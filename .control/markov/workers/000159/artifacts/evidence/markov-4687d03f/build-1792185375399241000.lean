import MarkovRowParameterM468
import MarkovRowTransferMFFD
/-! Machine-authored 4687d03f. Positive summation form of the parameter
difference and an explicit, still conditional induction route to row shape. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem rowH_difference_sumM468 (N j : ℕ) :
 rowHMFFD (N+j+3) (j+1)-rowHMFFD (N+j+2) (j+1)=
 X*∑ s ∈ range (j+1), rowHMFFD (N+s+2) s := by
 induction j with
 | zero =>
   have h := rowH_parameterM468 (N+1) 0 (by omega)
   simp only [Nat.add_zero,Nat.reduceAdd,Finset.sum_range_one,rowHMFFD,rowJ_zeroM468] at h ⊢
   simp only [Nat.add_assoc,Nat.reduceAdd] at h
   linear_combination h
 | succ j ih =>
   have h := rowH_parameterM468 (N+j+2) (j+1) (by omega)
   rw [Finset.sum_range_succ]
   have e1 : N+(j+1)+3=N+j+2+2 := by omega
   have e2 : N+(j+1)+2=N+j+2+1 := by omega
   have e3 : N+j+3=N+j+2+1 := by omega
   rw [e1,e2]
   rw [e3] at ih
   linear_combination h+ih

def RowDifferenceM468 (n j : ℕ) : ℤ → ℝ :=
 fun k => CoeffSeq ((rowHMFFD (n+1) j).map (Int.castRingHom ℝ)) k-
   CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ)) k

def RowDifferenceShapeM468 : Prop := ∀ n j : ℕ, 2*j+1 ≤ n →
 CrossLC (RowDifferenceM468 n j) ∧
 ∀ i k : ℤ, i ≤ k →
   CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ)) i*RowDifferenceM468 n j (k+1)+
   RowDifferenceM468 n j i*CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ)) (k+1) ≤
   CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ)) (i+1)*RowDifferenceM468 n j k+
   RowDifferenceM468 n j (i+1)*CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ)) k

theorem crossLC_sum_mixedM468 (f g : ℤ → ℝ) (hf : CrossLC f) (hg : CrossLC g)
 (hm : ∀ i k : ℤ, i ≤ k → f i*g (k+1)+g i*f (k+1) ≤
   f (i+1)*g k+g (i+1)*f k) : CrossLC (fun k => f k+g k) := by
 intro i k hik
 have ha := hf i k hik
 have hb := hg i k hik
 have hc := hm i k hik
 dsimp only
 nlinarith

theorem lower_shape_of_differenceM468
 (hb : ∀ j : ℕ, CrossLC (CoeffSeq ((rowHMFFD (2*j+1) j).map (Int.castRingHom ℝ))))
 (hd : RowDifferenceShapeM468) : LowerRowShapeMFFD := by
 intro n j hn
 obtain ⟨d,rfl⟩ := Nat.exists_eq_add_of_le hn
 clear hn
 induction d with
 | zero => simpa using hb j
 | succ d ih =>
   obtain ⟨h1,h2⟩ := hd (2*j+1+d) j (by omega)
   have h := crossLC_sum_mixedM468 _ _ ih h1 h2
   simpa only [RowDifferenceM468,add_sub_cancel,Nat.add_assoc] using h

end
end MathGKM.Markov
