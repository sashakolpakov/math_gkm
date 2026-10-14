import MarkovZeroAll80b7
/-! Machine-authored 80b7912a. The common C-weight as an actual polynomial
parameter, with exact source evaluation and its first two coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def baseD80 : BiPoly := (U+V)^2+U
def parameterP80 : ℕ → Polynomial BiPoly
 | 0 => 1
 | 1 => C baseD80
 | n+2 => (C baseD80+C V*X)*parameterP80 (n+1)-C (U*V)*X*parameterP80 n

theorem parameter_eval80 (t : ℤ) (a : ℕ) :
 (parameterP80 a).eval (C (C t))=typeP3 t a := by
 induction a using Nat.twoStepInduction with
 | zero => simp [parameterP80,typeP3]
 | one => simp [parameterP80,typeP3,baseD80]
 | more n h0 h1 =>
   rw [parameterP80]
   simp only [eval_sub,eval_mul,eval_add,eval_C,eval_X,h0,h1,typeP3,baseD80]
   ring

theorem parameter_source80 (n : ℕ) :
 (parameterP80 (n+1)).eval 1=(frame (List.replicate n true)).mid.p := by
 simpa [typeP_source3,rightP650] using parameter_eval80 1 (n+1)

theorem parameter_constant80 (a : ℕ) :
 (parameterP80 a).coeff 0=baseD80^a := by
 induction a using Nat.twoStepInduction with
 | zero => simp [parameterP80]
 | one => simp [parameterP80]
 | more n h0 h1 =>
   simp [parameterP80,Polynomial.mul_coeff_zero,h1,pow_succ']

theorem parameter_linear_rec80 (a : ℕ) :
 (parameterP80 (a+2)).coeff 1=baseD80*(parameterP80 (a+1)).coeff 1+
   V*(U+V)^2*baseD80^a := by
 rw [parameterP80]
 simp only [add_mul,Polynomial.coeff_sub,Polynomial.coeff_add,
   Polynomial.coeff_C_mul,mul_assoc,Polynomial.coeff_X_mul,parameter_constant80]
 rw [pow_succ]
 unfold baseD80
 ring

theorem parameter_linear80 (n : ℕ) :
 (parameterP80 (n+2)).coeff 1=(n+1 : BiPoly)*V*(U+V)^2*baseD80^n := by
 induction n with
 | zero => simp [parameterP80,baseD80]; ring
 | succ n ih =>
   rw [show n+1+2=(n+1)+2 by omega,parameter_linear_rec80,ih]
   push_cast
   rw [pow_succ]
   ring

def parameterRaw80 (a i j : ℕ) : Polynomial ℤ :=
 (parameterP80 a).sum (fun k p => monomial k (coeff p i j))

theorem parameter_raw_coeff80 (a i j q : ℕ) :
 (parameterRaw80 a i j).coeff q=coeff ((parameterP80 a).coeff q) i j := by
 classical
 unfold parameterRaw80
 simp only [Polynomial.sum_def,Polynomial.finset_sum_coeff,Polynomial.coeff_monomial]
 by_cases h : q ∈ (parameterP80 a).support
 · simp [h]
 · have hz : (parameterP80 a).coeff q=0 := by simpa only [Polynomial.mem_support_iff,not_not] using h
   simp [h,hz,coeff]

theorem parameter_raw_source80 (n i j : ℕ) :
 (parameterRaw80 (n+1) i j).eval 1=coeff (frame (List.replicate n true)).mid.p i j := by
 rw [← parameter_source80]
 unfold parameterRaw80
 rw [Polynomial.eval₂_sum]
 simp [Polynomial.eval_eq_sum,Polynomial.sum_def,coeff,Polynomial.finsetSum_coeff]

theorem parameter_gap_constant80 (a i j : ℕ) :
 0 ≤ ((parameterRaw80 a (i+1) j)^2-
   parameterRaw80 a i j*parameterRaw80 a (i+2) j).coeff 0 := by
 simp only [Polynomial.coeff_sub,Polynomial.mul_coeff_zero,pow_two,
   parameter_raw_coeff80,parameter_constant80]
 have h := zero_weight_horizontal80 a i j
 rw [typeP_zero80] at h
 change 0 ≤ coeff (((U+V)^2+U)^a) (i+1) j*coeff (((U+V)^2+U)^a) (i+1) j-
   coeff (((U+V)^2+U)^a) i j*coeff (((U+V)^2+U)^a) (i+2) j
 nlinarith

#print axioms parameter_source80
#print axioms parameter_linear80
#print axioms parameter_raw_coeff80
#print axioms parameter_gap_constant80
end
end MathGKM.Markov
