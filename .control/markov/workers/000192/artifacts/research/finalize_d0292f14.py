"""Machine-authored final binding, scope and artifact report for d0292f14."""
from pathlib import Path
import json,hashlib,re
from finish_d0292f14 import finish
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-d0292f14'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
v=json.loads((O/'validation.json').read_text())
assert len(v['modules'])==9 and v['theorem_closures']==52
old=(R/'research/MarkovMiddleJetResidualM80F.lean').read_text()
new=(R/'research/MarkovMiddleShortResidualMD02.lean').read_text()
start=' (∀ i j, ¬(((i=3'
oldtail=old[old.index(start):old.index('\ntheorem root_iff_after_jetsM80F')].strip()
newtail=new[new.index(start):new.index('\ntheorem root_iff_middle_shortMD02')].strip()
assert oldtail==newtail
(O/'residual-scope-check.json').write_text(json.dumps(dict(vertical_and_diagonal_unchanged=True,old_source_sha256=sha(R/'research/MarkovMiddleJetResidualM80F.lean'),new_source_sha256=sha(R/'research/MarkovMiddleShortResidualMD02.lean'),exact_root_equivalence='root_iff_middle_shortMD02',remaining=['MiddleShortLCMD02','ThreeOutsideMiddleMD02','OtherFourM9E2'],newton_status='Unproved stronger sufficient condition, not equivalent to total-gap nonnegativity.'),indent=2))
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==z['sha256'] for k,z in idx.items()}
assert all(bindings.values())
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')==contract['root_sha256']
(O/'final-bindings.json').write_text(json.dumps(dict(inherited=bindings,root_sha256=sha(R/'MathGKM/Markov.lean'),canonical_contract_sha256=ch,stop_file=(R/'.control/markov/STOP.json').exists()),indent=2))
experiments={}
for name in ['kernel-probe.json','newton-components.json','strong-gap-probe.json','source-experiment.json','auxiliary-probes.json']:
 p=O/name;experiments[name]=sha(p)
(O/'experiment-bindings.json').write_text(json.dumps(dict(results=experiments,scripts={str(p.relative_to(R)):sha(p) for p in (R/'research').glob('*d0292f14.py')},status='Experiment outputs are not proof evidence.'),indent=2))
report=dict(request_id='d0292f142b0e4db995dc25f58edefaca',summary='Proved a uniform short binomial representation, exact correction support and Newton positivity, and a universal mixed-gap obstruction. Full pinned Conjecture63 remains unresolved.',actions=[
 'Read the mission, design, pinned root and independent audits; reconciled inherited and interrupted-worker evidence: evidence/markov-d0292f14/reconciliation.json.',
 'Compiled and jointly kernel-replayed nine modules; audited 52 theorem closures using only permitted axioms: evidence/markov-d0292f14/validation.json.',
 'Verified preserved inputs, source hashes and pinned bindings: evidence/markov-d0292f14/last-verification.json.'
],observations=[
 'Proved an exact short integer-binomial formula for every numerator-three middle coefficient at column c+3, with unbounded parameters and source transport: research/MarkovMiddleKernelSourceMD02.lean.',
 'Proved exact positive support and nonnegative mixed Newton coefficients of the correction itself; total-gap positivity remains open: research/MarkovMiddleKernelShapeMD02.lean and research/MarkovCorrectionNewtonMD02.lean.',
 'Proved a negative first-onset mixed-gap Newton coefficient in every column and both residues. This auxiliary obstruction does not refute the raw conjecture; the actual 3/26 example has positive raw gap: research/MarkovMiddleCrossObstructionMD02.lean and research/MarkovMiddleDiagnosticsMD02.lean.',
 'Proved Conjecture63 iff MiddleShortLCMD02, ThreeOutsideMiddleMD02 and unchanged OtherFourM9E2. All remain open. MiddleNewtonMD02 is stronger and sufficient only: research/MarkovMiddleShortResidualMD02.lean.',
 'Finite experiments passed 15755 source coefficient comparisons, retaining 1408 zeros, and 378853 polygon-valid triples. Further Newton and shifted-factorial probes are finite evidence only: evidence/markov-d0292f14/source-experiment.json and research/markov-d0292f14-mathematics.md.',
 'Preserved six rejected builds and capability limitations. No fresh whole-source rebuild or independent completion audit occurred: research/markov-d0292f14-operational.md.'
],agenda=[
 'Investigate the total integer-binomial gap MiddleShortLCMD02 or its stronger mixed-difference condition MiddleNewtonMD02: research/markov-d0292f14-next.md.',
 'Retain the negative mixed-gap terms; their first onset is universally negative. Template domination and the shifted-factorial strengthening remain experimental candidates.',
 'Retain every other row, direction, source family, zero and endpoint; completion requires all correspondence bridges, fresh whole-source validation and a separate independent hash-bound audit.'
],completion=None)
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
finish()
