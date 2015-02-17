# kmc_proc
Scripts used for processing the kmc400 data

The repository contains script that automate data processing for the kmc400 project, the idea is to reduce human mistakes and to make the analysis homogeneus

The main scripts are 

- ``1-importDCM.sh`` : Transform dicom series into nifti format using dcm2nii
- ``1b-verifyImport.sh``: Test that all the required images were correctly imported and are of the right size
- ``2-freeSurfer.sh``: Run [freeseurfer] *recon-all*
- ``3-tracula.sh`` : Run [freesurfer] tracula
- ``4-SPM_preproc.sh`` : Do [spm] preprocessing of functional series
- ``5a-Fist_Level_Miedo.sh`` : First level [spm] analysis of the "miedo" paradigm


[freesurfer]: http://freesurfer.net/
[spm]: http://www.fil.ion.ucl.ac.uk/spm/
