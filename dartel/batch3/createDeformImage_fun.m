function createDeformImage_fun(p)
% List of open inputs
% Deformations: Flow field - cfg_files
Patients=cellstr(p);
nrun = size(Patients,1);
%nrun=1;    
jobfile = {'/media/DATAPART2/Kangaroo/batch2/createDeformImage_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(1, nrun);
for crun = 1:nrun
    disp(['Importing Patient ' Patients{crun}]) 
    Route='/media/DATAPART2/Kangaroo/40brains/';
    Dir=[Route Patients{crun} '/Structural/'];
    mylist=dir([Dir  'u_rc*']);
    field=[Dir mylist(1).name];
    inputs{1, crun} = cellstr(field); % Deformations: Flow field - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
