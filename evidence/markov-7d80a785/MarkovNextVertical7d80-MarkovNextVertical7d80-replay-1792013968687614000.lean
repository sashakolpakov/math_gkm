import MarkovVerticalSource7d80
import MarkovVerticalAlgebra7d80
import MarkovVerticalMixed7d80
import MarkovVerticalSmall7d80
import MarkovFibonacciLC6ade
/-! Machine-authored 7d80a785. Full source next-upper-strip vertical inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_next_vertical_large7d80 (path : List Bool) (i j : ℕ)
 (ha4 : 4 ≤ (frame path).mid.a)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨ha,hab,_⟩ := frame_reduced path
 have hij : 3 ≤ i+j := by omega
 obtain ⟨s,hl⟩ := source_next_low7955 path i j hij hd
 have hm := source_vertical_middle7d80 path i j hij hd
 have hr := source_vertical_last7d80 path i j hd
 have haR : (4:ℝ) ≤ (frame path).mid.a := by exact_mod_cast ha4
 have habR : ((frame path).mid.a:ℝ)+1 ≤ (frame path).mid.b := by exact_mod_cast hab
 have hs : ((frame path).mid.b-1 : ℝ)+((frame path).mid.a-1 : ℝ)=(i:ℝ)+j+2 := by
   have hnat : i+j+4=(frame path).mid.a+(frame path).mid.b := by omega
   have hR : (i:ℝ)+j+4=(frame path).mid.a+(frame path).mid.b := by exact_mod_cast hnat
   linarith
 have hg := vertical_gap_nonneg7d80 i j ((frame path).mid.a-1) (by linarith) (by linarith)
 have h := vertical_triple_bound7d80 i j ((frame path).mid.a-1) ((frame path).mid.b-1)
   ((i+j).choose i) (coeff (frame path).mid.p i j) (coeff (frame path).mid.p i (j+1))
   (coeff (frame path).mid.p i (j+2)) s 0 (by linarith) (by linarith) hs hij
   (by positivity) hg hm hr hl
 exact_mod_cast h

theorem source_next_vertical_small7d80 (path : List Bool) (i j : ℕ)
 (ha2 : 2 ≤ (frame path).mid.a) (ha3 : (frame path).mid.a ≤ 3)
 (hij : 3 ≤ i+j)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨ha,hab,_⟩ := frame_reduced path
 have hsum : i+j+4=(frame path).mid.a+(frame path).mid.b := by omega
 have haR : (2:ℝ) ≤ (frame path).mid.a := by exact_mod_cast ha2
 have habR : ((frame path).mid.a:ℝ)+1 ≤ (frame path).mid.b := by exact_mod_cast hab
 have hs : ((frame path).mid.b-1 : ℝ)+((frame path).mid.a-1 : ℝ)=(i:ℝ)+j+2 := by
   have hR : (i:ℝ)+j+4=(frame path).mid.a+(frame path).mid.b := by exact_mod_cast hsum
   linarith
 have hcast : (((frame path).mid.a-1 : ℕ):ℝ)=(frame path).mid.a-1 := by
   rw [Nat.cast_sub (by omega : 1 ≤ (frame path).mid.a)]
   norm_num
 have hg := vertical_small_gap7d80 i j ((frame path).mid.a-1) (by omega) hij
   (by rw [hcast]; linarith)
 rw [hcast] at hg
 have hex : ∃ s : ℕ, (if i=1 then (2:ℝ) else 0) ≤ s ∧
   6*((i:ℝ)+j)*(i+j-1)*(i+j-2)*(coeff (frame path).mid.p i j : ℝ)=
   nextT7955 i j ((frame path).mid.a-1) ((frame path).mid.b-1) s*((i+j).choose i : ℝ) := by
   by_cases hi : i=1
   · have hab2 : (frame path).mid.a+2 ≤ (frame path).mid.b := by
       have hp := h0.1
       rcases (show (frame path).mid.a=2 ∨ (frame path).mid.a=3 by omega) with h | h
       · rw [h,hi] at hp hsum
         rw [h]
         nlinarith
       · rw [h,hi] at hp hsum
         rw [h]
         nlinarith
     obtain ⟨s,hss,hl⟩ := source_vertical_low_mixed7d80 path i j hij ha2 hab2 hd
     refine ⟨s,?_,hl⟩
     simp only [if_pos hi]
     exact_mod_cast hss
   · obtain ⟨s,hl⟩ := source_next_low7955 path i j hij hd
     refine ⟨s,?_,hl⟩
     simp only [if_neg hi]
     positivity
 obtain ⟨s,hss,hl⟩ := hex
 have hm := source_vertical_middle7d80 path i j hij hd
 have hr := source_vertical_last7d80 path i j hd
 have h := vertical_triple_bound7d80 i j ((frame path).mid.a-1) ((frame path).mid.b-1)
   ((i+j).choose i) (coeff (frame path).mid.p i j) (coeff (frame path).mid.p i (j+1))
   (coeff (frame path).mid.p i (j+2)) s (if i=1 then 2 else 0)
   (by linarith) (by linarith) hs hij hss hg hm hr hl
 exact_mod_cast h

theorem source_next_vertical7d80 (path : List Bool) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨ha,hab,hcop⟩ := frame_reduced path
 by_cases ha1 : (frame path).mid.a=1
 · have h1 : InPolygon (frame path).mid.a (frame path).mid.b i (j+1) := by
     constructor
     · have := h0.1; nlinarith
     · omega
   have h2 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2) := by
     constructor
     · have := h0.1; nlinarith
     · omega
   exact (source_one_weakLC6 path ha1).2.1 i j h0 h1 h2
 · by_cases ha4 : 4 ≤ (frame path).mid.a
   · exact source_next_vertical_large7d80 path i j ha4 hd
   · have hij : 3 ≤ i+j := by
       have hlo : (frame path).mid.a ≤ i+j := by
         have hh := h0.1
         nlinarith [Nat.mul_le_mul_right j (Nat.le_of_lt hab)]
       by_contra hn
       have ea : (frame path).mid.a=2 := by omega
       have eb : (frame path).mid.b=4 := by omega
       rw [ea,eb] at hcop
       norm_num at hcop
     exact source_next_vertical_small7d80 path i j (by omega) (by omega) hij h0 hd

#print axioms source_next_vertical7d80
end
end MathGKM.Markov
