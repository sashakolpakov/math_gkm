"""Machine-authored bf38fa19 final evidence manifest; no controller mutation."""
import pathlib,json,hashlib,datetime,re
out=pathlib.Path('evidence/markov-bf38fa19')
def sha(p):return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
names=['MarkovSecondRunBF','MarkovCyclicSecondBF','MarkovSecondSourceBF','MarkovRunRecurrenceBF']
runs=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
modules=[]
for name in names:
 source=pathlib.Path('research')/(name+'.lean');h=sha(source)
 matching=[(p,d) for p,d in runs if d['source']==str(source) and d['sha256']==h and d.get('returncode')==0]
 build=[(p,d) for p,d in matching if '-o' in d['command']]
 replay=[(p,d) for p,d in matching if d['command'][0].endswith('leanchecker')]
 assert build and replay,(name,'missing successful build/replay')
 ax=[l for l in build[-1][1]['stdout'].splitlines() if 'depends on axioms:' in l]
 assert ax and all('sorryAx' not in l for l in ax)
 for l in ax:
  allowed={'propext','Classical.choice','Quot.sound'}
  assert set(l.rsplit('[',1)[1].rstrip(']').split(', '))<=allowed
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',source.read_text())
 modules.append(dict(module=name,source=str(source),sha256=h,build=str(build[-1][0]),replay=str(replay[-1][0]),axiom_lines=ax,olean_sha256=sha(out/(name+'.olean'))))
root=sha('MathGKM/Markov.lean')
contract=json.loads(pathlib.Path('.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
validation=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,root_sha256=root,contract_canonical_sha256=ch,imports='Pinned inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False,completion=None)
(out/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
fail=[dict(record=str(p),**{k:d[k] for k in ['returncode','timeout','stdout','stderr'] if k in d}) for p,d in runs if d.get('returncode')!=0]
operational=dict(rejected_lean_attempts=fail,capability_file=str(out/'capabilities.json'),events=[
 'Initial zsh here-document could not create a temporary file; no Python code ran.',
 'Higher-priority .scratch denial respected; no access attempted.',
 'Sage and SymPy unavailable; GAP executable found but not invoked.',
 'pkill could not enumerate processes: sysmond service not found. No process was stopped by that command.',
 'Initial expensive envelope experiment interrupted successfully through its own foreground exec session (exit 130). Its source is preserved as second-envelope-initial.py; no result claimed.',
 'Optimized shared-jet envelope experiment completed; exact input range and counts saved.',
 'Hosted published-source read succeeded. No external assertion was added as a Lean axiom.',
 'All launched foreground experiment and validation sessions completed before finalization.'],completion=None)
(out/'operational-observations.json').write_text(json.dumps(operational,indent=2)+'\n')
report=dict(request_id='bf38fa192cd64d11804e5c1de553ef23',summary='Established exact second cyclic run coefficients and a recursive source formula; full published Markov Conjecture 6.3 remains unresolved.',actions=[
 'Reconciled 81 predecessor artifact hashes and interrupted event log: evidence/markov-bf38fa19/reconciliation.json.',
 'Compiled and kernel-replayed four Lean modules with permitted printed axiom closures: evidence/markov-bf38fa19/validation.json.',
 'Executed exact ordering, source-coefficient and parameter-envelope experiments: evidence/markov-bf38fa19/cyclic-probe.json, source-second-probe.json, second-envelope.json.',
 'Recorded derivations and all correspondence limits: research/markov-bf38fa19-mathematics.md and research/markov-bf38fa19-correspondence.md.'],observations=[
 'Pinned root and contract hashes are unchanged. Neither the root nor its negation is proved.',
 'The shorter run word is itself an actual source word; its denominator strictly decreases. Every non-Pell source second-lower-slice coefficient has an exact recursive formula, including zeros and the two-run correction.',
 'Second cyclic coefficients depend on run adjacency. The universal four-run order difference is 4 y^(2n+3); this is an auxiliary-word identity, not a source counterexample.',
 'No failures occurred in 3,138,496 artificial-envelope adjacent tests or 105,424 source-slice tests. Experiments are not proofs.',
 'An abstract tail parameter inequality is proved, but its coefficient and source-statistic bridges remain unproved.',
 'Validation reused inherited compiled imports; no fresh whole-source rebuild or independent completion audit was performed. Rejected attempts and capability failures are preserved in operational-observations.json.'],agenda=[
 'Prove the universal second-slice envelope inequality using the exact scalar recurrences or closed coefficient formulas; finite tests are insufficient.',
 'Formalize count compression and source adjacency bounds, exploiting the proved source-word recursion and denominator descent.',
 'Seek an induction preserving all three raw inequalities; retain universal coverage, polygon guards, zeros, both endpoints and every source bridge.'],completion=None)
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
cp=pathlib.Path('research/markov-bf38fa19-checkpoint.md')
cp.write_text(cp.read_text()+'\nFinal: all four new modules compiled and kernel replayed. Exact source formulas and abstract tail certificate validated; full root unresolved. All foreground sessions complete. Report and manifests saved in evidence/markov-bf38fa19/.\n')
paths=list(out.iterdir())+[pathlib.Path('research')/(n+'.lean') for n in names]
paths += [p for p in pathlib.Path('research').iterdir() if 'bf38' in p.name and p.is_file()]
hashes={str(p):sha(p) for p in paths if p.is_file() and p.name!='artifacts.json'}
(out/'artifacts.json').write_text(json.dumps(dict(provenance='Live machine-authored bf38fa192cd64d11804e5c1de553ef23',hashes=hashes),indent=2)+'\n')
print(json.dumps(dict(modules=[m['module'] for m in modules],failed_attempts=len(fail),artifacts=len(hashes),stop_file_exists=pathlib.Path('.control/markov/STOP.json').exists(),completion=None)))
