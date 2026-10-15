import MarkovGeometricFailureB485
/-! Machine-authored b485717c. Source scope, geometric activities and raw comparison. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem geometric_activity_shapeB485 (t : ℤ) (ht : 1≤t) :
 (∀ i≤8,0<t^(8-i)) ∧
 (∀ i<8,t^(8-(i+1))≤t^(8-i)) ∧
 (∀ i<7,t^(8-i)*t^(8-(i+2))=(t^(8-(i+1)))^2) := by
 refine ⟨?_,?_,?_⟩
 · intro i hi; exact pow_pos (by omega) _
 · intro i hi; exact pow_le_pow_right₀ ht (by omega)
 · intro i hi
   rw [←pow_add,←pow_mul]
   congr 1
   omega

theorem source710_rawB485 :
 let m := (frame [true,true,false,false]).mid
 m.a=7 ∧ m.b=10 ∧ Nat.Coprime m.a m.b ∧
 InPolygon m.a m.b 1 9 ∧ InPolygon m.a m.b 2 9 ∧ InPolygon m.a m.b 3 9 ∧
 coeff m.p 1 9=12 ∧ coeff m.p 2 9=472 ∧ coeff m.p 3 9=5092 ∧
 coeff m.p 2 9^2-coeff m.p 1 9*coeff m.p 3 9=161680 := by
 have ha : (frame [true,true,false,false]).mid.a=7 := rfl
 have hb : (frame [true,true,false,false]).mid.b=10 := rfl
 have hc (s : ℕ) :
   activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C (1:ℤ))) s =
   cutCoeffA27 (X:ℤ[X]) X 1 (central28 [true,true,false,false]++[true]) s := by
   rw [map_one,geometric_uniformB485,activity_uniformB485,geometric_source_wordB485]
 have h0 := geometric_coeff3B485 1
 have h1 := geometric_coeff4B485 1
 have h2 := geometric_coeff5B485 1
 rw [hc 3] at h0
 rw [hc 4] at h1
 rw [hc 5] at h2
 have c0 : coeff (frame [true,true,false,false]).mid.p 1 9=12 := by
   rw [source_cut_coeffA27 _ 1 9 3 (by rw [ha])]
   norm_num at h0 ⊢; exact h0
 have c1 : coeff (frame [true,true,false,false]).mid.p 2 9=472 := by
   rw [source_cut_coeffA27 _ 2 9 4 (by rw [ha])]
   norm_num at h1 ⊢; exact h1
 have c2 : coeff (frame [true,true,false,false]).mid.p 3 9=5092 := by
   rw [source_cut_coeffA27 _ 3 9 5 (by rw [ha])]
   norm_num at h2 ⊢; exact h2
 dsimp only
 norm_num [ha,hb,InPolygon,c0,c1,c2]

#print axioms geometric_activity_shapeB485
#print axioms source710_rawB485
end
end MathGKM.Markov
