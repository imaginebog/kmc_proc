function preProcFunc(p,paradigm)
% List of open inputs
% Named Directory Selector: Directory - cfg_files
% Named File Selector: File Set - cfg_files
 % enter the number of runs here
init

TR=2;
if strcmpi(paradigm,'MEMORIASENSE')
    TR=4;
end
slices=40;
if strcmpi(paradigm,'MIEDOSofToneSENSE')
    slices=32;
    TR=2.3;
end

Patients=cellstr(p);

nrun = size(Patients,2);
jobfile = {'/media/DATAPART5/kmc400/scripts/spm/singleFMRIscript_job_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    disp(['Processing ' paradigm ' for subject '  Patients{crun}]) 
    Route='/media/DATAPART5/kmc400/spm';
    Patient=Patients{crun};
    PatientRoute=[Route '/' Patient];
    
    InputRoute=[PatientRoute '/' paradigm];
    T1Route=InputRoute;
    T1file=[T1Route '/T1.nii'];
    T1cell{1}=T1file;
    
    
    InputFiles=[InputRoute '/BOLD-*.nii'];
    dirR=dir(InputFiles); 

    for i = 1:1:length(dirR)
        namescell{i}=[InputRoute '/' dirR(i).name];
    end
    
    
    inputs{1, crun} = namescell; % Slice Timing: Session - cfg_files
    inputs{2, crun} = slices; % Slice Timing: Number of Slices - cfg_entry
    inputs{3, crun} = TR; % Slice Timing: TR - cfg_entry
    inputs{4, crun} = TR-TR/slices; % Slice Timing: TA - cfg_entry
    inputs{5, crun} = 1:1:slices; % Slice Timing: Slice order - cfg_entry
    inputs{6, crun} = round(slices/2); % Slice Timing: Reference Slice - cfg_entry
    inputs{7, crun} = T1cell; % Coregister: Estimate: Source Image - cfg_files
    
    
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});

% Check for movement correction
mov_file_name=[InputRoute '/rp_aBOLD-0000.txt'];
mov_file=fopen(mov_file_name);
mov=textscan(mov_file,'%f %f %f %*[^\n]');
fclose(mov_file);
mov_x=mov{1};
mov_y=mov{2};
mov_z=mov{3};
magn_mov=mov_x.^2+mov_y.^2+mov_z.^2;
danger=find(magn_mov>3.0);
if(~isempty(danger))
    magns=magn_mov(danger);
    danger_magn=[danger magns];
    warn_file=fopen([InputRoute 'WARNING.txt'],'w');
    fprintf(warn_file,'%i %f \n',danger_magn');
    fclose(warn_file);
    exit(1)
end;
exit(0)
end
