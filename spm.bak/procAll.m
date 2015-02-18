%% 3 groups
tic
Todos = ['1326'; '326 ';  '567 ';  '911 ';    '330 ' ;                    '595 '          ;            '912 '    ;                  '093 ' ;                    '1339'      ;                '374 '               ;       '610 '                           ;          '1221'  ;                   '143 '           ;           '399 '               ;       '789 '             ;         '939 '  ;                    '1232'           ;          '144 '               ;       '413 '              ;        '790 '  ;                    '1249'            ;         '812 '               ;       '414 '               ;       '806 '  ;                     '1253'            ;         '207 '               ;       '544 '                ;      '813 '  ;                    '1258'              ;       '232 '               ;       '545 '                 ;     '815 '  ;                    '1267'               ;     '310 '                ;      '556 '                  ;    '823 '  ;                    '1300'                ;     '325 '                 ;     '566 '                   ;   '906 '];
%Todos=Todos(35:end,:);
Paradigmas={'T1','POWERGRIP','PRECISION','REDVERBALMANUALB','REDVERBALMANUALU','REPVERBALPEDESTREB','REPVERBALPEDESTREU'};
%Paradigmas=Paradigmas(1:3);
% Todos = ['1326'; '326 ';  '567 ';  '911 ';    '330 ' ;                    '595 '          ;            '912 '    ;                  '093 ' ;                    '1339'      ;                '374 '               ;       '610 '                           ;          '1221'  ;                   '143 '           ;           '399 '];%               ;       '789 '             ;         '939 '  ;                    '1232'           ;          '144 '               ;       '413 '              ;        '790 '  ;                    '1249'            ;         '812 '               ;       '414 '               ;       '806 '  ;                     '1253'            ;         '207 '               ;       '544 '                ;      '813 '  ;                    '1258'              ;       '232 '               ;       '545 '                 ;     '815 '  ;                    '1267'               ;     '310 '                ;      '556 '                  ;    '823 '  ;                    '1300'                ;     '325 '                 ;     '566 '                   ;   '906 '];
%% Inicializacion
cd /media/DATAPART5/spm40/interSubj/
addpath('/home/imagine/spm8');
spm('defaults','fmri');
spm_jobman('initcfg');

%% Procesar T1

%for p=16:size(Todos,1)
%        procT1func(Todos(p,:),Paradigmas{1});
%        cd '/media/DATAPART5/spm40/interSubj'
%end;
%% Procesar funcionales
for p=1:size(Todos,1)
    for pdgm=Paradigmas(2:end)
        procFunc(Todos(p,:),pdgm{1});
        cd '/media/DATAPART5/spm40/interSubj'
    end;
end;

%% Imprimir resultados

for p=31:40%size(Todos,1)
    for pdgm=Paradigmas(2:end)
        printFunc(Todos(p,:),pdgm{1});
        cd '/media/DATAPART5/spm40/interSubj'        
    end;
    fclose('all') ;
end;
