function printFunc(p,paradigm)
% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
 % enter the number of runs here

Patients=cellstr(p);

nrun = size(Patients,2);
jobfile = {'/media/DATAPART5/spm40/interSubj/printScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    disp(['Printing ' paradigm ' for subject '  Patients{crun}]) 
    Route='/media/DATAPART5/spm40/subjects';
    Patient=Patients{crun};
    PatientRoute=[Route '/' Patient];
    
    InputRoute=[PatientRoute '/' paradigm];
    spmFile=[InputRoute '/' 'canonical/SPM.mat'];
    if isempty(dir([InputRoute '/' 'canonical/con_0001.hdr']))
        return;
    end;
    spmCell{1}=spmFile;

    title=[paradigm ' : ' Patients{crun} ];
    titleCell{1}=title;
inputs{1, crun} = spmCell;
inputs{2, crun} = title; % Results Report: Results Title - cfg_entry
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
end
