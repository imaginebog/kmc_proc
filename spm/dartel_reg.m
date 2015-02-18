% List of open inputs
% New Segment: Volumes - cfg_files
% Normalise to MNI Space: Images - cfg_files
% Deformations: Image to base Id on - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/dartel_reg_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(3, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % New Segment: Volumes - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise to MNI Space: Images - cfg_files
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % Deformations: Image to base Id on - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
