import MarkovBandSumM831
import MarkovBinomialLiftMAE9
/-! Machine-authored 6576ccc5. An exact positive finite sum for the
smoothed correction, with summation length controlled by the column index.
No log-concavity is assumed in this representation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem binomial_product_offsetM657 (s t m c : ℕ) :
 (s.choose m:ℤ)*((t+s+c).choose s:ℤ)=
 ((t+m+c).choose m:ℤ)*((t+s+c).choose (t+m+c):ℤ) := by
 have h := Nat.choose_mul (n:=t+s+c) (k:=t+m+c) (s:=t+c) (by omega)
 rw [show t+s+c-(t+c)=s by omega,show t+m+c-(t+c)=m by omega] at h
 rw [←Nat.choose_symm (by omega : t+c ≤ t+m+c),
   show t+m+c-(t+c)=m by omega,
   ←Nat.choose_symm (by omega : t+c ≤ t+s+c),
   show t+s+c-(t+c)=s by omega] at h
 exact_mod_cast (by nlinarith [h] : s.choose m*(t+s+c).choose s=
   (t+m+c).choose m*(t+s+c).choose (t+m+c))

theorem binomial_vandermonde_offsetM657 (d s t c : ℕ) :
 ((d+s).choose t:ℤ)*((t+s+c).choose s:ℤ)=
 ∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*((t+m+c).choose m:ℤ)*
   ((t+s+c).choose (t+m+c):ℤ) := by
 have hv : ((d+s).choose t:ℤ)=
   ∑ m ∈ range (t+1), (s.choose m:ℤ)*(d.choose (t-m):ℤ) := by
   rw [Nat.add_comm d s,Nat.add_choose_eq,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
   push_cast
   rfl
 rw [hv,sum_mul]
 apply sum_congr rfl
 intro m hm
 have h := binomial_product_offsetM657 s t m c
 linear_combination (d.choose (t-m):ℤ)*h

theorem diagonal_fib_smoothedM657 (d s t : ℕ) :
 ((X+1)^d*diagonalFibM831 d s).coeff t=
 ((d+s).choose t:ℤ)*((t+s+1).choose s:ℤ) := by
 have h := fib_band_coeffM139 (d+2*s+1) s t (by omega)
 simpa only [diagonalFibM831,show d+2*s+1-2*s-1=d by omega,
   show d+2*s+1-s-1=d+s by omega] using h

theorem fib_prefix_liftM657 (d k t : ℕ) :
 ((X+1)^d*doublePrefixMDAB (diagonalFibM831 d) k).coeff t=
 ∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*((t+m+1).choose m:ℤ)*
   ((k+t+2).choose (t+m+3):ℤ) := by
 have he : (X+1)^d*doublePrefixMDAB (diagonalFibM831 d) k=
     ∑ s ∈ range k, C ((k:ℤ)-s)*((X+1)^d*diagonalFibM831 d s) := by
   simp only [doublePrefixMDAB,mul_sum]
   apply sum_congr rfl
   intro s hs
   ring
 rw [he]
 simp only [finsetSum_coeff,coeff_C_mul,diagonal_fib_smoothedM657]
 simp_rw [mul_assoc,binomial_vandermonde_offsetM657 d _ t 1,mul_sum]
 rw [sum_comm]
 apply sum_congr rfl
 intro m hm
 have hw := weighted_chooseMDAB (t+1) (t+m+1) k (by omega)
 rw [show k+(t+1)+1=k+t+2 by omega,show t+m+1+2=t+m+3 by omega] at hw
 calc
  _ = (d.choose (t-m):ℤ)*((t+m+1).choose m:ℤ)*
      ∑ s ∈ range k, ((k:ℤ)-s)*((s+(t+1)).choose (t+m+1):ℤ) := by
    rw [mul_sum]
    apply sum_congr rfl
    intro s hs
    rw [show s+(t+1)=t+s+1 by omega]
    ring
  _ = _ := by rw [hw]; ring

def correctionLiftM657 (d k t : ℕ) (r : Bool) : ℤ :=
 4*∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*((t+m+1).choose m:ℤ)*
   ((if r then 2 else 1)*((k+t+3).choose (t+m+3):ℤ)+
    (if r then 1 else 2)*((k+t+2).choose (t+m+3):ℤ))

theorem band_smoothed_liftM657 (d k t : ℕ) (r : Bool) :
 ((X+1)^d*bandAtM139 d k r).coeff t=correctionLiftM657 d k t r := by
 rw [band_at_positive_sumM831]
 have he : (X+1)^d*(4*((if r then 2 else 1)*doublePrefixMDAB (diagonalFibM831 d) (k+1)+
      (if r then 1 else 2)*doublePrefixMDAB (diagonalFibM831 d) k))=
     4*((if r then 2 else 1)*((X+1)^d*doublePrefixMDAB (diagonalFibM831 d) (k+1))+
       (if r then 1 else 2)*((X+1)^d*doublePrefixMDAB (diagonalFibM831 d) k)) := by ring
 rw [he]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,coeff_ofNat_mul,
   coeff_add,one_mul,fib_prefix_liftM657,correctionLiftM657,
   show k+1+t+2=k+t+3 by omega]
 all_goals
   congr 1
   simp only [mul_sum,←sum_add_distrib]
   apply sum_congr rfl
   intro m hm
   ring

theorem correction_lift_nonnegM657 (d k t : ℕ) (r : Bool) :
 0 ≤ correctionLiftM657 d k t r := by
 unfold correctionLiftM657
 apply mul_nonneg (by norm_num)
 apply sum_nonneg
 intro m hm
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> positivity

end
end MathGKM.Markov
