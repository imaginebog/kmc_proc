%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.dir = '<UNDEFINED>';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.units = 'scans';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.RT = 2;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.timing.fmri_t0 = 1;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.scans = '<UNDEFINED>';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(1).name = 'atencion';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(1).onset = [10
                                                                   30
                                                                   50
                                                                   70];
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(1).duration = 10;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(1).tmod = 0;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(2).name = 'Rest-sin-rta-motora';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(2).onset = [2
                                                                   22
                                                                   42
                                                                   62
                                                                   82];
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(2).duration = 8;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(2).tmod = 0;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(3).name = 'rta.pad';
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(3).onset = [0
                                                                   20
                                                                   40
                                                                   60
                                                                   80];
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(3).duration = 2;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(3).tmod = 0;
matlabbatch{1}.spm.tools.rwls.fmri_rwls_spec.sess.cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
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
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Atencion(active)';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.convec = [1 0 0];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'Atencion (zonas desactivadas)';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.convec = [-1 0 0];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = 'Atencion(Active>rest-sin-rta.pad)';
matlabbatch{3}.spm.stats.con.consess{3}.tcon.convec = [1 -1 0];
matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{4}.tcon.name = 'Atencion(rest-sin-rta.pad>active)';
matlabbatch{3}.spm.stats.con.consess{4}.tcon.convec = [-1 1 0];
matlabbatch{3}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{5}.tcon.name = 'rta-pad';
matlabbatch{3}.spm.stats.con.consess{5}.tcon.convec = [0 0 1];
matlabbatch{3}.spm.stats.con.consess{5}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;
