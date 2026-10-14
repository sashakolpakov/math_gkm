import MarkovNextSource7955
import MarkovNextAlgebra7955
import MarkovFibonacciLC6ade
/-! Machine-authored 7955df0c. Universal horizontal triples ending one below top. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_next_horizontal_large7955 (path : List Bool) (i j : ℕ)
 (hij : 3 ≤ i+j)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨ha,hab,_⟩ := frame_reduced path
 obtain ⟨s,hl⟩ := source_next_low7955 path i j hij hd
 have hm := source_next_middle7955 path i j hij hd
 have hr := source_next_last7955 path i j hd
 have haR : (1:ℝ) ≤ (frame path).mid.a := by exact_mod_cast ha
 have habR : ((frame path).mid.a:ℝ)+1 ≤ (frame path).mid.b := by exact_mod_cast hab
 have hs : ((frame path).mid.b-1 : ℝ)+((frame path).mid.a-1 : ℝ)=(i:ℝ)+j+2 := by
   have hnat : i+j+4=(frame path).mid.a+(frame path).mid.b := by omega
   have hR : (i:ℝ)+j+4=(frame path).mid.a+(frame path).mid.b := by exact_mod_cast hnat
   linarith
 rw [mul_comm (nextQ7955 _ _ _ _) _] at hm
 have h := next_triple_bound7955 i j ((frame path).mid.a-1) ((frame path).mid.b-1)
   ((i+j).choose i) (coeff (frame path).mid.p i j) (coeff (frame path).mid.p (i+1) j)
   (coeff (frame path).mid.p (i+2) j) s (by linarith) (by linarith) hs hij
   (by positivity) hm hr hl
 exact_mod_cast h

theorem source_next_horizontal7955 (path : List Bool) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 by_cases hij : 3 ≤ i+j
 · exact source_next_horizontal_large7955 path i j hij hd
 · obtain ⟨ha,hab,hcop⟩ := frame_reduced path
   have hlo : (frame path).mid.a ≤ i+j := by
     have hh := h0.1
     nlinarith [Nat.mul_le_mul_right j (Nat.le_of_lt hab)]
   have ha1 : (frame path).mid.a=1 := by
     by_contra h
     have ea : (frame path).mid.a=2 := by omega
     have eb : (frame path).mid.b=4 := by omega
     rw [ea,eb] at hcop
     norm_num at hcop
   have h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) j := by
     constructor
     · have := h0.1; nlinarith
     · omega
   have h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j := by
     constructor
     · have := h0.1; nlinarith
     · omega
   exact (source_one_weakLC6 path ha1).1 i j h0 h1 h2

#print axioms source_next_horizontal_large7955
#print axioms source_next_horizontal7955
end
end MathGKM.Markov
