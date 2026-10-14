import MarkovPellCorner654a
/-! Machine-authored 654a72ea. Full first-positive-excess horizontal and
vertical band for all Pell sources, without coordinate exclusions. -/
namespace MathGKM.Markov
noncomputable section

theorem lower_band_horizontal654a (n i j : ℕ) (hij : i+j=n+2) :
 coeff (rightP650 n) i j*coeff (rightP650 n) (i+2) j ≤
 coeff (rightP650 n) (i+1) j^2 := by
 by_cases hn : n < 2
 · have hz := raw_outside_polygon18 (List.replicate n true) (i+2) j (by
     rw [(right_labels650 n).1,(right_labels650 n).2]
     unfold InPolygon; omega)
   change coeff (rightP650 n) (i+2) j=0 at hz
   rw [hz,mul_zero]; exact sq_nonneg _
 by_cases hi : i=0
 · subst i
   have hj : j=n+2 := by omega
   subst j
   exact lower_corner654a n
 by_cases hj : 6 ≤ j
 · exact right_lower_horizontal654a n i j hij (by omega) hj
 interval_cases j
 · exact boundary_raw_logConcave _ i
 · exact horizontal_one_raw46 _ i
 · exact horizontal_two_raw8934 _ i
 · obtain ⟨k,rfl⟩ : ∃ k,i=k+1 := ⟨i-1,by omega⟩
   have he : n=k+2 := by omega
   subst n
   simpa only [rightP650,Nat.add_assoc] using lower_h_3_654a k
 · obtain ⟨k,rfl⟩ : ∃ k,i=k+1 := ⟨i-1,by omega⟩
   have he : n=k+3 := by omega
   subst n
   simpa only [rightP650,Nat.add_assoc] using lower_h_4_654a k
 · obtain ⟨k,rfl⟩ : ∃ k,i=k+1 := ⟨i-1,by omega⟩
   have he : n=k+4 := by omega
   subst n
   simpa only [rightP650,Nat.add_assoc] using lower_h_5_654a k

theorem lower_band_vertical654a (n i j : ℕ) (hij : i+j=n+2) :
 coeff (rightP650 n) i j*coeff (rightP650 n) i (j+2) ≤
 coeff (rightP650 n) i (j+1)^2 := by
 by_cases hn : n < 2
 · have hz := raw_outside_polygon18 (List.replicate n true) i (j+2) (by
     rw [(right_labels650 n).1,(right_labels650 n).2]
     unfold InPolygon; omega)
   change coeff (rightP650 n) i (j+2)=0 at hz
   rw [hz,mul_zero]; exact sq_nonneg _
 by_cases hi : i ≤ 2
 · interval_cases i
   · have hj : j=n+2 := by omega
     subst j
     simpa [Nat.add_assoc] using lower_vertical_zero654a n
   · exact vertical_one_all274 _ j
   · exact right_vertical_two650 n j
 by_cases hj : 4 ≤ j
 · exact right_lower_vertical654a n i j hij (by omega) hj
 interval_cases j
 · obtain ⟨k,rfl⟩ : ∃ k,i=k+4 := ⟨i-4,by omega⟩
   have he : n=k+2 := by omega
   subst n
   simpa only [rightP650,Nat.add_assoc] using lower_v_0_654a k
 · obtain ⟨k,rfl⟩ : ∃ k,i=k+3 := ⟨i-3,by omega⟩
   have he : n=k+2 := by omega
   subst n
   simpa only [rightP650,Nat.add_assoc] using lower_v_1_654a k
 · obtain ⟨k,rfl⟩ : ∃ k,i=k+3 := ⟨i-3,by omega⟩
   have he : n=k+3 := by omega
   subst n
   simpa only [rightP650,Nat.add_assoc] using lower_v_2_654a k
 · obtain ⟨k,rfl⟩ : ∃ k,i=k+3 := ⟨i-3,by omega⟩
   have he : n=k+4 := by omega
   subst n
   simpa only [rightP650,Nat.add_assoc] using lower_v_3_654a k

theorem source_near_one_lower_band654a (path : List Bool)
 (hb : (frame path).mid.b=(frame path).mid.a+1) (i j : ℕ)
 (hij : i+j=(frame path).mid.a+1) :
 (coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2) ∧
 (coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2) := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1] at hij
 exact ⟨lower_band_horizontal654a n i j (by omega),
   lower_band_vertical654a n i j (by omega)⟩

#print axioms source_near_one_lower_band654a
end
end MathGKM.Markov
