import MarkovMinimalShapeMDAB
import MarkovDifferencePositiveMDAB
import MarkovResolventSourceM468
/-! Machine-authored daba8bcf. The minimal-denominator premise is discharged.
The remaining gap-monotonicity and difference-shape premises are explicit,
unproved conditions, not axioms or a proof of the published conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def rowGapMDAB (n j k : ℕ) : ℤ :=
 (rowHMFFD n j).coeff (k+1)^2-(rowHMFFD n j).coeff k*(rowHMFFD n j).coeff (k+2)
def RowGapMonotoneMDAB : Prop := ∀ n j k : ℕ, 2*j+1 ≤ n → k+2 ≤ j →
 rowGapMDAB n j k ≤ rowGapMDAB (n+1) j k

theorem lower_shape_of_difference_onlyMDAB (hd : RowDifferenceShapeM468) : LowerRowShapeMFFD :=
 lower_shape_of_differenceM468 minimal_row_crossMDAB hd

theorem lower_shape_of_gap_monotoneMDAB (hg : RowGapMonotoneMDAB) : LowerRowShapeMFFD := by
 have hadj (n j k : ℕ) (hn : 2*j+1 ≤ n) (hk : k+2 ≤ j) :
   (rowHMFFD n j).coeff k*(rowHMFFD n j).coeff (k+2) ≤ (rowHMFFD n j).coeff (k+1)^2 := by
   obtain ⟨d,rfl⟩ := Nat.exists_eq_add_of_le hn
   have hbase : 0 ≤ rowGapMDAB (2*j+1) j k := by
     have h := minCoeff_adjacentMDAB j k hk
     unfold minCoeffMDAB at h
     have h' : (rowHMFFD (2*j+1) j).coeff k*(rowHMFFD (2*j+1) j).coeff (k+2) ≤
       (rowHMFFD (2*j+1) j).coeff (k+1)^2 := by exact_mod_cast h
     exact sub_nonneg.mpr h'
   have hall : 0 ≤ rowGapMDAB (2*j+1+d) j k := by
     induction d with
     | zero => simpa using hbase
     | succ d ih => exact ih.trans (hg _ j k (by omega) hk)
   exact sub_nonneg.mp hall
 intro n j hn
 let f := CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ))
 have hz (k : ℤ) (hk : k<0 ∨ (j:ℤ)<k) : f k=0 := by
   dsimp [f,CoeffSeq]
   rcases hk with hk|hk
   · rw [if_pos hk]
   · rw [if_neg (by omega),Polynomial.coeff_map,rowH_tailMFFD n j _ (by omega)]
     simp
 have hp (k : ℤ) (hk0 : 0 ≤ k) (hkj : k ≤ j) : 0 < f k := by
   dsimp [f,CoeffSeq]
   rw [if_neg (by omega),Polynomial.coeff_map,Int.coe_castRingHom]
   dsimp only
   exact_mod_cast rowH_coeff_posMDAB n j k.toNat hn (by omega)
 have hnon (k : ℤ) : 0 ≤ f k := by
   by_cases h0 : 0 ≤ k
   · by_cases hj : k ≤ j
     · exact (hp k h0 hj).le
     · rw [hz k (Or.inr (by omega))]
   · rw [hz k (Or.inl (by omega))]
 apply crossLC_of_adjacent_interval774 f hnon
 · intro k
   by_cases h0 : k ≤ 0
   · rw [hz (k-1) (Or.inl (by omega)),zero_mul]
     exact sq_nonneg _
   by_cases hj : (j:ℤ) ≤ k
   · rw [hz (k+1) (Or.inr (by omega)),mul_zero]
     exact sq_nonneg _
   have hh := hadj n j (k-1).toNat hn (by omega)
   dsimp [f,CoeffSeq]
   simp only [show ¬k-1<0 by omega,show ¬k<0 by omega,show ¬k+1<0 by omega,
     if_false,Polynomial.coeff_map,Int.coe_castRingHom]
   have h1 : (k-1).toNat+1=k.toNat := by omega
   have h2 : (k-1).toNat+2=(k+1).toNat := by omega
   rw [h1,h2] at hh
   exact_mod_cast hh
 · intro i k l hik hkl hi hl
   have hi0 : 0 ≤ i := by
     by_contra h
     rw [hz i (Or.inl (by omega))] at hi
     linarith
   have hlj : l ≤ j := by
     by_contra h
     rw [hz l (Or.inr (by omega))] at hl
     linarith
   exact hp k (by omega) (by omega)

theorem source_lower_horizontal_of_gapMDAB (hg : RowGapMonotoneMDAB)
 (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 :=
 source_lower_horizontal_of_shapeMFFD (lower_shape_of_gap_monotoneMDAB hg) q i j r hj

theorem source_lower_horizontal_of_differenceMDAB (hd : RowDifferenceShapeM468)
 (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 :=
 source_lower_horizontal_of_shapeMFFD (lower_shape_of_difference_onlyMDAB hd) q i j r hj

end
end MathGKM.Markov
