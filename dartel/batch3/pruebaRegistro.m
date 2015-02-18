%% 3 groups
tic

%% Inicializacion
addpath('/home/imagine/spm8');
spm('defaults','fmri');
spm_jobman('initcfg');


%% Registrar todos 
tic
%dartelRegFun();
%normalizeFunc();
toc

%% Deformation fields
% createDeformImage;
