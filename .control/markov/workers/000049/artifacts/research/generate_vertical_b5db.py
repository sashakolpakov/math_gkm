"""Machine-authored exact certificates; no inherited artifact is changed."""
from vertical_gap_b5db import *
def expr(p):
 terms=[]
 for e,c in sorted(p.items()):
  assert c.denominator==1 and c>0
  fs=[str(c.numerator)] if c!=1 else []
  for v,k in zip(['x','y','(2*b)'],e):
   if k:fs.append(v if k==1 else v+'^'+str(k))
  k=2-e[2]
  if k:fs.append('c' if k==1 else 'c^'+str(k))
  terms.append('*'.join(fs) or '1')
 return ' +\n    '.join(terms)
q=interval(raw)
src='''import MarkovTopSource58d2
/-! Machine-authored b5dbe087. Vertical raw top-crossing gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000
def verticalGapB5 (i j b : ℝ) : ℝ :=
 let d := i+j
 let n := d+1-b
 let c := b*n+n-3*b-1
 2*d*(d-1)*(j+2)*(b*(j+1)+n*i)^2 -
 (j+1)*(d+2)*(d+1)*(n*(n-1)*i*(i-1)+2*c*i*j+b*(b-1)*j*(j-1))
'''
cases=[('large',[i+2,j,b],'x+2','y'),('one',[1,j+1,b],'1','y+1'),('zero',[0,j+2,b],'0','y+2')]
for name,vs,ii,jj in cases:
 p=q.sub(vs)
 src+=f'''\ntheorem verticalGap_certificate_{name}B5 (x y b c : ℝ)
 (he : c={ii}+({jj})-2*b) :
 (2*({ii}+({jj})))^2*verticalGapB5 ({ii}) ({jj}) b =
    {expr(p)} := by
 rw [he]
 unfold verticalGapB5
 ring

theorem verticalGap_nonneg_{name}B5 (x y b : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hb : 0 ≤ b) (hc : 0 ≤ {ii}+({jj})-2*b) :
 0 ≤ verticalGapB5 ({ii}) ({jj}) b := by
 have h := verticalGap_certificate_{name}B5 x y b ({ii}+({jj})-2*b) rfl
 have hp : 0 ≤ {expr(p).replace('c^','('+ii+'+('+jj+')-2*b)^').replace('*c','*('+ii+'+('+jj+')-2*b)')} := by positivity
 have ht : 0 < (2*({ii}+({jj})))^2 := by positivity
 rw [← h] at hp
 exact (mul_nonneg_iff_of_pos_left ht).mp hp
'''
src+='''
theorem verticalGap_nonnegB5 (i j : ℕ) (b : ℝ) (hb : 0 ≤ b)
 (hc : 2*b ≤ (i:ℝ)+j) (hd : 2 ≤ i+j) : 0 ≤ verticalGapB5 i j b := by
 rcases i with _ | (_ | i)
 · have hj : 2 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   have h := verticalGap_nonneg_zeroB5 0 k b (by norm_num) (by positivity) hb (by push_cast at *; linarith)
   simpa [Nat.cast_add,add_comm] using h
 · have hj : 1 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   have h := verticalGap_nonneg_oneB5 0 k b (by norm_num) (by positivity) hb (by push_cast at *; linarith)
   simpa [Nat.cast_add,add_comm] using h
 · simpa [Nat.cast_add,add_comm,add_left_comm,add_assoc] using
     verticalGap_nonneg_largeB5 i j b (by positivity) (by positivity) hb (by push_cast at *; linarith)

#print axioms verticalGap_nonnegB5
end
end MathGKM.Markov
'''
pathlib.Path('research/MarkovVerticalCertificateB5.lean').write_text(src)
out={case:record(q.sub(vs)) for case,vs,_,_ in cases}
pathlib.Path('evidence/markov-b5dbe087/vertical-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
