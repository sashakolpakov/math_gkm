"""Machine-authored exact integer certificates, checked with Lean ring."""
from pathlib import Path
from fractions import Fraction
ns={}
exec(Path('research/probe_strip_d11e335e.py').read_text().split('out=[]')[0],ns)
G,a,k,l,t=[ns[x] for x in ['G','a','k','l','t']]
p=Path('research/MarkovStripMiddleGapMD11.lean')
src=p.read_text().split('theorem stripMiddle_')[0]
def horner(z,vs=(1,2,4)):
 if not vs:
  assert len(z)==1
  return str(next(iter(z.values())).numerator)
 v=vs[0]; groups={}
 for e,c in z.items():
  ee=list(e);ee[v]=0
  groups.setdefault(e[v],{})[tuple(ee)]=c
 exps=sorted(groups,reverse=True);ans=horner(groups[exps[0]],vs[1:]);last=exps[0]
 var=['a','k','l','q','t','u'][v]
 for e in exps[1:]:
  power=var if last-e==1 else f'{var}^{last-e}'
  ans=f'({ans})*{power}+({horner(groups[e],vs[1:])})';last=e
 if last:ans=f'({ans})*'+(var if last==1 else f'{var}^{last}')
 return ans
for name,kk,ll,ks,ls in [('large',k,l+7,'k','(l+7)'),('three',k+4,3,'(k+4)','3'),('four',k+3,4,'(k+3)','4'),('five',k+2,5,'(k+2)','5'),('six',k+1,6,'(k+1)','6')]:
 z=4096*G.subst([(kk+ll+2+t)*Fraction(1,4),kk,ll,0,t,0])
 terms=[]
 for e,c in sorted(z.items()):
  assert c.denominator==1 and c>0
  terms.append('*'.join([str(c.numerator)]+[v if n==1 else f'{v}^{n}' for v,n in zip(['a','k','l','q','t','u'],e) if n]))
 poly=horner(z)
 arg=f'(({ks}+{ls}+2+t)/4) {ks} {ls} t'
 src+=f'''theorem stripMiddle_{name}MD11 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapMD11 {arg} := by
 have he : 4096*stripMiddleGapMD11 {arg}=\n   {poly} := by
   unfold stripMiddleGapMD11 stripMiddleIMD11 stripIMD11 stripJMB9D stripHMB9D
   unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
   ring
 have hn : 0 ≤ 4096*stripMiddleGapMD11 {arg} := by rw [he]; positivity
 linarith only [hn]
\n'''
src+='end\nend MathGKM.Markov\n'
p.write_text(src)
print('Wrote integer certificates; validation required')
