function firstLevel(p,paradigm)
% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
 % enter the number of runs here
init
Patients=cellstr(p);

% List of open inputs
% fMRI model specification: Directory - cfg_files
% fMRI model specification: Scans - cfg_files
% fMRI model specification: Onsets - cfg_entry
% fMRI model specification: Multiple regressors - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/first_level_batch_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(10, nrun);
for crun = 1:nrun
    %onsets
    
    sbj=str2double(p);
    load('onsets')
    i=find(subjects==sbj);

    Bas_csm=onsets(i,1:6);
    Bas_csp=onsets(i,7:12);
    Acq_csm=onsets(i,13:40);
    Acq_csp=onsets(i,41:54);
    Ext_csm=onsets(i,55:68);
    Ext_csp=onsets(i,69:82);
    Acq_us=onsets(i,83:96);
    
    
    %files
    Route=['/media/DATAPART5/kmc400/spm/' Patients{crun} '/MIEDOSofToneSENSE']; %to preprocessed files
    InputFiles=[Route '/swraBOLD-*.nii'];
    dirR=dir(InputFiles);
    for i = 1:1:length(dirR)
        namescell{i}=[Route '/' dirR(i).name];
    end
    
    %movement parameter files
    dirParameters=dir([Route '/rp_*']);
    prmCell{1}=[Route '/' dirParameters(1).name];
    
    outDir=[Route '/FirstLevel'];
    mkdir(outDir)
    inputs{1, crun} = cellstr(outDir); % fMRI model specification: Directory - cfg_files
    inputs{2, crun} = namescell; % fMRI model specification: Scans - cfg_files
    inputs{3, crun} = Bas_csp'; % fMRI model specification: Onsets - cfg_entry
    inputs{4, crun} = Bas_csm'; % fMRI model specification: Onsets - cfg_entry
    inputs{5, crun} = Acq_csp'; % fMRI model specification: Onsets - cfg_entry
    inputs{6, crun} = Acq_csm'; % fMRI model specification: Onsets - cfg_entry
    inputs{7, crun} = Acq_us'; % fMRI model specification: Onsets - cfg_entry
    inputs{8, crun} = Ext_csp'; % fMRI model specification: Onsets - cfg_entry
    inputs{9, crun} = Ext_csm'; % fMRI model specification: Onsets - cfg_entry
    inputs{10, crun} = prmCell; % fMRI model specification: Multiple regressors - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
