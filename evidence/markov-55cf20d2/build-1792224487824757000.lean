import MarkovTopSectorM55C
/-! Machine-authored 55cf20d2. Exact polynomial dependence on the free
parameter d, with its top-degree coefficient. No asymptotic inequality assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def topKernelPolyM55C (i s : ℕ) : Polynomial ℚ :=
 C ((s.choose i:ℚ)/(i+3).factorial)*
 (descPochhammer ℚ (i+3)).comp (X+C (s+i+8:ℚ))

def topMassPolyM55C (T i : ℕ) : Polynomial ℚ :=
 topKernelPolyM55C i T+4*∑ s ∈ range T, C ((T:ℚ)-s)*topKernelPolyM55C i s

def topLeadingM55C (T i : ℕ) : ℚ :=
 ((T.choose i:ℚ)+4*((T+1).choose (i+2):ℚ))/(i+3).factorial

theorem top_kernel_poly_evalM55C (d i s : ℕ) :
 (topKernelPolyM55C i s).eval d=(topKernelM55C d i s:ℚ) := by
 unfold topKernelPolyM55C topKernelM55C
 simp only [eval_mul,eval_C,eval_comp,eval_add,eval_X]
 push_cast
 rw [choose_poly_natM0D3]
 unfold choosePolyM0D3
 push_cast
 have h : (d:ℚ)+(s+i+8)=d+s+i+8 := by ring
 rw [h]
 ring

theorem top_mass_poly_evalM55C (d T i : ℕ) :
 (topMassPolyM55C T i).eval d=(topMassM55C d T i:ℚ) := by
 simp [topMassPolyM55C,topMassM55C,topLinearM55C,top_kernel_poly_evalM55C]

theorem top_kernel_poly_degreeM55C (i s : ℕ) : (topKernelPolyM55C i s).natDegree ≤ i+3 := by
 unfold topKernelPolyM55C
 have hd : ((descPochhammer ℚ (i+3)).comp (X+C (s+i+8:ℚ))).natDegree=i+3 := by
   rw [natDegree_comp,descPochhammer_natDegree,natDegree_X_add_C,mul_one]
 calc
  _ ≤ (C ((s.choose i:ℚ)/(i+3).factorial)).natDegree+
    ((descPochhammer ℚ (i+3)).comp (X+C (s+i+8:ℚ))).natDegree := natDegree_mul_le
  _ = i+3 := by rw [natDegree_C,hd,zero_add]

theorem top_kernel_poly_topM55C (i s : ℕ) :
 (topKernelPolyM55C i s).coeff (i+3)=(s.choose i:ℚ)/(i+3).factorial := by
 unfold topKernelPolyM55C
 rw [coeff_C_mul]
 have hd : ((descPochhammer ℚ (i+3)).comp (X+C (s+i+8:ℚ))).natDegree=i+3 := by
   rw [natDegree_comp,descPochhammer_natDegree,natDegree_X_add_C,mul_one]
 have hm := (monic_descPochhammer ℚ (i+3)).comp_X_add_C (s+i+8:ℚ)
 rw [←hd,coeff_natDegree,hm.leadingCoeff,mul_one]

theorem top_mass_poly_degreeM55C (T i : ℕ) : (topMassPolyM55C T i).natDegree ≤ i+3 := by
 unfold topMassPolyM55C
 apply natDegree_add_le_of_degree_le (top_kernel_poly_degreeM55C i T)
 apply (natDegree_mul_le.trans ?_)
 simp only [natDegree_ofNat,zero_add]
 apply natDegree_sum_le_of_forall_le
 intro s hs
 exact (natDegree_C_mul_le _ _).trans (top_kernel_poly_degreeM55C i s)

theorem top_choose_weightM55C (T i : ℕ) :
 (∑ s ∈ range T, ((T:ℤ)-s)*(s.choose i:ℤ))=((T+1).choose (i+2):ℤ) := by
 have h := choose_weighted_generalMB3E 0 i T
 simpa [Nat.choose_eq_zero_of_lt (show 1 < i+2 by omega),
   Nat.choose_eq_zero_of_lt (show 0 < i+1 by omega)] using h

theorem top_mass_poly_topM55C (T i : ℕ) :
 (topMassPolyM55C T i).coeff (i+3)=topLeadingM55C T i := by
 simp only [topMassPolyM55C,coeff_add,coeff_ofNat_mul,finsetSum_coeff,coeff_C_mul,top_kernel_poly_topM55C]
 have h := congrArg (fun z : ℤ => (z:ℚ)) (top_choose_weightM55C T i)
 push_cast at h
 unfold topLeadingM55C
 simp only [mul_div_assoc,←sum_div]
 rw [h]
 ring

end
end MathGKM.Markov
