import MarkovTwoColumnM679
/-! Machine-authored 6799c386. Scalar binomial kernels with no polynomial
coefficient extraction in their definitions. All indices and zeros retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 2000000

def kernelCoeffM679 (m l s n j : ℕ) : ℕ :=
 ∑ ac∈antidiagonal n, ∑ ab∈antidiagonal ac.1,
   if j=ab.2+2*ac.2 then risingM679 m ab.1*risingM679 l ab.2*risingM679 s ac.2 else 0

theorem kernel_coeff_formulaM679 (m l s n j : ℕ) :
 (posKernelM679 (X:Polynomial ℤ) m l s n).coeff j=(kernelCoeffM679 m l s n j:ℤ) := by
 simp only [posKernelM679,kernelCoeffM679,Polynomial.finsetSum_coeff,Nat.cast_sum]
 apply sum_congr rfl
 intro ac hac
 apply sum_congr rfl
 intro ab hab
 simp only [←Nat.cast_mul,Polynomial.coeff_natCast_mul,Polynomial.coeff_X_pow]
 split_ifs <;> simp_all

def shiftedCoeffM679 (m l s n j : ℕ) : ℕ :=
 kernelCoeffM679 m l s n j+
   if n=0 ∨ j=0 then 0 else kernelCoeffM679 m l s (n-1) (j-1)

theorem shifted_coeff_formulaM679 (m l s n j : ℕ) :
 (shiftKernelM679 (X:Polynomial ℤ) m l s n).coeff j=(shiftedCoeffM679 m l s n j:ℤ) := by
 unfold shiftKernelM679 shiftedCoeffM679
 by_cases hn : n=0
 · simp [hn,kernel_coeff_formulaM679]
 · cases j with
   | zero => simp [hn,Polynomial.coeff_X_mul',kernel_coeff_formulaM679]
   | succ j => simp [hn,Polynomial.coeff_X_mul,kernel_coeff_formulaM679]

def termCoeffM679 (r e i j : ℕ) : ℕ :=
 if r+e ≤ i then
   2^(r-(i-(r+e)))*r.choose (i-(r+e))*(r-(i-(r+e))).choose j else 0

theorem term_coeff_formulaM679 (r e i j : ℕ) :
 (columnTermM679 r e i).coeff j=(termCoeffM679 r e i j:ℤ) := by
 unfold columnTermM679 termCoeffM679
 split_ifs
 · rw [mul_pow,←mul_assoc,Polynomial.coeff_mul_natCast,
     Polynomial.coeff_natCast_mul,Polynomial.coeff_X_add_one_pow]
   push_cast
   ring
 · simp

def pairCoeffM679 (q r e i j : ℕ) : ℕ :=
 ∑ ab∈antidiagonal j, termCoeffM679 r e i ab.1*
   shiftedCoeffM679 (if e=1 then r else r+1) (if e=1 then 1 else 0) (r+2) (q-r) ab.2

theorem pair_coeff_formulaM679 (q r e i j : ℕ) :
 (columnTermM679 r e i*
   shiftKernelM679 (X:Polynomial ℤ) (if e=1 then r else r+1)
    (if e=1 then 1 else 0) (r+2) (q-r)).coeff j=(pairCoeffM679 q r e i j:ℤ) := by
 simp only [Polynomial.coeff_mul,term_coeff_formulaM679,shifted_coeff_formulaM679,
   pairCoeffM679,Nat.cast_sum,Nat.cast_mul]

def rawTwoM679 (q i j : ℕ) : ℕ :=
 (if i=0 then (if j=2*q+1 then 1 else 0)+(if j=2*q+2 then 1 else 0) else 0)+
 ∑ r∈range (q+1),
   ((if j=0 then 0 else 2*pairCoeffM679 q r 1 i (j-1))+pairCoeffM679 q r 2 i j)

theorem raw_two_formulaM679 (q i j : ℕ) :
 (twoColumnM679 q i).coeff j=(rawTwoM679 q i j:ℤ) := by
 unfold twoColumnM679 rawTwoM679
 rw [Polynomial.coeff_add,Polynomial.finsetSum_coeff,Nat.cast_add,Nat.cast_sum]
 congr 1
 · split_ifs with hi
   · simp only [mul_add,mul_one,←pow_succ,Polynomial.coeff_add,Polynomial.coeff_X_pow]
     split_ifs <;> norm_num
   · simp
 · apply sum_congr rfl
   intro r hr
   rw [Polynomial.coeff_add,Nat.cast_add]
   have h1 := pair_coeff_formulaM679 q r 1 i (j-1)
   have h2 := pair_coeff_formulaM679 q r 2 i j
   norm_num only [show ¬(2:ℕ)=1 by omega,if_true,if_false] at h1 h2
   rw [h2]
   congr 1
   have he : 2*X*columnTermM679 r 1 i*shiftKernelM679 X r 1 (r+2) (q-r)=
     (2:Polynomial ℤ)*(X*(columnTermM679 r 1 i*shiftKernelM679 X r 1 (r+2) (q-r))) := by ring
   rw [he,Polynomial.coeff_ofNat_mul]
   cases j with
   | zero => simp
   | succ j => simpa only [Polynomial.coeff_X_mul,Nat.add_sub_cancel,
       Nat.succ_ne_zero,if_false,Nat.cast_mul,Nat.cast_ofNat] using congrArg (2*·) h1

theorem source_two_arithmeticM679 (path : List Bool) (ha : (frame path).mid.a=2) :
 ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
   ∀ i j, coeff (frame path).mid.p i j=(rawTwoM679 q i j:ℤ) := by
 obtain ⟨q,hq,hb,hp⟩ := source_two_raw_formulaM679 path ha
 exact ⟨q,hq,hb,fun i j => (hp i j).trans (raw_two_formulaM679 q i j)⟩

end
end MathGKM.Markov
