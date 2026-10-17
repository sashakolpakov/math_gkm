import MarkovTopFourthControlM97B
/-! Machine-authored 97b019af. Summation by parts for any symmetric inward
test function, retaining the endpoint-modified cut and its zero region. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

theorem finite_generator_partsM97B (m : ℕ) (w B D f g : ℕ → ℝ)
 (hB : B m=0) (hD : D 0=0)
 (hstep : ∀ k, k < m → w k*B k=w (k+1)*D (k+1)) :
 (∑ k ∈ range (m+1), w k*f k*(B k*(g (k+1)-g k)+D k*(g (k-1)-g k)))=
 -(∑ k ∈ range m, w k*B k*(f (k+1)-f k)*(g (k+1)-g k)) := by
 have h0 : (∑ k ∈ range (m+1), w k*f k*B k*(g (k+1)-g k))=
   ∑ k ∈ range m, w k*f k*B k*(g (k+1)-g k) := by
   rw [sum_range_succ,hB]; simp
 have h1 : (∑ k ∈ range (m+1), w k*f k*D k*(g (k-1)-g k))=
   -(∑ k ∈ range m, w k*B k*f (k+1)*(g (k+1)-g k)) := by
   rw [sum_range_succ']
   simp only [hD,mul_zero,zero_mul,add_zero,Nat.add_sub_cancel]
   rw [←sum_neg_distrib]
   apply sum_congr rfl; intro k hk
   have h := hstep k (mem_range.mp hk)
   linear_combination f (k+1)*(g k-g (k+1))*h
 simp only [mul_add,←mul_assoc,sum_add_distrib]
 rw [h0,h1,←sub_eq_add_neg,←sum_sub_distrib,←sum_neg_distrib]
 apply sum_congr rfl; intro k hk; ring

theorem cut_inward_edge_nonnegM97B (r m : ℕ) (g : ℕ → ℝ)
 (hs : ∀ k, k ≤ m → g (m-k)=g k)
 (hi : ∀ k, 2*k+1 ≤ m → g k ≤ g (k+1))
 (k : ℕ) (hk : k < m) :
 0 ≤ (steinCutM208 r m (k+1)-steinCutM208 r m k)*(g (k+1)-g k) := by
 by_cases hmid : 2*k+1 ≤ m
 · exact mul_nonneg (sub_nonneg.mpr (stein_cut_inwardM208 r m k hmid))
     (sub_nonneg.mpr (hi k hmid))
 · have hmid' : 2*(m-(k+1))+1 ≤ m := by omega
   have hc := stein_cut_inwardM208 r m (m-(k+1)) hmid'
   have hg := hi (m-(k+1)) hmid'
   rw [show m-(k+1)+1=m-k by omega,stein_cut_symmetricM208 r m k (by omega),
     stein_cut_symmetricM208 r m (k+1) (by omega)] at hc
   rw [show m-(k+1)+1=m-k by omega,hs k (by omega),hs (k+1) (by omega)] at hg
   exact mul_nonneg_of_nonpos_of_nonpos (sub_nonpos.mpr hc) (sub_nonpos.mpr hg)

theorem stein_generator_inward_nonposM97B (d i r m : ℕ) (g : ℕ → ℝ)
 (hs : ∀ k, k ≤ m → g (m-k)=g k)
 (hi : ∀ k, 2*k+1 ≤ m → g k ≤ g (k+1)) :
 (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   (steinBM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k*(g (k+1)-g k)+
    steinDM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k*(g (k-1)-g k))) ≤ 0 := by
 rw [finite_generator_partsM97B m (steinPairM208 d i m)
   (fun k => steinBM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k)
   (fun k => steinDM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k)
   (steinCutM208 r m) g (by simp [steinBM208]) (by simp [steinDM208])
   (fun k hk => by simpa only [Nat.cast_add,Nat.cast_one] using stein_pair_balanceM208 d i m k hk)]
 apply neg_nonpos.mpr
 apply sum_nonneg; intro k hk
 have hkR : (k:ℝ) < m := by exact_mod_cast mem_range.mp hk
 have hB : 0 ≤ steinBM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k := by
   unfold steinBM208
   have h1 : 0 ≤ (m:ℝ)-k := by linarith
   have h2 : 0 ≤ (d:ℝ)+2*i+9-((i:ℝ)+1)-3+m-k := by
     have : (0:ℝ) ≤ d := by positivity
     have : (0:ℝ) ≤ i := by positivity
     linarith
   positivity
 have h := mul_nonneg (mul_nonneg (stein_pair_positiveM208 d i m k).le hB)
   (cut_inward_edge_nonnegM97B r m g hs hi k (mem_range.mp hk))
 simpa only [mul_assoc] using h

end
end MathGKM.Markov
