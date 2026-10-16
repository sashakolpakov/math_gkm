"""Machine-authored split polynomial certificates. Generated Lean must be checked."""
from pathlib import Path
from fractions import Fraction
import sys,json
sys.path.insert(0,'research')
ns={};exec(Path('research/probe_strip_d11e335e.py').read_text().split('out=[]')[0],ns)
G,J,H,I,a,k,l,t=[ns[x] for x in ['G','J','H','I','a','k','l','t']]
P=ns['p'].sp
sub=[(k+l+9+t)*Fraction(1,4),k,l+7,0,t,0]
jj=(16*J).subst(sub); hh=(64*H).subst(sub)
rr=(256*((k+1)*I+96*t*ns['p'].fall(l-3,5))).subst(sub)
def coefficient(z,r):
 return P.P({tuple(0 if j==4 else e[j] for j in range(6)):c for e,c in z.items() if e[4]==r})
def horner(z,vs=(1,2)):
 if not z:return '0'
 if not vs:
  assert len(z)==1
  c=next(iter(z.values()));assert c.denominator==1
  return str(c.numerator) if c>=0 else f'({c.numerator})'
 v=vs[0];groups={}
 for e,c in z.items():
  ee=list(e);ee[v]=0;groups.setdefault(e[v],{})[tuple(ee)]=c
 exps=sorted(groups,reverse=True);ans=horner(groups[exps[0]],vs[1:]);last=exps[0]
 var=['a','k','l','q','t','u'][v]
 for e in exps[1:]:
  power=var if last-e==1 else f'{var}^{last-e}'
  ans=f'({ans})*{power}+({horner(groups[e],vs[1:])})';last=e
 if last:ans=f'({ans})*'+(var if last==1 else f'{var}^{last}')
 return ans
head='''import MarkovStripGapMD11
/-! Machine-authored request 5703599b. Coefficient-wise middle-cone certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
'''
defs='''def stripMiddleIM570 (a k l t : ℝ) : ℝ :=
 (k+1)*stripIMD11 a k l+96*t*(l-3)*(l-4)*(l-5)*(l-6)*(l-7)
def stripMiddleGapM570 (a k l t : ℝ) : ℝ :=
 4*(k+l-5)*(k+l-6)*(l-1)*(k+1)*(stripHMB9D a k l)^2-
 3*(k+l-3)*(k+l-4)*(l-2)*stripJMB9D a k l*stripMiddleIM570 a k l t
'''
cs={}
for key,z,n in [('j',jj,2),('h',hh,3),('r',rr,4)]:
 cs[key]=[coefficient(z,r) for r in range(n+1)]
 for r,c in enumerate(cs[key]):defs+=f'def {key}{r}M570 (k l : ℝ) : ℝ := {horner(c)}\n'
F=4*(k+l+2)*(k+l+1)*(l+6)*(k+1)
E=3*(k+l+4)*(k+l+3)*(l+5)
defs+='def gapFM570 (k l : ℝ) : ℝ := 4*(k+l+2)*(k+l+1)*(l+6)*(k+1)\n'
defs+='def gapEM570 (k l : ℝ) : ℝ := 3*(k+l+4)*(k+l+3)*(l+5)\n'
gaps=[]
for r in range(7):
 hs=[(i,j) for i in range(4) for j in range(4) if i+j==r]
 js=[(i,j) for i in range(3) for j in range(5) if i+j==r]
 z=F*sum((cs['h'][i]*cs['h'][j] for i,j in hs),P.poly(0))-E*sum((cs['j'][i]*cs['r'][j] for i,j in js),P.poly(0))
 assert all(c>0 for c in z.values())
 e1='+'.join(f'h{i}M570 k l*h{j}M570 k l' for i,j in hs)
 e2='+'.join(f'j{i}M570 k l*r{j}M570 k l' for i,j in js)
 defs+=f'def g{r}M570 (k l : ℝ) : ℝ := gapFM570 k l*({e1})-gapEM570 k l*({e2})\n'
 gaps.append(z)
Path('research/MarkovMiddleDefsM570.lean').write_text(head+defs+'end\nend MathGKM.Markov\n')
for r,z in enumerate(gaps):
 src=head.replace('import MarkovStripGapMD11','import MarkovMiddleDefsM570')
 used=sorted(set([f'h{i}M570' for i in range(4) if 0<=r-i<4]+[f'j{i}M570' for i in range(3) if 0<=r-i<5]+[f'r{i}M570' for i in range(5) if 0<=r-i<3]))
 src+=f'''theorem gap_coefficient_{r}M570 (k l : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ g{r}M570 k l := by
 have he : g{r}M570 k l = {horner(z)} := by
   unfold g{r}M570 gapFM570 gapEM570 {' '.join(used)}
   ring
 rw [he]
 positivity
end
end MathGKM.Markov
'''
 Path(f'research/MarkovMiddleCert{r}M570.lean').write_text(src)
def expr(key,n):return '+'.join(f'{key}{r}M570 k l'+(f'*t^{r}' if r else '') for r in range(n+1))
src=head.replace('import MarkovStripGapMD11','import MarkovMiddleDefsM570')
for key,z,n,term,unfold in [
 ('j',jj,2,'16*stripJMB9D ((k+l+9+t)/4) k (l+7)','stripJMB9D'),
 ('h',hh,3,'64*stripHMB9D ((k+l+9+t)/4) k (l+7)','stripHMB9D'),
 ('r',rr,4,'256*stripMiddleIM570 ((k+l+9+t)/4) k (l+7) t','stripMiddleIM570 stripIMD11 h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511')]:
 src+=f'''theorem {key}_expandM570 (k l t : ℝ) :
 {term}={expr(key,n)} := by
 unfold {unfold} {' '.join(f'{key}{r}M570' for r in range(n+1))}
 ring
'''
src+='''theorem gap_expandM570 (k l t : ℝ) :
 4096*stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t=
 '''+expr('g',6)+''' := by
 have hj := j_expandM570 k l t
 have hh := h_expandM570 k l t
 have hr := r_expandM570 k l t
 have he : 4096*stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t=
   gapFM570 k l*('''+expr('h',3)+''')^2-gapEM570 k l*('''+expr('j',2)+''')*('''+expr('r',4)+''') := by
   unfold stripMiddleGapM570 gapFM570 gapEM570
   linear_combination
    4*(k+l+2)*(k+l+1)*(l+6)*(k+1)*
      (64*stripHMB9D ((k+l+9+t)/4) k (l+7)+('''+expr('h',3)+'''))*hh-
    3*(k+l+4)*(k+l+3)*(l+5)*
      (256*stripMiddleIM570 ((k+l+9+t)/4) k (l+7) t*hj+('''+expr('j',2)+''')*hr)
 rw [he]
 unfold '''+' '.join(f'g{r}M570' for r in range(7))+'''
 ring
end
end MathGKM.Markov
'''
Path('research/MarkovMiddleExpandM570.lean').write_text(src)
Path('evidence/markov-5703599b/split-design.json').write_text(json.dumps({'status':'generated candidates, require Lean checks','coefficient_terms':[len(z) for z in gaps],'scale':4096,'substitution':'a=(k+l+9+t)/4, original l=l+7'},indent=2)+'\n')
print([len(z) for z in gaps])
