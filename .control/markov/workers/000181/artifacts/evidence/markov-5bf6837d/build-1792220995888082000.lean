import MarkovVarianceContractionM1C6
/-! Machine-authored 5bf6837d. Finite covariance comparison and exact
mass/moment identities for the outward-biased half-step shift. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

theorem weighted_covarianceM5BF (N : ℕ) (w x b : ℕ → ℝ)
 (hw : ∀ i, i<N → 0≤w i)
 (hb : ∀ i, i<N → ∀ k, k<N → x i≤x k → b i≤b k) :
 (∑ i ∈ range N, w i*x i)*(∑ i ∈ range N, w i*b i) ≤
 (∑ i ∈ range N, w i)*(∑ i ∈ range N, w i*b i*x i) := by
 have H : 0≤∑ i ∈ range N, ∑ k ∈ range N,
   w i*w k*(x i-x k)*(b i-b k) := by
   apply sum_nonneg; intro i hi
   apply sum_nonneg; intro k hk
   have hi' := mem_range.mp hi
   have hk' := mem_range.mp hk
   have hp : 0≤(x i-x k)*(b i-b k) := by
     rcases le_total (x i) (x k) with hh|hh
     · exact mul_nonneg_of_nonpos_of_nonpos (sub_nonpos.mpr hh) (sub_nonpos.mpr (hb i hi' k hk' hh))
     · exact mul_nonneg (sub_nonneg.mpr hh) (sub_nonneg.mpr (hb k hk' i hi' hh))
   simpa only [mul_assoc] using mul_nonneg (mul_nonneg (hw i hi') (hw k hk')) hp
 have he : (∑ i ∈ range N, ∑ k ∈ range N,
   w i*w k*(x i-x k)*(b i-b k))=
   2*((∑ i ∈ range N,w i)*(∑ i ∈ range N,w i*b i*x i)-
     (∑ i ∈ range N,w i*x i)*(∑ i ∈ range N,w i*b i)) := by
   calc
    _ = ∑ i ∈ range N,∑ k ∈ range N,
      ((w i*b i*x i)*w k+w i*(w k*b k*x k)-
        (w i*x i)*(w k*b k)-(w i*b i)*(w k*x k)) := by
      apply sum_congr rfl; intro i hi
      apply sum_congr rfl; intro k hk
      ring
    _ = _ := by
      simp only [sum_sub_distrib,sum_add_distrib,←mul_sum,←sum_mul]
      ring
 rw [he] at H
 linarith

theorem outward_sumM5BF (H : ℕ) (f : ℕ → ℝ) (y : ℝ) (F : ℝ → ℝ) :
 (∑ t ∈ range (H+1),
   (((y-(t+1))*f (t+1)*f (H-t)+(y-(H-t+1))*f t*f (H-t+1))*
     F ((t:ℝ)-(H:ℝ)/2)))+
 y*f 0*f (H+1)*F (-(H:ℝ)/2-1)+
 y*f (H+1)*f 0*F ((H:ℝ)/2+1)=
 ∑ r ∈ range (H+2),
   ((y-r)*F ((r:ℝ)-(H:ℝ)/2-1)+(y-(H+1-r))*F ((r:ℝ)-(H:ℝ)/2))*
     f r*f (H+1-r) := by
 have hsplit : (∑ r ∈ range (H+2),
   ((y-r)*F ((r:ℝ)-(H:ℝ)/2-1)+(y-(H+1-r))*F ((r:ℝ)-(H:ℝ)/2))*
     f r*f (H+1-r))=
   (∑ r ∈ range (H+2), (y-r)*f r*f (H+1-r)*F ((r:ℝ)-(H:ℝ)/2-1))+
   (∑ r ∈ range (H+2), (y-(H+1-r))*f r*f (H+1-r)*F ((r:ℝ)-(H:ℝ)/2)) := by
   rw [←sum_add_distrib]
   apply sum_congr rfl; intro r hr; ring
 rw [hsplit]
 rw [show H+2=(H+1)+1 by omega]
 rw [sum_range_succ' (fun r => (y-r)*f r*f (H+1-r)*F ((r:ℝ)-(H:ℝ)/2-1)),
   sum_range_succ (fun r => (y-(H+1-r))*f r*f (H+1-r)*F ((r:ℝ)-(H:ℝ)/2))]
 have he : (∑ t ∈ range (H+1),
   (((y-(t+1))*f (t+1)*f (H-t)+(y-(H-t+1))*f t*f (H-t+1))*F ((t:ℝ)-(H:ℝ)/2)))=
   (∑ r ∈ range (H+1), (y-((r+1:ℕ):ℝ))*f (r+1)*f (H+1-(r+1))*F (((r+1:ℕ):ℝ)-(H:ℝ)/2-1))+
   (∑ r ∈ range (H+1), (y-(H+1-r))*f r*f (H+1-r)*F ((r:ℝ)-(H:ℝ)/2)) := by
   rw [←sum_add_distrib]
   apply sum_congr rfl; intro r hr
   have hr' : r≤H := by simpa using hr
   rw [show H+1-(r+1)=H-r by omega,show H+1-r=H-r+1 by omega]
   push_cast
   congr 1
   <;> ring
 rw [he]
 simp only [Nat.cast_zero,sub_zero,zero_sub,Nat.sub_self,Nat.cast_add,Nat.cast_one]
 have ha : (H:ℝ)+1-(H:ℝ)/2=(H:ℝ)/2+1 := by ring
 rw [ha]
 ring

end
end MathGKM.Markov
