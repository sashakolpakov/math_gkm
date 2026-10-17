import MarkovLowerKernelLiftMF88
import MarkovKernelSequencesMDB9
/-! Machine-authored f88f6a75. A positive diagonal-convolution model for
the lower kernel. Domain restrictions are retained in the source bridge. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 8000000

def rampWeightMF88 (r : ℤ) : ℝ := if r<0 then 0 else if r=0 then 1 else 4*r

theorem ramp_weight_nonnegMF88 (r : ℤ) : 0 ≤ rampWeightMF88 r := by
 unfold rampWeightMF88
 split_ifs <;> first | positivity | have hr : (0:ℝ) ≤ r := by exact_mod_cast (by omega : 0 ≤ r); positivity

theorem ramp_weight_zeroMF88 (r : ℤ) (hr : r<0) : rampWeightMF88 r=0 := by
 simp [rampWeightMF88,hr]

theorem ramp_weight_crossMF88 : CrossLC rampWeightMF88 := by
 intro i j hij
 by_cases hi : i<0
 · rw [ramp_weight_zeroMF88 i hi,zero_mul]
   exact mul_nonneg (ramp_weight_nonnegMF88 _) (ramp_weight_nonnegMF88 _)
 have hj : ¬j<0 := by omega
 have hi1 : ¬i+1<0 := by omega
 have hj1 : ¬j+1<0 := by omega
 simp only [rampWeightMF88,hi,hj,hi1,hj1,if_false,
   if_neg (show i+1≠0 by omega),if_neg (show j+1≠0 by omega)]
 by_cases hi0 : i=0
 · subst i
   by_cases hj0 : j=0
   · subst j; norm_num
   · rw [if_pos rfl,if_neg hj0]
     have hjR : (1:ℝ) ≤ j := by exact_mod_cast (by omega : 1 ≤ j)
     push_cast
     nlinarith
 · have hj0 : j≠0 := by omega
   rw [if_neg hi0,if_neg hj0]
   have hR : (i:ℝ) ≤ j := by exact_mod_cast hij
   push_cast
   nlinarith

def lowerDiagMF88 (t j k : ℕ) : ℝ :=
 diagSumMDB9 (nbSeqMDB9 (t+3)) (chooseSeqMDB9 t) rampWeightMF88 j (t+k)

theorem lower_diag_rowMF88 (t j k : ℕ) :
 lowerDiagMF88 t j k*lowerDiagMF88 t (j+2) k ≤ lowerDiagMF88 t (j+1) k^2 :=
 diagSum_rowMDB9 _ _ _ (nbSeq_crossMDB9 _) (chooseSeq_crossMDB9 _) ramp_weight_crossMF88
   (nbSeq_nonnegMDB9 _) (chooseSeq_nonnegMDB9 _) ramp_weight_nonnegMF88
   (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _) ramp_weight_zeroMF88 _ _

theorem lower_diag_columnMF88 (t j k : ℕ) :
 lowerDiagMF88 t j k*lowerDiagMF88 t j (k+2) ≤ lowerDiagMF88 t j (k+1)^2 := by
 unfold lowerDiagMF88
 simp only [diagSum_swapMDB9 (nbSeqMDB9 (t+3)) (chooseSeqMDB9 t)]
 simpa only [Nat.add_assoc] using
   diagSum_rowMDB9 (chooseSeqMDB9 t) (nbSeqMDB9 (t+3)) rampWeightMF88
     (chooseSeq_crossMDB9 _) (nbSeq_crossMDB9 _) ramp_weight_crossMF88
     (chooseSeq_nonnegMDB9 _) (nbSeq_nonnegMDB9 _) ramp_weight_nonnegMF88
     (chooseSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _) ramp_weight_zeroMF88 (t+k) j

theorem lower_diag_minorMF88 (t j k : ℕ) :
 lowerDiagMF88 t (j+1) k*lowerDiagMF88 t j (k+1) ≤
 lowerDiagMF88 t j k*lowerDiagMF88 t (j+1) (k+1) := by
 simpa only [lowerDiagMF88,Nat.add_assoc] using
   diagSum_minorMDB9 (nbSeqMDB9 (t+3)) (chooseSeqMDB9 t) rampWeightMF88
     (nbSeq_crossMDB9 _) (chooseSeq_crossMDB9 _) ramp_weight_nonnegMF88
     (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _) j (t+k)

theorem lower_row_diagonalMF88 (n j t : ℕ) (hn : 2*j+1 ≤ n) (ht : t+j+1 ≤ n) :
 ((lowerRowMFFD n j).coeff (t+3):ℝ)=lowerDiagMF88 t j (n-j-t-1) := by
 rw [lower_row_positive_coeffMDAB n j t hn]
 unfold lowerDiagMF88
 have hm : t+(n-j-t-1)=n-j-1 := by omega
 rw [hm,diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _) j
   (n-j-1) (j+1) (by omega),sum_range_succ']
 have hz : rampWeightMF88 (0:ℤ)=1 := by norm_num [rampWeightMF88]
 simp only [Nat.cast_zero,sub_zero,hz,one_mul,nbSeq_natMDB9,chooseSeq_natMDB9]
 rw [←sum_range_reflect (fun s => ((j:ℤ)-s)*((n-2*j+s-1).choose t:ℤ)*
   ((t+s+3).choose s:ℤ)) j]
 push_cast
 have hbase : ((t+j+3).choose j:ℝ)=((j+(t+3)).choose (t+3):ℝ) := by
   congr 1
   rw [show t+j+3=j+(t+3) by omega,Nat.choose_symm_add]
 rw [hbase]
 rw [mul_sum]
 have hs : (∑ r ∈ range j,
   4*((j:ℝ)-(j-1-r))*((n-2*j+(j-1-r)-1).choose t:ℝ)*
     ((t+(j-1-r)+3).choose (j-1-r):ℝ))=
   ∑ r ∈ range j, rampWeightMF88 ((r+1:ℕ):ℤ)*
     nbSeqMDB9 (t+3) ((j:ℤ)-(r+1))*chooseSeqMDB9 t ((n-j-1:ℕ)-(r+1)) := by
   apply sum_congr rfl
   intro r hr
   have hrj : r<j := mem_range.mp hr
   have hJ : (j:ℤ)-(r+1)=((j-1-r:ℕ):ℤ) := by omega
   have hM : ((n-j-1:ℕ):ℤ)-(r+1)=((n-j-r-2:ℕ):ℤ) := by omega
   rw [hJ,hM,nbSeq_natMDB9,chooseSeq_natMDB9]
   have hw : rampWeightMF88 ((r+1:ℕ):ℤ)=4*(r+1:ℝ) := by
     simp [rampWeightMF88]; norm_cast
   rw [hw,show n-2*j+(j-1-r)-1=n-j-r-2 by omega]
   rw [show t+(j-1-r)+3=(j-1-r)+(t+3) by omega,Nat.choose_symm_add]
   have he : (j:ℝ)-(j-1-r:ℕ)=r+1 := by
     have heN : j=(j-1-r)+(r+1) := by omega
     exact_mod_cast (show (j:ℤ)-(j-1-r:ℕ)=(r:ℤ)+1 by omega)
   rw [he]
   ring
 rw [←hs]
 ring

end
end MathGKM.Markov
