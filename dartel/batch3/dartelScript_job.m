%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.tools.preproc8.channel.vols = '<UNDEFINED>';
matlabbatch{1}.spm.tools.preproc8.channel.biasreg = 0.0001;
matlabbatch{1}.spm.tools.preproc8.channel.biasfwhm = 60;
matlabbatch{1}.spm.tools.preproc8.channel.write = [0 0];
matlabbatch{1}.spm.tools.preproc8.tissue(1).tpm = {'/media/DATAPART5/applications/spm8/toolbox/Seg/TPM.nii,1'};
matlabbatch{1}.spm.tools.preproc8.tissue(1).ngaus = 2;
matlabbatch{1}.spm.tools.preproc8.tissue(1).native = [1 1];
matlabbatch{1}.spm.tools.preproc8.tissue(1).warped = [0 0];
matlabbatch{1}.spm.tools.preproc8.tissue(2).tpm = {'/media/DATAPART5/applications/spm8/toolbox/Seg/TPM.nii,2'};
matlabbatch{1}.spm.tools.preproc8.tissue(2).ngaus = 2;
matlabbatch{1}.spm.tools.preproc8.tissue(2).native = [1 1];
matlabbatch{1}.spm.tools.preproc8.tissue(2).warped = [0 0];
matlabbatch{1}.spm.tools.preproc8.tissue(3).tpm = {'/media/DATAPART5/applications/spm8/toolbox/Seg/TPM.nii,3'};
matlabbatch{1}.spm.tools.preproc8.tissue(3).ngaus = 2;
matlabbatch{1}.spm.tools.preproc8.tissue(3).native = [1 0];
matlabbatch{1}.spm.tools.preproc8.tissue(3).warped = [0 0];
matlabbatch{1}.spm.tools.preproc8.tissue(4).tpm = {'/media/DATAPART5/applications/spm8/toolbox/Seg/TPM.nii,4'};
matlabbatch{1}.spm.tools.preproc8.tissue(4).ngaus = 3;
matlabbatch{1}.spm.tools.preproc8.tissue(4).native = [1 0];
matlabbatch{1}.spm.tools.preproc8.tissue(4).warped = [0 0];
matlabbatch{1}.spm.tools.preproc8.tissue(5).tpm = {'/media/DATAPART5/applications/spm8/toolbox/Seg/TPM.nii,5'};
matlabbatch{1}.spm.tools.preproc8.tissue(5).ngaus = 4;
matlabbatch{1}.spm.tools.preproc8.tissue(5).native = [1 0];
matlabbatch{1}.spm.tools.preproc8.tissue(5).warped = [0 0];
matlabbatch{1}.spm.tools.preproc8.tissue(6).tpm = {'/media/DATAPART5/applications/spm8/toolbox/Seg/TPM.nii,6'};
matlabbatch{1}.spm.tools.preproc8.tissue(6).ngaus = 2;
matlabbatch{1}.spm.tools.preproc8.tissue(6).native = [0 0];
matlabbatch{1}.spm.tools.preproc8.tissue(6).warped = [0 0];
matlabbatch{1}.spm.tools.preproc8.warp.mrf = 0;
matlabbatch{1}.spm.tools.preproc8.warp.reg = 4;
matlabbatch{1}.spm.tools.preproc8.warp.affreg = 'mni';
matlabbatch{1}.spm.tools.preproc8.warp.samp = 3;
matlabbatch{1}.spm.tools.preproc8.warp.write = [0 0];
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1) = cfg_dep;
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).tname = 'Images';
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).tgt_spec{1}(1).value = 'image';
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).sname = 'New Segment: rc1 Images';
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.tools.dartel.warp.images{1}(1).src_output = substruct('.','tiss', '()',{1}, '.','rc', '()',{':'});
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1) = cfg_dep;
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).tname = 'Images';
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).tgt_spec{1}(1).value = 'image';
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).sname = 'New Segment: rc2 Images';
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.tools.dartel.warp.images{2}(1).src_output = substruct('.','tiss', '()',{2}, '.','rc', '()',{':'});
matlabbatch{2}.spm.tools.dartel.warp.settings.template = 'Template';
matlabbatch{2}.spm.tools.dartel.warp.settings.rform = 0;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(1).its = 3;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(1).rparam = [4 2 1e-006];
matlabbatch{2}.spm.tools.dartel.warp.settings.param(1).K = 0;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(1).slam = 16;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(2).its = 3;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(2).rparam = [2 1 1e-006];
matlabbatch{2}.spm.tools.dartel.warp.settings.param(2).K = 0;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(2).slam = 8;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(3).its = 3;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(3).rparam = [1 0.5 1e-006];
matlabbatch{2}.spm.tools.dartel.warp.settings.param(3).K = 1;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(3).slam = 4;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(4).its = 3;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(4).rparam = [0.5 0.25 1e-006];
matlabbatch{2}.spm.tools.dartel.warp.settings.param(4).K = 2;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(4).slam = 2;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(5).its = 3;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(5).rparam = [0.25 0.125 1e-006];
matlabbatch{2}.spm.tools.dartel.warp.settings.param(5).K = 4;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(5).slam = 1;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(6).its = 3;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(6).rparam = [0.25 0.125 1e-006];
matlabbatch{2}.spm.tools.dartel.warp.settings.param(6).K = 6;
matlabbatch{2}.spm.tools.dartel.warp.settings.param(6).slam = 0.5;
matlabbatch{2}.spm.tools.dartel.warp.settings.optim.lmreg = 0.01;
matlabbatch{2}.spm.tools.dartel.warp.settings.optim.cyc = 3;
matlabbatch{2}.spm.tools.dartel.warp.settings.optim.its = 3;
matlabbatch{3}.spm.tools.dartel.jacdet.flowfields(1) = cfg_dep;
matlabbatch{3}.spm.tools.dartel.jacdet.flowfields(1).tname = 'Flow fields';
matlabbatch{3}.spm.tools.dartel.jacdet.flowfields(1).tgt_spec{1}.name = 'filter';
matlabbatch{3}.spm.tools.dartel.jacdet.flowfields(1).tgt_spec{1}.value = 'nifti';
matlabbatch{3}.spm.tools.dartel.jacdet.flowfields(1).sname = 'Run DARTEL (create Templates): Flow Fields';
matlabbatch{3}.spm.tools.dartel.jacdet.flowfields(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{3}.spm.tools.dartel.jacdet.flowfields(1).src_output = substruct('.','files', '()',{':'});
matlabbatch{3}.spm.tools.dartel.jacdet.K = 6;
matlabbatch{4}.spm.tools.dartel.mni_norm.template(1) = cfg_dep;
matlabbatch{4}.spm.tools.dartel.mni_norm.template(1).tname = 'DARTEL Template';
matlabbatch{4}.spm.tools.dartel.mni_norm.template(1).tgt_spec{1}.name = 'filter';
matlabbatch{4}.spm.tools.dartel.mni_norm.template(1).tgt_spec{1}.value = 'nifti';
matlabbatch{4}.spm.tools.dartel.mni_norm.template(1).sname = 'Run DARTEL (create Templates): Template (Iteration 6)';
matlabbatch{4}.spm.tools.dartel.mni_norm.template(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{4}.spm.tools.dartel.mni_norm.template(1).src_output = substruct('.','template', '()',{7});
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.flowfields(1) = cfg_dep;
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.flowfields(1).tname = 'Flow fields';
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.flowfields(1).tgt_spec{1}.name = 'filter';
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.flowfields(1).tgt_spec{1}.value = 'nifti';
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.flowfields(1).sname = 'Run DARTEL (create Templates): Flow Fields';
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.flowfields(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.flowfields(1).src_output = substruct('.','files', '()',{':'});
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subjs.images = {'<UNDEFINED>'};
matlabbatch{4}.spm.tools.dartel.mni_norm.vox = [NaN NaN NaN];
matlabbatch{4}.spm.tools.dartel.mni_norm.bb = [NaN NaN NaN
                                               NaN NaN NaN];
matlabbatch{4}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{4}.spm.tools.dartel.mni_norm.fwhm = [8 8 8];
