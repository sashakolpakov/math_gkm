import MathGKM.Round104OriginalA
import MathGKM.Accepted2daf99e453e96324edca0dcf
import MathGKM.Acceptedcab29878f59978c1115c16e1
import MathGKM.Accepteda9625695d66c9988d543ca6d

/- Machine-authored r104. Actual corner prefix positivity is recovered from
already-established alpha-zero/one comparisons and the old raw corner sign.
It is NOT an independent explanation of that raw sign or a noncorner theorem.
The row-value correspondence remains a separate target. -/
namespace OrderedCornerR104
open scoped BigOperators
open NeighborSupportR100 OrderedCompensationR104 PairConvolutionR78
open LocalRetilingR76 MatchingSeparatorR63 MathGKM.Markov
noncomputable section

theorem pair_color_bound (N sigma t L a b r : ℕ)
    (h : (P N sigma t L a b r).Nonempty) : a≤L := by
  classical
  obtain ⟨z,hz⟩ := h
  obtain ⟨_,hf,_⟩ := Finset.mem_filter.mp hz
  obtain ⟨_,_,_,_,hL,ha,_⟩ := hf
  unfold du at hL
  omega

theorem pair_color_zero (N sigma t L a b r : ℕ) (ha : L<a) :
    P N sigma t L a b r=∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro z hz
  have := pair_color_bound N sigma t L a b r ⟨z,hz⟩
  omega

theorem corner_tail (n K a : ℕ) (ha : 2<a) : pooledDelta (2*n) 1 n 0 K a=0 := by
  unfold pooledDelta
  rw [pair_color_zero (2*n) 1 n (2*0+2) a (K-a) (0+1) (by omega),
    pair_color_zero (2*n) 1 n (2*0+2) a (K-a) 0 (by omega)]
  simp

theorem corner_small (n K a : ℕ) (ha : a≤1) : 0≤pooledDelta (2*n) 1 n 0 K a := by
  unfold pooledDelta
  have h : (P (2*n) 1 n (2*0+2) a (K-a) 0).card ≤
      (P (2*n) 1 n (2*0+2) a (K-a) (0+1)).card := by
    rcases (show a=0 ∨ a=1 by omega) with rfl | rfl
    · exact (Accepted2daf99e453e96324edca0dcf.obligation n n 0 (K-0)).2
    · exact Acceptedcab29878f59978c1115c16e1.obligation n n 0 (K-1)
  exact sub_nonneg.mpr (by exact_mod_cast h)

theorem corner_prefix (n : ℕ) (hn : 2≤n) :
    Prefix (2*n-2) (pooledDelta (2*n) 1 n 0 (2*n-2)) := by
  intro q hq
  by_cases hsmall : q≤1
  · exact Finset.sum_nonneg (fun a ha => corner_small n (2*n-2) a (by
      have := Finset.mem_range.mp ha
      omega))
  · have hsub : Finset.range (q+1) ⊆ Finset.range (2*n-2+1) :=
      Finset.range_mono (by omega)
    have he : (∑ a ∈ Finset.range (q+1), pooledDelta (2*n) 1 n 0 (2*n-2) a) =
        ∑ a ∈ Finset.range (2*n-2+1), pooledDelta (2*n) 1 n 0 (2*n-2) a := by
      apply Finset.sum_subset hsub
      intro a _ ha
      apply corner_tail
      have : ¬a<q+1 := by simpa using ha
      omega
    rw [he,(NeighborOriginalR100.original_margins n n 0 (2*n-2) (by omega) (by omega)).2]
    exact le_of_lt (Accepteda9625695d66c9988d543ca6d.obligation n hn).2.2.2.2

def CornerPrefix : Prop := ∀ n : ℕ, 2≤n →
  Prefix (2*n-2) (pooledDelta (2*n) 1 n 0 (2*n-2))
theorem corner_claim : CornerPrefix := corner_prefix

end
end OrderedCornerR104
#print axioms OrderedCornerR104.corner_claim
