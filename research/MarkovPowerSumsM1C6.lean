import MarkovRisingConvolutionM1C6
/-! Machine-authored 1c65a306. Symbolic summation identities, no finite scan. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 12000

theorem power_sum_0M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^0)=1 +
   1*(h:ℝ) := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_1M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^1)=(1/2)*(h:ℝ) +
   (1/2)*(h:ℝ)^2 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_2M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^2)=(1/6)*(h:ℝ) +
   (1/2)*(h:ℝ)^2 +
   (1/3)*(h:ℝ)^3 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_3M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^3)=(1/4)*(h:ℝ)^2 +
   (1/2)*(h:ℝ)^3 +
   (1/4)*(h:ℝ)^4 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_4M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^4)=(-1/30)*(h:ℝ) +
   (1/3)*(h:ℝ)^3 +
   (1/2)*(h:ℝ)^4 +
   (1/5)*(h:ℝ)^5 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_5M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^5)=(-1/12)*(h:ℝ)^2 +
   (5/12)*(h:ℝ)^4 +
   (1/2)*(h:ℝ)^5 +
   (1/6)*(h:ℝ)^6 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_6M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^6)=(1/42)*(h:ℝ) +
   (-1/6)*(h:ℝ)^3 +
   (1/2)*(h:ℝ)^5 +
   (1/2)*(h:ℝ)^6 +
   (1/7)*(h:ℝ)^7 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_7M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^7)=(1/12)*(h:ℝ)^2 +
   (-7/24)*(h:ℝ)^4 +
   (7/12)*(h:ℝ)^6 +
   (1/2)*(h:ℝ)^7 +
   (1/8)*(h:ℝ)^8 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_8M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^8)=(-1/30)*(h:ℝ) +
   (2/9)*(h:ℝ)^3 +
   (-7/15)*(h:ℝ)^5 +
   (2/3)*(h:ℝ)^7 +
   (1/2)*(h:ℝ)^8 +
   (1/9)*(h:ℝ)^9 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_9M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^9)=(-3/20)*(h:ℝ)^2 +
   (1/2)*(h:ℝ)^4 +
   (-7/10)*(h:ℝ)^6 +
   (3/4)*(h:ℝ)^8 +
   (1/2)*(h:ℝ)^9 +
   (1/10)*(h:ℝ)^10 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

theorem power_sum_10M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^10)=(5/66)*(h:ℝ) +
   (-1/2)*(h:ℝ)^3 +
   1*(h:ℝ)^5 +
   -1*(h:ℝ)^7 +
   (5/6)*(h:ℝ)^9 +
   (1/2)*(h:ℝ)^10 +
   (1/11)*(h:ℝ)^11 := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring

end
end MathGKM.Markov
