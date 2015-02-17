% List of open inputs
% fMRI model specification: Directory - cfg_files
% fMRI model specification: Scans - cfg_files
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Multiple regressors - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'F:\pilotos\first_level_batch_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(10, nrun);
for crun = 1:nrun
    Bas_csp=[0:14];
    Bas_csm=[0:14];
    Acq_csp=[0:14];
    Acq_csm=[0:14];
    Acq_us=[0:14];
    Ext_csp=[0:14];
    Ext_csm=[0:14];
    
    
    
    
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Directory - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Scans - cfg_files
    inputs{3, crun} = Bas_csp; % fMRI model specification: Onsets - cfg_entry
    inputs{4, crun} = Bas_csm; % fMRI model specification: Onsets - cfg_entry
    inputs{5, crun} = Acq_csp; % fMRI model specification: Onsets - cfg_entry
    inputs{6, crun} = Acq_csm; % fMRI model specification: Onsets - cfg_entry
    inputs{7, crun} = Acq_us; % fMRI model specification: Onsets - cfg_entry
    inputs{8, crun} = Ext_csp; % fMRI model specification: Onsets - cfg_entry
    inputs{9, crun} = Ext_csm; % fMRI model specification: Onsets - cfg_entry
    inputs{10, crun} = MATLAB_CODE_TO_FILL_INPUT; % fMRI model specification: Multiple regressors - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
