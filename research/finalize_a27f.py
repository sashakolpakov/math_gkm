"""Machine-authored local evidence finalization; no controller or Git writes."""
import pathlib,json,hashlib,datetime,re
out=pathlib.Path('evidence/markov-a27f6d42')
def sha(p):return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
mods=['MarkovCutPartitionA27','MarkovCutGapsA27','MarkovCutRootA27','MarkovCutObstructionA27']
runs=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
rows=[]
for m in mods:
 src=pathlib.Path('research')/(m+'.lean');h=sha(src)
 good=[(p,r) for p,r in runs if r.get('sha256')==h and r.get('returncode')==0]
 builds=[(p,r) for p,r in good if r['command'][0].endswith('/lean')]
 replays=[(p,r) for p,r in good if r['command'][0].endswith('/leanchecker')]
 assert builds,m
 p,b=builds[-1];q,r=replays[-1] if replays else (None,None)
 assert 'sorryAx' not in b['stdout'] and 'error:' not in b['stdout']
 assert not re.search(r'\b(sorry|admit|native_decide)\b|^\s*axiom\s',src.read_text(),re.M)
 rows.append(dict(module=m,source=str(src),sha256=h,olean_sha256=sha(out/(m+'.olean')),build=str(p),replay=str(q) if q else None,axiom_lines=[l for l in b['stdout'].splitlines() if 'depends on axioms' in l]))
contract=json.loads(pathlib.Path('.control/markov/contract.json').read_text())
v=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=rows,root_sha256=sha('MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False,completion=None)
assert v['root_sha256']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert v['contract_canonical_sha256']=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(out/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
failed=[dict(record=str(p),returncode=r.get('returncode'),timeout=r.get('timeout',False),diagnostics=r.get('stdout','')) for p,r in runs if r.get('returncode')!=0]
ops=dict(failed_elaborations=failed,capabilities='capabilities.json',corrections=[
 'Initial second-row envelope admitted an unrealizable statistic; saved failure retained and sharper envelope tested separately.',
 'Sparse-polynomial certificates retain negative terms and were not promoted to proofs.',
 'An ad hoc printed BA^n mixed-gap diagnostic used weights shifted by one; the saved polygon-state-probe uses the correct weights and gives -432 at n=9. The diagnostic was not used in any theorem.',
 'Initial arbitrary-word obstruction draft incorrectly claimed a polygon exclusion. Lean rejected it. The corrected theorem proves all three memberships and excludes source membership by non-palindromicity.',
 'A guessed imported Examples object was unavailable; endpoint cases were proved locally from the exact polygon definition.',
 'Importing the second-normal probe during an ad hoc diagnostic repeated the same deterministic sharper-envelope scan and rewrote its run duration; mathematical output was unchanged.',
 'The first finalizer ran before the final two replay receipts existed and stopped at its assertion without writing a validation manifest. Parallel replays of the root and obstruction modules then each timed out at 100 seconds; these do not invalidate compilation or establish a mathematical conclusion. A sequential root replay was attempted.'
 ],foreground_status='All completed sessions are recorded; no background process launched')
(out/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
(out/'source-use.json').write_text(json.dumps(dict(primary_url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',queries=['Markov polynomial coefficient log concavity conjecture 6.3 proof 2026','log concavity fence poset rank polynomial bivariate coefficients Christoffel'],observation='Hosted target page refreshed and search results inspected. No external theorem was imported, assumed, or used to close the target.',independent_audits_read=['evidence/independent-markov/markov_round5_target_definition_audit.md','evidence/independent-markov/markov_residual_scope_audit.md','evidence/independent-markov/MATHEMATICAL_REVIEW.md']),indent=2)+'\n')
initial=pathlib.Path('research/second_normal_probe_a27f.py').read_text().replace('range((2*m if m==N-1 else max(2*m-1,0))+1)','range(2*m+1)').replace('second-normal-sharp-probe.json','second-normal-probe.json')
(out/'second-normal-initial.py').write_text(initial)
report=dict(request_id='a27f6d422b1a478c976694b9ca5c9a54',summary='Established an exact global cut-partition representation and full-root equivalence; the published Markov conjecture remains unresolved.',actions=[
 'Reconciled 86 predecessor hashes and inspected interrupted generation 48 events: evidence/markov-a27f6d42/reconciliation.json and earlier-interruption.json.',
 f'Compiled four Lean modules; {sum(bool(r["replay"]) for r in rows)} kernel replays succeeded: evidence/markov-a27f6d42/validation.json.',
 'Executed transfer, polygon, second-row and independent subset experiments: evidence/markov-a27f6d42/.',
 'Recorded derivations and correspondence limits: research/markov-a27f6d42-mathematics.md and research/markov-a27f6d42-correspondence.md.'
 ],observations=[
 'Pinned root and contract hashes are unchanged. Completion is null.',
 'Every source raw coefficient has an exact cut-count expression. root_iff_cutA27 preserves all directions, zeros, polygon guards and endpoints; its cut inequality premise remains unproved.',
 'Closed gap weights and an exact split-defect identity were proved. The split defect has both signs, obstructing a uniform local comparison.',
 '511 independent polynomial identities matched over 174762 cut subsets. A checked arbitrary-word diagonal triple [20,14,10] reverses log-concavity inside its virtual 7/9 polygon, but the word is proved not to be any source central word.',
 'Polygon restriction alone does not ensure nonnegative mixed component gaps for arbitrary words. No experiment resolves the full root.',
 f'Successful printed axiom closures use only permitted axioms. {len(failed)} failed validation attempts, including replay timeouts, and capability/experiment corrections are retained in operational-observations.json. Inherited compiled imports were reused; no independent completion audit was performed.'
 ],agenda=[
 'Investigate aggregation of the exact cut recurrence using source central-word restrictions and the explicit trailing-B gap weights.',
 'Use the split-defect factorization to identify compensating groups of cuts; neither unconditional local sign nor arbitrary-word diagonal closure holds.',
 'Preserve universal coverage, raw coefficients, all three directions, zeros, endpoints and every correspondence obligation.'
 ],completion=None)
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
pathlib.Path('research/markov-a27f6d42-checkpoint.md').write_text('# Final research checkpoint\n\nMachine-authored request a27f6d422b1a478c976694b9ca5c9a54.\nFour new modules compiled. Per-module kernel replay outcomes, including timeouts, are in evidence/markov-a27f6d42/validation.json. Exact source cut-count representation, full-root equivalence, explicit gap weights/split defect, and a non-source obstruction are retained. All three root inequalities remain unproved. Completion null.\nDetailed mathematics and correspondence are in the adjacent a27f6d42 reports. Predecessor hashes and interrupted event tail reconciled; no side effects replayed. Failed attempts, capability failures and experiment corrections retained. No controller edits, package updates or commits.\n')
files=list(out.iterdir())+[p for p in pathlib.Path('research').iterdir() if 'a27f' in p.name.lower() or p.stem in mods]
hashes={str(p):sha(p) for p in files if p.is_file() and p.name!='artifacts.json'}
(out/'artifacts.json').write_text(json.dumps(dict(provenance='Machine-authored live worker a27f6d42',hashes=hashes),indent=2)+'\n')
print(json.dumps(dict(modules=len(rows),failed_elaborations=len(failed),artifacts=len(hashes),completion=None)))
