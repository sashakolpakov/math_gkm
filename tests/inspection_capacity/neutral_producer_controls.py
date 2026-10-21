"""Prepared actual Lean controls. NOT executed by the offline test runner.

Later use, only after the operator verifies quiescence and authorizes execution:
GKM_CAPACITY_QUIESCENT=reviewed python3 neutral_producer_controls.py --run
The intentionally forbidden axiom is isolated negative control source, never a
research input or admitted theorem. Outputs use a fresh tempfile/TMPDIR child, never the installed test tree.
"""
import copy
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import secrets
import shutil
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

HOME = Path(__file__).resolve().parent
LIVE = Path(os.environ.get('MATH_GKM_CAPACITY_REPO', os.getcwd())).expanduser().resolve()
if not (LIVE/'machinery/study_common.py').is_file() or not (LIVE/'lean-toolchain').is_file():
    raise RuntimeError('Set MATH_GKM_CAPACITY_REPO or run from a validated repository root')
OVERLAY = Path(os.environ['MATH_GKM_CAPACITY_STAGE']).expanduser().resolve() if os.environ.get('MATH_GKM_CAPACITY_STAGE') else None
sys.dont_write_bytecode = True
sys.path.insert(0, str(LIVE))
import machinery
machinery.__path__ = ([str(OVERLAY/'machinery')] if OVERLAY else []) + [str(LIVE/'machinery')]
from machinery import proof_audit as audit, inspection_stream, validation_receipts as receipts
from machinery.study_common import Invalid, read, sha, write

MODULE = 'MathGKM.InspectionCapacityNeutral'
GOOD = MODULE+'.goodRoot'
POISON = MODULE+'.poisonRoot'
BASE = MODULE+'.base'
UNUSED = MODULE+'.unused'
LOW_TEST_CAP = 16


BASELINE_HASHES = {
    'proof_audit.py':'1c836ec67bdd37ce05dc80d35a34d5d9cf4b526c552afc2f5e83d653323753ba',
    'inspection_stream.py':'cb0ff86634236920531ea15f5151ad94ad0782a908ead12ce88f83ee647c4ab3',
    'own_feedback.py':'1d5bda9d3ce3f4957b13e7f5efcf554ef3ae059d802500465042f50ff30a8d69'}


def baseline_path(filename):
    roots = ([OVERLAY/'baseline/machinery'] if OVERLAY else []) + [HOME/'baseline/machinery',
        LIVE/'evidence/concept-driver-source-20261020/source/machinery']
    path = next((root/filename for root in roots if (root/filename).is_file()), None)
    if path is None or sha(path) != BASELINE_HASHES[filename]:
        raise RuntimeError('Missing or changed historical inspector source: '+filename)
    return path


def baseline(name):
    spec = importlib.util.spec_from_file_location('machinery._capacity_neutral_old_'+name,
        baseline_path(name+'.py'))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class ActualNeutralProducerControls(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if os.environ.get('GKM_CAPACITY_QUIESCENT') != 'reviewed':
            raise RuntimeError('Actual controls require separate operator-confirmed quiescence; not an offline suite')
        from machinery.process import run
        from machinery.trust import LEAN, CHECKER, CORE, environment
        from machinery.study_transfer import sandbox_prefix
        cls.process_run = staticmethod(run)
        cls.LEAN, cls.CHECKER, cls.CORE = LEAN, CHECKER, CORE
        cls.environment = staticmethod(environment)
        cls.sandbox_prefix = staticmethod(sandbox_prefix)
        cls.old_audit = baseline('proof_audit')
        cls.old_stream = baseline('inspection_stream')
        for name in BASELINE_HASHES: baseline_path(name)
        cls.work = Path(tempfile.mkdtemp(prefix='math-gkm-capacity-neutral-')).resolve()
        print('NEUTRAL_RESULT_DIRECTORY',cls.work,flush=True)
        cls.source = cls.work/'module-source'; (cls.source/'MathGKM').mkdir(parents=True)
        cls.build = cls.work/'build'; (cls.build/'MathGKM').mkdir(parents=True)
        fixture = HOME/'controls/MathGKM/InspectionCapacityNeutral.lean'
        cls.fixture_sha = sha(fixture)
        shutil.copyfile(fixture, cls.source/'MathGKM/InspectionCapacityNeutral.lean')
        cls.env = {**environment([cls.build,CORE]),'TMPDIR':str(cls.work)}
        prefix = sandbox_prefix(cls.work,[CORE])
        cls.setup_records = []
        for operation, command in (
                ('compile',[str(LEAN),'-j','1','-o',str(cls.build/'MathGKM/InspectionCapacityNeutral.olean'),'MathGKM/InspectionCapacityNeutral.lean']),
                ('kernel_replay',[str(CHECKER),MODULE])):
            cls.not_stopped()
            record = run(prefix+command,cwd=cls.source,env=cls.env,timeout=120,output_bytes=1048576)
            cls.setup_records.append(dict(operation=operation,**record))
            if record['returncode'] or record['termination'] or record.get('operationally_incomplete') or record['stdout'] or record['stderr']:
                raise AssertionError({'setup_operation':operation,'record':record})
        write(cls.work/'SETUP.json',dict(engineering_control_only=True,source_sha256=cls.fixture_sha,checks=cls.setup_records))

    @classmethod
    def not_stopped(cls):
        if (getattr(cls,'work',HOME)/'STOP').exists() or (OVERLAY and (OVERLAY/'STOP').exists()):
            raise RuntimeError('Neutral control STOP requested')

    def inspect(self, root=GOOD, *, old=False, cap=None, required=(BASE,)):
        self.not_stopped()
        directory = Path(tempfile.mkdtemp(prefix='attempt-',dir=self.work))
        source = directory/'source'; source.mkdir()
        nonce = secrets.token_hex(32)
        if old:
            text = self.old_stream.program(MODULE,(root,),required,(MODULE,),nonce)
        else:
            with patch.object(audit,'EDGE_LIMIT',audit.EDGE_LIMIT if cap is None else cap):
                text = inspection_stream.program(MODULE,(root,),required,(MODULE,),nonce)
        (source/'Producer.lean').write_text(text)
        (source/'MathGKM').mkdir()
        shutil.copyfile(self.source/'MathGKM/InspectionCapacityNeutral.lean',source/'MathGKM/InspectionCapacityNeutral.lean')
        prefix = self.sandbox_prefix(directory,[self.build,self.CORE])
        record = self.process_run(prefix+[str(self.LEAN),'-j','1','Producer.lean'],cwd=source,
            env={**self.env,'TMPDIR':str(directory)},timeout=120,output_bytes=1048576)
        write(directory/'PROCESS.json',record)
        return directory,record,nonce

    def success(self, directory, record, nonce, root=GOOD, parser=audit):
        self.assertEqual(record['returncode'],0,record)
        self.assertIsNone(record['termination'],record)
        self.assertFalse(record.get('operationally_incomplete'),record)
        self.assertEqual(record['stderr'],'',record)
        self.assertRegex(record['stdout'],r'\AGKM_DECLARATIONS_COMPLETE_V3:'+nonce+r':[0-9]+:[0-9a-f]{64}\n\Z')
        return parser.parse_artifact(record,(root,),directory/'source/declarations.json',nonce=nonce)

    def failure(self, directory, record, nonce, category, root=GOOD):
        self.assertEqual(record['returncode'],1,record)
        self.assertIsNone(record['termination'],record)
        self.assertFalse(record.get('operationally_incomplete'),record)
        failure = audit.failure_artifact(directory/'source/declarations.json',(root,),record,nonce=nonce)
        self.assertIsNotNone(failure,record)
        self.assertEqual(failure['category'],category)
        prefix = 'GKM_INSPECTION_FAILURE_V3:'+nonce+':'
        other = [line for line in (record['stdout']+'\n'+record['stderr']).splitlines() if line and not line.startswith(prefix)]
        self.assertEqual(len(other),1,record)
        self.assertRegex(other[0],r'^(?:Producer\.lean:[0-9]+:[0-9]+: )?error: trusted inspection did not complete$',record)

    def identities(self, rows):
        result=[]
        for row in rows:
            result.append(dict(name=row['name'],axioms=sorted(row['axioms']),
                traversal=row['traversal'],
                constants=sorted(row['constants'],key=lambda v:v['name']),
                catalog=sorted(row['catalog'],key=lambda v:v['name'])))
        return result

    def test_small_complete_old_new_closures_equal(self):
        a,ra,na = self.inspect(old=True)
        b,rb,nb = self.inspect()
        before = self.success(a,ra,na,parser=self.old_audit)
        after = self.success(b,rb,nb)
        self.assertEqual(self.identities(before),self.identities(after))
        self.assertIn(BASE,{v['name'] for v in after[0]['constants']})
        self.assertIn(UNUSED,{v['name'] for v in after[0]['catalog']})

    def test_scaled_low_cap_fails_shared_graph_full_cap_counts_every_edge(self):
        low,rl,nl = self.inspect(cap=LOW_TEST_CAP)
        self.failure(low,rl,nl,'dependency_edge_limit')
        high,rh,nh = self.inspect()
        traversal = self.success(high,rh,nh)[0]['traversal']
        self.assertGreater(traversal['edges'],LOW_TEST_CAP)
        self.assertGreater(traversal['duplicate_edges'],0)
        self.assertEqual(traversal['edges']-traversal['duplicate_edges'],traversal['distinct_nodes']-1)
        self.assertLessEqual(traversal['distinct_nodes'],200000)

    def test_forbidden_axiom_reachable_after_low_test_cap_is_not_hidden(self):
        low,rl,nl = self.inspect(POISON,cap=LOW_TEST_CAP)
        self.failure(low,rl,nl,'dependency_edge_limit',POISON)
        high,rh,nh = self.inspect(POISON)
        self.failure(high,rh,nh,'forbidden_axiom',POISON)

    def test_required_constant_missing_from_root_despite_catalog_presence(self):
        directory,record,nonce = self.inspect(required=(UNUSED,))
        self.failure(directory,record,nonce,'missing_required')

    def test_actual_nonce_hash_source_and_finished_bindings(self):
        directory,record,nonce = self.inspect()
        rows = self.success(directory,record,nonce)
        artifact = directory/'source/declarations.json'; original = artifact.read_bytes()
        with self.assertRaises(Invalid):
            audit.parse_artifact(record,(GOOD,),artifact,nonce=('0' if nonce[0]!='0' else '1')+nonce[1:])
        changed = original.replace(b'"nat",[37]',b'"nat",[38]',1)
        self.assertNotEqual(changed,original)
        self.assertEqual(len(changed),len(original))
        artifact.write_bytes(changed)
        with self.assertRaises(Invalid): audit.parse_artifact(record,(GOOD,),artifact,nonce=nonce)
        artifact.write_bytes(original)
        # This is engineering evidence, explicitly not a research admission.
        result=dict(checked=False,status='neutral_producer_control_only',finished=time.time(),
            inspection_schema=audit.SCHEMA,declarations=rows,producer_completion=rows[0]['producer_completion'],
            declaration_artifact_sha256=sha(artifact),checks=self.setup_records+[
                dict(operation='trusted_premise_inspection',**record)],
            binary_hashes={str(p):sha(p) for p in (self.LEAN,self.CHECKER)},
            pin_hashes={name:sha(LIVE/name) for name in ('lean-toolchain','lakefile.toml','lake-manifest.json')})
        write(directory/'result.json',result)
        task=dict(engineering_only=True,source_sha256=self.fixture_sha,root=GOOD,
            producer_source_sha256=sha(directory/'source/Producer.lean'))
        solution=dict(engineering_only=True);required=(BASE,)
        receipts.finish(directory,task,solution,required)
        self.assertFalse(receipts.reuse(directory,task,solution,required)['checked'])
        producer=directory/'source/Producer.lean';saved=producer.read_bytes()
        producer.write_bytes(saved+b'\n-- altered source\n')
        with self.assertRaises(Invalid): receipts.reuse(directory,task,solution,required)
        producer.write_bytes(saved)
        marker=directory/'FINISHED.json';saved_marker=marker.read_bytes();marker.unlink()
        with self.assertRaises(receipts.UnfinishedReceipt): receipts.reuse(directory,task,solution,required)
        marker.write_bytes(saved_marker)
        self.assertFalse(receipts.reuse(directory,task,solution,required)['checked'])


if __name__ == '__main__':
    if '--run' not in sys.argv:
        print('PREPARED ONLY: no Lean/model calls. Separate quiescent authorization is required for --run.')
    else:
        sys.argv.remove('--run')
        unittest.main(verbosity=2)
