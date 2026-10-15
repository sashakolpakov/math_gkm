import MarkovAlignedLC6d2c
/-! Machine-authored 6d2c5a67. Actual-multiplicity aggregation of aligned
constant-coefficient layers on the infinite mixed-run source family. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def alignedPrefix6d (n e : ℕ) : ℤ[X] :=
 ∑ k ∈ range (e+1),singleAAligned6d n (n+1) k

theorem alignedPrefix_step6d (n e : ℕ) :
 alignedPrefix6d n (e+1)=alignedPrefix6d n e+singleAAligned6d n (n+1) (e+1) := by
 exact Finset.sum_range_succ _ _

theorem alignedPrefix_below6d (n e : ℕ) (hen : e<n) :
 alignedPrefix6d n e=(1+X)^e*(1+C (e+1:ℤ)*X) := by
 induction e with
 | zero => simp [alignedPrefix6d,singleAAligned_zero6d n (by omega)]
 | succ e ih =>
   rw [alignedPrefix_step6d,ih (by omega),singleAAligned_below6d n (e+1) (by omega) hen]
   simp only [Nat.add_sub_cancel,pow_succ,Nat.cast_add,Nat.cast_one,map_add,map_one,map_ofNat]
   ring

theorem alignedPrefix_at6d (n : ℕ) (hn : 1 ≤ n) :
 alignedPrefix6d n n=(1+X)^n*(1+C (n+2:ℤ)*X) := by
 have h := alignedPrefix_step6d n (n-1)
 rw [show n-1+1=n by omega,alignedPrefix_below6d n (n-1) (by omega),
   singleAAligned_at6d n hn] at h
 rw [h]
 have hp : (1+(X:ℤ[X]))^n=(1+X)^(n-1)*(1+X) := by
   conv_lhs => rw [show n=(n-1)+1 by omega]
   rw [pow_succ]
 rw [hp]
 have hc : ((n-1:ℕ):ℤ)+1=(n:ℤ) := by omega
 simp only [hc,map_add,map_one,map_ofNat]
 ring

theorem alignedPrefix_above6d (n t : ℕ) (hn : 1 ≤ n) (ht : t ≤ n+1) :
 alignedPrefix6d n (n+t)=(1+X)^(n+t)*(1+C ((n+2-t:ℕ):ℤ)*X) := by
 induction t with
 | zero => simpa using alignedPrefix_at6d n hn
 | succ t ih =>
   rw [show n+(t+1)=(n+t)+1 by omega,alignedPrefix_step6d,
     ih (by omega),singleAAligned_above6d n (n+t+1) (by omega)]
   have he : 2*n+2-(n+t+1)=n+1-t := by omega
   have he2 : n+t+1-1=n+t := by omega
   have he3 : n+2-(t+1)=n+1-t := by omega
   rw [he,he2,he3,pow_succ]
   have hc : ((n+2-t:ℕ):ℤ)=((n+1-t:ℕ):ℤ)+1 := by omega
   rw [hc]
   simp only [map_add,map_one]
   ring

theorem alignedPrefix_terminal6d (n : ℕ) (hn : 1 ≤ n) :
 alignedPrefix6d n (2*n+1)=(1+X)^(2*n+2) := by
 have h := alignedPrefix_above6d n (n+1) hn (by omega)
 rw [show n+(n+1)=2*n+1 by omega,show n+2-(n+1)=1 by omega] at h
 rw [h]
 simp only [Nat.cast_one,map_one,one_mul]
 exact (pow_succ (1+(X:ℤ[X])) (2*n+1)).symm

theorem alignedPrefix_stable6d (n t : ℕ) (hn : 1 ≤ n) :
 alignedPrefix6d n (2*n+1+t)=(1+X)^(2*n+2) := by
 induction t with
 | zero => simpa using alignedPrefix_terminal6d n hn
 | succ t ih =>
   rw [show 2*n+1+(t+1)=(2*n+1+t)+1 by omega,alignedPrefix_step6d,ih,
     singleAAligned_above6d n (2*n+1+t+1) (by omega)]
   simp [show 2*n+2-(2*n+1+t+1)=0 by omega]

theorem alignedPrefix_lc6d (n e s : ℕ) (hn : 1 ≤ n) :
 (alignedPrefix6d n e).coeff s*(alignedPrefix6d n e).coeff (s+2) ≤
 (alignedPrefix6d n e).coeff (s+1)^2 := by
 by_cases he : e<n
 · rw [alignedPrefix_below6d n e he]
   simpa using linear_binomial_integer_lc6d 0 e s 1 (e+1) (by norm_num) (by positivity)
 by_cases ht : e ≤ 2*n+1
 · have h := alignedPrefix_above6d n (e-n) hn (by omega)
   rw [show n+(e-n)=e by omega] at h
   rw [h]
   simpa using linear_binomial_integer_lc6d 0 e s 1 ((n+2-(e-n):ℕ):ℤ)
     (by norm_num) (by positivity)
 · have h := alignedPrefix_stable6d n (e-(2*n+1)) hn
   rw [show 2*n+1+(e-(2*n+1))=e by omega] at h
   rw [h]
   simpa using linear_binomial_integer_lc6d 0 (2*n+2) s 1 0
     (by norm_num) (by norm_num)

theorem source_aligned_prefix_coeff6d (n e s : ℕ) :
 (∑ k ∈ range (e+1),
   (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) s (s+k)).coeff 0)=
 (alignedPrefix6d n e).coeff s := by
 simp only [alignedPrefix6d,Polynomial.finsetSum_coeff,source_aligned_count6d]

theorem source_aligned_prefix_lc6d (n e s : ℕ) (hn : 1 ≤ n) :
 let f := fun r => ∑ k ∈ range (e+1),
   (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) r (r+k)).coeff 0
 f s*f (s+2) ≤ f (s+1)^2 := by
 dsimp only
 rw [source_aligned_prefix_coeff6d,source_aligned_prefix_coeff6d,source_aligned_prefix_coeff6d]
 exact alignedPrefix_lc6d n e s hn

#print axioms alignedPrefix_below6d
#print axioms alignedPrefix_above6d
#print axioms alignedPrefix_stable6d
#print axioms source_aligned_prefix_lc6d
end
end MathGKM.Markov
