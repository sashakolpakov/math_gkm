import MathGKM.Accepted7e6fb328ed271fc7880fec83
import MathGKM.Accepted0beeba7c6244e2295e3e804c
/- Machine-authored round85; retained witness only. -/
namespace ObstructionR85
open Polynomial MatchingProjectionR64 AlphaZeroR82
noncomputable section
set_option maxHeartbeats 2000000
def H : Polynomial ℤ := FullFiberRankR80.rankPoly 10 1 5 4 0 6
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
theorem expanded : ((u+v)^2+z*v)^5 =
  term 1 0 10 0 +
  term 10 1 9 0 +
  term 45 2 8 0 +
  term 120 3 7 0 +
  term 210 4 6 0 +
  term 252 5 5 0 +
  term 210 6 4 0 +
  term 120 7 3 0 +
  term 45 8 2 0 +
  term 10 9 1 0 +
  term 1 10 0 0 +
  term 5 0 9 1 +
  term 40 1 8 1 +
  term 140 2 7 1 +
  term 280 3 6 1 +
  term 350 4 5 1 +
  term 280 5 4 1 +
  term 140 6 3 1 +
  term 40 7 2 1 +
  term 5 8 1 1 +
  term 10 0 8 2 +
  term 60 1 7 2 +
  term 150 2 6 2 +
  term 200 3 5 2 +
  term 150 4 4 2 +
  term 60 5 3 2 +
  term 10 6 2 2 +
  term 10 0 7 3 +
  term 40 1 6 3 +
  term 60 2 5 3 +
  term 40 3 4 3 +
  term 10 4 3 3 +
  term 5 0 6 4 +
  term 10 1 5 4 +
  term 5 2 4 4 +
  term 1 0 5 5 := by
  simp only [term_eq]
  ring
theorem Bdrop (r : ℕ) :
    (B 10 1 r 5).coeff 0 = (((G 10).coeff r).coeff 5) := by
  simp [G,dropAlpha,B,Polynomial.coeff_map,← Polynomial.coeff_zero_eq_eval_zero]
theorem rows :
    (B 10 1 0 5).coeff 0=X^5 ∧
    (B 10 1 1 5).coeff 0=10*X^4 ∧
    (B 10 1 2 5).coeff 0=60*X^3 ∧
    (B 10 1 3 5).coeff 0=200*X^2 ∧
    (B 10 1 4 5).coeff 0=350*X := by
  have h10 : G 10=((u+v)^2+z*v)^5 :=
    Accepted7e6fb328ed271fc7880fec83.obligation 5
  simp only [Bdrop,h10,expanded,coeff_add,term_coeff]
  norm_num
def value (r : ℕ) : ℤ :=
  if r=0 then 350 else if r=1 then 2000 else if r=2 then 3600 else
  if r=3 then 2000 else if r=4 then 350 else 0
theorem coeffs (r : ℕ) : H.coeff r = value r := by
  by_cases hr : r≤4
  · have h := (Accepted0beeba7c6244e2295e3e804c.obligation.1 10 1 5 4 0 6 r).2 hr
    change H.coeff r = _ at h
    rw [h,Polynomial.mul_coeff_zero]
    have p0 : (X^5 : Polynomial ℤ)*(350*X)=350*X^6 := by ring
    have p1 : (10*X^4 : Polynomial ℤ)*(200*X^2)=2000*X^6 := by ring
    have p2 : (60*X^3 : Polynomial ℤ)*(60*X^3)=3600*X^6 := by ring
    have p3 : (200*X^2 : Polynomial ℤ)*(10*X^4)=2000*X^6 := by ring
    have p4 : (350*X : Polynomial ℤ)*X^5=350*X^6 := by ring
    interval_cases r <;>
      norm_num [value,rows.1,rows.2.1,rows.2.2.1,rows.2.2.2.1,rows.2.2.2.2,p0,p1,p2,p3,p4]
  · have h := FullFiberRankR80.card_above 10 1 5 4 0 6 r (by omega)
    have h0 : r≠0 := by omega
    have h1 : r≠1 := by omega
    have h2 : r≠2 := by omega
    have h3 : r≠3 := by omega
    have h4 : r≠4 := by omega
    simp [H,FullFiberRankR80.rank_coeff,h,value,h0,h1,h2,h3,h4]
theorem identity : H=350+2000*X+3600*X^2+2000*X^3+350*X^4 := by
  ext r
  rw [coeffs]
  change value r = (C 350+C 2000*X+C 3600*X^2+C 2000*X^3+C 350*X^4 : Polynomial ℤ).coeff r
  by_cases hr : r≤4
  · interval_cases r <;> norm_num [value,coeff_X]
  · have h0 : r≠0 := by omega
    have h1 : r≠1 := by omega
    have h2 : r≠2 := by omega
    have h3 : r≠3 := by omega
    have h4 : r≠4 := by omega
    have hc : (350 : Polynomial ℤ).coeff r=0 := by
      change (C (350:ℤ)).coeff r=0
      rw [coeff_C]
      simp [h0,Ne.symm h0]
    norm_num [hc,value,h0,h1,h2,h3,h4,Ne.symm h0,Ne.symm h1,Ne.symm h2,Ne.symm h3,Ne.symm h4,coeff_X_pow,coeff_X,coeff_C]
end
end ObstructionR85
#print axioms ObstructionR85.identity
