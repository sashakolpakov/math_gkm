import MathGKM.Round89RankA

/- Machine-authored round90. Guarded adjacent binomial algebra. -/
namespace SparseRankR90
open Polynomial SparseRankR89 FullFiberRankR80
noncomputable section
set_option maxHeartbeats 1500000

theorem choose_two_step (m i : ℕ) (hi : i ≤ m) :
    (i+1 : ℤ)*(m+1-i : ℕ)*((m+2).choose (i+1) : ℤ)=
      (m+2 : ℤ)*(m+1 : ℤ)*(m.choose i : ℤ) := by
  have h0 : ((m+2).choose (i+1) : ℤ)*(i+1)=
      (m+2 : ℤ)*((m+1).choose i : ℤ) := by
    exact_mod_cast (Nat.add_one_mul_choose_eq (m+1) i).symm
  have h1 : ((m+1).choose i : ℤ)*(m+1-i : ℕ)=
      (m.choose i : ℤ)*(m+1 : ℤ) := by
    exact_mod_cast (Nat.choose_mul_succ_eq m i).symm
  calc
    _ = (m+1-i : ℕ)*(((m+2).choose (i+1) : ℤ)*(i+1)) := by ring
    _ = (m+2 : ℤ)*(((m+1).choose i : ℤ)*(m+1-i : ℕ)) := by rw [h0]; ring
    _ = _ := by rw [h1]; ring

theorem adjacent_product (d q m i : ℕ) (hq : 1 ≤ q) (hqd : q ≤ d)
    (hi : i ≤ m) :
    (d-q+1 : ℕ)*(i+1 : ℤ)*(m+1-i : ℕ)*
      ((d.choose (q-1) : ℤ)*((m+2).choose (i+1) : ℤ)) =
    (q : ℤ)*(m+2 : ℤ)*(m+1 : ℤ)*
      ((d.choose q : ℤ)*(m.choose i : ℤ)) := by
  have hb : (d.choose q : ℤ)*(q : ℤ)=
      (d.choose (q-1) : ℤ)*(d-q+1 : ℕ) := by
    have hh := Nat.choose_succ_right_eq d (q-1)
    have e0 : q-1+1=q := by omega
    have e1 : d-(q-1)=d-q+1 := by omega
    rw [e0,e1] at hh
    exact_mod_cast hh
  have hc := choose_two_step m i hi
  calc
    _ = ((d.choose (q-1) : ℤ)*(d-q+1 : ℕ))*
      ((i+1 : ℤ)*(m+1-i : ℕ)*((m+2).choose (i+1) : ℤ)) := by ring
    _ = _ := by rw [← hb,hc]; ring

theorem ratio_comparison (q x i : ℤ) (hq : 1 ≤ q) (hx : 0 ≤ x)
    (hi : 0 ≤ i) (him : i ≤ 2*x) :
    (2*(q-1)*(2*x+3))*((i+1)*(2*x-i+1)) ≤
      (2*q*(2*x+1))*((i+2)*(2*x-i+2)) := by
  have ha : 0 ≤ (i+1)*(2*x-i+1) := mul_nonneg (by omega) (by omega)
  have hb : 0 ≤ 2*x^2+2*(i-x)^2+4*x+1 := by positivity
  have hc := mul_nonneg (show 0 ≤ q by omega) hb
  have hd := mul_nonneg (show 0 ≤ 2*x+3 by omega) ha
  have he : (2*q*(2*x+1))*((i+2)*(2*x-i+2))-
      (2*(q-1)*(2*x+3))*((i+1)*(2*x-i+1)) =
      2*(q*(2*x^2+2*(i-x)^2+4*x+1)+(2*x+3)*((i+1)*(2*x-i+1))) := by ring
  linarith

theorem ratio_comparison_zero (q x i : ℤ) (hq : 1 ≤ q) (hx : 1 ≤ x)
    (hi : 0 ≤ i) (him : i ≤ 2*x) :
    (2*(q-1)*(x+2)*(2*x+3))*(x*(i+1)*(2*x-i+1)) ≤
      (2*q*(x+1)*(2*x+1))*((x+1)*(i+2)*(2*x-i+2)) := by
  have h := ratio_comparison q x i hq (by omega) hi him
  have h0 := mul_nonneg (sq_nonneg (x+1)) (sub_nonneg.mpr h)
  have h1 : 0 ≤ (2*(q-1)*(2*x+3))*((i+1)*(2*x-i+1)) := by
    apply mul_nonneg <;> apply mul_nonneg <;> omega
  have he : (2*q*(x+1)*(2*x+1))*((x+1)*(i+2)*(2*x-i+2))-
      (2*(q-1)*(x+2)*(2*x+3))*(x*(i+1)*(2*x-i+1)) =
      (x+1)^2*((2*q*(2*x+1))*((i+2)*(2*x-i+2))-
      (2*(q-1)*(2*x+3))*((i+1)*(2*x-i+1)))+
      (2*(q-1)*(2*x+3))*((i+1)*(2*x-i+1)) := by ring
  linarith

end
end SparseRankR90
#print axioms SparseRankR90.adjacent_product
