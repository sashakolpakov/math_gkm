from pathlib import Path
import os,json,hashlib,datetime,stat
R=Path('/Users/sasha/math_gkm');C=R/'.scratch/strategy-v3-blended-20261018';O=R/'.bootstrap/construction-v3-20261018'
rows={};excluded=[];fixtures=[];versions={};test_runs=[]
BUFFER=1024*1024

def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(BUFFER),b''):h.update(b)
 return h.hexdigest()

def add(p,name,expected=None):
 p=Path(p);s=p.lstat()
 if not stat.S_ISREG(s.st_mode):raise ValueError('nonregular selected source: '+str(p))
 if name.startswith('/') or '..' in Path(name).parts:raise ValueError('unsafe member path')
 h=sha(p)
 if expected and h!=expected:raise ValueError('frozen source hash mismatch: '+str(p))
 if name in rows and rows[name]['origin']!=str(p):raise ValueError('member collision')
 rows[name]=dict(path=name,origin=str(p),bytes=s.st_size,sha256=h)

def tree(p,prefix):
 p=Path(p)
 if not p.is_dir() or p.is_symlink():raise ValueError('invalid selected root: '+str(p))
 for folder,dirs,files in os.walk(p,followlinks=False):
  base=Path(folder);keep=[]
  for n in dirs:
   q=base/n
   if q.is_symlink() or n in ['.lake','.git','build','objects','__pycache__','evaluation','evaluations','curation','curator']:
    excluded.append(dict(origin=str(q),reason='link/build/cache/evaluation exclusion'));continue
   keep.append(n)
  dirs[:]=keep
  for n in files:
   q=base/n
   if q.is_symlink() or q.suffix in ['.olean','.ilean','.pyc','.o','.a','.so','.dylib','.c'] or '.olean.' in n or '.ilean.' in n:
    excluded.append(dict(origin=str(q),reason='link/compiled exclusion'));continue
   if q.suffix not in ['.py','.lean','.json','.jsonl','.md','.txt','.toml','.log','.sb','.sh','.diff','.stdout'] and n!='lean-toolchain':
    excluded.append(dict(origin=str(q),reason='non-source suffix exclusion'));continue
   add(q,prefix+'/'+str(q.relative_to(p)))

for version,expected in [('013','b7f0e1f0d76ed9233b61321ce39f123c80a954ac436e66d7a885cbc12700558c'),('014','86b321c9628ce7493c89e06ab0000050375974fd7fe10c1c28181e5467e8ee3f')]:
 d=C/'evidence/construction-v3'/('source-audit-'+version);m=d/'SOURCE_MANIFEST.json';obj=json.loads(m.read_text())
 add(m,'checkpoints/'+version+'/SOURCE_MANIFEST.json',expected)
 for name,h in obj['files_sha256'].items():add(d/'sources'/name,'checkpoints/'+version+'/sources/'+name,h)
 for q in d.iterdir():
  if q.is_file():
   if q.name!='SOURCE_MANIFEST.json':add(q,'checkpoints/'+version+'/metadata/'+q.name)
  elif q.name!='sources':tree(q,'checkpoints/'+version+'/metadata/'+q.name)
 versions[version]=dict(manifest_sha256=expected,frozen_sources=len(obj['files_sha256']))

for number,version,watch in [('0012','013','testwatch-external-constructor-round12-deployment013'),('0013','014','testwatch-external-constructor-round13-elaboration014')]:
 tree(O/('round-'+number+'-executed'),'constructors/'+version+'/executed')
 for name in ['round-'+number+'-PROTECTED_BEFORE_'+version+'.json','round-'+number+'-PROTECTED_AFTER_'+version+'.json','round-'+number+'-prompt-'+version+'.txt']:
  add(O/name,'constructors/'+version+'/operator/'+name)
 proposed=O/('round-'+number+'-PROPOSED_INVOCATION_'+version+'.json')
 if proposed.exists():add(proposed,'constructors/'+version+'/operator/'+proposed.name)
 for suffix in ['json','jsonl','stdout']:
  name=watch+'.'+suffix;add(O/name,'constructors/'+version+'/operator/'+name)
 tree(O/('independent-source-review-'+version),'reviews/'+version+'/preserved')

for name in ['VALIDATION013.json','VALIDATION014.json','PRE_PURE013_QUIESCENCE.json','PRE013_PRODUCER_QUIESCENCE.json','PRE014_PRODUCER_QUIESCENCE.json','round-0013-VERIFICATION_CORRECTION_014.json','STAGING014_IMMUTABLE_FIXTURE.json','largepilot014_operator.py','largepilot014_operator_v2.py','bounded_test_watch_v7b.py']:
 add(O/name,'operations/'+name)

for name in ['math_gkm_inspection013_resource_source_review_20261018.md','math_gkm_inspection014_resource_source_review_20261018.md','math_gkm_integration014_remaining_repro_checklist_20261018.md','math_gkm_largepilot014_v2_closed_quiescence_20261019.json','math_gkm_integration014_resource_20261018T234858Z.json']:
 add(Path('/private/tmp')/name,'reviews/operational/'+name)

for label in ['cp013-pure-entrypoints','cp013-producer-binding','cp014-producer-binding','cp014-largepilot','cp014-largepilot-v2']:
 d=C/'.scratch/v3-validation'/label;tree(d,'tests/'+label)
 for suffix in ['json','jsonl','stdout']:
  name='testwatch-'+label+'.'+suffix;add(O/name,'tests/operator/'+name)
 lo=(d/'intent.json').stat().st_mtime-.2;hi=(d/'result.json').stat().st_mtime+.2
 test_runs.append(dict(label=label,closed_interval_lower_epoch=lo,closed_interval_upper_epoch=hi,result_sha256=sha(d/'result.json')))
 if label in ['cp013-pure-entrypoints','cp013-producer-binding','cp014-producer-binding']:
  for base,prefixes in [(C/'local.scratch',('repair012-','report008-')),(C/'.scratch',('parser005-','feedback011-','role-report-repair-','sol-deployment-neutral-'))]:
   for q in base.iterdir():
    if q.is_dir() and not q.is_symlink() and q.name.startswith(prefixes) and lo<=q.stat().st_birthtime<=hi:
     fixtures.append(dict(path=str(q),test_run=label,birthtime=q.stat().st_birthtime));tree(q,'tests/fixtures/'+label+'/'+q.name)

for label,name in [('cp014-largepilot','inspection011-h1tkj2q7'),('cp014-largepilot-v2','inspection011-cwodc47o')]:
 tree(C/'.scratch'/name,'tests/workspaces/'+label)

tree(O/'immutable-fixture-data013','fixture-data/immutable-fixture-data013')
# This separately selected exact helper manifest is public engineering fixture DATA,
# not a curator/evaluation suite. All its component files are in the immutable packet.
add(C/'local.scratch/inspection011-fixture.json','fixture-data/active-helper-manifest-copy.json','26438fcf09ee851c40abd70727007e75d859357e185d5d2626208efb92b493c1')

out=dict(schema='math-gkm.closed-inspection013-014-publication-inventory.v1',created_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),scope='Closed013/014 source engineering history only.013 constructor TIMEOUT,014 normal completion.013 pure32PASS;013 producer raw1PASS1FAIL (capacity pass inconclusive);014 producer2PASS. Largepilot v1 setup/JSON normalization failures and v2 checked:true PUBLIC restricted-branch engineering validation. No installed/main registry admission/general conjecture/clean bootstrap claim.',versions=versions,selected_files=sorted(rows.values(),key=lambda x:x['path']),selected_file_count=len(rows),selected_source_bytes=sum(x['bytes'] for x in rows.values()),fixture_roots=fixtures,test_runs=test_runs,excluded=excluded,selection_note='Synthetic fixture roots use exact known test prefixes and closed intent/result mtime interval plus/minus0.2s, then fixed selected hashes. Timestamp association is not proof of causal ownership. All evaluation dirs (including regenerable synthetic evaluation) and compiled/link/cache payload excluded. Two exact frozen construction-inspector.json.gz members are lossless old source evidence requiring bounded nested UTF8/content scan, not compiled binaries.',private_evaluation_read_or_selected=False,active_files_selected=False,buffer_bytes=BUFFER,old010_prerequisite=dict(public_commit='733914c8e7883f3eb6340d7f213ee7e3e4800d9b',archive='evidence/blended-harness-v3-report-repair-20261018/report-repair008-009-010-source-evidence.tar.gz',sha256='e164c426cb48ba26a467e29c7a4717498b7285d3fb80a76579bf1c1d724eba96'),archive_status='PROPOSAL ONLY. No archive created; parent review required before packaging.')
p=Path('/private/tmp/math_gkm_inspection013_014_preservation_inventory_20261019.json');p.write_text(json.dumps(out,sort_keys=True,indent=2)+'\n')
print(json.dumps(dict(inventory=str(p),sha256=sha(p),files=out['selected_file_count'],bytes=out['selected_source_bytes'],versions=versions,fixture_counts={l:sum(f['test_run']==l for f in fixtures) for l in ['cp013-pure-entrypoints','cp013-producer-binding','cp014-producer-binding']},excluded=len(excluded),largest_selected=max(rows.values(),key=lambda r:r['bytes'])),indent=2))
