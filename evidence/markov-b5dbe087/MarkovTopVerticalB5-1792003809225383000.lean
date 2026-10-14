import MarkovVerticalSourceB5
import MarkovVerticalAlgebraB5
import MarkovFibonacciLC6ade
/-! Machine-authored b5dbe087. Unbounded source vertical triples ending on
the top face. All raw coefficients, zeros and low-degree cases retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem source_top_vertical_largeB5 (path : List Bool) (i j : ℕ)
 (hij : 2 ≤ i+j)
 (hd : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨ha,hab,_⟩ := frame_reduced path
 let b : ℝ := (frame path).mid.a-1
 let n : ℝ := (frame path).mid.b-1
 let f : ℝ := (i+j).choose i
 have haR : (1:ℝ) ≤ (frame path).mid.a := by exact_mod_cast ha
 have habR : ((frame path).mid.a:ℝ)+1 ≤ (frame path).mid.b := by exact_mod_cast hab
 have hs : n+b=(i:ℝ)+j+1 := by
   have hd' : i+j+3=(frame path).mid.a+(frame path).mid.b := by omega
   have hr : (i:ℝ)+j+3=(frame path).mid.a+(frame path).mid.b := by exact_mod_cast hd'
   dsimp [n,b]; linarith
 have hm : ((j:ℝ)+1)*(coeff (frame path).mid.p i (j+1) : ℝ)=
   f*(b*(j+1)+n*i) := source_top_vertical_middleB5 path i j hd
 have hr : ((j:ℝ)+1)*(j+2)*(coeff (frame path).mid.p i (j+2) : ℝ)=
   ((i:ℝ)+j+1)*(i+j+2)*f := by
   rw [top_raw_coeff1998 path i (j+2) (by omega),← hd]
   exact top_vertical_last_binomialB5 i j
 have hl : 2*((i:ℝ)+j)*(i+j-1)*(coeff (frame path).mid.p i j : ℝ)=
   (n*(n-1)*i*(i-1)+2*(b*n+n-3*b-1)*i*j+b*(b-1)*j*(j-1))*f := by
   rw [source_top_low58 path i j hij hd]
   dsimp [n,b,f]; ring
 have h := vertical_triple_boundB5 i j b n f
   (coeff (frame path).mid.p i j) (coeff (frame path).mid.p i (j+1))
   (coeff (frame path).mid.p i (j+2)) (by dsimp [b]; linarith)
   (by dsimp [n,b]; linarith) hs hij hm hr hl
 exact_mod_cast h

theorem source_top_vertical_rawB5 (path : List Bool) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (hd : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2 := by
 by_cases hij : 2 ≤ i+j
 · exact source_top_vertical_largeB5 path i j hij hd
 · obtain ⟨ha,hab,_⟩ := frame_reduced path
   have ha1 : (frame path).mid.a=1 := by omega
   have h1 : InPolygon (frame path).mid.a (frame path).mid.b i (j+1) := by
     constructor
     · have := h0.1; nlinarith
     · omega
   have h2 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2) := by
     constructor
     · have := h0.1; nlinarith
     · omega
   exact (source_one_weakLC6 path ha1).2.1 i j h0 h1 h2

#print axioms source_top_vertical_largeB5
#print axioms source_top_vertical_rawB5
end
end MathGKM.Markov
