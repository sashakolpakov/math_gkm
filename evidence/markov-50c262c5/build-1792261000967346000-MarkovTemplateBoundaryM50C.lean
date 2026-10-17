import MarkovMiddleModelM50C
/-! Machine-authored 50c262c5. Formal leading coefficients of the auxiliary
template, including zero coefficients beyond its degree. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
attribute [local irreducible] topTemplateMB3E topDiagonalDeltaMB3E

theorem top_delta_boundaryM50C (n t : ℕ) (ht : t ≤ n+2) :
 (∀ i, t < i → (topDiagonalDeltaMB3E n t).coeff i=0) ∧
 (topDiagonalDeltaMB3E n t).coeff t=((n+2).choose t:ℤ) := by
 constructor
 · intro i hi
   rw [top_delta_coeffMB3E]
   have hi0 : i≠0 := by omega
   simp [fibDeltaME9C,fibRawM9E2,hi0,
     show ¬ i+(n+2-t) ≤ n+2 by omega,
     show ¬ i+(n+2-t) ≤ n+1 by omega,
     show ¬ i+(n+2-t) ≤ n by omega]
 · rcases t with _|_|_|t
   · simp [top_delta_zeroMB3E]
   · rw [top_delta_oneMB3E]; simp [coeff_C_mul]
   · rw [top_delta_twoMB3E]; simp [coeff_C_mul,coeff_one]
   · rw [show t+1+1+1=t+3 by omega,top_delta_highMB3E n (t+3) t (by omega)]
     simp only [if_pos (by omega : 3 ≤ t+3),Nat.add_sub_cancel,Nat.choose_self,Nat.cast_one,one_mul]
     rw [show n+5-(t+3)+t=n+2 by omega]

theorem top_template_boundaryM50C (n t : ℕ) (ht : t ≤ n+2) :
 (∀ i, t < i → (topTemplateMB3E n t).coeff i=0) ∧
 (topTemplateMB3E n t).coeff t=((n+2).choose t:ℤ) := by
 induction t using Nat.twoStepInduction with
 | zero => simp (disch := omega) [topTemplateMB3E,coeff_one]
 | one =>
   constructor
   · intro i hi
     simp [topTemplateMB3E,←C_ofNat,(top_delta_boundaryM50C n 1 (by omega)).1 i hi,
       show i≠0 by omega]
   · simp [topTemplateMB3E,(top_delta_boundaryM50C n 1 (by omega)).2]
 | more t h0 h1 =>
   have h0 := h0 (by omega)
   have h1 := h1 (by omega)
   have d0 := top_delta_boundaryM50C n t (by omega)
   have d1 := top_delta_boundaryM50C n (t+1) (by omega)
   have d2 := top_delta_boundaryM50C n (t+2) ht
   have he : topTemplateMB3E n (t+2)=topDiagonalDeltaMB3E n (t+2)+
       2*X*topDiagonalDeltaMB3E n (t+1)+2*topDiagonalDeltaMB3E n (t+1)+
       X^2*topDiagonalDeltaMB3E n t+2*X*topDiagonalDeltaMB3E n t+topDiagonalDeltaMB3E n t-
       2*X*topTemplateMB3E n (t+1)+2*topTemplateMB3E n (t+1)-
       X^2*topTemplateMB3E n t-2*X*topTemplateMB3E n t-topTemplateMB3E n t := by
     rw [topTemplateMB3E]; ring
   have hx (p : Polynomial ℤ) (m : ℕ) : (X*p).coeff m=if 1 ≤ m then p.coeff (m-1) else 0 := by
     simpa using coeff_X_pow_mul' p 1 m
   rw [he]
   constructor
   · intro i hi
     simp only [coeff_sub,coeff_add,show 2*X=(2:Polynomial ℤ)*X by rfl,
       mul_assoc,coeff_ofNat_mul,hx,coeff_X_pow_mul']
     simp (disch := omega) only [if_pos,h0.1,h1.1,d0.1,d1.1,d2.1]
     ring
   · simp only [coeff_sub,coeff_add,mul_assoc,coeff_ofNat_mul,hx,coeff_X_pow_mul']
     simp (disch := omega) only [if_pos,h0.1,h1.1,d0.1,d1.1,d2.2,
       show t+2-1=t+1 by omega,show t+2-2=t by omega,h0.2,h1.2,d0.2,d1.2]
     ring

end
end MathGKM.Markov
