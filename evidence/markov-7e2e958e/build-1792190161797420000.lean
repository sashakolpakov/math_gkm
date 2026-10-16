import MarkovQKernelM7E2
/-! Machine-authored 7e2e958e. An auxiliary obstruction: coefficientwise
parameter LC and CrossLC of each polynomial do not suffice to justify the
varying truncation. These three polynomials are not asserted to be sources. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def truncE0M7E2 : Polynomial ℝ := Quadratic 1 1 1
def truncE1M7E2 : Polynomial ℝ := Quadratic 3 2 1
def truncE2M7E2 : Polynomial ℝ := Quadratic 5 3 1

theorem trunc_each_crossM7E2 :
 CrossLC (CoeffSeq truncE0M7E2) ∧ CrossLC (CoeffSeq truncE1M7E2) ∧
 CrossLC (CoeffSeq truncE2M7E2) := by
 simp only [truncE0M7E2,truncE1M7E2,truncE2M7E2,coeffSeq_quadratic]
 exact ⟨crossLC_quad (by norm_num) (by norm_num) (by norm_num) (by norm_num),
   crossLC_quad (by norm_num) (by norm_num) (by norm_num) (by norm_num),
   crossLC_quad (by norm_num) (by norm_num) (by norm_num) (by norm_num)⟩

theorem trunc_full_gapM7E2 :
 truncE1M7E2^2-truncE0M7E2*truncE2M7E2=Quadratic 4 4 1 := by
 unfold truncE0M7E2 truncE1M7E2 truncE2M7E2 Quadratic
 norm_num only [map_one,map_ofNat]
 ring

theorem trunc_full_gap_nonnegM7E2 (k : ℕ) :
 0 ≤ (truncE1M7E2^2-truncE0M7E2*truncE2M7E2).coeff k := by
 rw [trunc_full_gapM7E2]
 unfold Quadratic
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_C,
   Polynomial.coeff_X,Polynomial.coeff_X_pow]
 positivity

/-- Shift by t-2 and discard negative powers, for t=0,1,2 respectively. -/
def truncA0M7E2 : Polynomial ℝ := 1
def truncA1M7E2 : Polynomial ℝ := 2+X
def truncA2M7E2 : Polynomial ℝ := 5+3*X+X^2

theorem trunc_actual_cutM7E2 :
 truncE0M7E2=1+X+X^2*truncA0M7E2 ∧
 truncE1M7E2=3+X*truncA1M7E2 ∧ truncE2M7E2=truncA2M7E2 := by
 unfold truncE0M7E2 truncE1M7E2 truncE2M7E2 truncA0M7E2 truncA1M7E2 truncA2M7E2 Quadratic
 norm_num only [map_one,map_ofNat]
 constructor
 · ring
 constructor <;> ring

theorem trunc_cut_gapM7E2 :
 truncA1M7E2^2-truncA0M7E2*truncA2M7E2=X-1 := by
 unfold truncA0M7E2 truncA1M7E2 truncA2M7E2
 ring

theorem trunc_cut_failureM7E2 :
 (truncA1M7E2^2-truncA0M7E2*truncA2M7E2).coeff 0<0 := by
 rw [trunc_cut_gapM7E2]
 norm_num

end
end MathGKM.Markov
