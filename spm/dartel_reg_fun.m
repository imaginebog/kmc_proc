
 function dartel_reg_fun(t1_file)
% List of open inputs
% New Segment: Volumes - cfg_files
% Normalise to MNI Space: Images - cfg_files
% Deformations: Image to base Id on - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/dartel_reg_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(3, nrun);
t1_file_c=cellstr(t1_file)
for crun = 1:nrun
    inputs{1, crun} = t1_file_c; % New Segment: Volumes - cfg_files
    inputs{2, crun} = t1_file_c; % Normalise to MNI Space: Images - cfg_files
    inputs{3, crun} = t1_file_c; % Deformations: Image to base Id on - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
