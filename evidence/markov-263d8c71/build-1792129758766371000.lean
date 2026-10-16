import MarkovTerminalWordFormulaM263
import MarkovSecondSmall8934
/-! Machine-authored 263d8c71. Exhaustive small cores, with all indices retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem terminal_small_formulaM263 (w : List Bool) (hn : w.length ≤ 2) :
 ∃ a A B E : ℕ, A*E ≤ B^2 ∧
   (terminalWordM263 (X : ℤ[X]) w).coeff 2=
   X^a*(C (A:ℤ)+C (B:ℤ)*X+C (E:ℤ)*X^2) := by
 rcases w with _ | ⟨e,w⟩
 · refine ⟨0,0,0,0,by norm_num,?_⟩
   simp [terminalWordM263,Polynomial.coeff_one,Polynomial.coeff_X]
 rcases w with _ | ⟨f,w⟩
 · cases e
   · refine ⟨0,1,0,0,by norm_num,?_⟩
     simp [terminalWordM263,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
       Polynomial.mul_coeff_zero,Polynomial.coeff_one,Polynomial.coeff_X] <;> ring
   · refine ⟨0,2,3,0,by norm_num,?_⟩
     simp [terminalWordM263,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
       Polynomial.mul_coeff_zero,Polynomial.coeff_one,Polynomial.coeff_X] <;> ring
 have hw : w=[] := by cases w <;> simp_all
 subst w
 cases e <;> cases f
 · refine ⟨0,1,3,0,by norm_num,?_⟩
   simp [terminalWordM263,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
     Polynomial.mul_coeff_zero,Polynomial.coeff_one,Polynomial.coeff_X] <;> ring
 · refine ⟨1,7,6,0,by norm_num,?_⟩
   simp [terminalWordM263,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
     Polynomial.mul_coeff_zero,Polynomial.coeff_one,Polynomial.coeff_X] <;> ring
 · refine ⟨0,2,7,6,by norm_num,?_⟩
   simp [terminalWordM263,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
     Polynomial.mul_coeff_zero,Polynomial.coeff_one,Polynomial.coeff_X] <;> ring
 · refine ⟨1,6,18,10,by norm_num,?_⟩
   simp [terminalWordM263,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
     Polynomial.mul_coeff_zero,Polynomial.coeff_one,Polynomial.coeff_X] <;> ring

theorem terminal_small_crossM263 (w : List Bool) (hn : w.length ≤ 2) :
 CrossLC (CoeffSeq (((terminalWordM263 (X : ℤ[X]) w).coeff 2).map (Int.castRingHom ℝ))) := by
 obtain ⟨a,A,B,E,hgap,he⟩ := terminal_small_formulaM263 w hn
 have hgap' : (A:ℝ)*E ≤ (B:ℝ)^2 := by exact_mod_cast hgap
 have h := crossLC_quad (A:=(A:ℝ)) (B:=(B:ℝ)) (C:=(E:ℝ))
   (by positivity) (by positivity) (by positivity) hgap'
 rw [←coeffSeq_quadratic] at h
 have hh := crossLC_X_pow_mul46 _ h a
 rw [he]
 simpa [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,Polynomial.map_add,
   Polynomial.map_C,Quadratic] using hh
end
end MathGKM.Markov
