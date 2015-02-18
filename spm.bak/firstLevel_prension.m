% List of open inputs
% fMRI model specification: Directory - cfg_files
% fMRI model specification: Scans - cfg_files
% fMRI model specification: Multiple regressors - cfg_files
% fMRI model specification: Explicit mask - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'C:\Users\Diego\Dropbox\VaBD\ProyectoSavingBrains\MRI-processing\scripts_12_2_2014\scripts_new\spm\firstLevel_prension_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(4, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Directory - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Scans - cfg_files
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Multiple regressors - cfg_files
    inputs{4, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Explicit mask - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
