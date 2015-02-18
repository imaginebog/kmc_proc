% List of open inputs
% Deformations: Parameter File - cfg_files
% Deformations: Save as - cfg_entry
% Deformations: Parameter File - cfg_files
% Deformations: Save as - cfg_entry
nrun = X; % enter the number of runs here
jobfile = {'/media/DATAPART5/spm40b/interSubj/transform_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(4, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Deformations: Parameter File - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Deformations: Save as - cfg_entry
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % Deformations: Parameter File - cfg_files
    inputs{4, crun} = MATLAB_CODE_TO_FILL_INPUT; % Deformations: Save as - cfg_entry
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
