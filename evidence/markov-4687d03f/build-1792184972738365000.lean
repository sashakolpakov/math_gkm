import MarkovRowResolventM468
import MarkovRowTransferMFFD
/-! Machine-authored 4687d03f. Invertible formal resolvent, exact source
identification, and equivalent unproved shape obligation. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 4000000

def rowDenomM468 (N : ℕ) : PowerSeries (Polynomial ℤ) :=
 rowAM468^(N+4)*(1-2*X+C (Polynomial.X+1)*X^2)^2
def rowNumerM468 (N : ℕ) : PowerSeries (Polynomial ℤ) :=
 (1-X)^N*(1-C (Polynomial.X+1)*X^2)^2
def rowResolventM468 (N : ℕ) : PowerSeries (Polynomial ℤ) :=
 invOfUnit (rowDenomM468 N) 1*rowNumerM468 N

theorem rowDenom_unitM468 (N : ℕ) : constantCoeff (rowDenomM468 N)=1 := by
 simp [rowDenomM468,rowAM468]

theorem rowResolvent_eqM468 (N : ℕ) : rowResolventM468 N=rowHSeriesM468 N := by
 have h := rowH_resolventM468 N
 change rowDenomM468 N*rowHSeriesM468 N=rowNumerM468 N at h
 unfold rowResolventM468
 rw [←h,←mul_assoc,invOfUnit_mul _ _ (by simpa using rowDenom_unitM468 N),one_mul]

theorem rowResolvent_uniqueM468 (N : ℕ) (F : PowerSeries (Polynomial ℤ))
 (h : rowDenomM468 N*F=rowNumerM468 N) : F=rowResolventM468 N := by
 unfold rowResolventM468
 rw [←h,←mul_assoc,invOfUnit_mul _ _ (by simpa using rowDenom_unitM468 N),one_mul]

theorem rowResolvent_coeffM468 (n j : ℕ) (hn : j+1 ≤ n) :
 PowerSeries.coeff j (rowResolventM468 (n-j-1))=rowHMFFD n j := by
 rw [rowResolvent_eqM468]
 simp only [rowHSeriesM468,coeff_mk]
 rw [show n-j-1+j+1=n by omega]

theorem source_lower_resolventM468 (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j=
   (Polynomial.X^3*((Polynomial.X+1)^(sourceNME9C q r-2*j-1)*
   PowerSeries.coeff j (rowResolventM468 (sourceNME9C q r-j-1)))).coeff i := by
 rw [rowResolvent_coeffM468 _ j (by unfold sourceNME9C; split_ifs <;> omega)]
 exact source_lower_rowMFFD q i j r hj

def ResolventShapeM468 : Prop := ∀ N j : ℕ, j ≤ N →
 CrossLC (CoeffSeq ((PowerSeries.coeff j (rowResolventM468 N)).map (Int.castRingHom ℝ)))

theorem resolvent_shape_iffM468 : LowerRowShapeMFFD ↔ ResolventShapeM468 := by
 constructor
 · intro h N j hj
   rw [rowResolvent_eqM468]
   exact h (N+j+1) j (by omega)
 · intro h n j hn
   have hh := h (n-j-1) j (by omega)
   rw [rowResolvent_coeffM468 n j (by omega)] at hh
   exact hh

theorem source_lower_horizontal_of_resolventM468 (h : ResolventShapeM468)
 (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 :=
 source_lower_horizontal_of_shapeMFFD (resolvent_shape_iffM468.mpr h) q i j r hj

end
end MathGKM.Markov
