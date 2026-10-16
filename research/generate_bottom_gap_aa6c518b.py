"""Machine-authored exact polynomial certificates, subsequently checked by Lean."""
import probe_bottom_gap_aa6c518b as p
from fractions import Fraction
from pathlib import Path
import json
a,k,l,t=p.a,p.k,p.l,p.t
def lean(q):
 out=[]
 for e,c in sorted(q.items()):
  assert c.denominator==1 and c>0
  fs=[str(c.numerator)]+[v if n==1 else f'{v}^{n}' for v,n in zip(['a','k','l','t'],e) if n]
  out.append('*'.join(fs))
 return '+\n    '.join(out) if out else '0'
src='''import MathGKM.Markov
/-! Machine-authored aa6c518b. Exact bottom-strip gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def bottomTMAA6 (a k l : ℝ) : ℝ := (l-1)*(3*a-1)+k*(a+k+l)
def bottomJMAA6 (a k l s : ℝ) : ℝ :=
 4*s*(l-2)*(l-3)*(l-4)+(k+1)*((9*(a-1)^2+13*(a-1)+6)*(l-2)*(l-3)+
 (6*(a-1)^2+6*(a-1)*(k+l-1)+8*(a-1)+6*(k+l-1)+6)*k*(l-2)+
 (a+k+l)*(a+k+l-1)*k*(k-1))
def bottomGapMAA6 (a k l s : ℝ) : ℝ :=
 2*(k+1)*(k+l-2)*(k+l-3)*l*(bottomTMAA6 a k l)^2-
 (k+l)*(k+l-1)*(l-1)*bottomJMAA6 a k l s
'''
cases=[('zeroLarge','(a+1) (k+1) (l+3) 0',[a+1,k+1,l+3,0],1),
 ('smallTwo','(a+1) (k+2) 2 0',[a+1,k+2,2,0],1),
 ('smallThree','(a+1) (k+1) 3 0',[a+1,k+1,3,0],1),
 ('smallFour','(a+1) (k+1) 4 0',[a+1,k+1,4,0],1),
 ('highLarge','((k+l+7+t)/2) (k+1) (l+5) (2*t)',[(k+l+7+t)*Fraction(1,2),k+1,l+5,2*t],4)]
out=[]
for name,args,subs,scale in cases:
 q=scale*p.G.subst(subs); assert all(v>=0 for v in q.values())
 lhs=f'{scale}*bottomGapMAA6 {args}'
 src+=f'''\ntheorem bottom_{name}MAA6 (a k l t : ℝ) (ha : 0≤a) (hk : 0≤k) (hl : 0≤l) (ht : 0≤t) :
 0≤{lhs} := by
 have he : {lhs}=\n    {lean(q)} := by
   unfold bottomGapMAA6 bottomTMAA6 bottomJMAA6
   ring
 rw [he]
 positivity
'''
 out.append(dict(name=name,terms=len(q),negative=0,scale=scale))
src+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovBottomGapMAA6.lean').write_text(src)
Path('evidence/markov-aa6c518b/bottom-generated.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
