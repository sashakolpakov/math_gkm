import MathGKM.Round64ProjectionA
import MathGKM.Accepted2bd00ea2e90442d087663abe

/- Machine-authored round64. Conditional transport only. The projected sign
premises are explicit and are not supplied by any finite experiment. -/
namespace MatchingConsumerR64
set_option maxSynthPendingDepth 5
open MatchingProjectionR64 MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem swap_coeff {R : Type*} [CommRing R]
    (P : Polynomial (Polynomial R)) (i j : ℕ) :
    ((Polynomial.Bivariate.swap P).coeff i).coeff j = (P.coeff j).coeff i := by
  induction P using Polynomial.induction_on' with
  | add P Q ihP ihQ => simpa only [map_add,Polynomial.coeff_add,ihP,ihQ]
  | monomial n a =>
    induction a using Polynomial.induction_on' with
    | add a b iha ihb =>
      simpa only [map_add,Polynomial.coeff_add,iha,ihb]
    | monomial m c =>
      rw [Polynomial.Bivariate.swap_monomial_monomial]
      simp only [Polynomial.coeff_monomial]
      split_ifs <;> simp_all [Polynomial.coeff_monomial]

theorem actual_zero (n : ℕ) (hn : 1≤n) :
    specialize (F (2*n) 0)=(frame (List.replicate (n-1) true)).mid.p := by
  rw [unit_matching]
  simpa only [Nat.add_zero] using Accepted2bd00ea2e90442d087663abe.obligation.2 n hn

theorem unit_orientation (N : ℕ) :
    specialize (F N 1) =
      Polynomial.Bivariate.swap (specialize (F N 0)) := by
  rw [unit_matching,unit_matching]
  symm
  change Polynomial.Bivariate.swap.toRingHom
    (FiniteMatchingR61.finiteSum (U+V)
      (fun e => if (e+0)%2=0 then U else V) N) = _
  rw [finiteSum_map]
  congr 1
  · simp [U,V,add_comm,Polynomial.Bivariate.swap_X,Polynomial.Bivariate.swap_Y]
  · funext e
    have hp : e%2=0 ∨ e%2=1 := by omega
    rcases hp with h|h
    · have h1 : (e+1)%2=1 := by omega
      simp [h,h1,U,V,Polynomial.Bivariate.swap_X,Polynomial.Bivariate.swap_Y]
    · have h1 : (e+1)%2=0 := by omega
      simp [h,h1,U,V,Polynomial.Bivariate.swap_X,Polynomial.Bivariate.swap_Y]

theorem actual_coefficients (n : ℕ) (hn : 1≤n) (i j : ℕ) :
    unit (B (2*n) 0 i j)=coeff (frame (List.replicate (n-1) true)).mid.p i j ∧
    unit (B (2*n) 1 j i)=coeff (frame (List.replicate (n-1) true)).mid.p i j := by
  constructor
  · rw [B,← unit_coefficient,actual_zero n hn]
    rfl
  · rw [B,← unit_coefficient,unit_orientation,actual_zero n hn,swap_coeff]
    rfl

theorem eval_one_nonnegative (P : Polynomial ℤ) (h : ∀ i, 0≤P.coeff i) :
    0≤P.eval 1 := by
  rw [Polynomial.eval_eq_sum,Polynomial.sum_def]
  exact Finset.sum_nonneg (fun i _ => mul_nonneg (h i) (by positivity))

theorem unit_nonnegative (P : Color) (h : ∀ a b, 0≤(P.coeff a).coeff b) :
    0≤unit P := by
  change 0 ≤ (P.map (Polynomial.evalRingHom (1 : ℤ))).eval 1
  apply eval_one_nonnegative
  intro a
  simp only [Polynomial.coeff_map]
  exact eval_one_nonnegative (P.coeff a) (h a)

theorem unit_defect (N sigma i j : ℕ)
    (h : ∀ a b, 0≤((defect N sigma i j).coeff a).coeff b) :
    unit (B N sigma i j)*unit (B N sigma (i+2) j) ≤ unit (B N sigma (i+1) j)^2 := by
  have hp := unit_nonnegative (defect N sigma i j) h
  simpa only [defect,map_sub,map_pow,map_mul,sub_nonneg] using hp

theorem original_horizontal_vertical (n : ℕ) (hn : 1≤n)
    (hH : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a (frame (List.replicate (n-1) true)).mid.b (i+1) j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a (frame (List.replicate (n-1) true)).mid.b (i+2) j →
      ∀ a b, 0≤((defect (2*n) 0 i j).coeff a).coeff b)
    (hV : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a (frame (List.replicate (n-1) true)).mid.b i (j+1) →
      InPolygon (frame (List.replicate (n-1) true)).mid.a (frame (List.replicate (n-1) true)).mid.b i (j+2) →
      ∀ a b, 0≤((defect (2*n) 1 j i).coeff a).coeff b) :
    let E := (frame (List.replicate (n-1) true)).mid
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b (i+1) j →
      InPolygon E.a E.b (i+2) j → coeff E.p i j*coeff E.p (i+2) j≤coeff E.p (i+1) j^2) ∧
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b i (j+1) →
      InPolygon E.a E.b i (j+2) → coeff E.p i j*coeff E.p i (j+2)≤coeff E.p i (j+1)^2) := by
  dsimp only
  constructor
  · intro i j hp0 hp1 hp2
    have h := unit_defect (2*n) 0 i j (hH i j hp0 hp1 hp2)
    simpa only [(actual_coefficients n hn i j).1,
      (actual_coefficients n hn (i+1) j).1,(actual_coefficients n hn (i+2) j).1] using h
  · intro i j hp0 hp1 hp2
    have h := unit_defect (2*n) 1 j i (hV i j hp0 hp1 hp2)
    simpa only [(actual_coefficients n hn i j).2,
      (actual_coefficients n hn i (j+1)).2,(actual_coefficients n hn i (j+2)).2] using h

end
end MatchingConsumerR64
