"""Four new first-epoch connections; no process/model/native constructor.

Native CLI children are explicit doubles. Real pipe descriptors exercise the
operator's selector/drain/wait code without spawning a process. JSON content
and all directories are invented here, never an actual private suite or state.
"""
import hashlib,json,os,subprocess,tempfile,time,types,unittest
from pathlib import Path
from unittest.mock import patch
HERE=Path(__file__).parent
SOURCE=HERE/'operator.snapshot.py'
SOURCE_SHA='8a82b9a1835219d18abddf0398705dbfa13a1cb228787a3ab04fc80cfe83ca59'
MARKER='NEUTRAL_PRIVATE_SPAN_MUST_NOT_DECODE'

def canonical(value):return json.dumps(value,sort_keys=True,separators=(',',':')).encode()
def save(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    path.write_bytes(canonical(value)+b'\n')

def module(root):
    b=SOURCE.read_bytes();assert hashlib.sha256(b).hexdigest()==SOURCE_SHA
    m=types.ModuleType('neutral_first_epoch_operator');m.__file__=str(SOURCE)
    exec(compile(b,str(SOURCE),'exec'),m.__dict__);m.ROOT=root
    return m

def config(m):
    study=m.ROOT/'.scratch/studies/gaussian-quotient-concept-20261031'
    runtime=m.ROOT/'.bootstrap/gaussian-native-operator-20261031/RUN'
    base=m.ROOT/'new-inputs'
    return {'study':str(study),'runtime':str(runtime),'_config_sha256':'d'*64,
        'deadline_wall':time.time()+10000,'_deadline_monotonic':time.monotonic()+10000,
        'cleanup_seconds':1900,'model':'gpt-6.1-sol',
        'protocol':{'path':str(base/'PROTOCOL.json'),'sha256':'a'*64},
        'contract':{'path':str(base/'contract.json'),'sha256':'b'*64},
        'curation_suite':{'path':str(base/'curation/suite.json'),'sha256':'c'*64},
        'curation_provenance':{'path':str(base/'curation/provenance.json'),'sha256':'e'*64}}

def state(m,c,resolution=None):
    study=Path(c['study']);job=study/'arms/exploration/jobs/neutral-job'
    receipt={'request_id':'neutral-job','outcome':'completed','payload':{'opaque':MARKER}}
    save(job/'receipt.json',receipt)
    s={'round':4,'phase':'research','status':'finite_budget_finished; root_open',
       'calls':60,'meta_calls':40,'seconds':266400,'failures':0,'policy_trials':1,
       'active':None,'active_intent':None,'resolution':resolution,'reason':MARKER,
       'research':{'opaque':MARKER},'receipts':[str(job)],
       'receipt_hashes':{str(job):hashlib.sha256(canonical(receipt)).hexdigest()}}
    save(m.state_path(c),{'state':s,'sha256':hashlib.sha256(canonical(s)).hexdigest()})

class Keeper:
    def __init__(self,mode='normal'):self.code=None;self.mode=mode;self.waited=0
    def poll(self):return self.code
    def terminate(self):
        if self.mode=='oserror':raise OSError('SYNTHETIC ONLY')
        if self.mode=='normal':self.code=-15
    def kill(self):
        if self.mode=='normal':self.code=-9
    def wait(self,timeout=None):
        self.waited+=1
        if self.code is None:raise subprocess.TimeoutExpired('NEUTRAL_KEEPER',timeout)
        return self.code

class PipeChild:
    def __init__(self,events):
        self.events=events;self.polls=0;self.code=None
        streams=[]
        for _ in range(2):
            read,write=os.pipe();os.close(write);streams.append(os.fdopen(read,'rb',buffering=0))
        self.stdout,self.stderr=streams
    def poll(self):
        self.polls+=1
        if self.polls>=2:self.code=0
        return self.code
    def wait(self,timeout=None):self.events.append('owned_wait');return self.code
    def terminate(self):self.code=-15
    def kill(self):self.code=-9

class Connections(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='operator-new-connection-',dir=HERE)
        self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)

    def test_startup_exact_two_and_public_E1_idle_no_private_decode(self):
        m=module(self.root);c=config(m);m.source_checks=lambda c:None
        save(c['curation_suite']['path'],{'tasks':[{'kind':'holdout','statement':MARKER},
            {'kind':'regression','statement':MARKER}]})
        original=json.loads
        def checked(value,*a,**kw):
            self.assertNotIn(MARKER,value.decode() if isinstance(value,bytes) else value)
            return original(value,*a,**kw)
        with patch('json.loads',checked):
            runtime=m.startup(c);self.assertEqual(runtime,Path(c['runtime']))
            state(m,c,resolution={'opaque':MARKER})
            public=m.project_state(m.state_path(c));self.assertFalse(public['resolution_is_null'])
            closed=m.idle(c);self.assertTrue(closed['active_is_null'])
            m.publish(c,'neutral_observation')
        self.assertNotIn(MARKER,(Path(c['runtime'])/'STATUS.json').read_text())
        with self.assertRaisesRegex(RuntimeError,'one-use'):m.startup(c)
        other=module(self.root/'other');bad=config(other);other.source_checks=lambda c:None
        save(bad['curation_suite']['path'],{'tasks':[{'kind':'holdout'},{'kind':'regression'},{'kind':'holdout'}]})
        with self.assertRaisesRegex(RuntimeError,'exact two'):other.startup(bad)
        self.assertFalse(Path(bad['runtime']).exists())

    def lifecycle(self,mode):
        m=module(self.root/('lifecycle-'+mode));c=config(m);runtime=Path(c['runtime'])
        def startup(c):runtime.mkdir(parents=True);return runtime
        m.startup=startup;m.source_checks=lambda c:None
        keeper=Keeper(mode if mode in ('timeout','oserror') else 'normal')
        m.spawn=lambda *a,**kw:keeper;calls=[]
        def drive(c,name,argv,**kwargs):
            calls.append((name,argv));self.assertIs(kwargs['keeper'],keeper)
            if name=='FREEZE':Path(c['study']).mkdir(parents=True)
            else:
                state(m,c)
                if mode=='missing_controller_exit':raise RuntimeError('NEUTRAL_UNOBSERVED_WAIT')
            save(runtime/(name+'_EXIT.json'),{'schema':m.SCHEMA,'configuration_sha256':c['_config_sha256'],
                'returncode':0,'actual_numeric_wait_completed':True,'owned_handle':True,
                'terminate_sent':False,'kill_sent':False})
            return 0,False
        m.drive=drive
        result=m.run(c)
        return m,c,keeper,calls,result,json.loads((runtime/'OPERATOR_RETURN.json').read_bytes())

    def test_actual_run_freeze_and_exploration_only_CLI_binding(self):
        m,c,keeper,calls,result,returned=self.lifecycle('normal')
        self.assertEqual(result,0);self.assertEqual(keeper.waited,1)
        self.assertEqual(calls,[('FREEZE',[m.PYTHON,'-m','machinery.study','freeze','--study',c['study'],
            '--config',c['protocol']['path'],'--suite',c['curation_suite']['path'],'--contract',c['contract']['path']]),
            ('CONTROLLER',[m.PYTHON,'-m','machinery.study','run','--study',c['study'],'--arm','exploration'])])
        self.assertTrue(returned['all_owned_effects_settled']);self.assertFalse(returned['unresolved_cleanup'])
        self.assertFalse(returned['epoch2_launched']);self.assertFalse(returned['mathematical_completion_claimed'])
        status=json.loads((Path(c['runtime'])/'STATUS.json').read_bytes())
        self.assertEqual(status['phase'],'epoch1_complete_pending_root_closure_audit')
        self.assertTrue(status['status_file_is_timestamped_observation_not_live_handle'])

    def test_drive_writes_exit_only_after_same_fake_owned_numeric_wait(self):
        m=module(self.root);c=config(m);Path(c['runtime']).mkdir(parents=True)
        events=[];child=PipeChild(events);m.spawn=lambda *a,**kw:child
        original=m.write
        def write(path,value,**kw):
            if Path(path).name=='NEUTRAL_EXIT.json':self.assertEqual(events,['owned_wait'])
            return original(path,value,**kw)
        m.write=write
        self.assertEqual(m.drive(c,'NEUTRAL',['NEUTRAL_NO_PROCESS']), (0,False))
        exited=json.loads((Path(c['runtime'])/'NEUTRAL_EXIT.json').read_bytes())
        self.assertIs(exited['actual_numeric_wait_completed'],True);self.assertIs(exited['owned_handle'],True)
        self.assertEqual(type(exited['returncode']),int)
        self.assertTrue(child.stdout.closed and child.stderr.closed)

    def test_missing_controller_wait_and_keeper_failures_persist_uncertainty(self):
        for mode in ('missing_controller_exit','timeout','oserror'):
            with self.subTest(mode=mode):
                m,c,keeper,calls,result,returned=self.lifecycle(mode)
                self.assertEqual(result,1);self.assertTrue(returned['unresolved_cleanup'])
                self.assertFalse(returned['all_owned_effects_settled'])
                self.assertTrue((Path(c['runtime'])/'CLEANUP_UNCERTAIN.json').exists())
                self.assertFalse(returned['epoch2_launched'])

if __name__=='__main__':
    result=unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(Connections))
    (HERE/'OPERATOR_NEUTRAL_RESULT.json').write_text(json.dumps({'schema':'math-gkm.gaussian-first-operator-neutral-result.v1',
        'source_sha256':SOURCE_SHA,'test_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'tests':result.testsRun,'errors':len(result.errors),'failures':len(result.failures),'passed':result.wasSuccessful(),
        'actual_native_API_model_constructor_proof_or_ROOT_actions':False,'only_invented_private_fixtures_and_fake_owned_handles':True,
        'limits':'Source orchestration/CLI/status/cleanup connections only; native CLI children and source checks are explicit doubles. Low-level drive uses real EOF pipes and a fake process, never Popen.'},indent=2,sort_keys=True)+'\n')
    raise SystemExit(0 if result.wasSuccessful() else 1)
