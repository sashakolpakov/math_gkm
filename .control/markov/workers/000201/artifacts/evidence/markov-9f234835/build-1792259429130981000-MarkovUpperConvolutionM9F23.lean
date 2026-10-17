import MarkovLowerSourceM9F23
import MarkovTopShiftME10
/-! Machine-authored 9f234835. The upper source sector has the same positive
ramp convolution as the lower sector. The central correction is not discarded. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2

theorem top_mass_diagonalM9F23 (h T i : ℕ) (hi : i ≤ T) :
 (topMassME10 h T i:ℝ)=lowerDiagMF88 i (T+h+1) (T-i) := by
 unfold topMassME10 topLinearM55C lowerDiagMF88
 rw [show i+(T-i)=T by omega,
   diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _)
     (T+h+1) T (T+1) (by omega),sum_range_succ']
 have hz : rampWeightMF88 (0:ℤ)=1 := by norm_num [rampWeightMF88]
 simp only [Nat.cast_zero,sub_zero,hz,one_mul,nbSeq_natMDB9,chooseSeq_natMDB9]
 rw [←sum_range_reflect (fun s => ((T:ℤ)-s)*topKernelME10 h i s) T]
 unfold topKernelME10
 push_cast
 rw [mul_sum]
 have hs : (∑ r ∈ range T,
   4*((T:ℝ)-((T-1-r:ℕ):ℝ))*((T-1-r).choose i:ℝ)*
     ((h+(T-1-r)+i+4).choose (i+3):ℝ))=
   ∑ r ∈ range T, rampWeightMF88 ((r+1:ℕ):ℤ)*
     nbSeqMDB9 (i+3) ((T+h+1:ℕ)-(r+1))*chooseSeqMDB9 i ((T:ℤ)-(r+1)) := by
   apply sum_congr rfl
   intro r hr
   have hrT : r<T := mem_range.mp hr
   have hJ : ((T+h+1:ℕ):ℤ)-(r+1)=((T+h-r:ℕ):ℤ) := by omega
   have hM : (T:ℤ)-(r+1)=((T-1-r:ℕ):ℤ) := by omega
   rw [hJ,hM,nbSeq_natMDB9,chooseSeq_natMDB9]
   have hw : rampWeightMF88 ((r+1:ℕ):ℤ)=4*(r+1:ℝ) := by
     simp [rampWeightMF88]; norm_cast
   rw [hw,show T+h-r+(i+3)=h+(T-1-r)+i+4 by omega]
   have he : (T:ℝ)-(T-1-r:ℕ)=r+1 := by
     exact_mod_cast (show (T:ℤ)-(T-1-r:ℕ)=(r:ℤ)+1 by omega)
   rw [he]
   ring
 simp only [Nat.cast_add,Nat.cast_one,mul_assoc] at hs ⊢
 rw [hs,show T+h+1+(i+3)=h+T+i+4 by omega]
 ring

theorem source_upper_diagonal_modelM9F23 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : 3 ≤ i) (hj : sourceNME9C q r ≤ j+q) (hd : i+j ≤ sourceNME9C q r+2) :
 (threeRawM9E2 q r i j:ℝ)=lowerDiagMF88 (i-3) j (sourceNME9C q r+2-i-j) := by
 let n := sourceNME9C q r
 have hn : 3*q+1 ≤ n := by
   dsimp [n]; cases r <;> simp [sourceNME9C] <;> omega
 let T := n-j-1
 let h := 2*j-n
 have hjn : n ≤ j+q := hj
 have hdn : i+j ≤ n+2 := hd
 have ht : T+3 ≤ q+2 := by dsimp [T]; omega
 have heN : n=2*T+h+2 := by dsimp [T,h]; omega
 have heJ : n+2-(T+3)=j := by dsimp [T]; omega
 have heT : i-3 ≤ T := by dsimp [T]; omega
 have hc := source_top_coeffMB3E q (T+3) i r hq ht
 change threeRawM9E2 q r i (n+2-(T+3))=(topTemplateMB3E n (T+3)).coeff i at hc
 rw [heJ,heN,show i=i-3+3 by omega,top_shift_massME10] at hc
 rw [hc,top_mass_diagonalM9F23 h T (i-3) heT]
 congr 1 <;> dsimp [T,h,n] <;> omega

end
end MathGKM.Markov
