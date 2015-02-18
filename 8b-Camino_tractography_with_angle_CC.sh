#!/bin/bash

setup_dir ()
{

# Create output directory if it doesn't exists
echo "[$SUBJ-1/30] Checking if output directory exists..."
if [ ! -d $work_dir ]; then
   mkdir -p $work_dir
   echo "[$SUBJ-1/30] Output Directory created!"
else 
   echo "[$SUBJ-1/30] Output Directory already created, deleting old files!"
   rm -rf $work_dir/*
fi;
}

tractography ()
{

# Start clock
START=$(date +%s.%N)
echo "****** Processing Tractography " $SUBJ... " ******"
echo "[$SUBJ-1/30] Output Directory ready!"

# ------------- Diffusion Tensor Imaging --------------------------

# Check if bvec and bval files exists
echo "[$SUBJ-2/30] Checking if bval and bvec files exists..."
if [ ! -f $in_dir/$bvec_file ] || [ ! -f $in_dir/$bval_file ]; then
   # either bval or bvec don't exist
   echo "[$SUBJ-2/30] Either Bvec or Bval file doesn't found!. Exit."
   exit
else
   # Create Scheme File from bvec and bval files
   echo "[$SUBJ-2/30] Creating scheme file..."
   fsl2scheme -bvecfile $in_dir/$bvec_file -bvalfile $in_dir/$bval_file -bscale $schemeScale > $work_dir/$scheme_file
   echo "[$SUBJ-2/30] Scheme file done!"
fi;

# Check if DTI input image exists
echo "[$SUBJ-3/30] Checking if DTI input image exists..."
if [ ! -f $in_dir/$dti_image_file ]; then
   # DTI image doesn't exist
   echo "[$SUBJ-3/30] DTI image file doesn't exist!. Exit."
   exit
else
   # Convert the DWI Data to Camino Format
   echo "[$SUBJ-3/30] Converting the DWI Data to Camino format..."
   image2voxel -4dimage $in_dir/$dti_image_file -outputfile $work_dir/$dwi_image_file 
   echo "[$SUBJ-3/30] Conversion Done!"
fi;

# Create a binary mask of the brain from the dti image
echo "[$SUBJ-4/30] Creating brain mask from dti image..."
bet $in_dir/$dti_image_file $work_dir/$brain_mask -m
echo "[$SUBJ-4/30] Brain mask Done!"

# Fit the Difusion Tensor
echo "[$SUBJ-5/30] Fitting Difusion Tensors..."
dtfit $work_dir/$dwi_image_file $work_dir/$scheme_file -bgmask $work_dir/$binary_brain_mask -outputfile $work_dir/$difusion_tensor_image
echo "[$SUBJ-5/30] Fitting Done!"

# Compute fractional anisotropy map (outputs to fa.nii.gz)
echo "[$SUBJ-6/30] Computing fractional anisotropy..."
cat $work_dir/$difusion_tensor_image | fa | voxel2image -outputroot $work_dir/fa -header $in_dir/$dti_image_file
echo "[$SUBJ-6/30] Fractional Anisotropy Done!"

# Compute the eigen system in order to examine the spatial orientation of the tensors
echo "[$SUBJ-7/30] Computing the eigen system..."
cat $work_dir/$difusion_tensor_image | dteig > $work_dir/$dt_eigen_image
echo "[$SUBJ-7/30] Compute of eigen system Done!"

# Export DTs to NIfTI in order to corroborate that everything goes well
echo "[$SUBJ-8/30] Converting DTs to NifTI..."
dt2nii -inputfile $work_dir/$difusion_tensor_image -outputroot $work_dir/nifti_ -header $in_dir/$dti_image_file
echo "[$SUBJ-8/30] Convertion Done!"

# ------------- Basic Streamline Tracktography ---------------------

# Check if the orig.mgz in free surfer path exists
echo "[$SUBJ-9/30] Checking if orig.mgz file exists..."
if [ ! -f $freesurfer_path/$SUBJ/mri/$original_file_image.mgz ]; then
   # DTI image doesn't exist
   echo "[$SUBJ-9/30] orig.mgz image file doesn't exist!. Exit."
   exit
else
   # Convert anatomical image of the brain (from freesurfer) to nifti and place it to the output directory
   echo "[$SUBJ-10/30] Converting freesurfer anatomical image to Nifti Format!"
   mri_convert $freesurfer_path/$SUBJ/mri/$original_file_image.mgz $work_dir/orig.nii.gz
   echo "[$SUBJ-10/30] Convertion Done!"
fi;

# Extract the brain from the anatomical image 
echo "[$SUBJ-11/30] Extract the brain from the anatomical image"
bet $work_dir/orig.nii.gz $work_dir/$brain2_mask -m
echo  "[$SUBJ-11/30] Brain extracted!"

# Registering FA image and generate afine matrix (from dti space to freesurfer space) from anatomaical image (reference) 
echo "[$SUBJ-12/30] Registering FA image and creating afine matrix from anatomical image..."
flirt -ref $work_dir/orig.nii.gz -in $work_dir/fa.nii.gz -omat $work_dir/diff2surf.mat -out $work_dir/fa_mri.nii.gz -usesqform -refweight $work_dir/$binary_brain2_mask
echo "[$SUBJ-12/30] Register FA Done!"

# Invert the above matrix. This is to go from FreeSurfer Space to Diffusion (DTI) space
echo "[$SUBJ-13/30] Inverting Matrix..."
convert_xfm -omat $work_dir/surf2diff.mat -inverse $work_dir/diff2surf.mat
echo "[$SUBJ-13/30] Invertion Done!"

# Check if the seed image in free surfer path exists
echo "[$SUBJ-14/30] Checking if the seed image file exists..."
if [ ! -f $freesurfer_path/$SUBJ/mri/$seed_file_image.mgz ]; then
   # DTI image doesn't exist
   echo "[$SUBJ-14/30] seed image file doesn't exist!. Exit."
   exit
else
   # Convert seed image (from freesurfer) to nifti and place it to the output directory
   echo "[$SUBJ-14/30] Converting seed image to Nifti Format!"
   mri_convert $freesurfer_path/$SUBJ/mri/$seed_file_image.mgz $work_dir/seed1.nii.gz
   echo "[$SUBJ-14/30] Convertion Done!"
fi;

echo "[$subjectSrc] Creating Corpus Callosum masks..."
#Create a temp mask for Corpus Callosum Posterior
fslmaths $work_dir/seed1.nii.gz -thr 1 -uthr 255 $work_dir/CC.nii.gz

# Apply an isotransform in order to get a transformation from freesurfer space to DT space, also we want a 2x2x2 mm per voxel to seed image
echo "[$SUBJ-15/30] Transforming seed image from freesurfer space to DTI space / 2x2x2 mm/vox..."
flirt -applyisoxfm 2 -init $work_dir/surf2diff.mat -interp nearestneighbour -in $work_dir/CC.nii.gz -ref $work_dir/fa -out $work_dir/seed2.nii.gz
echo "[$SUBJ-15/30] Tranformation Done!"

# Apply an isotransform in order to get a transformation from freesurfer space to DT space, also we want a 2x2x2 mm per voxel to the mask
echo "[$SUBJ-16/30] Transforming Mask from freesurfer space to DTI space / 2x2x2 mm/vox..."
flirt -applyisoxfm 2 -init $work_dir/surf2diff.mat -interp nearestneighbour -in $work_dir/$binary_brain2_mask -ref $work_dir/fa -out $work_dir/brain_mask_diff.nii.gz
echo "[$SUBJ-16/30] Tranformation Done!"

# From above seed image, select those voxels with value below 150
echo "[$SUBJ-17/30] Selecting voxels below 150 on WM..."
fslmaths $work_dir/seed2.nii.gz -uthr 150 -bin $work_dir/seed3.nii.gz
echo "[$SUBJ-17/30] Voxels selected!" 

# From above seed do a dilation to the max kernel limit. Just in case the segmentation of free surfer was very strcict
echo "[$SUBJ-18/30] Dilating seed image..."
fslmaths $work_dir/seed3.nii.gz -dilF $work_dir/seed4.nii.gz
echo "[$SUBJ-18/30] Dilation Done!" 

# From above seed image get rid of noise that could get a wrong tracking 
echo "[$SUBJ-19/30] Getting rid of noise of seed mask..."
fslmaths $work_dir/seed4.nii.gz -mas $work_dir/brain_mask_diff.nii.gz $work_dir/seed5.nii.gz
echo "[$SUBJ-19/30] Noise out!" 

# Start a deterministic tractography
echo "[$SUBJ-20/30] Starting deterministic tractography..."
#track -inputmodel dt -header $in_dir/$dti_image_file -seedfile $work_dir/seed5.nii.gz -anisthresh 0.3 -interpolator tend_prob_nn -tracker rk4 -inputfile $work_dir/$difusion_tensor_image > $work_dir/$tractography_image
track -inputmodel dt -header $in_dir/$dti_image_file -seedfile $work_dir/seed5.nii.gz -anisthresh $fa_prmt -curvethresh $angle -interpolator tend_prob_nn -tracker rk4 -inputfile $work_dir/$difusion_tensor_image > $work_dir/$tractography_image

#track -inputmodel dt -seedfile $work_dir/seed5.nii.gz -anisthresh 0.2 -curvethresh 60 -inputfile $work_dir/$difusion_tensor_image > $work_dir/$tractography_image
echo "[$SUBJ-20/30] Tractography Done!"

# Creating mask for hair cutting
echo "[$SUBJ-21/30] Creating masks for hair-cutting..."
flirt -applyxfm -init $work_dir/surf2diff.mat -interp nearestneighbour -in $work_dir/$binary_brain2_mask -ref $work_dir/fa -out $work_dir/brain_mask_diff_aniso.nii.gz
fslmaths $work_dir/brain_mask_diff.nii.gz -mul -1 -add 1 $work_dir/brain2_mask_diff.nii.gz
echo "[$SUBJ-21/30] Masks for haircuting done!" 

# Getting rid of hairs
echo "[$SUBJ-22/30] Cutting hairs less than 20..."
cat $work_dir/$tractography_image | procstreamlines -mintractlength 20 -waypointfile $work_dir/seed3.nii.gz -header $work_dir/seed3.nii.gz -exclusionfile $work_dir/brain2_mask_diff.nii.gz -truncateinexclusion > $work_dir/tracks2.camino
echo "[$SUBJ-22/30] Cut!"

echo "[$SUBJ-23/30] Cutting hairs less than 40..."
cat $work_dir/$tractography_image | procstreamlines -mintractlength 40 -waypointfile $work_dir/seed3.nii.gz -header $work_dir/seed3.nii.gz -exclusionfile $work_dir/brain2_mask_diff.nii.gz -truncateinexclusion > $work_dir/tracks3.camino
echo "[$SUBJ-23/30] Hairs gone..."

# Generate VTK files to visualize
echo "[$SUBJ-24/30] Exporting streamlines to VTK polydata..."
vtkstreamlines -colourorient < $work_dir/tracks3.camino > $work_dir/$VTK_image
echo "[$SUBJ-24/30] Export Done!"

# Compute mean diffusivity (and mri) maps (outputs to md.nii.gz and md_mri.nii.gz)
echo "[$SUBJ-25/30] Computing mean diffusivity..."
cat $work_dir/$difusion_tensor_image | md | voxel2image -outputroot $work_dir/md -header $in_dir/$dti_image_file
flirt -applyxfm -init $work_dir/diff2surf.mat -in $work_dir/md -ref $work_dir/orig -out $work_dir/md_mri
echo "[$SUBJ-25/30] Mean Dissfusivity Done!"

# Masquerading new dti image
echo "[$SUBJ-26-1/30] Masquerading md image ..."
fslmaths $work_dir/md -mas $work_dir/brain_mask_diff_aniso.nii.gz $work_dir/md_masked
echo "[$SUBJ-26-1/30] Masquerade done!"
echo "[$SUBJ-26-2/30] Masquerading md mri image ..."
fslmaths $work_dir/md_mri -mas $work_dir/brain2_mask.nii.gz $work_dir/md_mri_masked
echo "[$SUBJ-26-2/30] Masquerade done!"

# Create RGB_img image
echo "[$SUBJ-27/30] Creating RGB image from the eigenvalues..."
dteig < $work_dir/$difusion_tensor_image | rgbscalarimg -scalarfile $work_dir/fa.nii.gz -outputfile $work_dir/rgb_dti.nii.gz
echo "[$SUBJ-27/30] RGB image Done!"

# Convert to standar format using python script
echo "[$SUBJ-28/30] Converting to standar format using python script ..."
python rgb_dti.py $work_dir/rgb_dti.nii.gz $work_dir/rgb2_dti.nii.gz
echo "[$SUBJ-28/30] Converted!"

# Registering
echo "[$SUBJ-29/30] Registering RGB image..."
flirt -applyxfm -init $work_dir/diff2surf.mat -in $work_dir/rgb2_dti -ref $work_dir/orig -out $work_dir/rgb_dti_mri
echo "[$SUBJ-29/30] RGB image registered!"

# Apparently can't mask multichannel images
echo "[$SUBJ-30/30] Masquerading RGB image..."
fslmaths $work_dir/rgb2_dti -mas $work_dir/brain_mask_diff_aniso.nii.gz $work_dir/rgb_dti_masked -odt input
fslmaths $work_dir/rgb_dti_mri -mas $work_dir/brain2_mask.nii $work_dir/rgb_dti_mri_masked -odt input
echo "[$SUBJ-30/30] Masquerade Done!"

# Calculate elapsed time
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo "Elapsed Time: " $DIFF " Secs."

echo "***** Tractography " $SUBJ" Done! *****"

}



# Code of the subject (first parameter of the script)
SUBJ=$1
# Threshold angle
angle=$2
# Anisotropy frction
fa_prmt=$3

# Convert images from Dicom to Nifti?
convert_images=false
# Camino bin directory
camino_bin=/home/imagine/camino/bin
# FSL bin directory
fsl_bin=/canguro/applications/fsl/fsl/bin
# dcm2nii directory
dcm2nii_path=/canguro/applications/mricron
#Export applications PATH
export PATH=$PATH:$camino_bin:$fsl_bin:$dcm2nii_path

# Original anatomic image
original_file_image=orig
# Seed file
seed_file_image=aseg # White matter
# Directory of Dicom Images
dicom_repo=/media/backups/Dicom
# Freesurfer path (segmented files)
freesurfer_path=/media/backups/kmc400/freeSurfer_Tracula
# Already converted images to nifti directory
nifti_already_converted=/media/backups/kmc400/nii
# Input directory
in_dir=$nifti_already_converted/$SUBJ
# Output directory
work_dir=/media/backups/kmc400/tractography/$SUBJ/$angle
# Dcm2nii configuration file
dcm2nii_conf=dcm2nii_kmc.ini
# Anatomic image file
anatomic_image_file=MPRAGEmodifiedSENSE.nii.gz
# bvec file
bvec_file=xDTIhighisoSENSE.bvec
# bval file
bval_file=xDTIhighisoSENSE.bval
# DTI image file
dti_image_file=xDTIhighisoSENSE.nii.gz
# scheme file
scheme_file=scheme.txt
# scheme file scale
schemeScale=1.25
# DWI image file 
dwi_image_file=dwi.Bfloat
# Difusion Tensor Image
difusion_tensor_image=dt.Bdouble
# Eigen system Difusion Tensor Image
dt_eigen_image=dteig.Bdouble
# First Brain mask
brain_mask=brain1.nii.gz
# First Binary Brain Mask (generated by bet)
binary_brain_mask=brain1_mask.nii.gz
# Second Brain mask
brain2_mask=brain2.nii.gz
# Second Binary Brain Mask (generated by bet)
binary_brain2_mask=brain2_mask.nii.gz
# Camino tractography outpu file
tractography_image=CaminoTracts.Bfloat
# Tracts in VTK format
VTK_image=CaminoTracts.vtk

# Check if there is more than one parameter 
if [ $# -lt 3 ]
then
echo Usage: $0 subject angle_threshold fa_threshold
exit 0
fi

# Set up directory
setup_dir 

# Set up output to console and log file (at the same time)
exec 3>&1 1>>$work_dir/log.txt 2>&1

# Call the tractography function. Send the stdout and stderr to log file
tractography | tee /dev/fd/3

