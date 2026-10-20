import hashlib,io,json,os,platform,sys,tarfile,tempfile,unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch
import repro

class ReproTests(unittest.TestCase):
    def test_axiom_output_requires_exact_names_and_allowed_axioms(self):
        profile={'axiom_prints':{'Audit':['Project.theorem']}}
        def records(text):return [{'module':'Audit','operation':'compile','stdout':text}]
        self.assertEqual(repro.audit_axiom_prints(profile,records("'Project.theorem' depends on axioms: [propext]"))[0]['declarations'],1)
        for text in ["'Project.theorem' depends on axioms: [sorryAx]", "'Wrong.theorem' depends on axioms: [propext]", '', "'Project.theorem' depends on axioms: []\n'Project.theorem' depends on axioms: []"]:
            with self.assertRaises(ValueError):repro.audit_axiom_prints(profile,records(text))
    def test_exact_checkout_from_local_git_repository(self):
        with tempfile.TemporaryDirectory() as d:
            base=Path(d);source=base/'source';source.mkdir()
            repro.execute(['git','init','--quiet'],source)
            (source/'input.txt').write_text('pinned fixture\n')
            (source/'retained-archive.txt').write_text('retained on origin\n')
            repro.execute(['git','add','input.txt','retained-archive.txt'],source)
            repro.execute(['git','-c','user.name=Fixture','-c','user.email=fixture@example.invalid','commit','--quiet','-m','fixture'],source)
            revision=repro.execute(['git','rev-parse','HEAD'],source).strip()
            target=base/'checkout';repro.checkout_exact(str(source),revision,target,base)
            self.assertEqual((target/'input.txt').read_bytes(),(source/'input.txt').read_bytes())
            self.assertEqual(repro.execute(['git','rev-parse','HEAD'],target).strip(),revision)
            sparse=base/'sparse';repro.checkout_exact(str(source),revision,sparse,base,['input.txt'])
            self.assertTrue((sparse/'input.txt').is_file())
            self.assertFalse((sparse/'retained-archive.txt').exists())
            self.assertEqual(repro.execute(['git','show','HEAD:retained-archive.txt'],sparse),'retained on origin\n')
            self.assertEqual(repro.execute(['git','status','--porcelain'],sparse),'')
    def test_order_and_cycle(self):
        sources={'A':{'imports':['B','Mathlib']},'B':{'imports':[]}}
        self.assertEqual(repro.ordered({'modules':['A']},sources),['B','A'])
        sources['B']['imports']=['A']
        with self.assertRaises(ValueError):repro.ordered({'modules':['A']},sources)
    def test_source_hash_preflight(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);(root/'A.lean').write_text('fixture only')
            m={'profiles':{'test':{'modules':['A']}},'sources':{'A':{'path':'A.lean','sha256':repro.sha(root/'A.lean'),'imports':[]}},'fixed_inputs':[]}
            self.assertEqual(repro.preflight(root,m,'test'),['A'])
            (root/'A.lean').write_text('changed')
            with self.assertRaises(ValueError):repro.preflight(root,m,'test')
    def tar(self,path,entries):
        with tarfile.open(path,'w:gz') as t:
            for name,data in entries:
                row=tarfile.TarInfo(name);row.size=len(data);t.addfile(row,io.BytesIO(data))
    def test_safe_exact_archive_and_reject_traversal(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);archive=root/'a.tar.gz';dest=root/'dest';dest.mkdir();data=b'ordinary object fixture'
            self.tar(archive,[('objects/x',data)])
            repro.extract_checked(archive,dest,{'objects/x':{'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}})
            self.assertEqual((dest/'objects/x').read_bytes(),data)
            self.tar(archive,[('../escape',data)])
            with self.assertRaises(ValueError):repro.extract_checked(archive,dest,{'../escape':{'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}})
            self.assertFalse((root/'escape').exists())
    def test_release_schema_current_only_default(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);data=b'cache fixture';digest=hashlib.sha256(data).hexdigest();archive=root/'a.tar.gz'
            self.tar(archive,[('objects/'+digest,data)])
            spec={'schema':1,'repository':'https://github.com/example/project','tag':'frozen','public_source_commit':'a'*40,'lean_toolchain':'leanprover/lean4:v4.32.2','platform':sys.platform+'-'+platform.machine(),'objects':{digest:{'sha256':digest,'size':len(data),'current_paths':['evidence/tag/A.olean'],'restore_paths':['evidence/tag/A.olean','.control/objects/'+digest],'sources':[],'asset':'a.tar.gz'}},'assets':[{'name':'a.tar.gz','size':archive.stat().st_size,'sha256':repro.sha(archive),'objects':[digest]}]}
            manifest=root/'recovery.json';manifest.write_text(json.dumps(spec));dest=root/'restored'
            with patch('repro.urllib.request.urlopen',side_effect=lambda *a,**k:archive.open('rb')):
                repro.recover(SimpleNamespace(recovery_manifest=manifest,destination=dest,historical_copies=False))
            self.assertEqual((dest/'evidence/tag/A.olean').read_bytes(),data)
            self.assertFalse((dest/'.control').exists())
    def test_failed_fake_tool_does_not_claim_pass(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);(root/'.scratch').mkdir();(root/'core').mkdir();(root/'A.lean').write_text('fixture only')
            fake=root/'fake';fake.write_text('#!/bin/sh\nexit 7\n');fake.chmod(0o755)
            m={'packages':[],'fixed_inputs':[],'sources':{'A':{'path':'A.lean','sha256':repro.sha(root/'A.lean'),'imports':[]}},'profiles':{'test':{'modules':['A'],'scope':'fixture'}}}
            mp=root/'manifest.json';mp.write_text(json.dumps(m));repro.save(root/repro.MARKER,{'manifest_sha256':repro.sha(mp),'dependencies':'cache','lean':str(fake),'leanchecker':str(fake),'core':str(root/'core')})
            with self.assertRaises(RuntimeError):repro.run_profile(SimpleNamespace(workspace=root,manifest=mp,profile='test',timeout=2),m)
            report=list((root/'.scratch').glob('run-*/result.json'))[0]
            self.assertEqual(repro.load(report)['status'],'failed')
    def test_archive_duplicate_and_link_rejected(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);a=root/'a.tar.gz';dest=root/'dest';dest.mkdir();data=b'x'
            spec={'x':{'bytes':1,'sha256':hashlib.sha256(data).hexdigest()}}
            self.tar(a,[('x',data),('x',data)])
            with self.assertRaises(ValueError):repro.extract_checked(a,dest,spec)
            with tarfile.open(a,'w:gz') as t:
                row=tarfile.TarInfo('link');row.type=tarfile.SYMTYPE;row.linkname='../escape';t.addfile(row)
            with self.assertRaises(ValueError):repro.extract_checked(a,dest,{})
    def test_zero_exit_without_object_is_not_compilation(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);(root/'.scratch').mkdir();(root/'core').mkdir();(root/'A.lean').write_text('fixture only')
            fake=root/'fake';fake.write_text('#!/bin/sh\nexit 0\n');fake.chmod(0o755)
            m={'packages':[],'fixed_inputs':[],'sources':{'A':{'path':'A.lean','sha256':repro.sha(root/'A.lean'),'imports':[]}},'profiles':{'test':{'modules':['A'],'scope':'fixture'}}}
            mp=root/'manifest.json';mp.write_text(json.dumps(m));repro.save(root/repro.MARKER,{'manifest_sha256':repro.sha(mp),'dependencies':'cache','lean':str(fake),'leanchecker':str(fake),'core':str(root/'core')})
            with self.assertRaises(ValueError):repro.run_profile(SimpleNamespace(workspace=root,manifest=mp,profile='test',timeout=2),m)
    def test_archive_hash_mismatch_rejected(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);a=root/'a.tar.gz';dest=root/'dest';dest.mkdir();self.tar(a,[('x',b'x')])
            with self.assertRaises(ValueError):repro.extract_checked(a,dest,{'x':{'bytes':1,'sha256':'0'*64}})
    def test_bootstrap_rejects_existing_destination_before_tools(self):
        with tempfile.TemporaryDirectory() as d,patch('repro.execute') as call:
            with self.assertRaises(ValueError):repro.bootstrap(SimpleNamespace(workspace=d),{})
            call.assert_not_called()
    def test_prepare_copies_fixture_without_source_mutation(self):
        with tempfile.TemporaryDirectory() as d:
            base=Path(d);source=base/'source';source.mkdir();(source/'A.lean').write_text('fixture only')
            tc=base/'toolchain';(tc/'bin').mkdir(parents=True);(tc/'lib/lean').mkdir(parents=True)
            for n in ['lean','leanchecker']:(tc/'bin'/n).write_text('not executable fixture')
            m={'published_commit':'a'*40,'toolchain':'leanprover/lean4:v4.32.2','packages':[],'fixed_inputs':[],'sources':{'A':{'path':'A.lean','sha256':repro.sha(source/'A.lean'),'imports':[]}},'profiles':{'test':{'modules':['A'],'scope':'fixture'}}}
            mp=base/'manifest.json';mp.write_text(json.dumps(m));dest=base/'isolated'
            with patch('repro.execute',return_value='Lean (version 4.32.2, fixture)'):
                repro.prepare(SimpleNamespace(workspace=dest,source=source,profile='test',toolchain_dir=tc,packages_dir=base/'packages',manifest=mp),m)
            self.assertEqual((dest/'A.lean').read_bytes(),(source/'A.lean').read_bytes())
            self.assertFalse((source/'.scratch').exists())
            self.assertEqual(repro.load(dest/repro.MARKER)['dependencies'],'explicit_existing')

if __name__=='__main__':unittest.main()
