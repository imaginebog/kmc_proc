function firstLevel_all(p,paradigm)
% List of open inputs
% fMRI model specification: Directory - cfg_files
% fMRI model specification: Scans - cfg_files
% fMRI model specification: Multiple regressors - cfg_files
% fMRI model specification: Explicit mask - cfg_files

switch paradigm
    case 'ATENCIONSENSE'
        jobfile = {'/media/DATAPART5/kmc400/scripts/spm/firstLevel_atencion_job.m'};
    case 'COORDINACIONSENSE'
        jobfile = {'/media/DATAPART5/kmc400/scripts/spm/firstLevel_coordinacion_job.m'};
    case 'MEMORIASENSE'
        jobfile = {'/media/DATAPART5/kmc400/scripts/spm/firstLevel_memoria2_job.m'};
    case 'PRENSIONSENSE'
        jobfile = {'/media/DATAPART5/kmc400/scripts/spm/firstLevel_prension3_job.m'};
    otherwise
        disp(['Unknown paradigm ' paradigm])
        exit(10)
end


init
Patient=cellstr(p);

nrun = 1; % enter the number of runs here

jobs = repmat(jobfile, 1, nrun);
inputs = cell(4, nrun);
for crun = 1:nrun
    Route=['/media/DATAPART5/kmc400/spm/' Patient{crun} '/' paradigm]; %to preprocessed files
    
	CorrectedInputFiles=[Route '/vswraBOLD-*.nii'];
	dirR=dir(CorrectedInputFiles);
	if (size(dirR,1) < 1)
    InputFiles=[Route '/swraBOLD-*.nii'];
    dirR=dir(InputFiles);
	end

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
exit(0)