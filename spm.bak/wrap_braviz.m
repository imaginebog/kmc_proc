function wrap_braviz(subjects_dir)
init
% standard transforms

dirs = dir(subjects_dir);
for i=1:size(dirs,1)
    d=dirs(i).name;
    if strlen(d)>5 && strcmp(d(end-4:end),'SENSE')
        paradigm_dir=[subjects_dir '/' d]
        %create deform image
        transFunc(paradigm_dir)
        % smoothed 4d in bash
        cmd=['./create_smoothed_4d.sh ' paradigm_dir]
        system(cmd)
    end
end

% dartel transforms
t1_file=[subjects_dir '/T1/T1.nii'];
dartel_file=[subjects_dir '/T1/y_dartel_back.nii'];
if exist(dartel_file, 'file')==2
	disp 'dartel already calculated'
else
	dartel_reg_fun(t1_file);
end
exit(0)



