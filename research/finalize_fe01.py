"""Machine-authored final research manifest; does not change controller records."""
from pathlib import Path
import json,hashlib,re,sys,datetime
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-fe01d46b'
rid='fe01d46b39b940a4b22745b021f8d61c'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def put(n,x):(o/n).write_text(json.dumps(x,indent=2)+'\n')
mods=['MarkovCutMasksFe01','MarkovConvolutionFe01','MarkovCutTermFe01','MarkovCutSourceFe01','MarkovCutMixFe01','MarkovGuardedPalindromeFe01','MarkovCutPositiveFe01','MarkovGuardedSourceFe01']
records=[]
for p in sorted(o.glob('run-*.json')):
 x=json.loads(p.read_text());x['record']=str(p.relative_to(r));records.append(x)
val=[]
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p)
 runs=[x for x in records if x['source']==str(p.relative_to(r)) and x['sha256']==h]
 builds=[x for x in runs if '-o' in x['command'] and x.get('returncode')==0]
 replays=[x for x in runs if '-o' not in x['command'] and x.get('returncode')==0]
 closures=[]
 for b in builds:
  for name,axs in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",b['stdout']):
   closures.append(dict(declaration=name,axioms=[a.strip() for a in axs.split(',') if a.strip()]))
 forbidden=re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',p.read_text())
 val.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,compiled=bool(builds),replayed=bool(replays),builds=[x['record'] for x in builds],replays=[x['record'] for x in replays],printed_axioms=closures,allowed_axioms=all(set(c['axioms'])<=set(['propext','Classical.choice','Quot.sound']) for c in closures),forbidden_source_tokens=forbidden))
put('validation.json',dict(request_id=rid,modules=val,scope='Local current-source builds and direct kernel replays; inherited compiled imports reused. Not a fresh whole-source rebuild or independent English/source audit.'))
recon=json.loads((o/'reconciliation.json').read_text())
checks=recon['checks']+recon['inherited']
contract=json.loads((r/'.control/markov/contract.json').read_text())
pres=dict(changed_inherited=[x['path'] for x in checks if sha(r/x['path'])!=x['actual']],root_sha256=sha(r/'MathGKM/Markov.lean'),contract_file_sha256=sha(r/'.control/markov/contract.json'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest(),stop_file_exists=(r/'.control/markov/STOP.json').exists())
put('preservation.json',pres)
failed=[x for x in records if x.get('returncode')!=0]
put('operational-observations.json',dict(request_id=rid,failed_validation_attempts=failed,other_failures=['Initial shell here-document could not create its denied temporary file; no Python action ran.','One reduced-palindrome invocation failed to import cuts_fe01; no experiment ran. Corrected with PYTHONPATH=research.','One shell glob for a nonexistent optional source pattern failed before its rg command; other explicit file reads succeeded.','Sage was not discoverable. GAP was discoverable but not invoked.'],policy='Higher-priority policy denies .scratch; all new work uses durable research/evidence paths. No packages updated; no controller, protected source or independent evidence edited.',python=sys.version))
put('literature.json',dict(request_id=rid,method='Hosted live web tools; shell networking not used',queries=['Markov polynomials log concavity Conjecture 6.3 coefficients proof 2026','log concavity coefficients trace product two by two matrices Christoffel words','snake graph perfect matchings coefficients log concavity Markov polynomials','fence poset bivariate rank polynomial log concavity coefficients'],primary_target='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',exploratory_primary_links=['https://arxiv.org/abs/1910.11823','https://www3.risc.jku.at/conferences/aec2022/abs/kantarci_aec.pdf','https://mat.univie.ac.at/~kratt/artikel/matching.html'],use='No retrieved theorem used as a Lean axiom or proof premise. Search does not establish novelty or completeness.'))
report=dict(request_id=rid,summary='Established a universal exact decomposition of source slices into individually log-concave cut terms, and checked aggregation obstructions. Full Conjecture63 remains unresolved.',actions=['Reconciled 84 predecessor artifacts and six inherited-index hashes: evidence/markov-fe01d46b/reconciliation.json.','Built and audited eight Lean modules; direct replay status: evidence/markov-fe01d46b/validation.json.','Executed exact mask and aggregation experiments: evidence/markov-fe01d46b/cut-experiment.json, aggregation-budget.json and palindrome-reduced-guarded.json.','Saved derivations and all correspondence limits: research/markov-fe01d46b-mathematics.md and research/markov-fe01d46b-correspondence.md.'],observations=['Pinned root and canonical contract hashes are unchanged; completion remains null.','Proved exact fixed-size mask enumeration and an all-path decomposition with choose(b-1,s) terms. Every individual term is coefficientwise nonnegative, has interval support, and is log-concave; aggregation remains unproved.','At actual source 3/4 two cut summands have mixed gap -1, while the valid raw triple [8,4,1] has gap 8. This is not a source counterexample.','Proved a polygon-guarded diagonal failure [28,20,16] for a reduced palindromic auxiliary word, and proved that word cannot be any source central word.','Matched 252442 mask identities and checked 2353612 term inequalities across 71 sources. These are finite experiments.','Successful printed axiom closures use only permitted axioms. No fresh whole-source rebuild or independent completion audit was performed.','Rejected validation attempts and capability failures are retained in operational-observations.json.'],agenda=['Develop an aggregation inequality for the exact mechanical source words; individual term log-concavity and pairwise compatibility do not suffice.','Retain source order and balance: palindromicity, coprimality and polygon guards alone admit the checked auxiliary failure.','Address horizontal and vertical cut-count changes as well as the fixed-cut diagonal sum; the inherited root_iff_interior7d80 remains unresolved.'],completion=None)
put('report.json',report)
files=[p for p in o.iterdir() if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
files += [r/'research'/f'{m}.lean' for m in mods]
files += [r/'research'/p for p in ['start_fe01.py','validate_fe01.py','finalize_fe01.py','cuts_fe01.py','aggregation_fe01.py','markov-fe01d46b-checkpoint.md','markov-fe01d46b-mathematics.md','markov-fe01d46b-correspondence.md']]
hashes={str(p.relative_to(r)):sha(p) for p in files}
put('artifacts.json',dict(request_id=rid,hashes=hashes))
put('artifact-verification.json',dict(checked=len(hashes),mismatches=[p for p,h in hashes.items() if sha(r/p)!=h]))
print(json.dumps(dict(modules=[{k:v[k] for k in ['module','compiled','replayed','allowed_axioms','forbidden_source_tokens']} for v in val],failed_attempts=len(failed),preservation=pres,artifacts=len(hashes))))
