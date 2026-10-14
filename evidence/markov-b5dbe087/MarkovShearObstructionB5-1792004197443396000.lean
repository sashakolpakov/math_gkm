import MarkovPellLowerFormula26ca
import MarkovAmbientKernel5c90
/-! Machine-authored b5dbe087. Exact source-family obstruction to a TP2
invariant in the sheared coordinates. This is not a pinned LC direction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem pell_shear_minor_formulaB5 (k j : ℕ) (hj : 4 ≤ j) :
 let p := (frame (List.replicate (k+j) true)).mid.p
 (coeff p (k+2) j : ℚ)*coeff p (k+2) (j+1)-
   (coeff p (k+3) j : ℚ)*coeff p (k+1) (j+1)=
 32*((k+2 : ℚ)^3-j*((k+2 : ℚ)^2-(k+2)-1)-2) := by
 dsimp only
 have h0 := right_lower_one26ca (k+j) (k+2) j (by omega) (by omega) (by omega)
 have h1 := right_lower_two26ca (k+j) (k+3) j (by omega) (by omega) hj
 have h2 := right_lower_one26ca (k+j) (k+1) (j+1) (by omega) (by omega) (by omega)
 have h3 := right_lower_two26ca (k+j) (k+2) (j+1) (by omega) (by omega) (by omega)
 rw [h0,h1,h2,h3]
 unfold lowerOne26ca lowerTwo26ca
 push_cast
 ring

theorem pell_shear_minor_negativeB5 (j : ℕ) (hj : 7 ≤ j) :
 let p := (frame (List.replicate j true)).mid.p
 (coeff p 2 j : ℚ)*coeff p 2 (j+1) <
   (coeff p 3 j : ℚ)*coeff p 1 (j+1) := by
 have h := pell_shear_minor_formulaB5 0 j (by omega)
 norm_num at h
 have hjQ : (7:ℚ) ≤ j := by exact_mod_cast hj
 dsimp only
 linarith

theorem pell_shear_minor_polygonB5 (j : ℕ) (hj : 7 ≤ j) :
 let m := (frame (List.replicate j true)).mid
 InPolygon m.a m.b 2 j ∧ InPolygon m.a m.b 3 j ∧
 InPolygon m.a m.b 1 (j+1) ∧ InPolygon m.a m.b 2 (j+1) := by
 obtain ⟨ha,hb⟩ := right_labels650 j
 dsimp only
 rw [ha,hb]
 unfold InPolygon
 refine ⟨⟨?_,?_⟩,⟨?_,?_⟩,⟨?_,?_⟩,⟨?_,?_⟩⟩ <;> (first | omega | nlinarith)

/-- The same strict reversal in the ambient coefficient coordinates (s,j).
The pinned directions here are (1,0),(1,1),(0,1), not this minor. -/
theorem ambient_pell_not_TP2B5 (j : ℕ) (hj : 7 ≤ j) :
 let q := ambientPell5c U V (j+1)
 (coeff q 1 j : ℚ)*coeff q 2 (j+1) <
   (coeff q 2 j : ℚ)*coeff q 1 (j+1) := by
 have h := pell_shear_minor_negativeB5 j hj
 dsimp only at h ⊢
 rw [source_ambient_pell5c j 2 j 1 (by omega),
   source_ambient_pell5c j 2 (j+1) 2 (by omega),
   source_ambient_pell5c j 3 j 2 (by omega),
   source_ambient_pell5c j 1 (j+1) 1 (by omega)] at h
 exact h

#print axioms pell_shear_minor_formulaB5
#print axioms pell_shear_minor_negativeB5
#print axioms pell_shear_minor_polygonB5
#print axioms ambient_pell_not_TP2B5
end
end MathGKM.Markov
