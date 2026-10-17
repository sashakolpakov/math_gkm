import MarkovIntegerPolynomialM9DB
/-! Machine-authored 9db2326d. Exact integer polynomial for the complete
middle coefficient, including the positive correction and every raw zero. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000

def correctionPolyM9DB (N d k c : ℕ) (r : Bool) : Polynomial ℤ :=
 C 4*(if r then
 kernelPolyM9DB N (d+c+4) k c (c+1)+
 C 2*kernelPolyM9DB N (d+c+5) k (c+1) (c+2)+
 kernelPolyM9DB N (d+c+4) k (c+1) (c+2)+
 kernelPolyM9DB N (d+c+4) k c (c+2)+kernelPolyM9DB N (d+c+5) k c (c+2)
 else
 C 2*kernelPolyM9DB N (d+c+5) k (c+1) (c+2)+
 kernelPolyM9DB N (d+c+5) k c (c+1)+
 kernelPolyM9DB N (d+c+6) k (c+1) (c+2)+kernelPolyM9DB N (d+c+5) k c (c+2))

theorem correction_poly_evalM9DB (x N d k c : ℕ) (r : Bool) (hc : c+2 ≤ N) :
 (correctionPolyM9DB N d k c r).eval (x:ℤ)=
 (N.factorial:ℤ)*correctionShortMD02 (x+d) k c r := by
 have he (D a b : ℕ) (hb : b ≤ N) := kernel_poly_evalM9DB x N D k a b hb
 cases r <;> simp only [correctionPolyM9DB,correctionShortMD02,Bool.false_eq_true,
   if_false,if_true,eval_mul,eval_C,eval_add,
   he _ _ (c+1) (by omega),he _ _ (c+2) hc,Nat.add_assoc] <;> ring

def middlePolyM9DB (k c : ℕ) (r : Bool) (off : ℕ) : Polynomial ℤ :=
 topPolyM9DB off (off+3*k+middleBaseMD02 r) c+
 correctionPolyM9DB (2*c+5) (off+middleBaseMD02 r-2) k c r

theorem middle_poly_evalM9DB (x k c : ℕ) (r : Bool) (off : ℕ) :
 (middlePolyM9DB k c r off).eval (x:ℤ)=
 ((2*c+5).factorial:ℤ)*middleRawMD02 (x+off) k r c := by
 have he : x+(off+middleBaseMD02 r-2)=x+off+middleBaseMD02 r-2 := by
   cases r <;> simp [middleBaseMD02] <;> omega
 rw [middlePolyM9DB,eval_add,top_poly_evalM9DB,correction_poly_evalM9DB _ _ _ _ _ _ (by omega),
   middleRawMD02,he]
 simp only [Nat.add_assoc]
 ring

def integerGapPolyM9DB (k c : ℕ) (r : Bool) : Polynomial ℤ :=
 let off := fixedShiftM9DB k c r
 C (((2*c+5).factorial:ℤ)*((2*(c+2)+5).factorial:ℤ))*middlePolyM9DB k (c+1) r off^2-
 C (((2*(c+1)+5).factorial:ℤ)^2)*
   middlePolyM9DB k c r off*middlePolyM9DB k (c+2) r off

def integerGapScaleM9DB (c : ℕ) : ℤ :=
 ((2*c+5).factorial:ℤ)*((2*(c+2)+5).factorial:ℤ)*((2*(c+1)+5).factorial:ℤ)^2

theorem integer_gap_scale_positiveM9DB (c : ℕ) : 0 < integerGapScaleM9DB c := by
 unfold integerGapScaleM9DB
 positivity

theorem integer_gap_poly_evalM9DB (x k c : ℕ) (r : Bool) :
 (integerGapPolyM9DB k c r).eval (x:ℤ)=
 integerGapScaleM9DB c*middleGapMD02 r c (x+fixedShiftM9DB k c r) k := by
 simp only [integerGapPolyM9DB,eval_sub,eval_mul,eval_C,eval_pow,middle_poly_evalM9DB,
   integerGapScaleM9DB,middleGapMD02]
 ring

theorem polynomial_eval_nonnegM9DB (P : Polynomial ℤ) (x : ℤ) (hx : 0 ≤ x)
 (hp : ∀ i, 0 ≤ P.coeff i) : 0 ≤ P.eval x := by
 rw [eval_eq_sum_range]
 apply sum_nonneg
 intro i hi
 exact mul_nonneg (hp i) (pow_nonneg hx i)

theorem integer_gap_transferM9DB (k c : ℕ) (r : Bool)
 (hp : ∀ i, 0 ≤ (integerGapPolyM9DB k c r).coeff i) (x : ℕ) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hx : fixedShiftM9DB k c r ≤ x
 · have h := polynomial_eval_nonnegM9DB (integerGapPolyM9DB k c r)
     ((x-fixedShiftM9DB k c r:ℕ):ℤ) (by positivity) hp
   rw [integer_gap_poly_evalM9DB,Nat.sub_add_cancel hx] at h
   exact (mul_nonneg_iff_of_pos_left (integer_gap_scale_positiveM9DB c)).mp h
 · exact middle_gap_below_shiftM9DB x k c r (by omega)

end
end MathGKM.Markov
