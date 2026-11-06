import MathGKM.Round82SpecializationA
import MathGKM.Accepted0beeba7c6244e2295e3e804c
/- Machine-authored round82. Explicit monomials avoid recursive product extraction. -/
namespace StoppedFiberR82
open Polynomial MatchingProjectionR64 AlphaZeroR82
noncomputable section
set_option maxHeartbeats 2000000
def H : Polynomial ℤ := FullFiberRankR80.rankPoly 8 1 4 2 0 6
def term (a : ℤ) (i j k : ℕ) : Three := C (C (C a * X^k) * X^j) * X^i
theorem term_eq (a : ℤ) (i j k : ℕ) :
    term a i j k = (a : Three)*u^i*v^j*z^k := by
  simp only [term,u,v,z,map_mul,map_pow]
  simp
  ring
theorem term_coeff (a : ℤ) (i j k r s : ℕ) :
    ((term a i j k).coeff r).coeff s =
      if r=i then (if s=j then C a*X^k else 0) else 0 := by
  unfold term
  rw [coeff_C_mul_X_pow]
  by_cases hr : r=i
  · simp only [if_pos hr,coeff_C_mul_X_pow]
  · simp only [if_neg hr,coeff_zero]
theorem expanded : ((u+v)^2+z*v)^4 =
  term 1 0 4 4 + term 4 0 5 3 + term 6 0 6 2 + term 4 0 7 1 + term 1 0 8 0 +
  term 8 1 4 3 + term 24 1 5 2 + term 24 1 6 1 + term 8 1 7 0 +
  term 4 2 3 3 + term 36 2 4 2 + term 60 2 5 1 + term 28 2 6 0 +
  term 24 3 3 2 + term 80 3 4 1 + term 56 3 5 0 +
  term 6 4 2 2 + term 60 4 3 1 + term 70 4 4 0 +
  term 24 5 2 1 + term 56 5 3 0 + term 4 6 1 1 + term 28 6 2 0 +
  term 8 7 1 0 + term 1 8 0 0 := by
  simp only [term_eq]
  ring
theorem Bdrop (r : ℕ) :
    (B 8 1 r 4).coeff 0 = (((G 8).coeff r).coeff 4) := by
  simp [G,dropAlpha,B,Polynomial.coeff_map,← Polynomial.coeff_zero_eq_eval_zero]
theorem rows :
    (B 8 1 0 4).coeff 0=X^4 ∧
    (B 8 1 1 4).coeff 0=8*X^3 ∧
    (B 8 1 2 4).coeff 0=36*X^2 := by
  have h8 : G 8=((u+v)^2+z*v)^4 := specialization 4
  simp only [Bdrop,h8,expanded,coeff_add,term_coeff]
  norm_num
theorem coeffs (r : ℕ) :
    H.coeff r = if r=0 then 36 else if r=1 then 64 else if r=2 then 36 else 0 := by
  by_cases hr : r≤2
  · have h := (Accepted0beeba7c6244e2295e3e804c.obligation.1 8 1 4 2 0 6 r).2 hr
    change H.coeff r = _ at h
    rw [h,Polynomial.mul_coeff_zero]
    have p0 : (X^4 : Polynomial ℤ)*(36*X^2)=36*X^6 := by ring
    have p1 : (8*X^3 : Polynomial ℤ)*(8*X^3)=64*X^6 := by ring
    have p2 : (36*X^2 : Polynomial ℤ)*X^4=36*X^6 := by ring
    interval_cases r <;>
      norm_num [rows.1,rows.2.1,rows.2.2,p0,p1,p2]
  · have h := FullFiberRankR80.card_above 8 1 4 2 0 6 r (by omega)
    have h0 : r≠0 := by omega
    have h1 : r≠1 := by omega
    have h2 : r≠2 := by omega
    simp [H,FullFiberRankR80.rank_coeff,h,h0,h1,h2]
theorem identity : H=36+64*X+36*X^2 := by
  ext r
  rw [coeffs]
  simp only [coeff_add]
  by_cases h0 : r=0
  · subst r; norm_num [coeff_X]
  by_cases h1 : r=1
  · subst r; norm_num [coeff_X]
  by_cases h2 : r=2
  · subst r; norm_num [coeff_X]
  have hc : (36:Polynomial ℤ).coeff r=0 := by
    change (C (36:ℤ)).coeff r=0
    rw [coeff_C]
    simp [h0,Ne.symm h0]
  norm_num [hc,h0,h1,h2,Ne.symm h0,Ne.symm h1,Ne.symm h2,coeff_X_pow,coeff_X]
end
end StoppedFiberR82
#print axioms StoppedFiberR82.identity
