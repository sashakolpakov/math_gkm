"""Machine-authored exact terminal certificate generation; Lean must check each identity."""
from pathlib import Path
from uniform_shape_8bbb import Q,var,subst,horner
import json
O=Path('evidence/markov-e2cd486c');d=json.loads((O/'terminal-probe.json').read_text())
hdr='''import MarkovTailShape53D
/-! Machine-authored e2cd486c. Explicit fourth-band endpoint algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
set_option maxRecDepth 16384
def fourthCoeff0E2 (c r q t : ℤ) : ℤ := 24*t+48*q-72*r+24*c
def fourthCoeff1E2 (c r q t u : ℤ) : ℤ :=
 24*u-144*t-480*q+744*r-96*r*q+192*r^2-288*c+96*c*q-288*c*r+96*c^2
'''
out=hdr
for ch,vs in d['shapes'].items():
 for k,p in enumerate(vs):
  expr=horner(Q({tuple(a):b for a,b in p}),['n','c','r','k'])
  out+=f'def terminal{ch}{k}E2 (c r : ℤ) : ℤ :=\n {expr}\n'
 q='0' if ch=='lo' else '(2*r-c)';t='(c-r)' if ch!='lo' else '(3*r-c)';u='(3*r-2*c)' if ch=='hi' else '0'
 for k in range(4):
  tail='tailLow53D' if ch=='lo' else 'tailHigh53D'
  lhs=f'{tail} c r ({1-k})'
  if k==2:lhs+=f'+15*fourthCoeff0E2 c r {q} {t}'
  if k==3:lhs+=f'+15*(6*fourthCoeff0E2 c r {q} {t}+fourthCoeff1E2 c r {q} {t} {u})'
  out+=f'theorem terminal_{ch}_{k}_formulaE2 (c r : ℤ) :\n {lhs}=terminal{ch}{k}E2 c r := by\n simp only [{tail},fourthCoeff0E2,fourthCoeff1E2,terminal{ch}{k}E2]\n ring\n'
out+='end\nend MathGKM.Markov\n'
Path('research/MarkovTerminalAlgebraE2.lean').write_text(out)
u,v,_,_=map(var,range(4));out='''import MarkovTerminalAlgebraE2
/-! Machine-authored e2cd486c. Exhaustive parameter chamber gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
set_option maxRecDepth 16384
'''
for name,shifts in [('lo0',[(1,0),(0,1)]),('mid0',[(2,0),(1,1),(0,2)]),('hi0',[(1,0)]),('hi1',[(1,0)])]:
 p=Q({tuple(a):b for a,b in d['gaps'][name]});ch=name[:-1];k=int(name[-1])
 for a,b in shifts:
  w,z=u+a,v+b
  c,r=(3*w+2*z,w+z) if ch=='lo' else ((3*w+2*z,2*w+z) if ch=='mid' else (3*w+z,2*w+z))
  gap=subst(p,[0,c,r,0]);assert all(x>=0 for x in gap.values())
  cc=horner(c,['u','v','x','y']);rr=horner(r,['u','v','x','y']);expr=horner(gap,['u','v','x','y'])
  left=f'terminal{ch}{k}E2 {cc} {rr}';center=f'terminal{ch}{k+1}E2 {cc} {rr}';right=f'terminal{ch}{k+2}E2 {cc} {rr}'
  out+=f'''theorem terminal_gap_{name}_{a}{b}E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 {left}*{right} ≤ ({center})^2 := by
 have he : ({center})^2-{left}*{right}={expr} := by
  unfold terminal{ch}{k}E2 terminal{ch}{k+1}E2 terminal{ch}{k+2}E2
  ring
 have hp : 0 ≤ {expr} := by positivity
 omega
'''
out+='end\nend MathGKM.Markov\n';Path('research/MarkovTerminalGapsE2.lean').write_text(out)
