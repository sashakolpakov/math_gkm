import MarkovTopCoefficientsMB3E
/-! Machine-authored b3eed364. Exceptional upper coefficients, exactly and
without dropping zeros. The third coefficient is treated by a finite sum. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem sum_first_threeMB3E (f : ℕ → ℤ) (t : ℕ) (ht : 3 ≤ t)
 (hf : ∀ s, 3 ≤ s → s<t → f s=0) : ∑ s ∈ range t, f s=f 0+f 1+f 2 := by
 have he : (∑ s ∈ range 3, f s)=∑ s ∈ range t, f s := by
   apply sum_subset (range_mono ht)
   intro s hs h3
   exact hf s (by simpa using h3) (mem_range.mp hs)
 rw [←he]
 norm_num [sum_range_succ]

theorem top_edge_coeffsMB3E (n t : ℕ) (hn : 2*t ≤ n) (ht : 3 ≤ t) :
 (topTemplateMB3E n t).coeff 0=0 ∧
 (topTemplateMB3E n t).coeff 1=4*((n:ℤ)+6-3*t) ∧
 (topTemplateMB3E n t).coeff 2=4*((t:ℤ)-2)*((n-2*t+6).choose 2:ℤ) := by
 have he (i : ℕ) (hi : i ≤ 2) :
   (topTemplateMB3E n t).coeff i=4*(
   (t:ℤ)*(topDiagonalDeltaMB3E (n-2*t) 0).coeff i+
   ((t:ℤ)-1)*(topDiagonalDeltaMB3E (n-2*t+2) 1).coeff i+
   ((t:ℤ)-2)*(topDiagonalDeltaMB3E (n-2*t+4) 2).coeff i) := by
   rw [top_template_sumMB3E n t hn]
   simp only [coeff_add,coeff_ofNat_mul,finsetSum_coeff,coeff_C_mul]
   rw [top_delta_low_zeroMB3E n t i (by omega) ht hi,zero_add]
   congr 1
   have hs := sum_first_threeMB3E
     (fun s => ((t:ℤ)-s)*(topDiagonalDeltaMB3E (n-2*t+2*s) s).coeff i) t ht
     (fun s h3 hs => by rw [top_delta_low_zeroMB3E _ s i (by omega) h3 hi,mul_zero])
   simpa using hs
 have hnz : ((n-2*t:ℕ):ℤ)=(n:ℤ)-2*t := by rw [Nat.cast_sub hn]; push_cast; ring
 have h0 := he 0 (by omega)
 have h1 := he 1 (by omega)
 have h2 := he 2 (by omega)
 rw [top_delta_zeroMB3E,top_delta_oneMB3E,top_delta_twoMB3E] at h0 h1 h2
 norm_num [coeff_C_mul,coeff_one] at h0 h1 h2
 push_cast at h1
 rw [hnz] at h1
 refine ⟨by linear_combination h0,by linear_combination h1,?_⟩
 simpa only [show n-2*t+4+2=n-2*t+6 by omega] using h2

theorem choose_prefix_generalMB3E (a k m : ℕ) :
 (∑ s ∈ range m, ((a+s).choose k:ℤ))=
 ((a+m).choose (k+1):ℤ)-(a.choose (k+1):ℤ) := by
 induction m with
 | zero => simp
 | succ m ih =>
   rw [sum_range_succ,ih,show a+(m+1)=a+m+1 by omega,Nat.choose_succ_succ]
   push_cast
   ring

theorem choose_weighted_generalMB3E (a k m : ℕ) :
 (∑ s ∈ range m, ((m:ℤ)-s)*((a+s).choose k:ℤ))=
 ((a+m+1).choose (k+2):ℤ)-((a+1).choose (k+2):ℤ)-m*(a.choose (k+1):ℤ) := by
 induction m with
 | zero => simp
 | succ m ih =>
   rw [sum_range_succ]
   have hs : (∑ s ∈ range m, (((m+1:ℕ):ℤ)-s)*((a+s).choose k:ℤ))=
     (∑ s ∈ range m, ((m:ℤ)-s)*((a+s).choose k:ℤ))+
     ∑ s ∈ range m, ((a+s).choose k:ℤ) := by
     rw [←sum_add_distrib]
     apply sum_congr rfl
     intro s hs
     push_cast
     ring
   rw [hs,ih,choose_prefix_generalMB3E]
   have h0 : ((a+m+1).choose (k+1):ℤ)=((a+m).choose k:ℤ)+((a+m).choose (k+1):ℤ) := by
     exact_mod_cast Nat.choose_succ_succ (a+m) k
   have h1 : ((a+m+2).choose (k+2):ℤ)=((a+m+1).choose (k+1):ℤ)+
     ((a+m+1).choose (k+2):ℤ) := by
     exact_mod_cast Nat.choose_succ_succ (a+m+1) (k+1)
   rw [show a+(m+1)+1=a+m+2 by omega]
   push_cast
   linear_combination h0+h1

theorem top_third_coeffMB3E (n t : ℕ) (hn : 2*t ≤ n) (ht : 3 ≤ t) :
 (topTemplateMB3E n t).coeff 3=
 ((n+5-t).choose 3:ℤ)+4*(
 ((n-t+6).choose 5:ℤ)-((n-2*t+9).choose 5:ℤ)-
 ((t:ℤ)-3)*((n-2*t+8).choose 4:ℤ)) := by
 have he := top_positive_formulaMB3E n t 0 hn
 simp only [Nat.zero_add,Nat.add_zero,Nat.choose_zero_right,Nat.cast_one,
   one_mul,topPositiveMB3E,if_pos ht] at he
 rw [he]
 congr 1
 congr 1
 let f : ℕ → ℤ := fun s => ((t:ℤ)-s)*
   (if 3 ≤ s then ((n-2*t+s+5).choose 3:ℤ) else 0)
 have hs := sum_range_add f 3 (t-3)
 rw [show 3+(t-3)=t by omega] at hs
 have hzero : (∑ s ∈ range 3, f s)=0 := by norm_num [f,sum_range_succ]
 rw [hzero,zero_add] at hs
 change (∑ s ∈ range t, f s)=_
 rw [hs]
 have heq : (∑ s ∈ range (t-3), f (3+s))=
   ∑ s ∈ range (t-3), (((t-3:ℕ):ℤ)-s)*((n-2*t+8+s).choose 3:ℤ) := by
   apply sum_congr rfl
   intro s hs
   dsimp [f]
   rw [if_pos (by omega : 3 ≤ 3+s),Nat.cast_sub ht]
   push_cast
   rw [show n-2*t+(3+s)+5=n-2*t+8+s by omega]
   ring
 rw [heq,choose_weighted_generalMB3E]
 rw [show n-2*t+8+(t-3)+1=n-t+6 by omega,
   show n-2*t+8+1=n-2*t+9 by omega,Nat.cast_sub ht]
 norm_num

end
end MathGKM.Markov
