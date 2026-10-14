"""Machine-authored exact nonnegative horizontal gap certificate generator."""
from topnext_7955 import *
def horner(p,names):
 if not p:return '0'
 if not names:return str(p.get((),0))
 deg=max(k[0] for k in p)
 cs=[horner({k[1:]:v for k,v in p.items() if k[0]==z},names[1:]) for z in range(deg+1)]
 o=cs[-1]
 for c in reversed(cs[:-1]):o=f'({c}+{names[0]}*{o})'
 return o
src='''import MarkovTopSource58d2
import MarkovFourth5a7
/-! Machine-authored 7955df0c. Fourth-to-second upper-layer horizontal certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
def nextT7955 (i j b n s : ℝ) : ℝ :=
 cubicD5a7 (n-1)*i*(i-1)*(i-2)+cubicC5a7 (n-1) b*i*(i-1)*j+
 cubicB5a7 (n-1) b s*i*j*(j-1)+cubicA5a7 b*j*(j-1)*(j-2)
def nextQ7955 (i j b n : ℝ) : ℝ :=
 n*(n-1)*(i+1)*i+2*(b*n+n-3*b-1)*(i+1)*j+b*(b-1)*j*(j-1)
def nextGap7955 (i j b : ℝ) : ℝ :=
 let d := i+j
 let n := d+2-b
 3*(d-1)*(d-2)*(i+2)*(nextQ7955 i j b n)^2-
 2*d*(d+1)*(i+1)*nextT7955 i j b n 0*(n*(i+2)+b*j)
'''
p,k=interval(terms(i,j,b)[0])
for name,vs,ii,jj in [('large',[i+3,j,b],'x+3','y'),('two',[2,j+1,b],'2','y+1'),('one',[1,j+2,b],'1','y+2'),('zero',[0,j+3,b],'0','y+3')]:
 q=p.sub(vs)
 assert all(v>0 and v.denominator==1 for v in q.values())
 # Homogenize the interval parameter with c=(i+j+1)-2b.
 full={ (u,v,w,k-w):int(z) for (u,v,w),z in q.items() }
 expr=horner(full,['x','y','(2*b)','c'])
 src+=f'''
def nextCert_{name}7955 (x y b c : ℝ) : ℝ := {expr}
theorem nextCert_{name}_nonneg7955 (x y b c : ℝ)
 (hx : 0≤x) (hy : 0≤y) (hb : 0≤b) (hc : 0≤c) :
 0≤nextCert_{name}7955 x y b c := by
 unfold nextCert_{name}7955
 positivity
theorem nextGap_{name}_identity7955 (x y b : ℝ) :
 (2*({ii}+({jj})+1))^{k}*nextGap7955 ({ii}) ({jj}) b =
 nextCert_{name}7955 x y b ({ii}+({jj})+1-2*b) := by
 unfold nextGap7955 nextQ7955 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7 nextCert_{name}7955
 ring
theorem nextGap_{name}_nonneg7955 (x y b : ℝ)
 (hx : 0≤x) (hy : 0≤y) (hb : 0≤b) (hc : 2*b≤{ii}+({jj})+1) :
 0≤nextGap7955 ({ii}) ({jj}) b := by
 have hp := nextCert_{name}_nonneg7955 x y b ({ii}+({jj})+1-2*b) hx hy hb (by linarith)
 rw [←nextGap_{name}_identity7955] at hp
 have ht : 0<(2*({ii}+({jj})+1))^{k} := by positivity
 exact (mul_nonneg_iff_of_pos_left ht).mp hp
'''
src+='''
theorem nextGap_nonneg7955 (i j : ℕ) (b : ℝ) (hb : 0≤b)
 (hc : 2*b≤(i:ℝ)+j+1) (hd : 3≤i+j) : 0≤nextGap7955 i j b := by
 rcases i with _ | (_ | (_ | i))
 · have hj : 3≤j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   simpa [Nat.cast_add,add_comm] using nextGap_zero_nonneg7955 0 k b (by norm_num) (by positivity) hb (by push_cast at *; linarith)
 · have hj : 2≤j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   simpa [Nat.cast_add,add_comm] using nextGap_one_nonneg7955 0 k b (by norm_num) (by positivity) hb (by push_cast at *; linarith)
 · have hj : 1≤j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   simpa [Nat.cast_add,add_comm] using nextGap_two_nonneg7955 0 k b (by norm_num) (by positivity) hb (by push_cast at *; linarith)
 · simpa [Nat.cast_add,add_comm,add_left_comm,add_assoc] using nextGap_large_nonneg7955 i j b (by positivity) (by positivity) hb (by push_cast at *; linarith)
#print axioms nextGap_nonneg7955
end
end MathGKM.Markov
'''
pathlib.Path('research/MarkovNextCertificate7955.lean').write_text(src.replace("≤"," ≤ "))
