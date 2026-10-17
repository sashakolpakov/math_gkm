"""Machine-authored final local evidence checks, not root admission or controller writes."""
from pathlib import Path
import json,hashlib,re
from finish_e108e0e2 import validate,finish
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-e108e0e2'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'planned-validation.json').read_text());v=validate(mods)
records=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
failed={str(p.relative_to(R)):d for p,d in records if d.get('returncode')!=0}
(O/'failed-build-index.json').write_text(json.dumps(failed,indent=2))
extras=[]
for p in (R/'research').glob('*ME10.lean'):
 if p.stem in mods or p.stem.startswith(('MarkovAudit','ReplayIsolated')):continue
 good=[str(q.relative_to(R)) for q,d in records if d.get('returncode')==0 and d.get('modules',{}).get(p.stem)==sha(p)]
 extras.append(dict(path=str(p.relative_to(R)),sha256=sha(p),matching_successful_builds=good,status='Outside final validated bundle; no result assumed.'))
(O/'unaccepted-drafts.json').write_text(json.dumps(extras,indent=2))
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','lean-toolchain','lakefile.toml','lake-manifest.json']}
assert pins['MathGKM/Markov.lean']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=json.loads((R/'.control/markov/contract.json').read_text());canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(O/'final-bindings.json').write_text(json.dumps(dict(files=pins,canonical_contract_sha256=canonical,request_id='e108e0e26f6d456c97155a7914deaabe',stop_file=(R/'.control/markov/STOP.json').exists()),indent=2))
extra=''
if 'MarkovCentralNineME10' in mods:extra+='The strongest exact residual is ThreeCentralNineME10: physical starts4..12 in the two central rows; root_iff_central_nineME10 retains all other directions and families. '
if 'MarkovCentralSecondSourceME10' in mods:extra+='The physical-column-two gap is closed; root_iff_central_tenME10 leaves starting columns3..12 in the two central rows. '
if 'MarkovCentralLow0ME10' in mods:extra+='The c=0 shifted raw gap is also proved for every h<=3 and k+h>=3; use central_low_0ME10 with central_source_formulaME10. '
(R/'research/markov-e108e0e2-checkpoint-final.md').write_text(
 '# Final checkpoint\n\nMachine-authored request e108e0e26f6d456c97155a7914deaabe.\nFull pinned root and exact negation remain open; completion=null.\n\n'
 f'{len(mods)} modules compiled and jointly kernel-replayed; {v["theorem_closures"]} theorem closures use only permitted axioms. See evidence/markov-e108e0e2/validation.json. Inherited compiled imports reused; no fresh whole-source rebuild or independent completion audit.\n\n'
 'Proved the exact shifted central source formula, complete correction domination, actual-weight centered variance attachment, all physical starting columns>=13 on every numerator-three horizontal row, and the exact root residual ThreeCentralFiniteME10 (central starts2..12). '+extra+'All vertical and diagonal residuals and OtherFourM9E2 remain open.\n\n'
 'Finite source experiment:7016 coefficient comparisons retaining645 zeros;590991 polygon-valid triples across all directions. No failure; these are experiments, not proofs. Eighty univariate low-gap symbolic probes had nonnegative coefficients; unvalidated certificates remain drafts.\n\n'
 f'{len(failed)} rejected builds and {len(extras)} source files outside the validated bundle are preserved. No launched foreground work remains pending.\n')
print(json.dumps(dict(modules=len(mods),closures=v['theorem_closures'],failed_builds=len(failed),unaccepted_sources=len(extras))))
finish()
