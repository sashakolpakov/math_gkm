import MarkovCutDegree07a7
/-! Machine-authored 07a7e5b7. A positive three-state transfer for the
cut-count / term-degree / raw-coefficient refinement. No LC assumption. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def degreeEval07a7 {R : Type*} [CommRing R] (x y z p q : R) (d : ℕ) :
    List Bool → R
  | [] => q
  | r::rs =>
    degreeEval07a7 x y z (cutChargeA27 y p q r) q (if r then d+1 else 0) rs +
    x*z^(d+(if r then 1 else 0))*cutFactorA27 y r*(p+q)*
      degreeEval07a7 x y z y 1 1 rs

def degreeCoeff07a7 {R : Type*} [CommRing R] (y z p q : R) (d : ℕ) :
    List Bool → ℕ → R
  | [], 0 => q
  | [], _+1 => 0
  | r::rs, 0 =>
    degreeCoeff07a7 y z (cutChargeA27 y p q r) q (if r then d+1 else 0) rs 0
  | r::rs, s+1 =>
    degreeCoeff07a7 y z (cutChargeA27 y p q r) q (if r then d+1 else 0) rs (s+1) +
    z^(d+(if r then 1 else 0))*cutFactorA27 y r*(p+q)*
      degreeCoeff07a7 y z y 1 1 rs s

theorem degreeCoeff_masks07a7 {R : Type*} [CommRing R] (y z p q : R)
    (d : ℕ) (w : List Bool) (s : ℕ) :
    degreeCoeff07a7 y z p q d w s =
    ((cutMasksFe01 w s).map (fun m =>
      z^(maskDegree07a7 d m)*maskWeight340 y p q m)).sum := by
  induction w generalizing p q d s with
  | nil => cases s <;> simp [degreeCoeff07a7,cutMasksFe01,maskDegree07a7,maskWeight340]
  | cons r rs ih =>
    cases s with
    | zero =>
      simpa [degreeCoeff07a7,cutMasksFe01,List.map_map,Function.comp_def,
        maskDegree07a7,maskWeight340] using
        ih (cutChargeA27 y p q r) q (if r then d+1 else 0) 0
    | succ s =>
      simp only [degreeCoeff07a7,cutMasksFe01,List.map_append,List.sum_append,
        List.map_map,Function.comp_def,maskDegree07a7,maskWeight340,if_true,
        if_false,Bool.false_eq_true]
      rw [ih,ih]
      congr 1
      rw [←List.sum_map_mul_left]
      apply congrArg List.sum
      apply List.map_congr_left
      intro m hm
      rw [pow_add]
      ring

theorem degreeCoeff_forget07a7 {R : Type*} [CommRing R] (y p q : R)
    (d : ℕ) (w : List Bool) (s : ℕ) :
    degreeCoeff07a7 y 1 p q d w s=cutCoeffA27 y p q w s := by
  rw [degreeCoeff_masks07a7]
  simp only [one_pow,one_mul]
  exact cutMasks_sumFe01 y p q w s

theorem degreeEval_forget07a7 {R : Type*} [CommRing R] (x y p q : R)
    (d : ℕ) (w : List Bool) :
    degreeEval07a7 x y 1 p q d w=cutEvalA27 x y p q w := by
  induction w generalizing p q d with
  | nil => rfl
  | cons r rs ih => simp [degreeEval07a7,cutEvalA27,ih]

def degreeTransfer07a7 {R : Type*} [CommRing R] (x y z : R) :
    List Bool → R × R × R
  | [] => (1,0,0)
  | r::rs =>
    let (a,b,c) := degreeTransfer07a7 x y z rs
    if r then
      (a, x*z*(1+y)*a+(z*y+x*z^2*(1+y)^2)*b+x*z^2*(1+y)*c,
        z*(1+y)*b+z*c)
    else (a+b+c, x*(a+z*(1+y)*b+z*c), 0)

theorem degreeTransfer_exact07a7 {R : Type*} [CommRing R]
    (x y z p : R) (d : ℕ) (w : List Bool) :
    degreeEval07a7 x y z p 1 d w =
    let (a,b,c) := degreeTransfer07a7 x y z w
    a+b*z^d*(p+1)+c*z^d := by
  induction w generalizing p d with
  | nil => simp [degreeEval07a7,degreeTransfer07a7]
  | cons r rs ih =>
    obtain ⟨a,b,c⟩ := degreeTransfer07a7 x y z rs
    cases r <;>
      simp only [degreeEval07a7,degreeTransfer07a7,cutChargeA27,cutFactorA27,
        if_true,if_false,Bool.false_eq_true,ih,pow_succ,pow_one,pow_zero,
        Nat.add_zero] <;> ring

theorem degreeTransfer_nonneg07a7 (x y z : ℝ) (hx : 0≤x) (hy : 0≤y) (hz : 0≤z)
    (w : List Bool) :
    let (a,b,c) := degreeTransfer07a7 x y z w
    0≤a ∧ 0≤b ∧ 0≤c := by
  induction w with
  | nil => norm_num [degreeTransfer07a7]
  | cons r rs ih =>
    obtain ⟨a,b,c⟩ := degreeTransfer07a7 x y z rs
    dsimp only at ih
    obtain ⟨ha,hb,hc⟩ := ih
    cases r <;> simp only [degreeTransfer07a7,if_true,if_false,Bool.false_eq_true]
    all_goals refine ⟨?_,?_,?_⟩ <;> positivity

#print axioms degreeCoeff_masks07a7
#print axioms degreeCoeff_forget07a7
#print axioms degreeTransfer_exact07a7
#print axioms degreeTransfer_nonneg07a7
end
end MathGKM.Markov
