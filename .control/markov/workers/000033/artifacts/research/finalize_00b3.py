"""Machine-authored evidence finalization; does not edit controller records."""
import pathlib,json,hashlib
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-00b360ee'
mods=['MarkovPellLowerAll00b3','MarkovPellSeries00b3','MarkovPellExcess00b3']
receipts=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
validation={};rejected=[]
for p,d in receipts:
 if d.get('returncode')!=0:rejected.append(str(p.relative_to(r)))
for m in mods:
 source=r/'research'/f'{m}.lean';h=hashlib.sha256(source.read_bytes()).hexdigest()
 v={'source':str(source.relative_to(r)),'sha256':h}
 for p,d in receipts:
  if d['sha256']==h and d.get('returncode')==0:
   key='kernel_replay' if d['command'][0].endswith('leanchecker') else 'build'
   v[key]=str(p.relative_to(r))
 assert 'build' in v and 'kernel_replay' in v,(m,v)
 validation[m]=v
root_hash=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()
assert root_hash=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
manifest={'modules':validation,'rejected':rejected,'root_sha256':root_hash,
 'imports':'Inherited compiled imports; not a fresh whole-source rebuild',
 'status':'Local compiled and kernel-replayed representation theorems; no root closure','completion':None}
(o/'validation.json').write_text(json.dumps(manifest,indent=2)+'\n')
operations={'capability_failures':['Shell heredoc implicit temporary-file creation denied; direct arguments subsequently used','Higher-priority policy denies .scratch reads; no access attempted','SymPy, Sage and NumPy unavailable to /opt/homebrew/bin/python3','Springer DOI hosted retrieval returned Internal Error'],
 'capabilities_observed':{'GAP_path':'/opt/homebrew/bin/gap; discovered, not executed','python':'/opt/homebrew/bin/python3','Lean':'pinned 4.32.2'},
 'rejected_elaborations':rejected,'foreground_sessions':'All current build and replay sessions completed',
 'network':'Hosted searches only; no shell networking','stop_file':'Absent at last check'}
(o/'operational-observations.json').write_text(json.dumps(operations,indent=2)+'\n')
report={'request_id':'00b360ee01fe4f14ac8183ef8da6b5c9',
 'summary':'Proved the complete positive lower-excess series representation for all Pell sources and an exact reduction of their remaining inequalities. Full pinned Conjecture63 remains unresolved.',
 'actions':['Reconciled the interrupted predecessor and verified its saved hashes and receipts: evidence/markov-00b360ee/reconciliation.json.',
 'Proved the boundary-complete coefficient formula, formal-series bridge, positive transfer and exact Pell equivalence: research/MarkovPellLowerAll00b3.lean, research/MarkovPellSeries00b3.lean, research/MarkovPellExcess00b3.lean.',
 'Compiled and kernel-replayed three new modules: evidence/markov-00b360ee/validation.json.',
 'Recorded exact summation probes and correspondence limits: evidence/markov-00b360ee/refinement-probe.json and research/markov-00b360ee-correspondence.md.'],
 'observations':['Every Pell raw coefficient on i+j=a+s equals [x^i y^j](x+y)^(2s)/((1-x)^(s+1)(1-y)^s), including zero excess and above-degree zeros.',
 'The positive transfer kernel is proved; its cross-strip log-concavity remains unproved. Other rational families are not covered by the new representation.',
 'Finite probes through a=44 found no aggregate horizontal-fiber failure; an outside-in partial-sum criterion fails at -15. These are experiments, not proofs.',
 'Successful printed closures use only permitted axioms. Validation reused inherited compiled imports; root hash is unchanged. Capability failures and rejected elaborations are preserved.'],
 'agenda':['Prove or refute the two exact ExcessHorizontal00b3 and ExcessVertical00b3 predicates; positivity of the kernel alone is insufficient.',
 'Seek a transfer invariant that extends from the Pell series to all mechanical source words.',
 'Require fresh whole-source rebuilding and independent hash-bound English/source auditing before any root closure.'],
 'completion':None}
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
p=r/'research/markov-00b360ee-checkpoint.md'
p.write_text(p.read_text()+'\nFinal: three new modules compiled and kernel-replayed, with source hashes and rejected attempts retained in evidence/markov-00b360ee/validation.json. Complete zero-excess bridge and exact Pell equivalence checked. Both remaining inequalities and the full pinned root remain open. All foreground sessions completed. Final report: evidence/markov-00b360ee/report.json.\n')
print(json.dumps({'validated_modules':len(validation),'rejected_attempts':len(rejected),'root_unchanged':True,'report':str((o/'report.json').relative_to(r))}))
