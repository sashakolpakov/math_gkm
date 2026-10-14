"""Machine-authored evidence manifest, never a controller completion authority."""
import pathlib,json,hashlib,re,sys,datetime
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-b5dbe087'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(name,data):(o/name).write_text(json.dumps(data,indent=2,ensure_ascii=False)+'\n')
names=['MarkovVerticalCertificateB5','MarkovVerticalAlgebraB5','MarkovVerticalSourceB5','MarkovTopVerticalB5','MarkovVerticalSharpB5','MarkovInteriorReductionB5','MarkovShearObstructionB5','MarkovAmbientFormB5']
records=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
mods=[]
for name in names:
 p=r/'research'/f'{name}.lean';h=sha(p)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',p.read_text())
 matches=[(q,v) for q,v in records if v['source']==str(p.relative_to(r)) and v['sha256']==h and v.get('returncode')==0]
 builds=[(q,v) for q,v in matches if v['command'][0].endswith('/lean')]
 replays=[(q,v) for q,v in matches if v['command'][0].endswith('/leanchecker')]
 assert builds and replays,name
 q,v=builds[-1];qr,vr=replays[-1]
 assert 'sorryAx' not in v['stdout'] and 'error:' not in v['stdout']
 axs=[s for s in v['stdout'].splitlines() if 'depends on axioms:' in s]
 for s in axs:
  used=s.split('depends on axioms: [',1)[1].rstrip(']').split(', ')
  assert set(used)<={'propext','Classical.choice','Quot.sound'},s
 mods.append(dict(module=name,source=str(p.relative_to(r)),sha256=h,olean_sha256=sha(o/f'{name}.olean'),build=str(q.relative_to(r)),replay=str(qr.relative_to(r)),axiom_lines=axs))
root=sha(r/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((r/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest();assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
save('validation.json',dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=mods,root_sha256=root,contract_canonical_sha256=ch,imports='Inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False,completion=None))
failed=[dict(record=str(p.relative_to(r)),source=v['source'],sha256=v['sha256'],returncode=v.get('returncode'),timeout=v.get('timeout',False)) for p,v in records if v.get('returncode')!=0]
save('operational-observations.json',dict(failed_attempts=failed,failed_elaboration_count=len(failed),other_outcomes=[
 'Initial shell here-document failed before any side effect because zsh could not create a temporary file; replaced with apply_patch.',
 'Four guessed inherited filenames were absent (MarkovAmbientTransfer5c90, MarkovTransfer5c90, MarkovMatrix16, MarkovMatrices16); rg located the relevant existing modules. No source was inferred from absent files.',
 'Sage and SymPy unavailable; GAP discoverable but unused. All Python experiments used /opt/homebrew/bin/python3.',
 'Higher-priority permissions prohibit .scratch; uniquely named durable research/evidence paths used instead.',
 'Successful builds/replays use pinned absolute Lean 4.32.2 binaries, inherited read-only package locations, GIT_CONFIG_NOSYSTEM=1 and GIT_CONFIG_GLOBAL=/dev/null. No package updates.',
 'Failed elaborations can print sorryAx in error-recovery declarations; every such run was rejected and is excluded from validation.',
 'All foreground sessions completed; no external action requests or background processes remain.'
 ],python_executable=sys.executable))
report=dict(request_id='b5dbe087bddc41aaa420318d5cb776a1',summary='Proved universal vertical top-face log-concavity and an exact interior reduction; full published Markov Conjecture 6.3 remains unresolved.',actions=[
 'Reconciled the interrupted predecessor without replaying side effects: evidence/markov-b5dbe087/reconciliation.json.',
 'Compiled and kernel-replayed eight Lean modules: evidence/markov-b5dbe087/validation.json.',
 'Executed exact vertical, transfer-state, palindrome and source mixed-gap experiments: evidence/markov-b5dbe087/vertical-probe.json, transfer-invariants.json, source-invariants.json, palindrome-invariants.json, synchrony.json, and source-mixed-stress.json.',
 'Saved derivations and all correspondence limits: research/markov-b5dbe087-mathematics.md and research/markov-b5dbe087-correspondence.md.'
 ],observations=[
 'The pinned root and contract hashes are unchanged. Completion is null.',
 'Every source vertical triple ending on the top face satisfies the raw inequality, retaining zeros and small-degree cases. Combined with inherited results, root_iff_interiorB5 exactly reduces the root to the remaining infinite interior triples.',
 'The uniform vertical multiplicative constant one is sharp: for every real c>1, a checked actual source triple violates the c-strengthened inequality.',
 'An actual Pell-source sheared minor equals 32(6-j), strictly negative for every j≥7, with all four polygon memberships checked. This excludes a TP2 invariant, not the pinned conjecture.',
 '491572 finite top-triple tests had no failure; 4720 exact transfer/formula identities agreed. Palindromic state tests had no ULC failure in 8860294 checks, but palindrome mixed-gap nonnegativity failed at AB^9A. Source mixed-gap tests, including 84 additional selected fractions, found no failure. These are experiments only.',
 'The checked common quadratic form supplies exact ambient sandwich and source identities; it establishes no log-concavity closure.',
 f'Successful axiom closures contain only permitted axioms. Validation reused inherited compiled imports; no independent completion audit was performed. {len(failed)} rejected elaborations and capability limitations are retained in evidence/markov-b5dbe087/operational-observations.json.'
 ],agenda=[
 'Investigate the source-specific component and mixed-gap inequalities for the ambient transfer; palindrome alone does not ensure the mixed inequality.',
 'Use the common quadratic form and sandwich identities for a possible palindrome induction, without assuming sum-of-squares preserves coefficient log-concavity.',
 'Use root_iff_interiorB5 as an exact residual description; preserve every direction, zero, endpoint, source bridge and universal quantifier.'
 ],completion=None)
save('report.json',report)
artifacts={str(p.relative_to(r)):sha(p) for p in sorted(o.iterdir()) if p.is_file() and p.name!='artifacts.json'}
for p in sorted((r/'research').iterdir()):
 if p.is_file() and ('b5db' in p.name.lower() or p.name in [n+'.lean' for n in names]):artifacts[str(p.relative_to(r))]=sha(p)
save('artifacts.json',dict(provenance='Machine-authored live worker b5dbe087',hashes=artifacts))
print(json.dumps(dict(modules=len(mods),rejected_elaborations=len(failed),root_sha256=root,contract_sha256=ch,report=str((o/'report.json').relative_to(r)),stop_file_present=(r/'.control/markov/STOP.json').exists())))
