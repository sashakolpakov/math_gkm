import MathGKM.Accepted117175186eb78f969884c0a6
import MathGKM.Round80BinomialA

/- Machine-authored round80. Actual finite rank polynomial, with conditional
expansion transport. Applicability and all gamma signs remain explicit. -/
namespace FullFiberRankR80
open scoped BigOperators
open Polynomial PairConvolutionR78 LocalRetilingR76
noncomputable section

def rankPoly (N sigma j L a b : ℕ) : Polynomial ℤ :=
  ∑ r ∈ Finset.range (L+1), monomial r ((P N sigma j L a b r).card : ℤ)

theorem card_above (N sigma j L a b r : ℕ) (hr : L<r) :
    (P N sigma j L a b r).card=0 := by
  classical
  apply Finset.card_eq_zero.mpr
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro z hz
  have hf := (Finset.mem_filter.mp hz).2
  have ht := hf.1.2.2.2.2.1
  have he := hf.2
  simp only [rank] at he
  omega

theorem rank_coeff (N sigma j L a b r : ℕ) :
    (rankPoly N sigma j L a b).coeff r =
      ((P N sigma j L a b r).card : ℤ) := by
  classical
  by_cases hr : r≤L
  · simp [rankPoly,finsetSum_coeff,coeff_monomial,Finset.mem_range,Nat.lt_succ_iff,hr]
  · have hz := card_above N sigma j L a b r (by omega)
    simp [rankPoly,finsetSum_coeff,coeff_monomial,Finset.mem_range,Nat.lt_succ_iff,hr,hz]

theorem projected_coeff (N sigma j L a b r : ℕ) (hr : r≤L) :
    (rankPoly N sigma j L a b).coeff r =
      (((MatchingProjectionR64.B N sigma r j *
        MatchingProjectionR64.B N sigma (L-r) j).coeff a).coeff b) := by
  rw [rank_coeff]
  have h := Accepted117175186eb78f969884c0a6.obligation.2 N sigma r (L-r) j a b
  simpa only [Nat.add_sub_of_le hr] using h.symm

theorem conditional_comparison (N sigma j L a b : ℕ) (gamma : ℕ → ℤ)
    (hexp : rankPoly N sigma j L a b = SymmetricBinomialR80.expansion L gamma)
    (hnn : ∀ k, k≤L/2 → 0≤gamma k) :
    (∀ r, r≤L → (P N sigma j L a b r).card=(P N sigma j L a b (L-r)).card) ∧
    (∀ r, 2*r<L → (P N sigma j L a b r).card≤(P N sigma j L a b (r+1)).card) := by
  have h := SymmetricBinomialR80.transport L gamma (rankPoly N sigma j L a b) hexp hnn
  constructor
  · intro r hr
    have he := h.1 r hr
    simp only [rank_coeff] at he
    exact_mod_cast he
  · intro r hr
    have he := h.2.1 r hr
    simp only [rank_coeff] at he
    exact_mod_cast he

theorem central_comparison (N sigma j i a b : ℕ) (gamma : ℕ → ℤ)
    (hexp : rankPoly N sigma j (2*i+2) a b =
      SymmetricBinomialR80.expansion (2*i+2) gamma)
    (hnn : ∀ k, k≤(2*i+2)/2 → 0≤gamma k) :
    (P N sigma j (2*i+2) a b i).card≤(P N sigma j (2*i+2) a b (i+1)).card :=
  (conditional_comparison N sigma j (2*i+2) a b gamma hexp hnn).2 i (by omega)

end
end FullFiberRankR80
