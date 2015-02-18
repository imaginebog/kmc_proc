function firstLevel_coordinacion(p)
% List of open inputs
% fMRI model specification: Directory - cfg_files
% fMRI model specification: Scans - cfg_files
% fMRI model specification: Multiple regressors - cfg_files
% fMRI model specification: Explicit mask - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/firstLevel_coordinacion_job.m'};
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
