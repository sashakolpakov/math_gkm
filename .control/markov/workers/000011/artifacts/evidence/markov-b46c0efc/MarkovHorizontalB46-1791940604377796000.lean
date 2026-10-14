import MarkovRowJetB46
import MathGKM.MarkovBoundary
import Mathlib.Algebra.Polynomial.Bivariate

/-! Machine-authored worker b46c0efc. Exact source/raw horizontal coefficient
bridge, retaining zero coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem swap_coeff46 (P : BiPoly) (i j : ℕ) :
    ((Bivariate.swap P).coeff j).coeff i = coeff P i j := by
  induction P using Polynomial.induction_on' with
  | add p q hp hq => simp [map_add,Polynomial.coeff_add,coeff,hp,hq] at *; omega
  | monomial n p =>
    induction p using Polynomial.induction_on' with
    | add p q hp hq =>
      simp [Polynomial.monomial_add,map_add,Polynomial.coeff_add,coeff] at *
      omega
    | monomial m z =>
      simp only [Bivariate.swap_monomial_monomial,coeff,Polynomial.coeff_monomial]
      split_ifs <;> simp_all

theorem hrow_matrix_step46 (M : Mat16 BiPoly) (r : Bool) :
    hrowStep46 (X : Polynomial ℤ) (Bivariate.swap M.a,Bivariate.swap M.b) r =
      let N := mm16 M (if r then rawB18 else rawA18)
      (Bivariate.swap N.a,Bivariate.swap N.b) := by
  cases r <;>
    simp [hrowStep46,mm16,rawA18,rawB18,S,U,V,map_add,map_mul,
      Bivariate.swap_X,Bivariate.swap_Y] <;> constructor <;> ring

theorem hrow_fold_matrix46 (w : List Bool) (M : Mat16 BiPoly) :
    w.foldl (hrowStep46 (X : Polynomial ℤ)) (Bivariate.swap M.a,Bivariate.swap M.b)=
      let N := mm16 M (rawWord80 w)
      (Bivariate.swap N.a,Bivariate.swap N.b) := by
  induction w generalizing M with
  | nil => simp [rawWord80,mm_one_right774]
  | cons r rs ih =>
    simp only [List.foldl_cons,hrow_matrix_step46,rawWord80]
    rw [ih,mm_assoc16]

theorem hword_raw46 (w : List Bool) :
    Bivariate.swap (rawWord80 (false::(w++[true]))).b =
      hword46 (X : Polynomial ℤ) w := by
  have hr := hrow_fold_matrix46 w rawA18
  simp only [rawA18,V,Bivariate.swap_X,map_one] at hr
  rw [hword46,hr]
  simp only [rawWord80,if_false,rawWord_append80,if_true,mm_one_right774]
  rw [← mm_assoc16]
  simp [mm16,rawB18,S,U,V,map_add,map_mul,Bivariate.swap_X,Bivariate.swap_Y]
  ring

theorem source_hword46 (path : List Bool) :
    ∃ w : List Bool, w.length+2=(frame path).mid.b ∧
      w.count true+1=(frame path).mid.a ∧
      Bivariate.swap (frame path).mid.p=hword46 (X : Polynomial ℤ) w := by
  let xy := path.foldl wordPairStep774 ([false],[true])
  have hv := wordPair_fold_valid774 path initial ([false],[true])
    indices_initial wordPair_initial774
  change WordPairValid774 (frame path) xy at hv
  obtain ⟨lb,hb,la,ha,⟨l,hl⟩,⟨z,hz⟩⟩ := hv
  refine ⟨l++z,?_,?_,?_⟩
  · have h := (indices_frame path).2.1
    simp [hl,hz] at lb hb
    simp only [List.length_append]
    omega
  · have h := (indices_frame path).1
    simp [hl,hz] at la ha
    simp only [List.count_append]
    omega
  · rw [raw_matrix18]
    have he := rawWord_pairs80 path ([false],[true])
    simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at he
    change (rawWord80 xy.1,rawWord80 xy.2)=_ at he
    rw [← he]
    change Bivariate.swap (mm16 (rawWord80 xy.1) (rawWord80 xy.2)).b=_
    rw [← rawWord_append80,hl,hz]
    simpa [List.append_assoc] using hword_raw46 (l++z)

#print axioms swap_coeff46
#print axioms source_hword46
end
end MathGKM.Markov
