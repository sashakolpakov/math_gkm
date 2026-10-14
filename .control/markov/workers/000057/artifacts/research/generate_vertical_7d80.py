"""Machine-authored exact vertical certificate generator, request 7d80a785.
Loads only definition AST nodes from predecessor generator, avoiding its writes.
"""
import ast,json,pathlib
from vertical_gap_b5db import P,coerce,i,j,b,record
tree=ast.parse(pathlib.Path('research/topnext_7955.py').read_text())
exec(compile(ast.Module(body=[n for n in tree.body if isinstance(n,ast.FunctionDef)],type_ignores=[]),'inherited-definitions','exec'))
def horner(p,names):
 if not p:return '0'
 if not names:return str(p.get((),0))
 deg=max(k[0] for k in p)
 cs=[horner({k[1:]:v for k,v in p.items() if k[0]==z},names[1:]) for z in range(deg+1)]
 o=cs[-1]
 for c in reversed(cs[:-1]):o=f'({c}+{names[0]}*{o})'
 return o
src='''import MarkovNextCertificate7955
/-! Machine-authored 7d80a785. Vertical raw-gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
def verticalQ7d80 (i j b n : ℝ) : ℝ :=
 n*(n-1)*i*(i-1)+2*(b*n+n-3*b-1)*i*(j+1)+b*(b-1)*(j+1)*j
def verticalGap7d80 (i j b s : ℝ) : ℝ :=
 let d := i+j
 let n := d+2-b
 3*(d-1)*(d-2)*(j+2)*(verticalQ7d80 i j b n)^2-
 2*d*(d+1)*(j+1)*nextT7955 i j b n s*(b*(j+2)+n*i)
'''
q,k=interval(terms(i,j,b)[1]);q=q.sub([i+3,j,b]);assert all(v>0 for v in q.values())
full={(u,v,w,k-w):int(z) for (u,v,w),z in q.items()}
expr=horner(full,['x','y','(2*b)','c'])
src+=f'''
def verticalLargeCert7d80 (x y b c : ℝ) : ℝ := {expr}
theorem vertical_large_nonneg7d80 (x y b : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hb : 0 ≤ b) (hc : 2*b ≤ x+y+4) : 0 ≤ verticalGap7d80 (x+3) y b 0 := by
 have hp : 0 ≤ verticalLargeCert7d80 x y b (x+y+4-2*b) := by
   have : 0 ≤ x+y+4-2*b := by linarith
   unfold verticalLargeCert7d80
   positivity
 have he : (2*(x+y+4))^{k}*verticalGap7d80 (x+3) y b 0 =
   verticalLargeCert7d80 x y b (x+y+4-2*b) := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7 verticalLargeCert7d80
   ring
 rw [←he] at hp
 exact (mul_nonneg_iff_of_pos_left (by positivity : 0 < (2*(x+y+4))^{k})).mp hp
'''
records={'large':record(q)}
for I in range(3):
 q=terms(I,2*b+j+5-I,b+3)[1];assert all(v>0 for v in q.values())
 records[str(I)]=record(q)
 expr=horner({e:int(v) for e,v in q.items()},['z','c','t'])
 src+=f'''
def verticalSmallCert{I}7d80 (z c t : ℝ) : ℝ := {expr}
theorem vertical_small{I}_nonneg7d80 (t c : ℝ) (ht : 0 ≤ t) (hc : 0 ≤ c) :
 0 ≤ verticalGap7d80 {I} (2*t+c+{5-I}) (t+3) 0 := by
 have hp : 0 ≤ verticalSmallCert{I}7d80 0 c t := by
   unfold verticalSmallCert{I}7d80
   positivity
 have he : verticalGap7d80 {I} (2*t+c+{5-I}) (t+3) 0=verticalSmallCert{I}7d80 0 c t := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7 verticalSmallCert{I}7d80
   ring
 rwa [he]
'''
src+='''
theorem vertical_gap_nonneg7d80 (i j : ℕ) (b : ℝ) (hb : 3 ≤ b)
 (hc : 2*b ≤ (i:ℝ)+j+1) : 0 ≤ verticalGap7d80 i j b 0 := by
 rcases i with _ | (_ | (_ | i))
 · have h := vertical_small0_nonneg7d80 (b-3) ((j:ℝ)+1-2*b) (by linarith) (by simpa using sub_nonneg.mpr hc)
   convert h using 1 <;> push_cast <;> ring
 · have h := vertical_small1_nonneg7d80 (b-3) ((j:ℝ)+2-2*b) (by linarith) (by norm_num at hc; linarith)
   convert h using 1 <;> push_cast <;> ring
 · have h := vertical_small2_nonneg7d80 (b-3) ((j:ℝ)+3-2*b) (by linarith) (by norm_num at hc; linarith)
   convert h using 1 <;> push_cast <;> ring
 · simpa [Nat.cast_add,add_comm,add_left_comm,add_assoc] using vertical_large_nonneg7d80 i j b (by positivity) (by positivity) (by linarith) (by push_cast at hc; linarith)
#print axioms vertical_gap_nonneg7d80
end
end MathGKM.Markov
'''
pathlib.Path('research/MarkovVerticalCertificate7d80.lean').write_text(src)
pathlib.Path('evidence/markov-7d80a785/certificates.json').write_text(json.dumps(records,indent=2)+'\n')
print({k:(v['terms'],len(v['negative_terms'])) for k,v in records.items()})
