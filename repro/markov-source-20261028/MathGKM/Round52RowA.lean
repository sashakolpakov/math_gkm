import MathGKM.Round52PolynomialA

/-! Machine-authored round52. Exact raw integer row; factor applicability
remains an explicit premise, with no change to any Markov residual. -/
namespace RealRowR52
noncomputable section
open Polynomial MathGKM.Markov RealConeR52 RealPolynomialR52

def row (P : BiPoly) (j : ℕ) : Polynomial ℤ :=
  Polynomial.ofFinsupp (AddMonoidAlgebra.ofCoeff
    (P.toFinsupp.coeff.mapRange (fun p : Polynomial ℤ => p.coeff j) (by simp)))

theorem row_coeff (P : BiPoly) (i j : ℕ) : (row P j).coeff i=coeff P i j := rfl

def realRow (P : BiPoly) (j : ℕ) : Polynomial ℝ :=
  (row P j).map (Int.castRingHom ℝ)

theorem realRow_coeff (P : BiPoly) (i j : ℕ) :
    (realRow P j).coeff i=(coeff P i j : ℝ) := by
  simp only [realRow,Polynomial.coeff_map,row_coeff,Int.coe_castRingHom]

def Factorized (P : Polynomial ℝ) : Prop :=
  P=0 ∨ ∃ (c : ℝ) (a : ℕ) (ls : List ℝ) (qs : List (ℝ × ℝ)),
    0<c ∧ (∀ ρ ∈ ls, 0≤ρ) ∧
    (∀ q ∈ qs, 0≤q.1 ∧ 0≤q.2 ∧ q.2≤q.1^2) ∧
    P=C c*X^a*(ls.map (fun ρ => X+C ρ)).prod*
      (qs.map (fun q => X^2+C q.1*X+C q.2)).prod

theorem factorized_cone (P : Polynomial ℝ) (h : Factorized P) : Cone (seq P) := by
  rcases h with rfl | ⟨c,a,ls,qs,hc,hl,hq,rfl⟩
  · have he : (seq (0 : Polynomial ℝ) : ℤ → ℝ)=fun _ => 0 := by
      funext z
      by_cases hz : z<0
      · exact seq_negative 0 z hz
      · obtain ⟨n,rfl⟩ := Int.eq_ofNat_of_zero_le (le_of_not_gt hz)
        simp [seq_nat]
    rw [he]
    refine ⟨by intro z; norm_num,by intro z; norm_num,?_⟩
    intro x y z hxy hyz hx hz
    norm_num at hx
  · exact finite_factor_product c hc a ls qs hl hq

theorem original_row_conditional (P : BiPoly) (j : ℕ) (h : Factorized (realRow P j)) :
    (∀ i, 0≤coeff P i j) ∧
    (∀ i k l : ℕ, i<k → k<l → 0<coeff P i j → 0<coeff P l j → 0<coeff P k j) ∧
    (∀ i, coeff P i j*coeff P (i+2) j≤coeff P (i+1) j^2) := by
  have hc := factorized_cone _ h
  refine ⟨?_,?_,?_⟩
  · intro i
    have hh := hc.1 (i:ℤ)
    rw [seq_nat,realRow_coeff] at hh
    exact_mod_cast hh
  · intro i k l hik hkl hi hl
    have hh := hc.2.2 (i:ℤ) (k:ℤ) (l:ℤ) (by exact_mod_cast hik) (by exact_mod_cast hkl)
    simp only [seq_nat,realRow_coeff] at hh
    exact_mod_cast hh (by exact_mod_cast hi) (by exact_mod_cast hl)
  · intro i
    have hh := raw_consequence _ hc i
    simp only [realRow_coeff] at hh
    exact_mod_cast hh

theorem original_horizontal_conditional (n : ℕ) (hn : 1≤n)
    (h : ∀ j, Factorized (realRow (frame (List.replicate (n-1) true)).mid.p j)) :
    let E := (frame (List.replicate (n-1) true)).mid
    ∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b (i+1) j →
      InPolygon E.a E.b (i+2) j → coeff E.p i j*coeff E.p (i+2) j≤coeff E.p (i+1) j^2 := by
  intro E i j hp0 hp1 hp2
  exact (original_row_conditional E.p j (h j)).2.2 i

theorem polynomial_controls :
    Cone (seq (X^2+X+1 : Polynomial ℝ)) ∧
    ¬Cone (seq (X^2+1 : Polynomial ℝ)) ∧
    (X^2+1 : Polynomial ℝ).coeff 0*(X^2+1 : Polynomial ℝ).coeff 2 >
      (X^2+1 : Polynomial ℝ).coeff 1^2 := by
  have hgood : (X^2+X+1 : Polynomial ℝ)=elementaryPoly 1 1 1 := by
    simp [elementaryPoly]; ring
  have hbad : (X^2+1 : Polynomial ℝ)=elementaryPoly 1 0 1 := by
    simp [elementaryPoly,add_comm]
  refine ⟨?_,?_,by norm_num [Polynomial.coeff_one]⟩
  · rw [hgood,seq_elementary]
    exact RealProductR52.equality_and_failed_bound.1
  · rw [hbad,seq_elementary]
    exact RealProductR52.equality_and_failed_bound.2

end
end RealRowR52
#print axioms RealRowR52.factorized_cone
#print axioms RealRowR52.original_horizontal_conditional
