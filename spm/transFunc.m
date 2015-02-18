function transFunc(paradigm_dir)
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/transform_job.m'};
nrun = 1; % enter the number of runs here
jobs = repmat(jobfile, 1, nrun);
inputs = cell(4, nrun);

for crun = 1:nrun
    disp(['generating transform files in dir ' paradigm_dir]) 
    Route=paradigm_dir;
    inv_file=[Route '/T1_seg_inv_sn.mat'];
    back_file=[Route '/T1_seg_sn.mat'];
    inv_name='seg_forw';
    back_name='seg_back';
    inputs{1, crun} = cellstr(inv_file); % Deformations: Parameter File - cfg_files
    inputs{2, crun} = inv_name; % Deformations: Save as - cfg_entry
    inputs{3, crun} = cellstr(back_file); % Deformations: Parameter File - cfg_files
    inputs{4, crun} = back_name; % Deformations: Save as - cfg_entry
end
cd(paradigm_dir)
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
gzip(['y_' inv_name '.nii'])
delete(['y_' inv_name '.nii'])
gzip(['y_' back_name '.nii'])
delete(['y_' back_name '.nii'])
cd('/media/DATAPART5/kmc400/scripts/spm')
