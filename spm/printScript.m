% List of open inputs
% Results Report: Select SPM.mat - cfg_files
% Results Report: Results Title - cfg_entry
nrun = X; % enter the number of runs here
jobfile = {'/media/DATAPART5/spm40/interSubj/printScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Results Report: Select SPM.mat - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Results Report: Results Title - cfg_entry
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
