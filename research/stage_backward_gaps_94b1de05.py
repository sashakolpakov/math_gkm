"""Machine-authored staged gap identities, reducing expansion to two-variable columns."""
from pathlib import Path
from fractions import Fraction as F
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm/research');O=R.parent/'evidence/markov-94b1de05'
names=['n','z','c','r','q','e','u','x']
def expr(p):
 out=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  fs=[str(v.numerator)]
  for name,k in zip(names,ks):
   if k:fs.append(name if k==1 else f'{name}^{k}')
  out.append('*'.join(fs))
 return ' + '.join(out) or '0'
def columns(p):
 out={}
 for ks,v in p.items():
  d=ks[5];k=ks[:5]+(0,)+ks[6:];out.setdefault(d,P())[k]=v
 return out
header='''/-! Machine-authored 94b1de05. Staged backwards third-block gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
'''
end='end\nend MathGKM.Markov\n'
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
for row,((p,q),(s,t)) in zip(json.loads((O/'backward-candidates.json').read_text()),zip(bounds,bounds[1:])):
 ch=row['chamber'];shape=load(row['shape']);cv=q*(C+1)+t*(Rr+1);rv=p*(C+1)+s*(Rr+1)
 vals=[subst(shape,[N,Z,cv,rv,Q,T-i,U,X]) for i in range(3)]
 cols=[columns(v) for v in vals];gcols=columns(load(row['gap']))
 for d in range(15):gcols.setdefault(d,P())
 pn=lambda i,k:f'backChartP{ch}_{i}_{k}M94'
 gn=lambda k:f'backChartG{ch}_{k}M94'
 st=f'import MarkovBackwardChamber{ch}M94\n'+header
 for i,cs in enumerate(cols):
  for k,v in sorted(cs.items()):st+=f'\ndef {pn(i,k)} (c r : ℤ) : ℤ :=\n {expr(v)}\n'
 for k,v in sorted(gcols.items()):
  st+=f'\ndef {gn(k)} (c r : ℤ) : ℤ :=\n {expr(v)}\n'
  st+=f'\ntheorem {gn(k)}_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤{gn(k)} c r := by\n unfold {gn(k)}\n positivity\n'
 dec=lambda i:' + '.join(f'{pn(i,k)} c r*e^{k}' for k in sorted(cols[i]))
 for i,cs in enumerate(cols):
  st+=f'\ntheorem back_stage{ch}_{i}M94 (c r e : ℤ) :\n backShape{ch}M94 ({expr(cv)}) ({expr(rv)}) (e-{i})={dec(i)} := by\n unfold backShape{ch}M94 '+' '.join(pn(i,k) for k in cs)+'\n ring\n'
 for d,g in sorted(gcols.items()):
  lhs=' + '.join(f'{pn(1,i)} c r*{pn(1,j)} c r' for i in cols[1] for j in cols[1] if i+j==d) or '0'
  rhs=' + '.join(f'{pn(0,i)} c r*{pn(2,j)} c r' for i in cols[0] for j in cols[2] if i+j==d) or '0'
  defs={pn(1,i) for i in cols[1] for j in cols[1] if i+j==d}|{pn(0,i) for i in cols[0] for j in cols[2] if i+j==d}|{pn(2,j) for i in cols[0] for j in cols[2] if i+j==d}|{gn(d)}
  st+=f'\ntheorem back_column{ch}_{d}M94 (c r : ℤ) :\n ({lhs})-({rhs})={gn(d)} c r := by\n unfold '+' '.join(sorted(defs))+'\n ring\n'
 allpn=[pn(i,k) for i in range(3) for k in cols[i]]
 st+='\nattribute [local irreducible] '+' '.join(allpn+[gn(k) for k in gcols])+'\n'
 gaps=' + '.join(f'{gn(k)} c r*e^{k}' for k in sorted(gcols))
 st+=f'''\ntheorem back_columns_lc{ch}M94 (c r e : ℤ) (hc : 0≤c) (hr : 0≤r) (he : 0≤e) :
 backShape{ch}M94 ({expr(cv)}) ({expr(rv)}) e*backShape{ch}M94 ({expr(cv)}) ({expr(rv)}) (e-2)≤
 backShape{ch}M94 ({expr(cv)}) ({expr(rv)}) (e-1)^2 := by
 apply sub_nonneg.mp
 have hzero := back_stage{ch}_0M94 c r e
 simp only [sub_zero] at hzero
 rw [hzero,back_stage{ch}_1M94,back_stage{ch}_2M94]
 have hgap : ({dec(1)})^2-({dec(0)})*({dec(2)})={gaps} := by
  rw ['''+','.join(f'←back_column{ch}_{d}M94' for d in sorted(gcols))+''']
  ring
 rw [hgap]
'''
 for d in sorted(gcols):st+=f' have h{d} := {gn(d)}_nonneg c r hc hr\n'
 st+=' positivity\n'
 (R/f'MarkovBackwardColumnsGap{ch}M94.lean').write_text(st+end)
