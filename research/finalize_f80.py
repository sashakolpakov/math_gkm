"""Machine-authored local receipt inventory, not independent admission."""
import pathlib,json,hashlib,time,re
root=pathlib.Path('/Users/sasha/math_gkm');out=root/'evidence/markov-f80fb8bc'
mods=['MarkovGasF80','MarkovRenewalF80','MarkovCutsF80','MarkovBlocksF80','MarkovObstructionF80']
receipts=[]
for p in sorted(out.glob('run-*.json')):
 r=json.loads(p.read_text());r['receipt']=str(p.relative_to(root));receipts.append(r)
checks=[]
for m in mods:
 src=root/'research'/f'{m}.lean';h=hashlib.sha256(src.read_bytes()).hexdigest()
 rs=[r for r in receipts if r['source']==f'research/{m}.lean' and r['sha256']==h]
 good=[r for r in rs if r.get('returncode')==0 and 'sorryAx' not in r.get('stdout','')]
 builds=[r for r in good if r['command'][0].endswith('/lean')]
 kernels=[r for r in good if r['command'][0].endswith('/leanchecker')]
 checks.append(dict(module=m,sha256=h,build=builds[-1]['receipt'] if builds else None,
  kernel=kernels[-1]['receipt'] if kernels else None,axiom_output=builds[-1]['stdout'] if builds else None,
  olean_sha256=hashlib.sha256((out/f'{m}.olean').read_bytes()).hexdigest() if (out/f'{m}.olean').exists() else None))
imports={}
for r in receipts:
 for folder in r['lean_path'].split(':'):
  d=pathlib.Path(folder)
  if str(d).startswith(str(root/'evidence')):
   for f in d.glob('*.olean'):imports[str(f.relative_to(root))]=hashlib.sha256(f.read_bytes()).hexdigest()
record=dict(status='local fresh named builds and kernel replays, inherited compiled project imports; not an independent completion audit',
 request_id='f80fb8bcebd0420782ff3305c88ecadb',modules=checks,
 all_current_modules_passed=all(x['build'] and x['kernel'] for x in checks),
 rejected_receipts=[r['receipt'] for r in receipts if r.get('returncode')!=0 or 'sorryAx' in r.get('stdout','')],
 imported_project_olean_sha256=imports,
 root_sha256=hashlib.sha256((root/'MathGKM/Markov.lean').read_bytes()).hexdigest())
p=out/f'validation-{time.time_ns()}.json';p.write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(dict(path=str(p.relative_to(root)),passed=record['all_current_modules_passed'],modules=checks,rejected=len(record['rejected_receipts']))))
