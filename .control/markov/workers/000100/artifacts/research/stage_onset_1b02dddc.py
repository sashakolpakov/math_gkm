"""Machine-authored exact onset certificates staged by the nonnegative run variable."""
from pathlib import Path
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce
from probe_shift_f2da221d import load
R=Path('/Users/sasha/math_gkm/research');O=R.parent/'evidence/markov-1b02dddc'
names=['n','z','c','r','q','t','u','x']
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
  d=ks[0];key=(0,)+ks[1:];out.setdefault(d,P())[key]=v
 return out
header='''/-! Machine-authored 1b02dddc. Column-wise exact onset gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
'''
end='end\nend MathGKM.Markov\n'
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
for row in json.loads((O/'onset-candidates.json').read_text()):
 ch,k=row['chamber'],row['k'];(a,b),(s,t)=bounds[ch:ch+2]
 cv=b*(C+1)+t*(Rr+1);rv=a*(C+1)+s*(Rr+1)
 cols=[columns(load(v)) for v in row['values']];gcols=columns(load(row['gap']))
 for d in range(15):gcols.setdefault(d,P())
 pn=lambda i,d:f'onsetP{ch}_{k}_{i}_{d}M1B'
 gn=lambda d:f'onsetG{ch}_{k}_{d}M1B'
 st=f'import MarkovOnsetValues{ch}M1B\n'+header
 for i,cs in enumerate(cols):
  for d,v in sorted(cs.items()):st+=f'\ndef {pn(i,d)} (c r : ℤ) : ℤ :=\n {expr(v)}\n'
 for d,v in sorted(gcols.items()):
  st+=f'\ndef {gn(d)} (c r : ℤ) : ℤ :=\n {expr(v)}\n'
  st+=f'\ntheorem {gn(d)}_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤{gn(d)} c r := by\n unfold {gn(d)}\n positivity\n'
 dec=lambda i:' + '.join(f'{pn(i,d)} c r*n^{d}' for d in sorted(cols[i]))
 for i,cs in enumerate(cols):
  st+=f'\ntheorem onset_stage{ch}_{k}_{i}M1B (n c r : ℤ) :\n onsetValue{ch}_{k+i}M1B (n+7) ({expr(cv)}) ({expr(rv)})={dec(i)} := by\n unfold onsetValue{ch}_{k+i}M1B backShape{ch}M94 onsetCorrection{ch}_{k+i}M1B '+' '.join(pn(i,d) for d in cs)+'\n ring\n'
 for d,g in sorted(gcols.items()):
  lhs=' + '.join(f'{pn(1,i)} c r*{pn(1,j)} c r' for i in cols[1] for j in cols[1] if i+j==d) or '0'
  rhs=' + '.join(f'{pn(0,i)} c r*{pn(2,j)} c r' for i in cols[0] for j in cols[2] if i+j==d) or '0'
  defs={pn(1,i) for i in cols[1] for j in cols[1] if i+j==d}|{pn(0,i) for i in cols[0] for j in cols[2] if i+j==d}|{pn(2,j) for i in cols[0] for j in cols[2] if i+j==d}|{gn(d)}
  st+=f'\ntheorem onset_column{ch}_{k}_{d}M1B (c r : ℤ) :\n ({lhs})-({rhs})={gn(d)} c r := by\n unfold '+' '.join(sorted(defs))+'\n ring\n'
 allpn=[pn(i,d) for i in range(3) for d in cols[i]]
 st+='\nattribute [local irreducible] '+' '.join(allpn+[gn(d) for d in gcols])+'\n'
 gaps=' + '.join(f'{gn(d)} c r*n^{d}' for d in sorted(gcols))
 st+=f'''\ntheorem onset_columns_lc{ch}_{k}M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue{ch}_{k}M1B (n+7) ({expr(cv)}) ({expr(rv)})*
 onsetValue{ch}_{k+2}M1B (n+7) ({expr(cv)}) ({expr(rv)})≤
 onsetValue{ch}_{k+1}M1B (n+7) ({expr(cv)}) ({expr(rv)})^2 := by
 apply sub_nonneg.mp
 rw [onset_stage{ch}_{k}_0M1B,onset_stage{ch}_{k}_1M1B,onset_stage{ch}_{k}_2M1B]
 have hgap : ({dec(1)})^2-({dec(0)})*({dec(2)})={gaps} := by
  rw ['''+','.join(f'←onset_column{ch}_{k}_{d}M1B' for d in sorted(gcols))+''']
  ring
 rw [hgap]
'''
 for d in sorted(gcols):st+=f' have h{d} := {gn(d)}_nonneg c r hc hr\n'
 st+=' positivity\n'
 (R/f'MarkovOnsetColumns{ch}_{k}M1B.lean').write_text(st+end)
print('Generated 36 staged certificates; not yet checked.')
