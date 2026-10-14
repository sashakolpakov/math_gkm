import MarkovTopSource58d2
import MarkovTopAlgebra58d2
/-! Machine-authored 58d2f411. Unbounded source horizontal triples ending
on the top face. This does not prove the interior or other directions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_top_horizontal_ambient58 (path : List Bool) (i j : ℕ)
 (hij : 2 ≤ i+j)
 (hd : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
 2*((frame path).mid.b-1 : ℤ)*coeff (frame path).mid.p i j*
   coeff (frame path).mid.p (i+2) j ≤
 ((frame path).mid.b-2 : ℤ)*coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨ha,hab,_⟩ := frame_reduced path
 let b : ℝ := (frame path).mid.a-1
 let n : ℝ := (frame path).mid.b-1
 let f : ℝ := (i+j).choose i
 have haR : (1:ℝ) ≤ (frame path).mid.a := by exact_mod_cast ha
 have habR : ((frame path).mid.a:ℝ)+1 ≤ (frame path).mid.b := by exact_mod_cast hab
 have hs : n+b=(i:ℝ)+j+2 := by
   have hd' : i+j+3=(frame path).mid.a+(frame path).mid.b := by omega
   have hr : (i:ℝ)+j+3=(frame path).mid.a+(frame path).mid.b := by exact_mod_cast hd'
   dsimp [n,b]; linarith
 have hm : ((i:ℝ)+1)*(coeff (frame path).mid.p (i+1) j : ℝ)=
   f*(n*(i+1)+b*j) := by
   rw [source_top_middle58 path i j hd]
   have h := top_middle_binomial58 i j
   dsimp [f,n,b]
   linear_combination ((frame path).mid.a-1 : ℝ)*h
 have hr : ((i:ℝ)+1)*(i+2)*(coeff (frame path).mid.p (i+2) j : ℝ)=
   ((i:ℝ)+j+1)*(i+j+2)*f := by
   rw [top_raw_coeff1998 path (i+2) j (by omega),← hd]
   exact top_last_binomial58 i j
 have hl : 2*((i:ℝ)+j)*(i+j-1)*(coeff (frame path).mid.p i j : ℝ)=
   (n*(n-1)*i*(i-1)+2*(b*n+n-3*b-1)*i*j+b*(b-1)*j*(j-1))*f := by
   rw [source_top_low58 path i j hij hd]
   dsimp [n,b,f]; ring
 have h := top_triple_bound58 i j b n f
   (coeff (frame path).mid.p i j) (coeff (frame path).mid.p (i+1) j)
   (coeff (frame path).mid.p (i+2) j) (by dsimp [b]; linarith)
   (by dsimp [n,b]; linarith) hs hij hm hr hl
 dsimp [n] at h
 have hh : (2:ℝ)*((frame path).mid.b-1)*(coeff (frame path).mid.p i j : ℝ)*
     coeff (frame path).mid.p (i+2) j ≤
   ((frame path).mid.b-2)*(coeff (frame path).mid.p (i+1) j : ℝ)^2 := by
   nlinarith only [h]
 exact_mod_cast hh

theorem source_top_horizontal_raw58 (path : List Bool) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (hd : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 := by
 by_cases hij : 2 ≤ i+j
 · have h := source_top_horizontal_ambient58 path i j hij hd
   obtain ⟨ha,hab,_⟩ := frame_reduced path
   have hb : 3 ≤ (frame path).mid.b := by omega
   have hp : 0 ≤ coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j :=
     mul_nonneg (raw_coeff_nonneg18 path i j) (raw_coeff_nonneg18 path (i+2) j)
   have hbR : (0:ℤ)<(frame path).mid.b-2 := by omega
   have hscale : ((frame path).mid.b-2 : ℤ)*
       (coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j) ≤
       ((frame path).mid.b-2 : ℤ)*coeff (frame path).mid.p (i+1) j^2 := by
     nlinarith [mul_nonneg (show (0:ℤ) ≤ (frame path).mid.b by positivity) hp]
   exact (mul_le_mul_iff_right₀ hbR).mp hscale
 · obtain ⟨ha,hab,_⟩ := frame_reduced path
   have hi : i ≤ 1 := by omega
   have hj : j ≤ 1 := by omega
   have hz : j=0 := by
     by_contra hn
     have hj1 : j=1 := by omega
     have hi0 : i=0 := by omega
     have h := h0.1
     rw [hj1,hi0] at h
     simp only [Nat.mul_zero,Nat.mul_one,zero_add] at h
     nlinarith
   subst j
   exact boundary_raw_logConcave path i

#print axioms source_top_horizontal_ambient58
#print axioms source_top_horizontal_raw58
end
end MathGKM.Markov
