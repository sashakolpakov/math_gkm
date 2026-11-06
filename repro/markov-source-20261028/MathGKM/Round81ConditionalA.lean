import MathGKM.Accepted0beeba7c6244e2295e3e804c
/- Machine-authored round81 exact conditional wrapper of retained coefficient-comparison proof. Actual coefficients remain premises. -/
namespace Round81ConditionalA
open scoped BigOperators
theorem checked :
let H := FullFiberRankR80.rankPoly 8 1 4 2 0 6
(H.coeff 0=36 ∧ H.coeff 1=64) →
(∀ gamma : ℕ → ℤ, H=SymmetricBinomialR80.expansion 2 gamma →
  gamma 0=36 ∧ gamma 1= -8) ∧
¬∃ gamma : ℕ → ℤ, H=SymmetricBinomialR80.expansion 2 gamma ∧
  (∀ k, k≤2/2 → 0≤gamma k) :=
by
  dsimp only
  intro hc
  have forced : ∀ gamma : ℕ → ℤ,
      FullFiberRankR80.rankPoly 8 1 4 2 0 6 =
        SymmetricBinomialR80.expansion 2 gamma →
      gamma 0=36 ∧ gamma 1= -8 := by
    intro gamma he
    have h0 := congrArg (fun P : Polynomial ℤ => P.coeff 0) he
    have h1 := congrArg (fun P : Polynomial ℤ => P.coeff 1) he
    rw [hc.1,SymmetricBinomialR80.expansion_coeff] at h0
    rw [hc.2,SymmetricBinomialR80.expansion_coeff] at h1
    norm_num [SymmetricBinomialR80.weight,Finset.sum_range_succ] at h0 h1
    omega
  refine ⟨forced,?_⟩
  rintro ⟨gamma,he,hn⟩
  have hf := forced gamma he
  have hs := hn 1 (by norm_num)
  omega
end Round81ConditionalA
#print axioms Round81ConditionalA.checked
