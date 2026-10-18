from pathlib import Path
import os,json,hashlib,datetime,stat
R=Path('/Users/sasha/math_gkm');C=R/'.scratch/strategy-v3-blended-20261018';O=R/'.bootstrap/construction-v3-20261018';rows={};excluded=[];fixture_roots=[]
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
 return h.hexdigest()
def add(p,name,expected=None):
 p=Path(p);s=p.lstat()
 if not stat.S_ISREG(s.st_mode):raise ValueError('nonregular fixed source: '+str(p))
 h=sha(p)
 if expected and h!=expected:raise ValueError('frozen hash mismatch: '+str(p))
 if name in rows and rows[name]['origin']!=str(p):raise ValueError('archive name collision')
 rows[name]=dict(path=name,origin=str(p),bytes=s.st_size,sha256=h)
def tree(p,prefix):
 for folder,dirs,files in os.walk(p,followlinks=False):
  base=Path(folder);kept=[]
  for d in dirs:
   q=base/d;rel=q.relative_to(p)
   if q.is_symlink() or d in ['.lake','build','__pycache__','evaluation','evaluations','curation','curator']:
    excluded.append(dict(origin=str(q),reason='link/build/cache/evaluation exclusion'));continue
   kept.append(d)
  dirs[:]=kept
  for n in files:
   q=base/n;rel=q.relative_to(p)
   if q.is_symlink() or q.suffix in ['.olean','.ilean','.pyc','.o','.a','.so','.dylib'] or '.olean.' in n or '.ilean.' in n:
    excluded.append(dict(origin=str(q),reason='link/compiled exclusion'));continue
   if q.suffix not in ['.py','.lean','.json','.jsonl','.md','.txt','.toml','.log','.sb','.sh'] and n not in ['lean-toolchain']:
    excluded.append(dict(origin=str(q),reason='non-source suffix exclusion'));continue
   add(q,prefix+'/'+str(rel))
versions={}
for v,expected in [('011','bfa39cf48afc37645932202fa6de04bdf60ce98747ae40876e4a5a66620f7159'),('012','147c8d84caff127f3058d8c5e29c6f439e3fc35dc975e15cba2fcd02e7dd24d0')]:
 d=C/'evidence/construction-v3'/('source-audit-'+v);m=d/'SOURCE_MANIFEST.json';obj=json.loads(m.read_text());add(m,'checkpoints/'+v+'/SOURCE_MANIFEST.json',expected)
 for n,h in obj['files_sha256'].items():add(d/'sources'/n,'checkpoints/'+v+'/sources/'+n,h)
 # Checkpoint metadata not duplicated into the live source selection.
 for q in d.iterdir():
  if q.is_file() and q.name!='SOURCE_MANIFEST.json':add(q,'checkpoints/'+v+'/metadata/'+q.name)
 versions[v]=dict(manifest_sha256=expected,frozen_sources=len(obj['files_sha256']))
for number,v in [('0010','011'),('0011','012')]:
 tree(O/('round-'+number+'-executed'),'constructors/'+v+'/executed')
 for n in ['round-'+number+'-PROTECTED_BEFORE_'+v+'.json','round-'+number+'-PROTECTED_AFTER_'+v+'.json','round-'+number+'-PROPOSED_INVOCATION_'+v+'.json','round-'+number+'-prompt-'+v+'.txt','testwatch-external-constructor-round'+str(int(number))+'-inspection'+v+'.json','testwatch-external-constructor-round'+str(int(number))+'-inspection'+v+'.jsonl','testwatch-external-constructor-round'+str(int(number))+'-inspection'+v+'.stdout']:
  add(O/n,'constructors/'+v+'/operator/'+n)
 tree(O/('independent-source-review-'+v),'reviews/'+v+'/preserved')
for v in ['011','012']:
 p=Path('/private/tmp')/('math_gkm_inspection'+v+'_resource_source_review_20261018.md');add(p,'reviews/'+v+'/'+p.name)
 p=Path('/private/tmp')/('math_gkm_inspection'+v+('_resource_snapshot_20261018T225011Z.json' if v=='011' else '_quiescence_20261018T230823Z.json'));add(p,'reviews/'+v+'/'+p.name)
intervals=[]
for label in ['cp012-pure-entrypoints','cp012-producer-binding']:
 d=C/'.scratch/v3-validation'/label;tree(d,'tests/'+label)
 lo=(d/'intent.json').stat().st_mtime-.2;hi=(d/'result.json').stat().st_mtime+.2;intervals.append((label,lo,hi))
 for suffix in ['json','jsonl','stdout']:add(O/('testwatch-'+label+'.'+suffix),'tests/operator/testwatch-'+label+'.'+suffix)
 for base,prefixes in [(C/'local.scratch',('repair012-','report008-')),(C/'.scratch',('parser005-','feedback011-','report008-','role-report-repair-'))]:
  for q in base.iterdir():
   if q.is_dir() and not q.is_symlink() and q.name.startswith(prefixes) and lo<=q.stat().st_birthtime<=hi:
    fixture_roots.append(dict(path=str(q),test_run=label,birthtime=q.stat().st_birthtime));tree(q,'tests/fixtures/'+label+'/'+q.name)
obj=dict(schema='math-gkm.closed-inspection011-012-publication-inventory.v1',UTC=datetime.datetime.now(datetime.timezone.utc).isoformat(),scope='Closed011/012 sources, completed own constructor histories, independent reviews,28 pure successes and1 producer FAIL+1 ERROR; no admission/cold bootstrap claim',versions=versions,selected_files=sorted(rows.values(),key=lambda x:x['path']),selected_file_count=len(rows),selected_source_bytes=sum(x['bytes'] for x in rows.values()),fixture_roots=fixture_roots,excluded=excluded,excluded_active013=True,private_evaluation_read_or_selected=False,buffer_bytes=1048576,old010_reference='public733914c8e7883f3eb6340d7f213ee7e3e4800d9b report-repair008-009-010 source archive',selection_note='Fixture roots selected by exact test-run closed timestamps and known test-specific prefixes, then fixed by full selected hashes; synthetic evaluation dirs/alias links are excluded, tests regenerate them.')
p=Path('/private/tmp/math_gkm_inspection011_012_preservation_inventory_v2_20261018.json');p.write_text(json.dumps(obj,sort_keys=True,indent=2)+'\n');print(json.dumps({'inventory':str(p),'sha256':sha(p),'files':obj['selected_file_count'],'bytes':obj['selected_source_bytes'],'fixtures':len(fixture_roots),'excluded':len(excluded),'fixture_counts':{l:sum(q['test_run']==l for q in fixture_roots) for l,_,_ in intervals}},indent=2))
