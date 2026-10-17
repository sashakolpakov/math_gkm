"""Machine-authored final evidence binding, not an independent completion audit."""
from pathlib import Path
import hashlib,json,re,sys,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9c28b628'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
write=lambda name,d:(O/name).write_text(json.dumps(d,indent=2)+'\n')
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
builds={};failed=[]
for p in sorted(O.glob('build-*.json')):
    d=json.loads(p.read_text())
    if d.get('returncode')!=0:failed.append(str(p.relative_to(R)));continue
    for m,h in d['modules'].items():
        if m in sources and h==sources[m]:builds[m]=str(p.relative_to(R))
assert set(builds)==set(mods),(set(mods)-set(builds))
for m in mods:
    s=(R/'research'/f'{m}.lean').read_text()
    assert not re.search(r'\b(sorry|admit|native_decide|axiom|unsafe|partial)\b',s),m
    assert all(n.endswith('M9C28') for n in re.findall(r'^(?:def|theorem|abbrev)\s+(\w+)',s,re.M)),m
replays=[]
for p in O.glob('replay-*.json'):
    d=json.loads(p.read_text())
    if d.get('returncode')==0 and d['modules']==sources and 'replay union passed' in d['stdout']:
        replays.append(p)
assert replays
replay=sorted(replays)[-1]
audits=[]
for p in O.glob('axioms-*.json'):
    d=json.loads(p.read_text())
    if d['sources']==sources:audits.append(p)
assert audits
audit=sorted(audits)[-1];ad=json.loads(audit.read_text())
for ax in ad['declarations'].values():assert set(ax)<={'propext','Classical.choice','Quot.sound'}
write('validation.json',dict(modules=sources,build_receipts=builds,kernel_replay=str(replay.relative_to(R)),
    axiom_audit=str(audit.relative_to(R)),theorem_closures=len(ad['declarations']),permitted_axioms_only=True,
    fresh_whole_source_rebuild=False,independent_completion_audit=False,completion=None))
write('failed-build-index.json',dict(rejected_builds=failed,count=len(failed),
    other_failures=['zsh here-document temporary-file creation denied','Several guessed filenames absent',
    'A Python code-generation syntax error wrote no certificate file; immediate build found missing source.']))
initial=json.loads((O/'input-hashes.json').read_text())
changed=[p for p,h in initial.items() if not (R/p).is_file() or sha(R/p)!=h]
assert not changed,changed
old=json.loads((R/'evidence/markov-bebe7940/manifest.json').read_text())
oldchanged=[p for p,h in old.items() if not (R/p).is_file() or sha(R/p)!=h]
assert not oldchanged,oldchanged
contract=R/'.control/markov/contract.json';root=R/'MathGKM/Markov.lean'
canonical=hashlib.sha256(json.dumps(json.loads(contract.read_text()),sort_keys=True,
    ensure_ascii=True,separators=(',',':')).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(root)=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
write('source-retrieval.json',dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',
    method='Hosted web.open',status='Succeeded in this worker',limits='Retrieved text is source evidence, not a Lean axiom or independent completion audit.'))
write('last-verification.json',dict(unchanged_input_count=len(initial),input_mismatches=changed,
    predecessor_artifacts_checked=len(old),predecessor_mismatches=oldchanged,
    root_sha256=sha(root),contract_file_sha256=sha(contract),contract_canonical_ascii_sha256=canonical,
    lean_toolchain=(R/'lean-toolchain').read_text().strip(),
    source_rebuild_scope='Selected new modules over inherited compiled imports',completion=None))
files=[p for p in O.rglob('*') if p.is_file() and p.name!='manifest.json']
files += [p for p in (R/'research').iterdir() if p.is_file() and ('9c28b628' in p.name or 'M9C28' in p.name)]
manifest={str(p.relative_to(R)):sha(p) for p in files}
write('manifest.json',manifest)
print(json.dumps(dict(modules=len(mods),theorem_closures=len(ad['declarations']),
    rejected_builds=len(failed),artifacts=len(manifest),unchanged_inputs=len(initial),completion=None)))
