"""Machine-authored final local verification. Not an independent root audit."""
from validate_bebe7940 import *
mods=['MarkovShortKernelMBEB','MarkovBaseCertificateMBEB','MarkovBaseDiagonalMBEB',
 'MarkovSourceDiagonalMBEB','MarkovPathDiagonalMBEB','MarkovSupportResidualMBEB',
 'MarkovAffineShortMBEB','MarkovThreeMassMBEB','MarkovThreeCertificateMBEB',
 'MarkovCrossMassMBEB','MarkovCrossCertificateMBEB','MarkovThreeDiagonalMBEB','MarkovThreeResidualMBEB']
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2))
hashes={m:sha(R/'research'/f'{m}.lean') for m in mods}
receipts={}
for p in sorted(O.glob('build-*.json')):
 d=json.loads(p.read_text())
 if d.get('returncode')!=0:continue
 for m,h in d.get('modules',{}).items():
  if m in hashes and h==hashes[m]:receipts[m]=str(p.relative_to(R))
assert set(receipts)==set(mods),set(mods)-set(receipts)
for m in mods:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(?:sorry|admit|native_decide)\b|^\s*(?:axiom|unsafe|partial)\s',s,re.M),m
d=run(mods,'replay',240)
assert d.get('returncode')==0,d
replay=max(O.glob('replay-*.json'),key=lambda p:p.stat().st_mtime_ns)
p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/audit_bebe7940.py'),*mods],cwd=R,
 text=True,capture_output=True,timeout=150)
(O/'audit-run.json').write_text(json.dumps(dict(returncode=p.returncode,stdout=p.stdout,stderr=p.stderr),indent=2))
print(p.stdout,flush=True)
assert p.returncode==0,p.stderr
ax=max(O.glob('axioms-*.json'),key=lambda p:p.stat().st_mtime_ns)
axd=json.loads(ax.read_text())
v=dict(modules=hashes,build_receipts=receipts,kernel_replay=str(replay.relative_to(R)),
 axiom_audit=str(ax.relative_to(R)),theorem_closures=len(axd['declarations']),permitted_axioms_only=True,
 fresh_whole_source_rebuild=False,independent_completion_audit=False,completion=None)
(O/'validation.json').write_text(json.dumps(v,indent=2))
print(json.dumps(v),flush=True)
