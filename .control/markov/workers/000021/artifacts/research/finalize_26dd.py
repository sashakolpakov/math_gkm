"""Machine-authored evidence summary; not independent mathematical admission."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm');out=root/'evidence/markov-26dd33d6'
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovSmallQuartic26dd','MarkovFiniteQuartic26dd','MarkovFifthAll26dd']
records=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
entries=[]
for mod in mods:
 source=root/'research'/f'{mod}.lean';sha=digest(source)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',source.read_text())
 valid=[(p,r) for p,r in records if r['source']==str(source.relative_to(root)) and r['sha256']==sha and r.get('returncode')==0]
 builds=[str(p.relative_to(root)) for p,r in valid if r['command'][0].endswith('/lean')]
 kernels=[str(p.relative_to(root)) for p,r in valid if r['command'][0].endswith('/leanchecker')]
 assert builds and kernels,(mod,builds,kernels)
 for p,r in valid:assert 'sorryAx' not in r['stdout']
 imports=[]
 for name in re.findall(r'^import (\S+)',source.read_text(),re.M):
  candidates=[pathlib.Path(folder)/(name.replace('.','/')+'.olean') for folder in valid[-1][1]['lean_path'].split(':')]
  binary=next(p for p in candidates if p.exists())
  imports.append(dict(module=name,path=str(binary),sha256=digest(binary)))
 entries.append(dict(module=mod,source=str(source.relative_to(root)),sha256=sha,builds=builds,kernels=kernels,direct_import_binaries=imports))
root_hash=digest(root/'MathGKM/Markov.lean')
assert root_hash=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
rejected=[str(p.relative_to(root)) for p,r in records if r.get('returncode')!=0]
validation=dict(request_id='26dd33d6a67b4559b60690a5fd08502c',modules=entries,root_sha256=root_hash,rejected_attempts=rejected,
 scope='Fresh named modules and kernel replay using inherited compiled imports, not an independent full-source rebuild',completion=None)
target=out/f'validation-{time.time_ns()}.json';target.write_text(json.dumps(validation,indent=2)+'\n')
prior=json.loads((root/'evidence/markov-4f8ceeeb/validation-1791951589039539000.json').read_text())
recon=dict(latest_worker='4f8ceeeb08e4428892713ab6457705dd',latest_status='completed',
 module_source_checks=[dict(module=m['module'],matches_saved_hash=digest(root/'research'/f"{m['module']}.lean")==m['sha256']) for m in prior['modules']],
 prior_timeout_reconciliation='evidence/markov-f6506bc6/reconciliation.json',
 conclusion='Latest completed source hashes checked. Earlier timeout already reconciled with no unmatched starts; no side effect replayed.')
(out/'reconciliation.json').write_text(json.dumps(recon,indent=2)+'\n')
ops=dict(temporary_files='Higher-priority .scratch denial enforced; explicit research directory used for validation outputs.',
 failures=['Hidden-file search received denied .git and .scratch errors; no contents read; search not repeated.',
 'Shell heredoc temporary creation denied; switched to explicit file-writing tools.',
 'SymPy unavailable: ModuleNotFoundError. No package installation attempted.',
 'Sage not found on PATH. GAP exists at /opt/homebrew/bin/gap; not needed or invoked.'],
 proof_failures=rejected,validation_boundary='Inherited compiled imports; no full-source completion audit.',
 experiment_correction='quintic-fit.json v1 reports planned holdout_words=2050 but no holdout executed after training inconsistency; v2 and v3 correct bookkeeping.',
 sessions='All research, compilation and kernel foreground sessions completed; no background process launched.',
 source_retrieval=dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',sections='Definitions 6.1-6.2, Conjecture 6.3',date='2026-10-14'),
 protected_root_sha256=root_hash)
(out/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
print(json.dumps(dict(validation=str(target.relative_to(root)),rejected=len(rejected),root_sha256=root_hash)))
