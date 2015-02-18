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
    Route=['/media/DATAPART5/kmc400/spm/' Patients{crun} '/MIEDOSofToneSENSE']; %to preprocessed files
	csv_file=[Route '/onsets.csv'];
    pre_onsets=csvread(csv_file,0,0,[0,3,95,3]);
    onsets=pre_onsets(2:end,2);
    

    Bas_csm=onsets(1:6); %P1_Csm (6)
    Bas_csp=onsets(7:12);%P1_CSp (6)
    Acq_csm=onsets(13:40);%P2_CSm (28)
    Acq_csp=onsets(41:54);%P2_CSp (14)
    Ext_csm=onsets(55:68);%P3_Csm (14)
    Ext_csp=onsets(69:82);%P3_CSp (14)
    Acq_us=onsets(83:96);%P4_US (14)
    
    
    %files
    
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
quit
