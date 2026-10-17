import MarkovBinomialPolyM0D3
/-! Machine-authored request 9c28b628. A uniform binomial comparison intended
for injecting the correction summands into distinct base summands. -/
namespace MathGKM.Markov
set_option maxHeartbeats 8000000

theorem suppression_baseM9C28 (u v : ℕ) :
 8*(u+2).choose 2*(v+1) ≤ (2*u+v+5).choose 3 := by
 have hpoly (x : ℚ) : choosePolyM0D3 x 2=x*(x-1)/2 ∧
   choosePolyM0D3 x 3=x*(x-1)*(x-2)/6 := by
   constructor
   · rw [show (2:ℕ)=1+1 by rfl,choose_poly_succM0D3,
       show (1:ℕ)=0+1 by rfl,choose_poly_succM0D3,choose_poly_zeroM0D3]
     ring
   · rw [show (3:ℕ)=2+1 by rfl,choose_poly_succM0D3,
       show (2:ℕ)=1+1 by rfl,choose_poly_succM0D3,
       show (1:ℕ)=0+1 by rfl,choose_poly_succM0D3,choose_poly_zeroM0D3]
     ring
 have hh : (8:ℚ)*((u+2).choose 2:ℚ)*(v+1) ≤ ((2*u+v+5).choose 3:ℚ) := by
   rw [choose_poly_natM0D3,choose_poly_natM0D3,(hpoly _).1,(hpoly _).2]
   push_cast
   apply sub_nonneg.mp
   by_cases huv : u<v
   · obtain ⟨h,hv⟩ := Nat.exists_eq_add_of_le (show u+1 ≤ v by omega)
     rw [hv]
     push_cast
     ring_nf
     positivity
   · obtain ⟨h,hu⟩ := Nat.exists_eq_add_of_le (show v ≤ u by omega)
     rw [hu]
     push_cast
     ring_nf
     positivity
 exact_mod_cast hh

theorem choose_two_step_lowerM9C28 (n k m : ℕ) (hm : 2*m ≤ n+2) :
 2*m*n.choose k ≤ (k+1)*(n+2).choose (k+1) := by
 have h := Nat.choose_le_succ n k
 have he := Nat.succ_mul_choose_eq (n+1) k
 simp only [Nat.succ_eq_add_one,show n+1+1=n+2 by omega] at he
 calc
  2*m*n.choose k ≤ (n+2)*((n+1).choose k) := Nat.mul_le_mul hm h
  _ = _ := by nlinarith only [he]

theorem suppression_binomialM9C28 (u v t : ℕ) :
 2*(t+4)*(u+t+2).choose (t+2)*(v+t+1).choose (t+1) ≤
 (2*u+v+2*t+5).choose (t+3)*(u+2*v+2*t+3).choose t := by
 induction t with
 | zero => simpa using suppression_baseM9C28 u v
 | succ t ih =>
   have hA := choose_two_step_lowerM9C28 (2*u+v+2*t+5) (t+3) (u+t+3) (by omega)
   have hB := choose_two_step_lowerM9C28 (u+2*v+2*t+3) t (v+t+2) (by omega)
   have hR1 := Nat.succ_mul_choose_eq (u+t+2) (t+2)
   have hR2 := Nat.succ_mul_choose_eq (v+t+1) (t+1)
   simp only [Nat.succ_eq_add_one] at hR1 hR2 ⊢
   have hP := Nat.mul_le_mul hA hB
   have hI := Nat.mul_le_mul_left (4*(u+t+3)*(v+t+2)) ih
   have hR : (u+t+3)*(v+t+2)*(u+t+2).choose (t+2)*(v+t+1).choose (t+1)=
     (t+3)*(t+2)*(u+t+3).choose (t+3)*(v+t+2).choose (t+2) := by
     calc
      _ = ((u+t+2+1)*(u+t+2).choose (t+2))*((v+t+1+1)*(v+t+1).choose (t+1)) := by ring
      _ = _ := by rw [hR1,hR2]; congr 2 <;> omega
   have hscalar : 2*(t+1)*(t+5) ≤ 8*(t+3)*(t+2) := by nlinarith
   have hS := Nat.mul_le_mul_right ((t+4)*(u+t+3).choose (t+3)*(v+t+2).choose (t+2)) hscalar
   apply (Nat.mul_le_mul_left (show 0<(t+4)*(t+1) by positivity)).mp
   have hP' : 4*(u+t+3)*(v+t+2)*
       ((2*u+v+2*t+5).choose (t+3)*(u+2*v+2*t+3).choose t) ≤
       (t+4)*(t+1)*((2*u+v+2*(t+1)+5).choose (t+1+3)*
         (u+2*v+2*(t+1)+3).choose (t+1)) := by
     convert hP using 1 <;> first | ring | congr 2 <;> omega
   have hI' : 8*(t+4)*((u+t+3)*(v+t+2)*(u+t+2).choose (t+2)*(v+t+1).choose (t+1)) ≤
      4*(u+t+3)*(v+t+2)*((2*u+v+2*t+5).choose (t+3)*(u+2*v+2*t+3).choose t) := by
     convert hI using 1 <;> ring
   rw [hR] at hI'
   have hh := le_trans hI' hP'
   have hh2 := le_trans (show 2*(t+1)*(t+5)*((t+4)*(u+t+3).choose (t+3)*(v+t+2).choose (t+2)) ≤
     8*(t+4)*((t+3)*(t+2)*(u+t+3).choose (t+3)*(v+t+2).choose (t+2)) by
       convert hS using 1 <;> ring) hh
   convert hh2 using 1 <;> first | ring | congr 2 <;> omega

end MathGKM.Markov
