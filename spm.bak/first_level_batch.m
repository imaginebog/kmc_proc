% List of open inputs
% fMRI model specification: Directory - cfg_files
% fMRI model specification: Scans - cfg_files
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Multiple regressors - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/first_level_batch_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(10, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Directory - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Scans - cfg_files
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Onsets - cfg_entry
    inputs{4, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Onsets - cfg_entry
    inputs{5, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Onsets - cfg_entry
    inputs{6, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Onsets - cfg_entry
    inputs{7, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Onsets - cfg_entry
    inputs{8, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Onsets - cfg_entry
    inputs{9, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Onsets - cfg_entry
    inputs{10, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Multiple regressors - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
