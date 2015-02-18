% List of open inputs
% New Segment: Volumes - cfg_files
% Normalise to MNI Space: Images - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'C:\Users\da.angulo39\Documents\Matlab\Kanguros\batch\dartelScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);

Patients=cellstr(['1253'; '1249' ; '414 ' ;  '093 ']);
for i = 1:length(Patients)
    Route='..';
    Patient=Patients{i}; 
    ImageString=[Route '\' Patient '\Structural\sR*.img' ];
    ImageName = dir(ImageString);
    imagesCell{i,1}=([Route '\' Patient '\Structural\' ImageName.name]);
end
    


for crun = 1:nrun
    inputs{1, crun} = imagesCell; % New Segment: Volumes - cfg_files
    inputs{2, crun} = imagesCell; % Normalise to MNI Space: Images - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
