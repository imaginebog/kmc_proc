% List of open inputs
% Normalise to MNI Space: Flow fields - cfg_files
% Normalise to MNI Space: Images - cfg_repeat
nrun = X; % enter the number of runs here
jobfile = {'/media/DATAPART2/Kangaroo/batch2/mniRegScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise to MNI Space: Flow fields - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise to MNI Space: Images - cfg_repeat
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
