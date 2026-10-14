"""Machine-authored proof-size reduction; exact identities remain Lean checked."""
from pathlib import Path
import json
def horner(p,names):
 if not p:return '0'
 if not names:return str(p.get((),0))
 deg=max(k[0] for k in p)
 cs=[horner({k[1:]:v for k,v in p.items() if k[0]==i},names[1:]) for i in range(deg+1)]
 out=cs[-1]
 for c in reversed(cs[:-1]):out=f'(({out})*{names[0]}+({c}))'
 return out
# Load only the polynomial representation and helpers; no predecessor actions.
src=Path('research/transitions_0d052.py').read_text()
exec(src[:src.index('head=')])
text='import MarkovTransitionFormulasD052\n/-! Machine-authored 0d052acb. Horner-form exact gap certificates. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\n'
for s,t in [(0,0),(0,1),(0,2),(1,-1),(1,0),(1,1),(1,2)]:
 ns=[name(s,t+k) for k in range(3)];ps=[val(s,t+k) for k in range(3)]
 gap=sub(ps[1]*ps[1]-ps[0]*ps[2],N+5,C+R+2,C+1)
 g=horner(gap,['t','u','v'])
 text+=f'\ntheorem {ns[0]}_lc (n c r : ℤ) (hn : 5≤n) (hr : 1≤r) (hc : r+1≤c) :\n {ns[0]} n c r*{ns[2]} n c r≤{ns[1]} n c r^2 := by\n let t := n-5\n let u := r-1\n let v := c-r-1\n have ht : 0≤t := by dsimp [t]; omega\n have hu : 0≤u := by dsimp [u]; omega\n have hv : 0≤v := by dsimp [v]; omega\n have he : {ns[1]} n c r^2-{ns[0]} n c r*{ns[2]} n c r={g} := by\n  dsimp [{",".join(ns)},t,u,v]\n  ring\n have hp : (0:ℤ)≤{g} := by positivity\n omega\n'
text+='\n#print axioms trans1p2D052_lc\nend\nend MathGKM.Markov\n'
Path('research/MarkovTransitionGapsD052.lean').write_text(text)
print('Reexpressed seven gap certificates in Horner form')
