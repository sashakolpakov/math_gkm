import MarkovUpperReductionMA45
/-! Machine-authored beca0ad5. Exact falling-factorial representation of the
remaining upper interval. Every denominator used in transport is positive. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def reverseKernelMBEC (j s r : ℕ) : ℝ :=
 qWeightM7E2 r*(j.descFactorial r:ℝ)/((s+j+3).descFactorial r:ℝ)

def reverseConvMBEC (j s t h : ℕ) : ℝ :=
 ∑ r ∈ range (h+1), reverseKernelMBEC j s r*reverseKernelMBEC j t (h-r)

theorem choose_desc_ratioMBEC (N j r : ℕ) (hj : j≤N) (hr : r≤j) :
 ((N-r).choose (j-r):ℝ)=
 (j.descFactorial r:ℝ)/(N.descFactorial r:ℝ)*(N.choose j:ℝ) := by
 have h := Nat.choose_mul (n:=N) hr
 have hp : (0:ℝ)<N.descFactorial r := by exact_mod_cast Nat.descFactorial_pos.mpr (hr.trans hj)
 have he : (N.descFactorial r:ℝ)*((N-r).choose (j-r):ℝ)=
   (j.descFactorial r:ℝ)*(N.choose j:ℝ) := by
   rw [Nat.descFactorial_eq_factorial_mul_choose,Nat.descFactorial_eq_factorial_mul_choose]
   push_cast
   have hh : (N.choose j:ℝ)*(j.choose r:ℝ)=(N.choose r:ℝ)*((N-r).choose (j-r):ℝ) := by exact_mod_cast h
   nlinarith only [congrArg (fun x : ℝ => (r.factorial:ℝ)*x) hh]
 apply (mul_right_injective₀ (ne_of_gt hp))
 field_simp
 nlinarith only [he]

theorem reverse_coeffMBEC (j s r : ℕ) (hr : r≤j) :
 (qPolyM7E2 j s).coeff (j-r)=((s+j+3).choose j:ℝ)*reverseKernelMBEC j s r := by
 rw [q_poly_coeffM7E2,qCoeffM7E2,qBinM7E2]
 have he : (j:ℤ)-(j-r:ℕ)=(r:ℤ) := by omega
 rw [he,show s+(j-r)+3=s+j+3-r by omega,
   choose_desc_ratioMBEC (s+j+3) j r (by omega) hr]
 unfold reverseKernelMBEC
 ring

theorem reverse_product_coeffMBEC (j s t h : ℕ) (hh : h≤j) :
 (qPolyM7E2 j s*qPolyM7E2 j t).coeff (2*j-h)=
 ((s+j+3).choose j:ℝ)*((t+j+3).choose j:ℝ)*reverseConvMBEC j s t h := by
 have he := congrArg (fun P : ℝ[X] => P.coeff h)
   (reflect_mul (qPolyM7E2 j s) (qPolyM7E2 j t)
     (q_poly_degreeM7E2 _ _) (q_poly_degreeM7E2 _ _))
 rw [coeff_reflect,revAt_le (by omega : h≤j+j)] at he
 conv_rhs at he => rw [Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 rw [show j+j-h=2*j-h by omega] at he
 rw [he]
 unfold reverseConvMBEC
 rw [Finset.mul_sum]
 apply Finset.sum_congr rfl
 intro r hr
 have hr' : r≤h := by simpa using hr
 rw [coeff_reflect,coeff_reflect,revAt_le (hr'.trans hh),revAt_le (by omega : h-r≤j),
   reverse_coeffMBEC j s r (hr'.trans hh),reverse_coeffMBEC j t (h-r) (by omega)]
 ring

theorem reverse_adjacent_iffMBEC (j s h : ℕ) (hh0 : 1≤h) (hh : h≤j) :
 ((qPolyM7E2 j (s+1)^2).coeff (2*j-h)*
   (qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff (2*j-h+1) ≤
 (qPolyM7E2 j (s+1)^2).coeff (2*j-h+1)*
   (qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff (2*j-h)) ↔
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1) ≤
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h := by
 rw [show 2*j-h+1=2*j-(h-1) by omega,pow_two,
   reverse_product_coeffMBEC j (s+1) (s+1) h hh,
   reverse_product_coeffMBEC j s (s+2) (h-1) (by omega),
   reverse_product_coeffMBEC j (s+1) (s+1) (h-1) (by omega),
   reverse_product_coeffMBEC j s (s+2) h hh]
 have hp (t : ℕ) : (0:ℝ)<(t+j+3).choose j := by exact_mod_cast Nat.choose_pos (by omega : j≤t+j+3)
 have hscale : 0<((s+j+3).choose j:ℝ)*((s+1+j+3).choose j:ℝ)^2*((s+2+j+3).choose j:ℝ) :=
   mul_pos (mul_pos (hp s) (sq_pos_of_pos (hp (s+1)))) (hp (s+2))
 convert mul_le_mul_iff_of_pos_left hscale using 2 <;> ring

def ReverseUpperMBEC : Prop := ∀ j s h : ℕ, 2≤h → h≤j →
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1) ≤
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h

theorem reverse_upper_iffMBEC : ReverseUpperMBEC ↔ UpperAdjacentMA45 := by
 constructor
 · intro H j s n hj hn
   have hh : 2≤2*j-n ∧ 2*j-n≤j := by omega
   have he := (reverse_adjacent_iffMBEC j s (2*j-n) (by omega) hh.2).mpr (H j s _ hh.1 hh.2)
   simpa only [show 2*j-(2*j-n)=n by omega] using he
 · intro H j s h hh0 hh
   apply (reverse_adjacent_iffMBEC j s h (by omega) hh).mp
   exact H j s (2*j-h) (by omega) (by omega)

end
end MathGKM.Markov
