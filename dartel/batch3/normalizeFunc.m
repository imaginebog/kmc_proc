function normalizeFunc(p)
if nargin <2
    sFolder = 'Structural';
end
% List of open inputs
% Normalise to MNI Space: Flow fields - cfg_files
% Normalise to MNI Space: Images - cfg_repeat
nrun = 1; % enter the number of runs here
jobfile = {'/media/DATAPART2/Kangaroo/batch2/mniRegScript_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);

Patients=cellstr(p);
for i = 1:length(Patients)
    Route='/media/DATAPART2/Kangaroo/40brains';
    Patient=Patients{i}; 
    disp(['Loading patient ' Patient])
    ImageString=[Route '/' Patient '/' sFolder '/s*.img' ];
    FlowString=[Route '/' Patient '/' sFolder '/u_r*.nii' ];
    ImageName = dir(ImageString);
    FlowName=dir(FlowString);
    flowsCell{i,1}=([Route '/' Patient '/' sFolder '/' FlowName(1).name]);
    imagesCell{i,1}=([Route '/' Patient '/' sFolder '/' ImageName(1).name]);
end


for crun = 1:nrun
    inputs{1, crun} = flowsCell; % Normalise to MNI Space: Flow fields - cfg_files
    inputs{2, crun} = imagesCell; % Normalise to MNI Space: Images - cfg_repeat
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
end
