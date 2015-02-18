function firstLevel_atencion(p,paradigm)
% List of open inputs
% fMRI model specification: Directory - cfg_files
% fMRI model specification: Scans - cfg_files
% fMRI model specification: Multiple regressors - cfg_files
% fMRI model specification: Explicit mask - cfg_files

init
Patient=cellstr(p);

nrun = 1; % enter the number of runs here
jobfile = {	firstLevel_atencion_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(4, nrun);
for crun = 1:nrun
    Route=['/media/DATAPART5/kmc400/spm/' Patient{crun} '/ATENCIONSENSE']; %to preprocessed files
    
    InputFiles=[Route '/swraBOLD-*.nii'];
    dirR=dir(InputFiles);
    for i = 1:1:length(dirR)
        namescell{i}=[Route '/' dirR(i).name];
    end
    
    %movement parameter files
    dirParameters=dir([Route '/rp_*']);
    prmCell{1}=[Route '/' dirParameters(1).name];
    
    outDir=[Route '/FirstLevel'];
    mask='/media/DATAPART5/kmc400/scripts/spm/Mask.img';
    
    mkdir(outDir)
    
    inputs{1, crun} = cellstr(outDir); % fMRI model specification: Directory - cfg_files
    inputs{2, crun} = namescell; % fMRI model specification: Scans - cfg_files
    inputs{3, crun} = prmCell; % fMRI model specification: Multiple regressors - cfg_files
    inputs{4, crun} = cellstr(mask); % fMRI model specification: Explicit mask - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
quit