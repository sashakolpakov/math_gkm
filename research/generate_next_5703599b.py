"""Machine-authored 2a<=b<=3a certificate candidates, with split coefficient checks."""
from pathlib import Path
from fractions import Fraction
import sys,json
sys.path.insert(0,'research')
ns={};exec(Path('research/generate_split_5703599b.py').read_text().split('head=')[0],ns)
P,horner,coefficient=[ns[x] for x in ['P','horner','coefficient']]
nn={};exec(Path('research/probe_nextcone_d11e335e.py').read_text().rsplit('out=[]',1)[0],nn)
G,J,H,I,a,k,l,t=[nn[x] for x in ['G','J','Hnew','Inew','a','k','l','t']]
sub=[(k+l+9+t)*Fraction(1,3),k,l+7,0,t,0]
jj=(9*J).subst(sub);hh=(27*H).subst(sub);rr=(81*I).subst(sub)
head='''import MarkovStripGapMD11
import MarkovStripGapMCE8
/-! Machine-authored 5703599b. Next-cone split certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
'''
defs='''def stripNextIM570 (a k l t : ℝ) : ℝ :=
 (k+1)*stripIMD11 a k l+
 (-480*t+288*a*t+96*(k+l+2-2*a))*(l-3)*(l-4)*(l-5)*(l-6)*(l-7)+
 (96*a+96*(k+l+2)-864)*t*(k+1)*(l-3)*(l-4)*(l-5)*(l-6)
def stripNextGapM570 (a k l t : ℝ) : ℝ :=
 4*(k+l-5)*(k+l-6)*(l-1)*(stripHMCE8 a k l t)^2-
 3*(k+l-3)*(k+l-4)*(l-2)*(k+1)*stripJMB9D a k l*stripNextIM570 a k l t
'''
cs={}
for key,z,n in [('nj',jj,2),('nh',hh,3),('nr',rr,4)]:
 cs[key]=[coefficient(z,r) for r in range(n+1)]
 for r,c in enumerate(cs[key]):defs+=f'def {key}{r}M570 (k l : ℝ) : ℝ := {horner(c)}\n'
F=4*(k+l+2)*(k+l+1)*(l+6);E=3*(k+l+4)*(k+l+3)*(l+5)*(k+1)
defs+='def nextFM570 (k l : ℝ) : ℝ := 4*(k+l+2)*(k+l+1)*(l+6)\n'
defs+='def nextEM570 (k l : ℝ) : ℝ := 3*(k+l+4)*(k+l+3)*(l+5)*(k+1)\n'
gaps=[]
for r in range(7):
 hs=[(i,j) for i in range(4) for j in range(4) if i+j==r]
 js=[(i,j) for i in range(3) for j in range(5) if i+j==r]
 z=F*sum((cs['nh'][i]*cs['nh'][j] for i,j in hs),P.poly(0))-E*sum((cs['nj'][i]*cs['nr'][j] for i,j in js),P.poly(0))
 assert all(c>0 for c in z.values())
 e1='+'.join(f'nh{i}M570 k l*nh{j}M570 k l' for i,j in hs)
 e2='+'.join(f'nj{i}M570 k l*nr{j}M570 k l' for i,j in js)
 defs+=f'def ng{r}M570 (k l : ℝ) : ℝ := nextFM570 k l*({e1})-nextEM570 k l*({e2})\n'
 gaps.append(z)
Path('research/MarkovNextDefsM570.lean').write_text(head+defs+'end\nend MathGKM.Markov\n')
for r,z in enumerate(gaps):
 src=head.replace('import MarkovStripGapMD11\nimport MarkovStripGapMCE8','import MarkovNextDefsM570')
 used=sorted(set([f'nh{i}M570' for i in range(4) if 0<=r-i<4]+[f'nj{i}M570' for i in range(3) if 0<=r-i<5]+[f'nr{i}M570' for i in range(5) if 0<=r-i<3]))
 src+=f'''theorem next_coefficient_{r}M570 (k l : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ ng{r}M570 k l := by
 have he : ng{r}M570 k l = {horner(z)} := by
   unfold ng{r}M570 nextFM570 nextEM570 {' '.join(used)}
   ring
 rw [he]
 positivity
end
end MathGKM.Markov
'''
 Path(f'research/MarkovNextCert{r}M570.lean').write_text(src)
def expr(key,n):return '+'.join(f'{key}{r}M570 k l'+(f'*t^{r}' if r else '') for r in range(n+1))
src=head.replace('import MarkovStripGapMD11\nimport MarkovStripGapMCE8','import MarkovNextDefsM570')
for key,n,term,unfold in [
 ('nj',2,'9*stripJMB9D ((k+l+9+t)/3) k (l+7)','stripJMB9D'),
 ('nh',3,'27*stripHMCE8 ((k+l+9+t)/3) k (l+7) t','stripHMCE8 stripHMB9D'),
 ('nr',4,'81*stripNextIM570 ((k+l+9+t)/3) k (l+7) t','stripNextIM570 stripIMD11 h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511')]:
 src+=f'''theorem {key}_expandM570 (k l t : ℝ) :
 {term}={expr(key,n)} := by
 unfold {unfold} {' '.join(f'{key}{r}M570' for r in range(n+1))}
 ring
'''
src+='''theorem next_expandM570 (k l t : ℝ) :
 729*stripNextGapM570 ((k+l+9+t)/3) k (l+7) t=
 '''+expr('ng',6)+''' := by
 have hj := nj_expandM570 k l t
 have hh := nh_expandM570 k l t
 have hr := nr_expandM570 k l t
 have he : 729*stripNextGapM570 ((k+l+9+t)/3) k (l+7) t=
   nextFM570 k l*('''+expr('nh',3)+''')^2-nextEM570 k l*('''+expr('nj',2)+''')*('''+expr('nr',4)+''') := by
   unfold stripNextGapM570 nextFM570 nextEM570
   linear_combination
    4*(k+l+2)*(k+l+1)*(l+6)*
      (27*stripHMCE8 ((k+l+9+t)/3) k (l+7) t+('''+expr('nh',3)+'''))*hh-
    3*(k+l+4)*(k+l+3)*(l+5)*(k+1)*
      (81*stripNextIM570 ((k+l+9+t)/3) k (l+7) t*hj+('''+expr('nj',2)+''')*hr)
 rw [he]
 unfold '''+' '.join(f'ng{r}M570' for r in range(7))+'''
 ring
end
end MathGKM.Markov
'''
Path('research/MarkovNextExpandM570.lean').write_text(src)
src=head.replace('import MarkovStripGapMD11\nimport MarkovStripGapMCE8','import MarkovNextDefsM570')
for n in range(3,7):
 src+=f'''theorem next_small{n}M570 (a k t : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripNextGapM570 (a+1) (k+{7-n}) {n} t := by
 unfold stripNextGapM570 stripNextIM570 stripHMCE8 stripHMB9D stripJMB9D stripIMD11
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity
'''
src+='end\nend MathGKM.Markov\n';Path('research/MarkovNextSmallGapM570.lean').write_text(src)
Path('evidence/markov-5703599b/next-split-design.json').write_text(json.dumps({'status':'generated candidates, require Lean checks','coefficient_terms':[len(z) for z in gaps],'scale':729,'substitution':'a=(k+l+9+t)/3, original l=l+7'},indent=2)+'\n')
print([len(z) for z in gaps])
