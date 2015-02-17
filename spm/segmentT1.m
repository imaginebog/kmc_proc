% List of open inputs
% Segment: Data - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/segmentT1_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(1, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Segment: Data - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
