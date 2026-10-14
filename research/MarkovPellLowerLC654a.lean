import MarkovPellLowerFormula26ca
/-! Machine-authored request 654a72ea; recovered and corrected from 26ca8e85. Unbounded raw Pell inequalities
crossing the first three positive-excess lower strips, with explicit interior
coordinate hypotheses. This does not assert the full Pell or pinned root goal. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem lower_horizontal_gap654a (x y : ℚ) (hx : 1 ≤ x) (hy : 6 ≤ y) :
 lowerOne26ca x y*lowerThree26ca (x+2) y ≤ lowerTwo26ca (x+1) y^2 := by
 have hx0 : 0 ≤ x-1 := by linarith
 have hy0 : 0 ≤ y-6 := by linarith
 suffices h : 0 ≤ lowerTwo26ca ((x-1)+2) ((y-6)+6)^2-
     lowerOne26ca ((x-1)+1) ((y-6)+6)*lowerThree26ca ((x-1)+3) ((y-6)+6) by
   convert (sub_nonneg.mp h) using 1 <;> dsimp [lowerOne26ca,lowerTwo26ca,lowerThree26ca] <;> ring
 generalize x-1=u at hx0 ⊢
 generalize y-6=v at hy0 ⊢
 dsimp [lowerOne26ca,lowerTwo26ca,lowerThree26ca]
 ring_nf
 positivity

theorem lower_vertical_gap654a (x y : ℚ) (hx : 3 ≤ x) (hy : 4 ≤ y) :
 lowerOne26ca x y*lowerThree26ca x (y+2) ≤ lowerTwo26ca x (y+1)^2 := by
 have hx0 : 0 ≤ x-3 := by linarith
 have hy0 : 0 ≤ y-4 := by linarith
 suffices h : 0 ≤ lowerTwo26ca ((x-3)+3) ((y-4)+5)^2-
     lowerOne26ca ((x-3)+3) ((y-4)+4)*lowerThree26ca ((x-3)+3) ((y-4)+6) by
   convert (sub_nonneg.mp h) using 1 <;> dsimp [lowerOne26ca,lowerTwo26ca,lowerThree26ca] <;> ring
 generalize x-3=u at hx0 ⊢
 generalize y-4=v at hy0 ⊢
 dsimp [lowerOne26ca,lowerTwo26ca,lowerThree26ca]
 ring_nf
 positivity

theorem right_lower_horizontal654a (n i j : ℕ)
 (hij : i+j=n+2) (hi : 1 ≤ i) (hj : 6 ≤ j) :
 coeff (frame (List.replicate n true)).mid.p i j*
 coeff (frame (List.replicate n true)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true)).mid.p (i+1) j^2 := by
 have e0 := right_lower_one26ca n i j hij hi (by omega)
 have e1 := right_lower_two26ca n (i+1) j (by omega) (by omega) (by omega)
 have e2 := right_lower_three26ca n (i+2) j (by omega) (by omega) hj
 have hc : (coeff (frame (List.replicate n true)).mid.p i j : ℚ)*
     (coeff (frame (List.replicate n true)).mid.p (i+2) j : ℚ) ≤
     (coeff (frame (List.replicate n true)).mid.p (i+1) j : ℚ)^2 := by
   rw [e0,e1,e2]
   push_cast
   exact lower_horizontal_gap654a i j (by exact_mod_cast hi) (by exact_mod_cast hj)
 exact_mod_cast hc

theorem right_lower_vertical654a (n i j : ℕ)
 (hij : i+j=n+2) (hi : 3 ≤ i) (hj : 4 ≤ j) :
 coeff (frame (List.replicate n true)).mid.p i j*
 coeff (frame (List.replicate n true)).mid.p i (j+2) ≤
 coeff (frame (List.replicate n true)).mid.p i (j+1)^2 := by
 have e0 := right_lower_one26ca n i j hij (by omega) (by omega)
 have e1 := right_lower_two26ca n i (j+1) (by omega) (by omega) (by omega)
 have e2 := right_lower_three26ca n i (j+2) (by omega) hi (by omega)
 have hc : (coeff (frame (List.replicate n true)).mid.p i j : ℚ)*
     (coeff (frame (List.replicate n true)).mid.p i (j+2) : ℚ) ≤
     (coeff (frame (List.replicate n true)).mid.p i (j+1) : ℚ)^2 := by
   rw [e0,e1,e2]
   push_cast
   exact lower_vertical_gap654a i j (by exact_mod_cast hi) (by exact_mod_cast hj)
 exact_mod_cast hc

theorem source_near_one_lower_horizontal654a (path : List Bool)
 (hb : (frame path).mid.b=(frame path).mid.a+1) (i j : ℕ)
 (hij : i+j=(frame path).mid.a+1) (hi : 1 ≤ i) (hj : 6 ≤ j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1] at hij
 exact right_lower_horizontal654a n i j (by omega) hi hj

theorem source_near_one_lower_vertical654a (path : List Bool)
 (hb : (frame path).mid.b=(frame path).mid.a+1) (i j : ℕ)
 (hij : i+j=(frame path).mid.a+1) (hi : 3 ≤ i) (hj : 4 ≤ j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1] at hij
 exact right_lower_vertical654a n i j (by omega) hi hj

#print axioms source_near_one_lower_horizontal654a
#print axioms source_near_one_lower_vertical654a
end
end MathGKM.Markov
