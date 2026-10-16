import MarkovLowerDifferenceM4F4
import MarkovUpperCoreM2B3
import MarkovPositiveKernelM679
/-! Machine-authored 4f4ac079. Upper-region prefix formula, including zero
columns. The generating-series identities used here have already been proved. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem rising_chooseM4F4 (m n : ℕ) (hm : 1 ≤ m) :
 risingM679 m n=(m+n-1).choose n := by
 obtain ⟨m,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : m≠0)
 simp only [risingM679,show m+1+n-1=m+n by omega]
 exact Nat.choose_symm_add

theorem rising_convolutionM4F4 (a b k : ℕ) :
 (∑ h∈range (k+1), (risingM679 a h:ℤ)*(risingM679 b (k-h):ℤ))=
 (risingM679 (a+b) k:ℤ) := by
 have ht := congrArg (PowerSeries.coeff k)
   (pow_add (geoM679 (1:ℤ)) a b)
 rw [PowerSeries.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at ht
 simp only [geo_power_coeffM679,one_pow,one_mul] at ht
 exact ht.symm

theorem rising_choose_convolutionM4F4 (N d i : ℕ) (hd : 1 ≤ d) :
 (∑ h∈range (i+1), ((2*d+h-1).choose h:ℤ)*((N+i-h).choose (i-h):ℤ))=
 ((N+i+2*d).choose i:ℤ) := by
 have ht := rising_convolutionM4F4 (2*d) (N+1) i
 rw [rising_chooseM4F4 _ _ (by omega),show 2*d+(N+1)+i-1=N+i+2*d by omega] at ht
 rw [←ht]
 apply sum_congr rfl
 intro h hh
 have hh' := mem_range.mp hh
 rw [rising_chooseM4F4 _ _ (by omega),rising_chooseM4F4 _ _ (by omega),
   show N+1+(i-h)-1=N+i-h by omega]

def upperBaseM4F4 (i N d : ℕ) : ℤ :=
 ((N+2*d+i).choose i:ℤ)*(N.choose (i-2):ℤ)

theorem upper_core_differenceM4F4 (i N h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) :
 upperCoreM2B3 (N+1) i h-upperCoreM2B3 N i h=
 ((N+i-h+1).choose (i-h):ℤ)*((N+1).choose (i-2):ℤ)+
 ((N+i-h).choose (i-h):ℤ)*(N.choose (i-2):ℤ) := by
 let k := 2*i-2-h
 have hk : i-h ≤ k := by dsimp [k]; omega
 have he : k+1=2*i-1-h := by dsimp [k]; omega
 have h0 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_succ_succ (N+i-h) k)
 have h1 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_succ_succ (N+i-h+1) k)
 have hm0 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_mul (n:=N+i-h) hk)
 have hm1 := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_mul (n:=N+i-h+1) hk)
 simp only [Nat.succ_eq_add_one] at h0 h1
 push_cast at h0 h1 hm0 hm1
 rw [show N+i-h-(i-h)=N by omega,show k-(i-h)=i-2 by dsimp [k]; omega] at hm0
 rw [show N+i-h+1-(i-h)=N+1 by omega,show k-(i-h)=i-2 by dsimp [k]; omega] at hm1
 unfold upperCoreM2B3
 change (k.choose (i-h):ℤ)*_-(k.choose (i-h):ℤ)*_=_
 rw [←he]
 rw [show N+1+i-h+1=N+i-h+1+1 by omega,show N+1+i-h=N+i-h+1 by omega]
 linear_combination (k.choose (i-h):ℤ)*(h1+h0)+hm1+hm0

theorem upper_differenceM4F4 (i N d : ℕ) (hi : 2 ≤ i) (hd : 1 ≤ d) :
 upperValM2B3 (N+1) d i-upperValM2B3 N d i=
 upperBaseM4F4 i (N+1) d+upperBaseM4F4 i N d := by
 have hf (N : ℕ) : upperValM2B3 N d i=
   ∑ h∈range (i+1), ((2*d+h-1).choose h:ℤ)*upperCoreM2B3 N i h := by
   unfold upperValM2B3 upperCoreM2B3
   rw [if_neg (by omega : i≠0)]
   apply sum_congr rfl
   intro h hh
   ring
 rw [hf,hf,←sum_sub_distrib]
 have ht (h : ℕ) (hh : h∈range (i+1)) :
   ((2*d+h-1).choose h:ℤ)*upperCoreM2B3 (N+1) i h-
   ((2*d+h-1).choose h:ℤ)*upperCoreM2B3 N i h=
   (((2*d+h-1).choose h:ℤ)*((N+1+i-h).choose (i-h):ℤ))*((N+1).choose (i-2):ℤ)+
   (((2*d+h-1).choose h:ℤ)*((N+i-h).choose (i-h):ℤ))*(N.choose (i-2):ℤ) := by
   rw [←mul_sub,upper_core_differenceM4F4 i N h hi (by have := mem_range.mp hh; omega)]
   rw [show N+1+i-h=N+i-h+1 by have := mem_range.mp hh; omega]
   ring
 rw [sum_congr rfl ht,sum_add_distrib,←sum_mul,←sum_mul,
   rising_choose_convolutionM4F4 (N+1) d i hd,rising_choose_convolutionM4F4 N d i hd]
 simp only [upperBaseM4F4,show N+1+i+2*d=N+1+2*d+i by omega,
   show N+i+2*d=N+2*d+i by omega]

theorem upper_initialM4F4 (i d : ℕ) (hi : 2 ≤ i) (hd : 1 ≤ d) :
 upperValM2B3 0 d i=upperBaseM4F4 i 0 d := by
 unfold upperValM2B3 upperBaseM4F4
 rw [if_neg (by omega : i≠0)]
 by_cases he : i=2
 · subst i
   have ht := rising_choose_convolutionM4F4 0 d 2 hd
   norm_num only [Nat.zero_add,Nat.sub_self,Nat.choose_self,Nat.choose_zero_right,
     Nat.cast_one,mul_one] at ht ⊢
   rw [show 2*d+2=2+2*d by omega,←ht]
   apply sum_congr rfl
   intro h hh
   have hh' := mem_range.mp hh
   interval_cases h <;> norm_num
 · rw [Nat.choose_eq_zero_of_lt (by omega : 0 < i-2),Nat.cast_zero,mul_zero]
   apply sum_eq_zero
   intro h hh
   have hh' := mem_range.mp hh
   rw [Nat.choose_eq_zero_of_lt (by omega : 0+i-h+1<2*i-1-h),
     Nat.choose_eq_zero_of_lt (by omega : 0+i-h<2*i-1-h)]
   ring

theorem upper_prefixM4F4 (i N d : ℕ) (hi : 2 ≤ i) (hd : 1 ≤ d) :
 upperValM2B3 N d i=upperBaseM4F4 i N d+2*∑ t∈range N, upperBaseM4F4 i t d := by
 induction N with
 | zero => simpa using upper_initialM4F4 i d hi hd
 | succ N ih =>
   have h := upper_differenceM4F4 i N d hi hd
   rw [sum_range_succ]
   linear_combination h+ih

theorem source_two_upper_prefixM4F4 (path : List Bool) (i N d : ℕ)
 (hi : 2 ≤ i) (hN : 1 ≤ N) (hd : 1 ≤ d)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*(N+d)+1) :
 coeff (frame path).mid.p i (N+2*d)=
 upperBaseM4F4 i N d+2*∑ t∈range N, upperBaseM4F4 i t d := by
 rw [source_two_upper_formulaM2B3 path N d i hN hd ha hb]
 exact upper_prefixM4F4 i N d hi hd
end
end MathGKM.Markov
