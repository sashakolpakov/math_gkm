"""Machine-authored low-slope strip certificate generator; Lean checks identities."""
import probe_strip_b9d0d341 as p
from pathlib import Path
import json
a,k,l=p.a,p.k,p.l;N=k+l
J=p.D*(l-1)*(l-2)+p.E*k*(l-1)+p.F*k*(k-1)
H=p.cs[2].subst([a,k,l,0,0,0])*(l-2)*(l-3)*(l-4)+p.cs[3]*k*(l-2)*(l-3)+p.cs[4]*k*(k-1)*(l-2)+p.cs[5]*k*(k-1)*(k-2)
G=3*(N-3)*(N-4)*l*J**2-2*(N-1)*(N-2)*(l-1)*p.T*H
def lean(q):
 out=[]
 for e,c in sorted(q.items()):
  assert c.denominator==1 and c>0
  out.append('*'.join([str(c.numerator)]+[v if n==1 else f'{v}^{n}' for v,n in zip(['a','k','l','q','t','u'],e) if n]))
 return '+\n    '.join(out) if out else '0'
src='''import MathGKM.Markov
/-! Machine-authored b9d0d341. Exact low-slope vertical j=1 gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
def stripTMB9D (a k l : ℝ) := (3*a-1)*l+(a+k+l+1)*k
def stripJMB9D (a k l : ℝ) :=
 (9*a^2-5*a+2)*(l-1)*(l-2)+(6*a^2+6*a*(k+l+2)-16*a+4)*k*(l-1)+
 (a+k+l+1)*(a+k+l)*k*(k-1)
def stripHMB9D (a k l : ℝ) :=
 (27*a^3-18*a^2+21*a-6)*(l-2)*(l-3)*(l-4)+
 (27*a^3+27*a^2*(k+l+2)-114*a^2+3*a*(k+l+2)+33*a+6*(k+l+2)-18)*k*(l-2)*(l-3)+
 (9*a^3+18*a^2*(k+l+2)-54*a^2+9*a*(k+l+2)^2-51*a*(k+l+2)+87*a+3*(k+l+2)^2-3*(k+l+2)-18)*k*(k-1)*(l-2)+
 (a+k+l+1)*(a+k+l)*(a+k+l-1)*k*(k-1)*(k-2)
def stripGapMB9D (a k l : ℝ) :=
 3*(k+l-3)*(k+l-4)*l*(stripJMB9D a k l)^2-
 2*(k+l-1)*(k+l-2)*(l-1)*stripTMB9D a k l*stripHMB9D a k l
'''
out=[]
for name,args,subs in [('large','(a+1) k (l+5)',[a+1,k,l+5,0,0,0]),('two','(a+1) (k+3) 2',[a+1,k+3,2,0,0,0]),('three','(a+1) (k+2) 3',[a+1,k+2,3,0,0,0]),('four','(a+1) (k+1) 4',[a+1,k+1,4,0,0,0])]:
 z=G.subst(subs)
 out.append(p.report(name,z));assert all(c>0 for c in z.values()),out[-1]
 src+=f'''\ntheorem strip_{name}MB9D (a k l : ℝ) (ha : 0≤a) (hk : 0≤k) (hl : 0≤l) :
 0≤stripGapMB9D {args} := by
 have he : stripGapMB9D {args}=\n    {lean(z)} := by
   unfold stripGapMB9D stripTMB9D stripJMB9D stripHMB9D
   ring
 rw [he]
 positivity
'''
src+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovStripGapMB9D.lean').write_text(src)
Path('evidence/markov-b9d0d341/low-strip-generated.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
