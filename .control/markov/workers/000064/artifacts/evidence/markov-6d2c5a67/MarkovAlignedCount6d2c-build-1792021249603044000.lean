import MarkovSourceCount68a4
/-! Machine-authored 6d2c5a67. Exact degree-minus-cut alignment of
constant coefficients. Auxiliary refinement, not the published root. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def alignedAtom6d (r h n e : ℕ) : ℤ[X] :=
 if h+n=e+r then X^r*(1+X)^n else 0

theorem alignedAtom_coeff6d (r h n e s : ℕ) :
 (alignedAtom6d r h n e).coeff s=countAtom68 r h n s (s+e) := by
 unfold alignedAtom6d countAtom68
 by_cases hr : r≤s
 · by_cases he : h+n=e+r
   · rw [if_pos he,Polynomial.coeff_X_pow_mul']
     simp [hr,Polynomial.coeff_one_add_X_pow,show h+n+(s-r)=s+e by omega]
   · rw [if_neg he]
     simp [show ¬(r≤s ∧ h+n+(s-r)=s+e) by omega]
 · split_ifs <;> simp [Polynomial.coeff_X_pow_mul',hr]

def singleAAligned6d (p q e : ℕ) : ℤ[X] :=
 (if e=0 then 1 else 0)+
 (∑ k ∈ range q,alignedAtom6d 1 1 k e)+
 (∑ k ∈ range p,alignedAtom6d 1 2 k e)+
 alignedAtom6d 1 1 p e+
 ∑ k ∈ range (p+1),∑ l ∈ range q,alignedAtom6d 2 3 (k+l) e

theorem singleAAligned_coeff6d (p q e s : ℕ) :
 (singleAAligned6d p q e).coeff s=singleACount68 p q s (s+e) := by
 simp only [singleAAligned6d,singleACount68,Polynomial.coeff_add,
   Polynomial.finsetSum_coeff,alignedAtom_coeff6d]
 congr 4
 by_cases he : e=0 <;> by_cases hs : s=0 <;> simp_all

theorem alignedAtom_sum6d (r h e N : ℕ) (he : h≤e+r) :
 (∑ k ∈ range N,alignedAtom6d r h k e)=
 if e+r-h<N then X^r*(1+X)^(e+r-h) else 0 := by
 have hh (k : ℕ) : h+k=e+r ↔ k=e+r-h := by omega
 simp only [alignedAtom6d,hh]
 simp [Finset.sum_ite_eq',Finset.mem_range]

theorem alignedAtom_square6d (n e : ℕ) (he : 1≤e) :
 (∑ k ∈ range (n+1),∑ l ∈ range (n+1),alignedAtom6d 2 3 (k+l) e)=
 C ((((min n (e-1)+1)-((e-1)-n):ℕ):ℤ))*X^2*(1+X)^(e-1) := by
 have hh (k l : ℕ) : 3+(k+l)=e+2 ↔ k+l=e-1 := by omega
 simp only [alignedAtom6d,hh]
 have hi (k : ℕ) :
   (∑ l ∈ range (n+1),if k+l=e-1 then X^2*(1+X)^(k+l) else (0:ℤ[X]))=
   if k≤e-1 ∧ e-1-k≤n then X^2*(1+X)^(e-1) else 0 := by
   by_cases hk : k≤e-1
   · have hkl (l : ℕ) : k+l=e-1 ↔ l=e-1-k := by omega
     simp [hkl,Finset.sum_ite_eq',Finset.mem_range,hk,Nat.lt_succ_iff,
       show k+(e-1-k)=e-1 by omega]
   · have hkl (l : ℕ) : ¬k+l=e-1 := by omega
     simp [hk,hkl]
 simp only [hi]
 rw [←Finset.sum_filter]
 have hf : (range (n+1)).filter (fun k => k≤e-1 ∧ e-1-k≤n)=
     Icc (e-1-n) (min n (e-1)) := by
   ext k
   simp only [Finset.mem_filter,Finset.mem_range,Finset.mem_Icc,le_min_iff]
   omega
 rw [hf,Finset.sum_const,Nat.card_Icc]
 simp [nsmul_eq_mul,mul_assoc]

theorem singleAAligned_zero6d (n : ℕ) (hn : 1≤n) :
 singleAAligned6d n (n+1) 0=1+X := by
 unfold singleAAligned6d
 rw [alignedAtom_sum6d 1 1 0 (n+1) (by omega)]
 have hz (k : ℕ) : alignedAtom6d 1 2 k 0=0 := by simp [alignedAtom6d]
 have hz2 (k l : ℕ) : alignedAtom6d 2 3 (k+l) 0=0 := by simp [alignedAtom6d]
 simp [hz,hz2,alignedAtom6d,show n≠0 by omega]

theorem singleAAligned_positive6d (n e : ℕ) (he : 1≤e) :
 singleAAligned6d n (n+1) e=
 (if e<n+1 then X*(1+X)^e else 0)+
 (if e-1<n then X*(1+X)^(e-1) else 0)+
 (if e=n then X*(1+X)^n else 0)+
 C ((((min n (e-1)+1)-((e-1)-n):ℕ):ℤ))*X^2*(1+X)^(e-1) := by
 unfold singleAAligned6d
 rw [alignedAtom_sum6d 1 1 e (n+1) (by omega),
   alignedAtom_sum6d 1 2 e n (by omega),alignedAtom_square6d n e he]
 simp only [show e≠0 by omega,if_false,zero_add,Nat.add_sub_cancel,
   show e+1-2=e-1 by omega,pow_one,alignedAtom6d]
 congr 2
 have hh : 1+n=e+1 ↔ e=n := by omega
 rw [hh,pow_one]

theorem singleAAligned_below6d (n e : ℕ) (he : 1≤e) (hen : e<n) :
 singleAAligned6d n (n+1) e=
 X*(1+X)^(e-1)*(C 2+C (e+1:ℤ)*X) := by
 rw [singleAAligned_positive6d n e he]
 simp only [show e<n+1 by omega,show e-1<n by omega,if_true,
   show e≠n by omega,if_false,add_zero,
   min_eq_right (show e-1≤n by omega),Nat.sub_eq_zero_of_le (show e-1≤n by omega),
   Nat.sub_zero,show e-1+1=e by omega]
 conv_lhs => arg 1; arg 1; rw [show e=(e-1)+1 by omega,pow_succ]
 push_cast
 ring

theorem singleAAligned_at6d (n : ℕ) (hn : 1≤n) :
 singleAAligned6d n (n+1) n=
 X*(1+X)^(n-1)*(C 3+C (n+2:ℤ)*X) := by
 rw [singleAAligned_positive6d n n hn]
 simp only [Nat.lt_succ_self,show n-1<n by omega,if_true,
   min_eq_right (show n-1≤n by omega),Nat.sub_eq_zero_of_le (show n-1≤n by omega),
   Nat.sub_zero,show n-1+1=n by omega]
 have hp : (1+(X:ℤ[X]))^n=(1+X)^(n-1)*(1+X) := by
   conv_lhs => rw [show n=(n-1)+1 by omega]
   rw [pow_succ]
 rw [hp]
 push_cast
 ring

theorem singleAAligned_above6d (n e : ℕ) (hen : n<e) :
 singleAAligned6d n (n+1) e=
 C ((2*n+2-e:ℕ):ℤ)*X^2*(1+X)^(e-1) := by
 rw [singleAAligned_positive6d n e (by omega)]
 simp only [show ¬e<n+1 by omega,show ¬e-1<n by omega,if_false,
   show e≠n by omega,zero_add,min_eq_left (show n≤e-1 by omega)]
 congr 3
 omega

theorem source_aligned_count6d (n e s : ℕ) :
 (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) s (s+e)).coeff 0=
 (singleAAligned6d n (n+1) e).coeff s := by
 rw [oneA_layer_count68,singleAAligned_coeff6d]

#print axioms source_aligned_count6d
#print axioms singleAAligned_zero6d
#print axioms singleAAligned_below6d
#print axioms singleAAligned_at6d
#print axioms singleAAligned_above6d
end
end MathGKM.Markov
