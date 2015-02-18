% List of open inputs
% Slice Timing: Session - cfg_files
% Slice Timing: Number of Slices - cfg_entry
% Slice Timing: TR - cfg_entry
% Slice Timing: TA - cfg_entry
% Slice Timing: Slice order - cfg_entry
% Slice Timing: Reference Slice - cfg_entry
% Coregister: Estimate: Reference Image - cfg_files
% Normalise: Write: Parameter File - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/singleFMRI_b_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(8, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Slice Timing: Session - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Slice Timing: Number of Slices - cfg_entry
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % Slice Timing: TR - cfg_entry
    inputs{4, crun} = MATLAB_CODE_TO_FILL_INPUT; % Slice Timing: TA - cfg_entry
    inputs{5, crun} = MATLAB_CODE_TO_FILL_INPUT; % Slice Timing: Slice order - cfg_entry
    inputs{6, crun} = MATLAB_CODE_TO_FILL_INPUT; % Slice Timing: Reference Slice - cfg_entry
    inputs{7, crun} = MATLAB_CODE_TO_FILL_INPUT; % Coregister: Estimate: Reference Image - cfg_files
    inputs{8, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise: Write: Parameter File - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
