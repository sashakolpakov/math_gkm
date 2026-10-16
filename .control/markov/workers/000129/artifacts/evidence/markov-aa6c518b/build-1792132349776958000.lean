import MarkovBottomCoefficientsMAA6
import MarkovBottomPositiveMAA6
import MarkovVertexLCMAA6
/-! Machine-authored aa6c518b. Raw vertical triples starting at v=0. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
attribute [local irreducible] frame coeff

theorem bottom_gap_transferMAA6 (a k l C c₁ c₂ s : ℝ)
 (hk : 1≤k) (hl : 2≤l) (hN : 4≤k+l) (hC : 0≤C)
 (h₁ : (k+l)*(k+l-1)*c₁=C*l*bottomTMAA6 a k l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+1)*c₂=
   C*l*(l-1)*bottomJMAA6 a k l s)
 (hg : 0≤bottomGapMAA6 a k l s) : C*c₂≤c₁^2 := by
 have he : 2*(k+1)*(k+l-2)*(k+l-3)*((k+l)*(k+l-1))^2*(c₁^2-C*c₂)=
   C^2*l*bottomGapMAA6 a k l s := by
   unfold bottomGapMAA6
   linear_combination
     2*(k+1)*(k+l-2)*(k+l-3)*((k+l)*(k+l-1)*c₁+C*l*bottomTMAA6 a k l)*h₁-
     (k+l)*(k+l-1)*C*h₂
 have hp : 0<2*(k+1)*(k+l-2)*(k+l-3)*((k+l)*(k+l-1))^2 := by
   have : 0<k+l-3 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l := by linarith
   positivity
 have hn : 0≤C^2*l*bottomGapMAA6 a k l s := mul_nonneg (by positivity) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith

theorem source_bottom_interiorMAA6 (path : List Bool) (k l : ℕ)
 (hb : 5≤(frame path).mid.b) (hbl : (frame path).mid.b=k+l+1)
 (hk : 1≤k) (hl : 2≤l) :
 coeff (frame path).mid.p ((frame path).mid.a+k) 0*
 coeff (frame path).mid.p ((frame path).mid.a+k) 2≤
 coeff (frame path).mid.p ((frame path).mid.a+k) 1^2 := by
 have h₁ := source_bottom_firstMAA6 path k l hb hbl
 have h₂ := source_bottom_secondMAA6 path k l hb hbl hl
 have h₀ := source_boundary_choose68 path k
 rw [hbl,show k+l+1-1=k+l by omega] at h₀
 have hg := bottom_gap_nonnegMAA6 (frame path).mid.a k l
   (frame_reduced path).1 hk hl (by omega)
 rw [←hbl] at hg
 have h := bottom_gap_transferMAA6 (frame path).mid.a k l
   ((k+l).choose k) (coeff (frame path).mid.p ((frame path).mid.a+k) 1)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 2)
   (2*((2*(frame path).mid.a-(frame path).mid.b:ℕ):ℝ))
   (by exact_mod_cast hk) (by exact_mod_cast hl)
   (by exact_mod_cast (show 4≤k+l by omega)) (by positivity) h₁ h₂ hg
 rw [h₀]
 exact_mod_cast h

theorem source_bottom_verticalMAA6 (path : List Bool) (hb : 5≤(frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 0*coeff (frame path).mid.p i 2≤
 coeff (frame path).mid.p i 1^2 := by
 obtain ⟨ha,hab,hcop⟩ := frame_reduced path
 by_cases hi : i<(frame path).mid.a
 · have hz := raw_outside_polygon18 path i 0 (by
     intro hp
     have h := hp.1
     simp only [mul_zero,add_zero] at h
     nlinarith)
   rw [hz,zero_mul]; exact sq_nonneg _
 by_cases ht : (frame path).mid.a+(frame path).mid.b-1 < i+2
 · have hz := raw_outside_polygon18 path i 2 (by unfold InPolygon; omega)
   rw [hz,mul_zero]; exact sq_nonneg _
 by_cases hv : i=(frame path).mid.a
 · subst i; exact source_vertex_verticalMAA6 path
 let k := i-(frame path).mid.a
 let l := (frame path).mid.b-1-k
 have he : (frame path).mid.a+k=i := by dsimp [k]; omega
 have hk : 1≤k := by dsimp [k]; omega
 have hl : 2≤l := by dsimp [l,k]; omega
 have hbl : (frame path).mid.b=k+l+1 := by dsimp [k,l]; omega
 simpa only [he] using source_bottom_interiorMAA6 path k l hb hbl hk hl

theorem source_bottom_allMAA6 (path : List Bool) (i : ℕ) :
 coeff (frame path).mid.p i 0*coeff (frame path).mid.p i 2≤
 coeff (frame path).mid.p i 1^2 := by
 by_cases hb : 5≤(frame path).mid.b
 · exact source_bottom_verticalMAA6 path hb i
 by_cases hi : i≤3
 · simpa using vertical_first_fourMF8 path i 0 hi
 by_cases ht : (frame path).mid.a+(frame path).mid.b-1 < i+2
 · have hz := raw_outside_polygon18 path i 2 (by unfold InPolygon; omega)
   rw [hz,mul_zero]; exact sq_nonneg _
 have hab := (frame_reduced path).2.1
 simpa using source_top_vertical_largeB5 path i 0 (by omega) (by omega)
end
end MathGKM.Markov
