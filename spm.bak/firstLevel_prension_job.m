%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.dir = '<UNDEFINED>';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.units = 'scans';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.RT = 2;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.fmri_t0 = 1;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.scans = '<UNDEFINED>';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond.name = 'Prension';
%%
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond.onset = [5
                                                                15
                                                                25
                                                                35
                                                                45
                                                                55
                                                                65
                                                                75
                                                                85
                                                                95
                                                                105
                                                                115];
%%
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond.duration = 5;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond.tmod = 0;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond.pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.multi = {''};
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.multi_reg = '<UNDEFINED>';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.hpf = 128;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.volt = 1;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.global = 'None';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.mask = '<UNDEFINED>';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.cvi = 'wls';
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1) = cfg_dep;
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).tname = 'Select SPM.mat';
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).tgt_spec{1}(1).value = 'mat';
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).sname = 'fMRI model specification: SPM.mat File';
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.spmmat(1).src_output = substruct('.','spmmat');
matlabbatch{2}.spm.tools.rwls.fmri_rwls_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep;
matlabbatch{3}.spm.stats.con.spmmat(1).tname = 'Select SPM.mat';
matlabbatch{3}.spm.stats.con.spmmat(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{3}.spm.stats.con.spmmat(1).tgt_spec{1}(1).value = 'mat';
matlabbatch{3}.spm.stats.con.spmmat(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{3}.spm.stats.con.spmmat(1).tgt_spec{1}(2).value = 'e';
matlabbatch{3}.spm.stats.con.spmmat(1).sname = 'rWLS Model estimation: SPM.mat File';
matlabbatch{3}.spm.stats.con.spmmat(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{3}.spm.stats.con.spmmat(1).src_output = substruct('.','spmmat');
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Prension(active)';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.convec = 1;
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'Prension (desactivaciones)';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.convec = -1;
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;
