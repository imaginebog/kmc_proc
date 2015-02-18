% List of open inputs
% Deformations: Flow field - cfg_files
% Deformations: Save as - cfg_entry

%find files
Dir='/media/DATAPART2/Kangaroo/AnatomicasKab/';
Route=[Dir 'u_rc1*-MRI-full_Template.nii'];
y=dir(Route);

nrun = length(y); % enter the number of runs here
jobfile = {'/media/DATAPART2/Kangaroo/batch3/createDeformImageBack_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    inputs{1, crun} = cellstr([Dir y(crun).name]); % Deformations: Flow field - cfg_files
    % create name
    patient=regexp(y(crun).name,'u_rc1(.*)-MRI-full_Template.nii','tokens');
    name=[patient{1}{1} '-back'];
    inputs{2, crun} = name; % Deformations: Save as - cfg_entry
end

spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
