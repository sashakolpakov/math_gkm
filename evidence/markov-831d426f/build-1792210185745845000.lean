import MarkovFibCoeffM831
/-! Machine-authored 831d426f. Positive binomial form of the boundary
candidate. Equality with the actual source factor remains explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def boundaryBinomialM831 (k m : ℕ) (r : Bool) : ℤ :=
 2*((2*m+2).choose (m+1):ℤ)*
  ((if r then 2 else 1)*((k+m+3).choose (2*m+3):ℤ)+
   (if r then 1 else 2)*((k+m+2).choose (2*m+3):ℤ))

theorem boundary_binomial_nonnegM831 (k m : ℕ) (r : Bool) :
 0 ≤ boundaryBinomialM831 k m r := by
 cases r <;> simp only [boundaryBinomialM831,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem boundary_binomial_tailM831 (k m : ℕ) (r : Bool) (hm : k < m) :
 boundaryBinomialM831 k m r=0 := by
 simp [boundaryBinomialM831,Nat.choose_eq_zero_of_lt (by omega : k+m+3 < 2*m+3),
   Nat.choose_eq_zero_of_lt (by omega : k+m+2 < 2*m+3)]

theorem boundary_binomial_clearedM831 (k m : ℕ) (r : Bool) (hm : m ≤ k) :
 (2*(m:ℤ)+3)*boundaryBinomialM831 k m r=
 2*(if r then 3*(k:ℤ)+m+6 else 3*(k:ℤ)+3-m)*
   ((k+m+2).choose (2*m+2):ℤ)*((2*m+2).choose (m+1):ℤ) := by
 have h1 := Nat.add_one_mul_choose_eq (k+m+2) (2*m+2)
 have h2 := Nat.choose_succ_right_eq (k+m+2) (2*m+2)
 have h1z : ((k:ℤ)+m+3)*((k+m+2).choose (2*m+2):ℤ)=
     ((k+m+3).choose (2*m+3):ℤ)*(2*(m:ℤ)+3) := by
   exact_mod_cast h1
 have h2z : ((k+m+2).choose (2*m+3):ℤ)*(2*(m:ℤ)+3)=
     ((k+m+2).choose (2*m+2):ℤ)*((k:ℤ)-m) := by
   have hh : k+m+2-(2*m+2)=k-m := by omega
   rw [hh] at h2
   exact_mod_cast h2
 cases r <;> simp only [boundaryBinomialM831,Bool.false_eq_true,if_false,if_true]
 · linear_combination 2*((2*m+2).choose (m+1):ℤ)*(-h1z+2*h2z)
 · linear_combination 2*((2*m+2).choose (m+1):ℤ)*(-2*h1z+h2z)

def BandBoundaryPositiveFormulaM831 : Prop :=
 ∀ k m r, (bandAtM139 0 k r).coeff m=boundaryBinomialM831 k m r

theorem boundary_formula_iff_positiveM831 :
 BandBoundaryFormulaM139 ↔ BandBoundaryPositiveFormulaM831 := by
 constructor
 · intro h k m r
   by_cases hm : m ≤ k
   · have h0 := h k m r hm
     have h1 := boundary_binomial_clearedM831 k m r hm
     have hz : (2*(m:ℤ)+3)≠0 := by omega
     exact mul_left_cancel₀ hz (h0.trans h1.symm)
   · rw [boundary_binomial_tailM831 k m r (by omega)]
     exact band_Q_tailM139 _ k m r (by omega)
 · intro h k m r hm
   rw [h]
   exact boundary_binomial_clearedM831 k m r hm

theorem band_nonnegative_of_positive_formulaM831 (h : BandBoundaryPositiveFormulaM831) :
 ∀ d k i r, 0 ≤ (bandAtM139 d k r).coeff i := by
 apply band_nonnegative_iff_boundaryM139.mpr
 intro k i r
 rw [h]
 exact boundary_binomial_nonnegM831 k i r

end
end MathGKM.Markov
