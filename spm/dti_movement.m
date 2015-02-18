function dti_movement(subj)
% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
% enter the number of runs here
init
msg=strcat('Detecting movement for subject :', subj);
disp(msg);
%Set the subject path where the images are
subj_path=strcat('/media/DATAPART5/kmc400/dti_movement','/',subj);
%set the path of the volumes
vols_path=strcat(subj_path,'/','vol*.nii');
vols_dir=dir(vols_path);
%Iterate over all the images. Append ",1"
for i = 1:1:length(vols_dir)
    str=strcat(subj_path,'/',vols_dir(i).name,',1');
    vol_files{i,1}=str;
end
%Remove the first element of the list
vol_files(1)=[];
%Set the array as cell string
vol_files = {vol_files};
%Set up the job execution
spm('defaults','fmri');
spm_jobman('initcfg');
%Configure options
matlabbatch{1}.spm.spatial.realign.estimate.data = vol_files;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.quality = 0.9;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.sep = 4;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.fwhm = 5;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.rtm = 1;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.interp = 2;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.weight = '';
%Run batch
spm_jobman('run',matlabbatch);
mov_file_name=strcat(subj_path,'/rp_vol0001.txt');
mov_file=fopen(mov_file_name);
mov=textscan(mov_file,'%f %f %f %*[^\n]');
fclose(mov_file);
mov_x=mov{1};
mov_y=mov{2};
mov_z=mov{3};
magn_mov=mov_x.^2+mov_y.^2+mov_z.^2;
danger=find(magn_mov>2.0);
if(~isempty(danger))
    magns=magn_mov(danger);
    danger_magn=[danger magns];
    warn_file_name=strcat(subj_path,'/WARNING_2mm.txt');
    warn_file=fopen(warn_file_name,'w');
    fprintf(warn_file,'%i %f \n',danger_magn');
    fclose(warn_file);
end;

danger=find(magn_mov>3.0);
if(~isempty(danger))
    magns=magn_mov(danger);
    danger_magn=[danger magns];
    warn_file_name=strcat(subj_path,'/WARNING_3mm.txt');
    warn_file=fopen(warn_file_name,'w');
    fprintf(warn_file,'%i %f \n',danger_magn');
    fclose(warn_file);
    exit(1)
end;
exit(0)
end

