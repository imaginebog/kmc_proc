function diicomImportFun(p)
% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
 % enter the number of runs here

Patients=cellstr(p);

nrun = size(Patients,2);
jobfile = {'/media/DATAPART2/Kangaroo/batch2/singleScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    disp(['Importing Patient ' Patients{crun}]) 
    Route='/media/DATAPART2/Kangaroo/40brains';
    Patient=Patients{crun};
    PatientRoute=[Route '/' Patient];
    inputs{1, crun} = cellstr(PatientRoute); % Named Directory Selector: Directory - cfg_files
    dirR=dir([PatientRoute '/' 'RESONANCIA*']);
    if isempty(dirR)
        dirR=dir([PatientRoute '/' 'resonanci*']);
    end
    dirT1=dir([PatientRoute '/' dirR(1).name '/T1*']);
    if isempty(dirT1)
        dirT1=dir([PatientRoute '/' dirR(1).name '/t1*']);
    end
    mylist=dir([PatientRoute '/' dirR(1).name '/' dirT1(1).name '/'  '*.dcm']);
    for i = 1:1:length(mylist)
        namescell{i}=[PatientRoute '/' dirR(1).name '/' dirT1(1).name '/' mylist(i).name];
    end
    inputs{2, crun} = namescell; % Named File Selector: File Set - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
end