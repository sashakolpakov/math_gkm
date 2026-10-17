"""Final evidence packaging only; no model calls, compilation or research."""
import hashlib,json,re
from pathlib import Path
from datetime import datetime,timezone
root=Path.cwd(); out=root/'evidence/neutral-validation'
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
labels=['regressions-002','foundations-005','identity-005','recovery-005','invariance-005','connected-005']
rows=[]
for label in labels:
    p=out/(label+'.json'); log=out/(label+'.log')
    d=json.loads(p.read_text()) if p.exists() else {'returncode':None,'status':'unfinished'}
    text=log.read_text() if log.exists() else ''
    n=re.findall(r'Ran (\d+) tests? in',text)
    d.update(label=label,tests=int(n[-1]) if n else None)
    rows.append(d)
passed=sum(r['tests'] or 0 for r in rows if r.get('returncode')==0)
endpoint=json.loads((out/'connected-endpoint.json').read_text()) if (out/'connected-endpoint.json').exists() else {'status':'unfinished'}
summary={'time':datetime.now(timezone.utc).isoformat(),'completed_passing_tests':passed,'groups':rows,'connected_endpoint':endpoint,'full_connected_regression_passed':rows[-1].get('returncode')==0}
(out/'VALIDATION_SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n')
# Index retained exact validation data, omitting rebuildable compiler objects and links.
roots=set()
for label in labels:
    log=out/(label+'.log')
    if log.exists():
        roots.update(Path(p) for p in re.findall(r'RETAINED (.+)',log.read_text()))
artifacts={}
for base in sorted(roots):
    for p in base.rglob('*'):
        if p.is_file() and not p.is_symlink() and '.lake' not in p.parts and 'build' not in p.parts and p.suffix in ('.json','.lean','.log','.md','.svg','.txt'):
            artifacts[str(p.relative_to(root))]=sha(p)
(out/'RETAINED_ARTIFACT_MANIFEST.json').write_text(json.dumps({'roots':[str(p.relative_to(root)) for p in sorted(roots)],'files_sha256':artifacts,'retain':'Archive these sources, receipts, snapshots and checker logs before any scratch cleanup. Compiler objects are rebuildable and their hashes remain in receipts.'},indent=2)+'\n')
commands='\n'.join('- '+json.dumps(r.get('command',[]))+' → exit '+str(r.get('returncode'))+', tests '+str(r['tests'])+', '+r['label']+'.log' for r in rows)
report=f"""# Neutral harness validation report

{passed} tests passed in completed groups. Connected endpoint audit: **{endpoint['status']}**.
Full four-round connected regression passed: **{summary['full_connected_regression_passed']}**.
The long regression was bounded by this invocation deadline if interrupted; an
endpoint receipt does not convert an unfinished regression into a passing test.

Final executable/test bytes are pinned by pre-005/SOURCE_MANIFEST.json:
7e9ab7911641fd1c05b0266ef81a525bbde12ee77e6bde94830555a8227737b7.
The 26 earlier neutral regressions passed against pre-002:
50887c719b8b8f4ce3ba9103709494203996f643f9d5be20d18a0bc4e2ea7b6e.
Their broker/gate/engine/history code paths were unchanged afterward; later
root/inspector behavior received dedicated real-Lean coverage. Final documentation
and supplemental inputs are separately pinned in FINAL_SOURCE_MANIFEST.json.
Every pre-* directory retains immutable source copies, static dispositions and
a source manifest before that revision's execution. Earlier failures and
interruptions are retained, not counted as passes.

## Actual commands and results

All commands use the bounded neutral_validate runner (720-second outer bound,
per-validator shared timeout, per-child process/output bounds). Group JSON files
retain full argv, elapsed time, exit status, pre/post source checks and log SHA256.

{commands}

The separately pre-audited endpoint command was
/opt/homebrew/bin/python3 .scratch/neutral_endpoint_audit.py.
Its 11 assertions require actual family admission/reuse, residual discharge,
paired two-round trial eligibility, independent fixture review/selection,
experimental installation, a completed NEXT ACTUAL researcher subprocess, and
retention/exclusion of an invalid draft. See connected-endpoint.json.
These roles are deterministic fixtures, not autonomous scientific discovery.

## Established scope

Original-context target modules bind proposition meaning before adapter imports.
Reductions use captured residual constants in their antecedent; discharges require
a checked bridge to those exact constants. Canonical root/foundation substitution,
missing-before target vocabulary, changed-context discharge, hidden premises,
missing section laws and lossy maps are covered by real Lean negatives.
The original strengthened actual-premise inspector and exact-root audit gate
remain mandatory. Large inspector catalogs use complete bounded hashed artifacts;
no premises or declaration bodies were omitted to obtain passes.

ResearchSemantics and ContinuationObligations compiled and kernel-replayed.
WholeSemantics has an every-step recurrence; continuation_eq_run and
ImplementationBinding.whole_trace connect local simulation to every trace prefix.
modelBinding is inhabited. This is a verified generic MODEL, not a host bridge or
a proof that a replacement improves the complete research continuation.

Resource pools protect equal branch opportunities, validation limits and delayed
research horizons; distinct real validation operations have distinct charges and
recovery reuse does not charge twice. Required constants means all listed
constants for component-use credit, while old direct proofs remain admissible.
Accepted-module snapshots exclude preserved failed drafts. The experiment is
fixed-round/equal-upper-cap, not a matched-actual-cost efficiency comparison.
Protocol attempts have a separately reserved 30-second bound per attempt;
installation and controller wall are separately observed. Overlapping times
must not be summed or called provider-normalized costs.

The audit records SAME root/reference tasks under bound old/enlarged accepted
dictionaries, conditional partial derivation/residual descriptions, introduced
dictionary/adapters/connecting-proof overhead, and unknown proof remainder.
Cumulative witness bytes against the initial dictionary remain a separate audit.
All scheduled observations, missing points and costs remain visible. No shorter
description implies an easier proof, no forced drop is required, and no proxy
enters acquisition or selection. Actual subprocess/Lean audit-invariance passed.

## Remaining obligations and next checks

- Finish the full four-round connected regression in a NEW neutral fixture if its
  group is incomplete; never resume the interrupted fixture or an old campaign.
  Exact command is in connected-005.json.
- Terminal-export fault injection and the full interruption/deployment containment
  matrix remain incomplete. Finished completion-receipt/no-headroom recovery,
  orphan intent recovery and ordinary audit invariance are tested.
- No concrete Python/OS/Astra refinement, timed-environment coupling, whole-incumbent
  utility comparison, or guarded certified executable switch is supplied.
- Live independent curation, provider behavior, full dependency-tree attestation
  and portable deployment are not established by fixtures. Fixture freeze mocks
  dependency-tree hashing, explicitly; actual Lean/compiler/checker and their
  binary hashes are used by mathematical validation.
- Independent supervisor whole-source review remains appropriate. The supervisor
  owns versioning. No Git, publication, external messaging, downloads, dependency
  writes, live authorization, live model roles or Markov research occurred.
  Explicit USER OK AFTER this report is still required for fresh Markov work.

RETAINED_ARTIFACT_MANIFEST.json indexes exact staged sources, receipts, requests,
snapshots, reports and logs under .scratch. Preserve those indexed files when
archiving; the source manifests also retain immutable copies.
"""
(out/'REPORT.md').write_text(report)
guide="""# Current study status

The current source and evidence are described in docs/REQUIREMENT_MAP.md and
evidence/neutral-validation/REPORT.md. Earlier construction logs remain historical
and do not validate revised source.

Use only fresh NEUTRAL fixture runs for remaining validation. No old run resumes.
Fresh Markov work, live curation, live canaries and activation require explicit
USER OK after the final harness report plus the protected authorization boundary.
No live authorization file was created.

The strengthened exact-root gate requires the pinned root environment, actual
premise closure, fresh replay and independent English/source correspondence.
Generic gluing foundations are authenticated by their canonical modules; carrier
types do not automatically describe models of the accepted theory. Residuals and
held-out tasks are bound to original-context declarations, not printed text.

The trial design has fixed rounds and equal upper caps, not matched actual cost.
Additional branch/evaluation/reviewer work is charged. Experimental request-program
installation is distinct from certified self-change. The concrete host refinement,
whole-continuation utility proof and certified installation obligations remain open.

The conditional remaining-goal audit compares the SAME tasks under two bound
accepted theories, with dictionary/adapter/connecting overhead separate from
unknown proof remainder. Cumulative initial-dictionary witness storage is a
different quantity. All measures are audit-only.

Reproduction commands, exact tested source manifests, counts, failures, retained
logs and remaining checks are in evidence/neutral-validation/REPORT.md.
"""
(root/'docs/STUDY_V2.md').write_text(guide)
for name in ('docs/HARNESS_CHECKPOINT.md','docs/REQUIREMENT_MAP.md'):
    p=root/name
    p.write_text(p.read_text()+f'\n## Executed evidence update\n\n{passed} passing tests in completed groups; connected endpoint {endpoint["status"]}; full connected regression passed: {summary["full_connected_regression_passed"]}. Exact code/consumer/evidence bindings, commands, limitations and retained artifacts: evidence/neutral-validation/REPORT.md and VALIDATION_SUMMARY.json. Earlier “planned” labels above are source-design descriptions; this evidence update supplies actual execution status. D1/D2/D3 and the full recovery/deployment matrix remain open. No live activation.\n')
prior=json.loads((out/'pre-005/SOURCE_MANIFEST.json').read_text())['files_sha256']
supp=json.loads((out/'SUPPLEMENTAL_INPUT_MANIFEST.json').read_text())['files_sha256']
paths=set(prior)|set(supp)|{'.scratch/neutral_endpoint_audit.py','.scratch/finalize_neutral.py'}
paths.update(str(p.relative_to(root)) for p in out.glob('*') if p.is_file() and p.name not in ('FINAL_SOURCE_MANIFEST.json','FINAL_SOURCE_MANIFEST.sha256','PROGRESS.json'))
final={'phase':'construction','files_sha256':{p:sha(root/p) for p in sorted(paths)},'tested_manifest':'pre-005/SOURCE_MANIFEST.json','post_test_changes':[p for p,h in prior.items() if sha(root/p)!=h],'scope':'Executable/test source unchanged from final tested manifest; final documentation and evidence added separately.','status':summary}
p=out/'FINAL_SOURCE_MANIFEST.json';p.write_text(json.dumps(final,indent=2)+'\n')
(out/'FINAL_SOURCE_MANIFEST.sha256').write_text(sha(p)+'  FINAL_SOURCE_MANIFEST.json\n')
(out/'PROGRESS.json').write_text(json.dumps({'status':'checkpoint complete; no active research authorization','summary':summary,'final_manifest_sha256':sha(p)},indent=2)+'\n')
print(json.dumps({'passing_tests':passed,'endpoint':endpoint['status'],'full_connected':summary['full_connected_regression_passed'],'source_manifest_sha256':sha(p),'files':len(final['files_sha256']),'retained_artifacts':len(artifacts),'post_test_changes':final['post_test_changes']}))
