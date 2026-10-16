import MarkovPositiveSourceMDAB
/-! Machine-authored ae9e841e. A positive transposed sum for every lower-row
coefficient. This is an identity, not an assertion of log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem binomial_product_liftMAE9 (s t m : ℕ) :
 (s.choose m:ℤ)*((t+s+3).choose s:ℤ)=
 ((t+m+3).choose m:ℤ)*((t+s+3).choose (t+m+3):ℤ) := by
 have h := Nat.choose_mul (n:=t+s+3) (k:=t+m+3) (s:=t+3) (by omega)
 rw [show t+s+3-(t+3)=s by omega,show t+m+3-(t+3)=m by omega] at h
 rw [←Nat.choose_symm (by omega : t+3 ≤ t+m+3),
   show t+m+3-(t+3)=m by omega,
   ←Nat.choose_symm (by omega : t+3 ≤ t+s+3),
   show t+s+3-(t+3)=s by omega] at h
 exact_mod_cast (by nlinarith [h] : s.choose m*(t+s+3).choose s=
   (t+m+3).choose m*(t+s+3).choose (t+m+3))

theorem binomial_vandermonde_liftMAE9 (d s t : ℕ) :
 ((d+s).choose t:ℤ)*((t+s+3).choose s:ℤ)=
 ∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*((t+m+3).choose m:ℤ)*
   ((t+s+3).choose (t+m+3):ℤ) := by
 have hv : ((d+s).choose t:ℤ)=
   ∑ m ∈ range (t+1), (s.choose m:ℤ)*(d.choose (t-m):ℤ) := by
   rw [Nat.add_comm d s,Nat.add_choose_eq,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
   push_cast
   rfl
 rw [hv,sum_mul]
 apply sum_congr rfl
 intro m hm
 have h := binomial_product_liftMAE9 s t m
 linear_combination (d.choose (t-m):ℤ)*h

def liftTermMAE9 (j t m : ℕ) : ℤ :=
 ((t+m+3).choose m:ℤ)*
   (((t+j+3).choose (t+m+3):ℤ)+4*((t+j+4).choose (t+m+5):ℤ))

theorem lower_row_liftMAE9 (d j t : ℕ) :
 (lowerRowMFFD (2*j+1+d) j).coeff (t+3)=
 ∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*liftTermMAE9 j t m := by
 rw [lower_row_positive_coeffMDAB _ j t (by omega)]
 rw [show 2*j+1+d-j-1=d+j by omega]
 have hs : (∑ s ∈ range j, ((j:ℤ)-s)*
   ((2*j+1+d-2*j+s-1).choose t:ℤ)*((t+s+3).choose s:ℤ))=
   ∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*((t+m+3).choose m:ℤ)*
     ((t+j+4).choose (t+m+5):ℤ) := by
   simp only [show ∀ s, 2*j+1+d-2*j+s-1=d+s by omega]
   simp_rw [mul_assoc,binomial_vandermonde_liftMAE9,mul_sum]
   rw [sum_comm]
   apply sum_congr rfl
   intro m hm
   have hw := weighted_chooseMDAB (t+3) (t+m+3) j (by omega)
   rw [show j+(t+3)+1=t+j+4 by omega,show t+m+3+2=t+m+5 by omega] at hw
   calc
    _ = (d.choose (t-m):ℤ)*((t+m+3).choose m:ℤ)*
      ∑ s ∈ range j, ((j:ℤ)-s)*((s+(t+3)).choose (t+m+3):ℤ) := by
       rw [mul_sum]
       apply sum_congr rfl
       intro s hss
       rw [show s+(t+3)=t+s+3 by omega]
       ring
    _ = _ := by rw [hw]; ring
 rw [hs,binomial_vandermonde_liftMAE9,mul_sum,←sum_add_distrib]
 apply sum_congr rfl
 intro m hm
 unfold liftTermMAE9
 ring

theorem source_lower_liftMAE9 (q j t : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r (t+3) j=
 ∑ m ∈ range (t+1), ((sourceNME9C q r-2*j-1).choose (t-m):ℤ)*
   liftTermMAE9 j t m := by
 rw [source_lower_rowMFFD q (t+3) j r hj]
 have hn : 2*j+1 ≤ sourceNME9C q r := by unfold sourceNME9C; split_ifs <;> omega
 have h := lower_row_liftMAE9 (sourceNME9C q r-2*j-1) j t
 rw [show 2*j+1+(sourceNME9C q r-2*j-1)=sourceNME9C q r by omega] at h
 exact h

end
end MathGKM.Markov
