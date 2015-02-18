function dartelRegFun()

% List of open inputs
% New Segment: Volumes - cfg_files
% Normalise to MNI Space: Images - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'/media/DATAPART2/Kangaroo/batch3/dartelScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
Dir='/media/DATAPART2/Kangaroo/AnatomicasKab/';
Route=[Dir '*-MRI-full.nii'];
y=dir(Route);
l=y(find(1==cellfun(@(l) regexp(l,'[0-9]+-MRI-full.nii'),{y(:).name} )));

imagesCell=cell(length(l),1);
for i = 1:length(l)
    disp(['Loading image ' l(i).name] )
    imagesCell{i,1}=([Dir l(i).name]);
end
    
for crun = 1:nrun
    inputs{1, crun} = imagesCell; % New Segment: Volumes - cfg_files
    inputs{2, crun} = imagesCell; % Normalise to MNI Space: Images - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
end