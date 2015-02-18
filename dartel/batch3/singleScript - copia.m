% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
nrun = 4; % enter the number of runs here
jobfile = {'C:\Users\da.angulo39\Documents\Matlab\Kanguros\batch\singleScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
Patients=cellstr(['1253'; '1249' ; '414 ' ;  '093 ']);
for crun = 1:nrun
    Route='..';
    Patient=Patients{crun};
    PatientRoute=[Route '\' Patient];
    inputs{1, crun} = cellstr(PatientRoute); % Named Directory Selector: Directory - cfg_files
    dirR=dir([PatientRoute '\' 'RESONANCIA*']);
    dirT1=dir([PatientRoute '\' dirR(1).name '/T1*']);
    mylist=dir([PatientRoute '\' dirR(1).name '\' dirT1(1).name '\'  '*.dcm']);
    for i = 1:1:length(mylist)
        namescell{i}=['..\' dirR(1).name '\' dirT1(1).name '\' mylist(i).name];
    end
    inputs{2, crun} = namescell; % Named File Selector: File Set - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
