"""Synthetic finished-bundle cache tests; no Lean, hosted models or private tasks."""
import copy
from pathlib import Path
import shutil
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from machinery import study_transfer as transfer, study_common, validation_receipts as receipts
from machinery.study_common import Invalid, digest, read, sha, snapshot, write


class FrozenCatalogCache(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='catalog-cache-neutral-')
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name).resolve()
        self.study = self.base/'study'; self.study.mkdir()
        self.armroot = self.study/'arms'/'exploration'; self.armroot.mkdir(parents=True)
        self.seed = self.study/'seed'; (self.seed/'MathGKM').mkdir(parents=True)
        (self.seed/'MathGKM/Root.lean').write_text('namespace Neutral\ndef root := True\nend Neutral\n')
        rootsha = sha(self.seed/'MathGKM/Root.lean')
        write(self.seed/'contract.json', {'root_file':'MathGKM/Root.lean','root_sha256':rootsha})
        write(self.seed/'seed-files.json', ['MathGKM/Root.lean'])
        write(self.study/'seal.json', {'dependencies':{'neutral':'fixed dependency identity'}})
        self.repo = self.base/'repo'; (self.repo/'machinery').mkdir(parents=True)
        for name in ('proof_audit.py','inspection_stream.py','validation_receipts.py','study_transfer.py'):
            (self.repo/'machinery'/name).write_text('neutral implementation identity '+name+'\n')
        for name in ('lean-toolchain','lakefile.toml','lake-manifest.json'):
            (self.repo/name).write_text('neutral pinned input '+name+'\n')
        self.lean = self.base/'lean'; self.lean.write_text('neutral nonexecutable binary fixture\n')
        self.checker = self.base/'leanchecker'; self.checker.write_text('another nonexecutable binary fixture\n')
        self.source = self.armroot/'snapshots'/'initial'
        self.manifest = snapshot(self.seed, self.source, {'neutral':'fixed'}, ['MathGKM/Root.lean'])
        self.reservations = {}
        def reserve(key, seconds):
            if key in self.reservations and self.reservations[key] != seconds:
                raise Invalid('fixture reservation changed')
            self.reservations[key] = seconds
        self.arm = SimpleNamespace(root=self.armroot, study=self.study,
                  p={'validation_seconds':90,'transport':'fixture'},
                  reserve=reserve, stopped=lambda:False)
        self.compilations = 0
        for target, field, value in ((transfer,'ROOT',self.repo),(receipts,'ROOT',self.repo),
                 (transfer,'LEAN',self.lean),(transfer,'CHECKER',self.checker)):
            patcher = patch.object(target, field, value); patcher.start(); self.addCleanup(patcher.stop)
        patcher = patch.object(study_common,'dependencies',lambda _:None)
        patcher.start(); self.addCleanup(patcher.stop)
        patcher = patch.object(transfer,'run',side_effect=AssertionError('no external processes in neutral test'))
        patcher.start(); self.addCleanup(patcher.stop)
        self.compiler = patch.object(transfer,'check_task',side_effect=self.fake_check)
        self.compiler.start(); self.addCleanup(self.compiler.stop)

    def fake_check(self, workspace, task, solution, directory, seconds, **kwargs):
        """Protocol-shaped evidence only, expressly not a mathematical proof."""
        self.compilations += 1
        (directory/'source').mkdir(parents=True)
        artifact = directory/'source/declarations.json'; artifact.write_text('neutral completion artifact\n')
        evidence = {'schema':'math-gkm.producer-completion.v3','nonce':'a'*64,
                    'artifact_bytes':artifact.stat().st_size,'artifact_sha256':sha(artifact)}
        marker = f"GKM_DECLARATIONS_COMPLETE_V3:{evidence['nonce']}:{evidence['artifact_bytes']}:{evidence['artifact_sha256']}"
        result = {'checked':True,'inspection_schema':transfer.proof_audit.SCHEMA,
                  'elapsed_seconds':12.5,'finished':123.0,
                  'target_binding':digest(task),'solution_binding':digest(solution),
                  'binary_hashes':{str(p):sha(p) for p in (self.lean,self.checker)},
                  'pin_hashes':{n:sha(self.repo/n) for n in ('lean-toolchain','lakefile.toml','lake-manifest.json')},
                  'producer_completion':evidence,'declaration_artifact_sha256':sha(artifact),
                  'declarations':[{'name':'StudyObligation','producer_completion':evidence,
                      'artifact_sha256':sha(artifact),'artifact_bytes':artifact.stat().st_size,
                      'catalog':[{'name':'Neutral.root','identity_schema':'neutral-only','semantic_sha256':'b'*64}]}],
                  'checks':[{'operation':'trusted_premise_inspection','returncode':0,
                             'termination':None,'stdout':marker+'\n'}]}
        write(directory/'result.json',result)
        receipts.finish(directory,task,solution,())
        return result

    def catalog(self, label='first', source=None, manifest=None):
        return transfer.catalog_snapshot(self.arm, source or self.source, manifest or self.manifest,
                    self.armroot/'evaluations'/label/'catalog-before', label+'-before')

    def first_directory(self):
        return self.armroot/'evaluations'/'first'/'catalog-before'

    def test_exact_context_reuses_official_finished_receipt_and_preserves_full_reservation(self):
        first = self.catalog()
        second = self.catalog('second')
        self.assertTrue(first['checked']); self.assertTrue(second['checked'])
        self.assertEqual(self.compilations,1)
        self.assertFalse(first['catalog_accounting']['reused_finished_receipt'])
        self.assertTrue(second['catalog_accounting']['reused_finished_receipt'])
        self.assertEqual(second['catalog_accounting']['original_validation_seconds'],12.5)
        self.assertLess(second['catalog_accounting']['current_elapsed_seconds'],12.5)
        self.assertEqual(self.reservations,{'catalog-first-before':90,'catalog-second-before':90})
        self.assertEqual(second['catalog_accounting']['validator_directory'],str(self.first_directory()))
        self.assertTrue((self.armroot/'evaluations/second/catalog-before/CACHE_REUSE.json').is_file())
        again = self.catalog('second')
        self.assertTrue(again['checked']); self.assertEqual(self.compilations,1)

    def test_same_bound_contents_at_a_different_snapshot_path_can_reuse(self):
        self.catalog()
        cloned = self.armroot/'snapshots'/'identical'
        shutil.copytree(self.source,cloned)
        result = self.catalog('cloned',source=cloned,manifest=read(cloned/'manifest.json'))
        self.assertTrue(result['catalog_accounting']['reused_finished_receipt'])
        self.assertEqual(self.compilations,1)

    def test_different_manifest_or_source_misses_cache(self):
        self.catalog()
        second_source = self.armroot/'snapshots'/'new-policy'
        second_manifest = snapshot(self.seed,second_source,{'neutral':'changed policy'},['MathGKM/Root.lean'])
        result = self.catalog('different-policy',source=second_source,manifest=second_manifest)
        self.assertTrue(result['checked']); self.assertEqual(self.compilations,2)
        (self.seed/'MathGKM/Extra.lean').write_text('def neutralExtra : True := True.intro\n')
        third_source = self.armroot/'snapshots'/'new-source'
        third_manifest = snapshot(self.seed,third_source,{'neutral':'fixed'},['MathGKM/Root.lean'])
        self.catalog('different-source',source=third_source,manifest=third_manifest)
        self.assertEqual(self.compilations,3)

    def test_changed_binary_pin_or_inspector_identity_misses_cache(self):
        self.catalog()
        for count,path in enumerate((self.lean,self.repo/'lakefile.toml',self.repo/'machinery/inspection_stream.py'),start=2):
            path.write_text(path.read_text()+'changed identity\n')
            result = self.catalog('identity-'+str(count))
            self.assertTrue(result['checked']); self.assertEqual(self.compilations,count)

    def test_dependency_identity_change_misses_cache(self):
        self.catalog()
        write(self.study/'seal.json',{'dependencies':{'neutral':'changed dependency identity'}})
        self.catalog('new-dependencies')
        self.assertEqual(self.compilations,2)

    def test_mutated_snapshot_is_rejected_before_lookup(self):
        self.catalog()
        (self.source/'source/MathGKM/Root.lean').chmod(0o644)
        (self.source/'source/MathGKM/Root.lean').write_text('Changed outside frozen manifest.\n')
        with self.assertRaises(Invalid): self.catalog('changed-source')
        self.assertEqual(self.compilations,1)

    def test_missing_finished_marker_is_inconclusive_and_not_recompiled(self):
        self.catalog()
        (self.first_directory()/'FINISHED.json').unlink()
        result = self.catalog('missing-marker')
        self.assertFalse(result['checked'])
        self.assertIn('inconclusive',result['status']); self.assertEqual(self.compilations,1)

    def test_modified_retained_artifact_is_rejected_by_official_reuse(self):
        self.catalog()
        (self.first_directory()/'source/declarations.json').write_text('Changed retained artifact.\n')
        result = self.catalog('changed-artifact')
        self.assertFalse(result['checked']); self.assertEqual(self.compilations,1)

    def test_modified_finished_receipt_is_inconclusive(self):
        self.catalog()
        marker = self.first_directory()/'FINISHED.json'
        value = read(marker); value['finished'] = False; write(marker,value)
        result = self.catalog('changed-marker')
        self.assertFalse(result['checked']); self.assertEqual(self.compilations,1)

    def test_unfinished_same_attempt_is_not_treated_as_a_catalog(self):
        directory = self.first_directory()
        write(directory/'result.json',{'checked':True,'declarations':[{'catalog':[]} ]})
        result = self.catalog()
        self.assertFalse(result['checked']); self.assertEqual(self.compilations,0)

    def test_cache_origin_cannot_escape_the_owning_arm(self):
        self.catalog()
        index = next((self.armroot/'frozen-catalog-cache').glob('*/index.json'))
        value = read(index); value['validator_directory'] = '../elsewhere'; write(index,value)
        result = self.catalog('escaped')
        self.assertFalse(result['checked']); self.assertEqual(self.compilations,1)

    def test_cache_identity_cannot_be_rebound(self):
        self.catalog()
        index = next((self.armroot/'frozen-catalog-cache').glob('*/index.json'))
        value = read(index); value['identity']['source_sha256'] = '0'*64; write(index,value)
        result = self.catalog('rebound')
        self.assertFalse(result['checked']); self.assertEqual(self.compilations,1)

    def test_unbound_fresh_success_is_not_published(self):
        with patch.object(transfer,'check_task',return_value={'checked':True,'elapsed_seconds':1.0}):
            result = self.catalog()
        self.assertFalse(result['checked'])
        self.assertIn('unbound',result['status'])
        self.assertFalse((self.armroot/'frozen-catalog-cache').exists())

    def test_failed_catalog_is_not_published_or_upgraded_to_valid_theory(self):
        with patch.object(transfer,'check_task',return_value={'checked':False,'elapsed_seconds':1.0,'status':'inspection_limit'}):
            result = self.catalog()
        self.assertFalse(result['checked'])
        self.assertEqual(result['status'],'inspection_limit')
        self.assertFalse((self.armroot/'frozen-catalog-cache').exists())

    def test_measurements_use_actual_verification_not_original_compile_time(self):
        self.catalog(); cached = self.catalog('second')
        result = transfer._measured_costs({'before':{'adapter_receipt':{'elapsed_seconds':3.0},
                      'checks':[{'elapsed_seconds':2.0},{'elapsed_seconds':1.0}]}}, {'before':cached})
        self.assertEqual(result['before']['adapter_seconds'],3.0)
        self.assertEqual(result['before']['validation_seconds'],3.0)
        self.assertEqual(result['before']['context_validation_seconds'],cached['catalog_accounting']['current_elapsed_seconds'])
        self.assertEqual(result['after'],{'adapter_seconds':None,'validation_seconds':None,'context_validation_seconds':None})

    def test_measurements_never_substitute_caps_or_invalid_values(self):
        result = transfer._measured_costs({'before':{'adapter_receipt':{'elapsed_seconds':float('nan')},
                        'checks':[{'elapsed_seconds':float('inf')}]}}, {'before':{'budget_seconds':999}})
        self.assertEqual(result['before'],{'adapter_seconds':None,'validation_seconds':None,'context_validation_seconds':None})


if __name__ == '__main__':
    unittest.main()
