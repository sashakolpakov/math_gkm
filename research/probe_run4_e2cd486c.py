"""Machine-authored run-four crossing experiment and exact certificates."""
from pathlib import Path
from uniform_shape_8bbb import Q,var,subst,horner
import json
O=Path('evidence/markov-e2cd486c');d=json.loads(Path('evidence/markov-53d5229e/cross-probe.json').read_text())
u,v,_,_=map(var,range(4));rec=[];mods=[]
for name,ch,c,r in [('LowOne','low',v+4,1),('LowLarge','low',2*u+v+4,u+2),('HighOne','high',u+4,u+3),('HighLarge','high',u+2*v+4,u+v+2)]:
 ps=[subst(Q({tuple(a):b for a,b in p}),[4,c,r,0]) for p in d['shapes'][ch]]
 cc=horner(c,['u','v','x','y']);rr=str(r) if isinstance(r,int) else horner(r,['u','v','x','y']);q='0' if ch=='low' else f'(2*{rr}-{cc})'
 out='''import MarkovCrossTail53D
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
'''
 for k in range(4):
  gap=ps[k+1]**2-ps[k]*ps[k+2];neg=sum(v<0 for v in gap.values());rec.append(dict(case=name,k=k,terms=len(gap),negatives=neg))
  if neg:continue
  expr=horner(gap,['u','v','x','y']);a,b,z=[f'crossTail{l+1}53D 4 {cc} {rr} {q}' for l in [k,k+1,k+2]]
  defs='crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,'+','.join(f'thirdTailCoeff{j}53D' for j in range(4))
  out+=f'''theorem run4_{name}_{k}E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 {a}*{z} ≤ ({b})^2 := by
 have he : ({b})^2-{a}*{z}={expr} := by
  simp only [{defs}]
  ring
 have hp : 0 ≤ {expr} := by positivity
 omega
'''
 out+='end\nend MathGKM.Markov\n';m='MarkovRun4'+name+'E2';mods.append(m);Path('research/'+m+'.lean').write_text(out)
(O/'run4-gap-probe.json').write_text(json.dumps(dict(records=rec,modules=mods),indent=2)+'\n');print(json.dumps(rec))
# Extend only coefficient extraction, retaining the predecessor definitions.
s=Path('research/MarkovCrossTail53D.lean').read_text();s=s[s.index('theorem cross_tail_coeff153D'):s.index('\nend\nend MathGKM.Markov')]
s=s.replace('5 ≤ n','4 ≤ n')
for k in range(1,7):s=s.replace(f'cross_tail_coeff{k}53D',f'cross_tail_coeff{k}E2')
Path('research/MarkovCrossCoefficientsE2.lean').write_text('import MarkovCrossTail53D\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 3000000\n'+s+'\nend\nend MathGKM.Markov\n')
