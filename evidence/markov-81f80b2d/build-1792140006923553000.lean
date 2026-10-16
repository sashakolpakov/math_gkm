import Mathlib
/-! Machine-authored 81f80b2d. Unbounded, zero-inclusive binomial coefficient bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def fallM81F (x : ℝ) (d : ℕ) : ℝ := (descPochhammer ℝ d).eval x

theorem falling_chooseM81F (k l d r : ℕ) (hr : r ≤ d) (hkr : r ≤ k)
 (hd : d ≤ k+l) :
 (k+l).descFactorial d * (k+l-d).choose (k-r) =
 (k+l).choose k * k.descFactorial r * l.descFactorial (d-r) := by
 by_cases hl : d-r ≤ l
 · have hleft := Nat.choose_mul_factorial_mul_factorial (show k-r ≤ k+l-d by omega)
   have hright := Nat.choose_mul_factorial_mul_factorial (show k ≤ k+l by omega)
   have hkf := Nat.factorial_mul_descFactorial hkr
   have hlf := Nat.factorial_mul_descFactorial hl
   have hdf := Nat.factorial_mul_descFactorial hd
   have he : k+l-d-(k-r)=l-(d-r) := by omega
   rw [he] at hleft
   rw [show k+l-k=l by omega] at hright
   apply Nat.mul_left_cancel (show 0 < (k-r).factorial*(l-(d-r)).factorial by positivity)
   calc
    _ = (k+l).descFactorial d *
      ((k+l-d).choose (k-r)*(k-r).factorial*(l-(d-r)).factorial) := by ring
    _ = (k+l-d).factorial*(k+l).descFactorial d := by rw [hleft]; ring
    _ = (k+l).factorial := hdf
    _ = (k+l).choose k * k.factorial * l.factorial := hright.symm
    _ = (k+l).choose k * ((k-r).factorial*k.descFactorial r) *
      ((l-(d-r)).factorial*l.descFactorial (d-r)) := by rw [hkf,hlf]
    _ = _ := by ring
 · rw [Nat.choose_eq_zero_of_lt (by omega),
     Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)]
   simp

theorem falling_monomialM81F (k l d r : ℕ) (hr : r ≤ d) (hd : d ≤ k+l) :
 fallM81F (k+l) d * (((1+(X:ℝ[X]))^(k+l-d)*X^r).coeff k) =
 ((k+l).choose k:ℝ)*fallM81F k r*fallM81F l (d-r) := by
 have hf (n m : ℕ) : fallM81F n m=(n.descFactorial m:ℝ) :=
   descPochhammer_eval_eq_descFactorial ℝ n m
 rw [show (k:ℝ)+l=((k+l:ℕ):ℝ) by push_cast; rfl,hf,hf,hf]
 rw [Polynomial.coeff_mul_X_pow']
 split_ifs with hk
 · rw [Polynomial.coeff_one_add_X_pow]
   exact_mod_cast falling_chooseM81F k l d r hr hk hd
 · rw [Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)]
   simp
end
end MathGKM.Markov
