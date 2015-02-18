function procFunc(p,paradigm)
% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
 % enter the number of runs here
disp('initiating spm')
init
disp('starting')
Patients=cellstr(p);

nrun = size(Patients,2);
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/segmentT1_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    disp(['Segmenting subject ' Patients{crun}]) 
    Route='/media/DATAPART5/kmc400/spm';
    Patient=Patients{crun};
    PatientRoute=[Route '/' Patient];
    
    T1Route=[PatientRoute '/' 'T1'];
    T1file=[T1Route '/T1.nii'];
    T1cell{1}=T1file;
   
    inputs{1, crun} = T1cell; % Segment: Data - cfg_files
    disp(['inFile= ' T1file]);
    
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
disp('sleeping for 10 seconds');
pause(10)
%spm quit
pause(10)
%exit
end

