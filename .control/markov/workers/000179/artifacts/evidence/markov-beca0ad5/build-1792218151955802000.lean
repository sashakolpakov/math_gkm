import MarkovSecondTopMBEC
/-! Machine-authored beca0ad5. Exact attachment of the second-top scalar. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

def topBinMBEC (k t : ℕ) : ℝ := ((t+k+5).choose (k+2):ℝ)

theorem top_bin_nonnegMBEC (k t : ℕ) : 0 ≤ topBinMBEC k t := by
 unfold topBinMBEC
 positivity

theorem top_choose_ratiosMBEC (k t : ℕ) :
 ((t+k+4).choose (k+1):ℝ) = (k+2:ℝ)/(t+k+5)*topBinMBEC k t ∧
 ((t+k+3).choose k:ℝ) = (k+2:ℝ)*(k+1)/((t+k+5)*(t+k+4))*topBinMBEC k t := by
 have h0 := Nat.add_one_mul_choose_eq (t+k+4) (k+1)
 have h1 := Nat.add_one_mul_choose_eq (t+k+3) k
 have h0' : (t+k+5:ℝ)*((t+k+4).choose (k+1):ℝ)=(k+2:ℝ)*topBinMBEC k t := by
   unfold topBinMBEC
   exact_mod_cast (by simpa [Nat.add_assoc] using h0)
 have h1' : (t+k+4:ℝ)*((t+k+3).choose k:ℝ)=(k+1:ℝ)*((t+k+4).choose (k+1):ℝ) := by
   exact_mod_cast (by simpa [Nat.add_assoc] using h1)
 have hx : (t+k+5:ℝ)≠0 := by positivity
 have hy : (t+k+4:ℝ)≠0 := by positivity
 constructor
 · field_simp
   nlinarith only [h0']
 · field_simp
   linear_combination (t+k+5:ℝ)*h1'+(k+1:ℝ)*h0'

theorem q_product_pre_normalizedMBEC (k s t : ℕ) :
 (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) t).coeff (2*k+3) =
 topBinMBEC k s*topBinMBEC k t*
   (4*(k+2:ℝ)*(1/(s+k+5)+1/(t+k+5))) := by
 have h := q_product_pretopMA45 (k+1) s t
 simp only [show (k+1)+1=k+2 by omega,show 2*(k+1)+1=2*k+3 by omega,
   show s+(k+1)+4=s+k+5 by omega,show t+(k+1)+4=t+k+5 by omega,
   show s+(k+1)+3=s+k+4 by omega,show t+(k+1)+3=t+k+4 by omega] at h
 rw [h,(top_choose_ratiosMBEC k s).1,(top_choose_ratiosMBEC k t).1]
 change 4*(topBinMBEC k s*((k+2:ℝ)/(t+k+5)*topBinMBEC k t)+
   ((k+2:ℝ)/(s+k+5)*topBinMBEC k s)*topBinMBEC k t)=_
 ring

theorem q_product_second_normalizedMBEC (k s t : ℕ) :
 (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) t).coeff (2*k+2) =
 topBinMBEC k s*topBinMBEC k t*
   (8*(k+2:ℝ)*(k+1)*(1/((s+k+5)*(s+k+4))+1/((t+k+5)*(t+k+4)))+
     16*(k+2:ℝ)^2/((s+k+5)*(t+k+5))) := by
 rw [q_product_second_topMBEC,(top_choose_ratiosMBEC k s).1,
   (top_choose_ratiosMBEC k t).1,(top_choose_ratiosMBEC k s).2,
   (top_choose_ratiosMBEC k t).2]
 change 8*topBinMBEC k s*((k+2:ℝ)*(k+1)/((t+k+5)*(t+k+4))*topBinMBEC k t)+
   16*((k+2:ℝ)/(s+k+5)*topBinMBEC k s)*((k+2:ℝ)/(t+k+5)*topBinMBEC k t)+
   8*((k+2:ℝ)*(k+1)/((s+k+5)*(s+k+4))*topBinMBEC k s)*topBinMBEC k t=_
 ring

theorem q_second_last_adjacentMBEC (k s : ℕ) :
 (qPolyM7E2 (k+2) (s+1)^2).coeff (2*k+2)*
   (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) (s+2)).coeff (2*k+3) ≤
 (qPolyM7E2 (k+2) (s+1)^2).coeff (2*k+3)*
   (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) (s+2)).coeff (2*k+2) := by
 rw [pow_two,q_product_second_normalizedMBEC,q_product_pre_normalizedMBEC,
   q_product_pre_normalizedMBEC,q_product_second_normalizedMBEC]
 have h := second_top_scalarMBEC (s+k+5:ℝ) (k+2:ℝ) (by positivity) (by positivity)
 have hn : 0 ≤ topBinMBEC k s*topBinMBEC k (s+1)^2*topBinMBEC k (s+2) := by
   exact mul_nonneg (mul_nonneg (top_bin_nonnegMBEC _ _) (sq_nonneg _)) (top_bin_nonnegMBEC _ _)
 have hh := mul_le_mul_of_nonneg_left h hn
 push_cast
 convert hh using 1 <;> ring_nf <;> ring

end
end MathGKM.Markov
