import MarkovSecondJet8934
import MarkovHorizontalLCB46

/-! Machine-authored exact small-core cases; no source path bound is imposed
on the final use of these cases. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem second_small_formula8934 (w : List Bool) (hn : w.length ≤ 2) :
    ∃ a A B E : ℕ, A*E ≤ B^2 ∧
      (hword46 (X : Polynomial ℤ) w).coeff 2 =
        X^a*(C (A:ℤ)+C (B:ℤ)*X+C (E:ℤ)*X^2) := by
  rcases w with _ | ⟨e,w⟩
  · refine ⟨0,1,0,0,by norm_num,?_⟩
    simp [hword46,coeff_mul_two8934,Polynomial.coeff_one]
  rcases w with _ | ⟨f,w⟩
  · cases e
    · refine ⟨1,3,0,0,by norm_num,?_⟩
      simp [hword46,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
        Polynomial.mul_coeff_zero,Polynomial.coeff_one]; ring
    · refine ⟨1,4,6,0,by norm_num,?_⟩
      simp [hword46,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
        Polynomial.mul_coeff_zero,Polynomial.coeff_one]; ring
  have hw : w=[] := by cases w <;> simp_all
  subst w
  cases e <;> cases f
  · refine ⟨1,3,6,0,by norm_num,?_⟩
    simp [hword46,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
      Polynomial.mul_coeff_zero,Polynomial.coeff_one]; ring
  · refine ⟨1,2,12,10,by norm_num,?_⟩
    simp [hword46,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
      Polynomial.mul_coeff_zero,Polynomial.coeff_one]; ring
  · refine ⟨1,2,12,10,by norm_num,?_⟩
    simp [hword46,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
      Polynomial.mul_coeff_zero,Polynomial.coeff_one]; ring
  · refine ⟨2,8,26,15,by norm_num,?_⟩
    simp [hword46,hrowStep46,coeff_mul_two8934,coeff_mul_one46,
      Polynomial.mul_coeff_zero,Polynomial.coeff_one]; ring

theorem second_small_crossLC8934 (w : List Bool) (hn : w.length ≤ 2) :
    CrossLC (CoeffSeq (((hword46 (X : Polynomial ℤ) w).coeff 2).map
      (Int.castRingHom ℝ))) := by
  obtain ⟨a,A,B,E,hgap,he⟩ := second_small_formula8934 w hn
  have hgap' : (A:ℝ)*E ≤ (B:ℝ)^2 := by exact_mod_cast hgap
  have h := crossLC_quad (A:=(A:ℝ)) (B:=(B:ℝ)) (C:=(E:ℝ))
    (by positivity) (by positivity) (by positivity) hgap'
  rw [← coeffSeq_quadratic] at h
  have hh := crossLC_X_pow_mul46 _ h a
  rw [he]
  simpa [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,Polynomial.map_add,
    Polynomial.map_C,Quadratic] using hh

#print axioms second_small_crossLC8934
end
end MathGKM.Markov
