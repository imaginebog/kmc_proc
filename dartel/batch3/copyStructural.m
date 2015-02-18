function copyStructural(p)
% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
nrun = length(p); % enter the number of runs here
Patients=cellstr(p);
for crun = 1:nrun
    disp(['Copying ' Patients{crun}]) 
    Route='..';
    Patient=Patients{crun};
    PatientRoute=[Route '\' Patient];
    dirStructural=[PatientRoute  '\Structural'];
    dirStructural2=[PatientRoute '\Structural2'];
    copyfile(dirStructural,dirStructural2);
end