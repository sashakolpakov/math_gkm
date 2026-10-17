"""Machine-authored evidence sealing and immutable-input verification."""
from pathlib import Path
import json,hashlib,datetime
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bebe7940'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inp=json.loads((O/'input-hashes.json').read_text())
bad=[p for p,h in inp.items() if sha(R/p)!=h]
assert not bad,bad
v=json.loads((O/'validation.json').read_text())
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items())
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert not (R/'.control/markov/STOP.json').exists()
report=dict(request_id='bebe7940cb4f488b90ea3d92a8e3f199',
 summary='Closed every numerator-three raw diagonal triple starting at column three. Full pinned Conjecture63 remains unresolved.',
 actions=[
  'Read the required documents, pinned target and independent audits; verified 117 predecessor artifacts and reconciled its completed raw event log: evidence/markov-bebe7940/reconciliation.json.',
  'Compiled and jointly kernel-replayed 13 modules; audited 48 theorem closures using only permitted axioms: evidence/markov-bebe7940/validation.json.',
  'Preserved 11 rejected builds and capability failures, verified 5,461 unchanged inputs and pinned bindings, and sealed the new evidence: evidence/markov-bebe7940/manifest.json and last-verification.json.'
 ],observations=[
  'Proved the complete raw inequality A(3,j+2) A(5,j) ≤ A(4,j+1)^2 for every numerator-three source and every natural j, including correction-entry crossings and zeros. All-path transport: research/MarkovThreeDiagonalMBEB.lean.',
  'Proved the formerly exceptional parameter-zero base diagonal and thus the base diagonal for every parameter: research/MarkovBaseDiagonalMBEB.lean. Universal short-sum identities are in MarkovShortKernelMBEB.lean and MarkovAffineShortMBEB.lean.',
  'Proved Conjecture63 iff ThreeRemainingMBEB and OtherFourM9E2. Both remain open: research/MarkovThreeResidualMBEB.lean.',
  'Finite recurrence checks passed 4,375 raw triples retaining 630 zero triples and 21,744 coefficient comparisons. Generalized total-gap expansions passed for 84 region/residue/column choices; these are experiments, not universal proofs: evidence/markov-bebe7940/source-experiment.json and general-column-probe*.json.',
  'Inherited compiled imports were reused. No fresh whole-source completion rebuild or independent completion audit occurred: research/markov-bebe7940-correspondence.md and markov-bebe7940-operational.md.'
 ],agenda=[
  'Investigate uniform coefficientwise positivity for the remaining numerator-three diagonal columns using research/markov-bebe7940-general-gap.md; general source wrappers and entry rows remain explicit obligations.',
  'Alternatively investigate the remaining vertical region or OtherFourM9E2. Preserve signed mixed terms and distinguish the diagonal unsigned proposal from the formally false vertical bound.',
  'Require exact-root closure, every correspondence bridge and independent hash-bound source/English validation before completion.'
 ],completion=None)
(O/'report.json').write_text(json.dumps(report,indent=2,ensure_ascii=False)+'\n')
files=[p for p in O.rglob('*') if p.is_file() and p.name not in ('manifest.json','last-verification.json')]
files+=list((R/'research').glob('*MBEB.lean'))
files+=list((R/'research').glob('*bebe7940*'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file()}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
now=datetime.datetime.now(datetime.timezone.utc)
start=datetime.datetime(2026,10,17,19,57,11,tzinfo=datetime.timezone.utc)
elapsed=(now-start).total_seconds();assert elapsed<1800
verification=dict(request_id=report['request_id'],artifacts_checked=len(manifest),input_files_checked=len(inp),
 artifact_mismatches=[],input_mismatches=[],root_sha256=sha(R/'MathGKM/Markov.lean'),
 contract_canonical_ascii_sha256=ch,contract_file_sha256=sha(R/'.control/markov/contract.json'),
 manifest_sha256=sha(O/'manifest.json'),finished_utc=now.isoformat(),elapsed_seconds=elapsed,
 stop_file_present=False,completion=None)
(O/'last-verification.json').write_text(json.dumps(verification,indent=2)+'\n')
print(json.dumps(verification),flush=True)
