"""Machine-authored final hash manifest, not independent admission."""
import pathlib,json,hashlib,re
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-9a720f77'
mods=['MarkovPellSum9a72','MarkovPellSummand9a72','MarkovPellHorizontalSum9a72','MarkovPellObstructions9a72','MarkovPellFiberTransfer9a72']
runs=[(p,json.loads(p.read_text())) for p in o.glob('run-*.json')];records=[]
for m in mods:
 p=r/'research'/f'{m}.lean';sha=hashlib.sha256(p.read_bytes()).hexdigest();rr=[(q,d) for q,d in runs if d['source']==str(p.relative_to(r)) and d['sha256']==sha]
 builds=[(q,d) for q,d in rr if d.get('returncode')==0 and d['command'][0].endswith('/lean')]
 kernels=[(q,d) for q,d in rr if d.get('returncode')==0 and d['command'][0].endswith('/leanchecker')]
 imports=[]
 if builds:
  lp=builds[-1][1]['lean_path'].split(':')
  for name in re.findall(r'^import (\S+)',p.read_text(),re.M):
   found=next((pathlib.Path(d)/(name.replace('.','/')+'.olean') for d in lp if (pathlib.Path(d)/(name.replace('.','/')+'.olean')).is_file()),None)
   if found:imports.append(dict(module=name,path=str(found),sha256=hashlib.sha256(found.read_bytes()).hexdigest()))
 code=re.sub(r'/-[\s\S]*?-/|--[^\n]*','',p.read_text())
 records.append(dict(module=m,source=str(p.relative_to(r)),sha256=sha,status='compiled and kernel-replayed' if builds and kernels else 'incomplete',builds=[str(q.relative_to(r)) for q,d in builds],kernels=[str(q.relative_to(r)) for q,d in kernels],direct_import_binaries=imports,axiom_output=builds[-1][1]['stdout'] if builds else None,forbidden_source_tokens=re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',code)))
v=dict(request_id='9a720f77696445aab32325da611c5097',modules=records,root_sha256=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest(),rejected_attempts=[str(p.relative_to(r)) for p,d in runs if d.get('returncode',1)!=0],scope='Fresh named-source builds and kernel replay using inherited compiled imports. Not independent or full dependency rebuild.',completion=None)
(o/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
ops=dict(capability_failures=['Sage unavailable; GAP detected but not needed.','SymPy import raised ModuleNotFoundError; exact rational arithmetic used without installation.','Active permission profile denies .scratch and default temporary location; shell heredoc failed. Temporary work stored under uniquely named research directory.','Two guessed research filenames did not exist; actual modules were located with rg.','STOP.json absent when checked.'],rejected_compilations=v['rejected_attempts'],notes=['One dependent build was started before its prerequisite had successfully compiled; it failed missing-import and was repeated only after prerequisite success.','Rejected elaborations can print parser-generated sorryAx; they are not admitted. Successful final closures contain only permitted axioms.','All controller, contract, root, independent evidence and prior research files preserved.'])
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
print(json.dumps([(m['module'],m['status']) for m in records]))
