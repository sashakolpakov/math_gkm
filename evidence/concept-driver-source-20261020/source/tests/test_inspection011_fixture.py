"""Supervisor-input integration selectors. NEVER run during source construction.

Missing fixture is a failure, never a skipped/easier substitute. Inputs are own
engineering cases, not evaluator payloads. Source copies preserve original bytes.
"""
import importlib.util
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch
from machinery import proof_audit, study_transfer
from machinery.study_common import ROOT, read, sha, write, digest


class Supervisor011(unittest.TestCase):
    def inputs(self):
        path=ROOT/'local.scratch/inspection011-fixture.json'
        expected=os.environ.get('GKM_INSPECTION011_FIXTURE_SHA256')
        self.assertIsNotNone(expected,'Supervisor must supply immutable fixture hash after source review')
        self.assertEqual(sha(path),expected)
        value=read(path)
        self.assertEqual(value['schema'],'math-gkm.inspection011.fixture.v1')
        self.assertEqual(value['supervisor_selected'],True)
        self.assertEqual(value['unchanged_original_claim_context_dependencies'],True)
        self.assertEqual({c['tag'] for c in value['cases']}, {'large_pilot','neutral','full_mathlib'})
        return value

    def run_case(self,case,checker=study_transfer.check_task):
        directory=Path(tempfile.mkdtemp(dir=ROOT/'.scratch',prefix='inspection011-'))
        ws=directory/'workspace'; ws.mkdir()
        origin=ROOT/case['source_directory']
        self.assertTrue(origin.resolve().is_relative_to((ROOT/'local.scratch').resolve()))
        for name,expected in case['files_sha256'].items():
            source=origin/name
            self.assertTrue(source.resolve().is_relative_to(origin.resolve()))
            self.assertFalse(source.is_symlink()); self.assertEqual(sha(source),expected)
            target=ws/name; target.parent.mkdir(parents=True,exist_ok=True); shutil.copyfile(source,target)
        (ws/'.lake').mkdir()
        (ws/'.lake/packages').symlink_to(ROOT/'.lake/packages',target_is_directory=True)
        self.assertEqual(digest(case['task']),case['task_hash'])
        self.assertEqual(digest(case['solution']),case['solution_hash'])
        self.assertEqual(case['required'],case['task']['required_constants'])
        result=None
        failure=None
        try:
            result=checker(ws,case['task'],case['solution'],directory/'check',case['seconds'],
                live=True,required=case['required'],contract=read(ws/'contract.json'))
        except Exception as exc:
            # Engineering artifact only; never exported as own research feedback.
            failure=dict(type=type(exc).__name__,message=str(exc))
            raise
        finally:
            raw=directory/'check/result.json'
            finished=directory/'check/FINISHED.json'
            checks=(result or {}).get('checks',[])
            metrics=dict(tag=case['tag'],fixture_binding=digest(case),
                checked=(result or {}).get('checked'),status=(result or {}).get('status'),
                outcome='checker_exception' if failure else 'returned',
                failure=failure,raw_returned_result=result,
                elapsed_seconds=(result or {}).get('elapsed_seconds'),
                artifact_bytes=(directory/'check/source/declarations.json').stat().st_size
                    if (directory/'check/source/declarations.json').is_file() else None,
                traversals=[r.get('traversal') for r in (result or {}).get('declarations',[])],
                resources=[c.get('resources') for c in checks],
                finished_present=finished.is_file(),
                finished_sha256=sha(finished) if finished.is_file() else None,
                result_sha256=sha(raw) if raw.is_file() else None,
                raw_result_path=str(raw) if raw.is_file() else None)
            write(directory/'ENGINEERING_MEASUREMENTS.json',metrics)
        self.last_check_directory=directory/'check'
        return result

    def test_supervisor_large_neutral_full_mathlib_actual_admission(self):
        for case in self.inputs()['cases']:
            with self.subTest(tag=case['tag']):
                result=self.run_case(case)
                self.assertTrue((self.last_check_directory/'FINISHED.json').is_file(),result)
                from machinery.validation_receipts import reuse
                from machinery.study_transfer import bind_task
                self.assertEqual(reuse(self.last_check_directory,(case['task'] if 'target_module' in case['task'] else bind_task(self.last_check_directory.parent/'workspace',case['task'])),case['solution'],case['required']),result)
                self.assertEqual(result['checked'],case['expected_checked'],result)
                self.assertEqual({c['operation'] for c in result['checks']},
                    {'compile','kernel_replay','trusted_premise_inspection'})
                self.assertEqual(result['inspection_schema'],proof_audit.SCHEMA)

    def test_differential_old_new_complete_closures(self):
        # INSPECTOR-ONLY differential on the same freshly replayed objects.
        # Never execute old check_task with current receipt dependencies.
        prior=ROOT/'evidence/construction-v3/source-audit-010'
        self.assertEqual(sha(prior/'SOURCE_MANIFEST.json'),
            '91849c3534793fc2c9b0c77303816bc3d7c322b310eb09d5a9745734953cbd7b')
        manifest=read(prior/'SOURCE_MANIFEST.json')
        path=prior/'sources/machinery/proof_audit.py'
        self.assertEqual(sha(path),manifest['files_sha256']['machinery/proof_audit.py'])
        spec=importlib.util.spec_from_file_location('machinery._inspection012_old_audit',path)
        old_audit=importlib.util.module_from_spec(spec); spec.loader.exec_module(old_audit)
        identities={}
        for case in self.inputs()['differential_cases']:
            with patch('machinery.retention.retire_build'):
                new=self.run_case(case)
            self.assertTrue(new['checked'],new)
            check=self.last_check_directory
            directory=check.parent/'old-inspector-only'; directory.mkdir()
            roots=tuple(r['name'] for r in new['declarations'])
            modules=sorted({c['origin'] for c in new['declarations'][0]['catalog']})
            (directory/'OldInspect.lean').write_text(old_audit.inspector(
                'StudyCheck',roots,case['required'],modules,artifact='declarations.json'))
            deps=[Path(v) for v in new['launch_environment']['LEAN_PATH'].split(':')]
            prefix=study_transfer.sandbox_prefix(directory,deps)
            record=study_transfer.run(prefix+[str(study_transfer.LEAN),'-j','1','OldInspect.lean'],
                cwd=directory,env={**new['launch_environment'],'TMPDIR':str(directory)},
                timeout=case['seconds'],output_bytes=1048576)
            old=old_audit.parse_artifact(record,roots,directory/'declarations.json')
            for a,b in zip(old,new['declarations']):
                self.assertEqual(a['name'],b['name'])
                self.assertEqual(set(a['axioms']),set(b['axioms']))
                for field in ('constants','catalog'):
                    self.assertEqual({(c['name'],c['origin']) for c in a[field]},
                                     {(c['name'],c['origin']) for c in b[field]})
            for rows in (old,new['declarations']):
                self.assertTrue(set(case['required']) <= {c['name'] for c in rows[0]['constants']})
            identities[case['tag']]=[{c['name']:c['semantic_sha256'] for c in rows[0]['catalog']}
                for rows in (old,new['declarations'])]
        # Compare equality/change WITHIN each encoding, never cross-version hashes.
        pairs=self.inputs()['differential_identity_pairs']
        self.assertTrue(pairs,'include unchanged and changed-unused catalog controls')
        for pair in pairs:
            left,right=identities[pair['left']],identities[pair['right']]
            for version in (0,1):
                self.assertEqual(left[version][pair['constant']]==right[version][pair['constant']],pair['equal'])
