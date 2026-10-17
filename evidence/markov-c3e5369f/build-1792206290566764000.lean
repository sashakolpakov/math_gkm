import MarkovThirdRowFormulaMC3E
import MarkovPerturbKernelMC3E
/-! Machine-authored c3e5369f. A source-based obstruction to extending the
single last-coefficient absorption unchanged. This does not refute raw LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem third_correction_edgeMC3E (q : ℕ) (r : Bool) :
 (thirdCorrectionMC3E q r).coeff (thirdExponentMC3E q r+4)=thirdQuadraticMC3E q r := by
 have he : thirdCorrectionMC3E q r=
 C (thirdConstantMC3E r)*(X^2*(X+1)^thirdExponentMC3E q r)+
 C (thirdLinearMC3E q r)*(X^3*(X+1)^thirdExponentMC3E q r)+
 C (thirdQuadraticMC3E q r)*(X^4*(X+1)^thirdExponentMC3E q r) := by
   unfold thirdCorrectionMC3E
   ring
 rw [he]
 simp only [coeff_add,coeff_C_mul,coeff_X_pow_mul',
   if_pos (show 2 ≤ thirdExponentMC3E q r+4 by omega),
   if_pos (show 3 ≤ thirdExponentMC3E q r+4 by omega),
   if_pos (show 4 ≤ thirdExponentMC3E q r+4 by omega),
   show thirdExponentMC3E q r+4-2=thirdExponentMC3E q r+2 by omega,
   show thirdExponentMC3E q r+4-3=thirdExponentMC3E q r+1 by omega,
   Nat.add_sub_cancel,coeff_X_add_one_pow]
 simp [Nat.choose_eq_zero_of_lt (show thirdExponentMC3E q r<thirdExponentMC3E q r+2 by omega),
   Nat.choose_eq_zero_of_lt (show thirdExponentMC3E q r<thirdExponentMC3E q r+1 by omega)]

theorem third_quadratic_positiveMC3E (q : ℕ) (r : Bool) (hq : 3 ≤ q) :
 0<thirdQuadraticMC3E q r := by
 rw [third_quadratic_valueMC3E]
 have hq' : (3:ℤ) ≤ q := by exact_mod_cast hq
 have h1 : 0<(q:ℤ)-1 := by omega
 have h2 : 0<(q:ℤ)-2 := by omega
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> positivity

theorem third_row_edgeMC3E (q : ℕ) (r : Bool) (hq : (if r then 6 else 5) ≤ q) :
 threeRawM9E2 q r (thirdExponentMC3E q r+4) (q+3)=
 lowerRawME9C (sourceNME9C q r) (thirdExponentMC3E q r+4) (q+3)+thirdQuadraticMC3E q r := by
 rw [third_row_sourceMC3E q _ r hq,third_correction_edgeMC3E]

theorem single_slot_weight_zeroMC3E (d j : ℕ) (a : ℝ) :
 (weightPolyMFEE (fun k => zchooseM37B d k) (perturbLiftMC3E j (d+1) a)).eval 1=
 (liftOutputMAE9 d j (d+1):ℝ) := by
 rw [perturbLiftMC3E,weight_addM418,eval_add,weighted_lift_outputMFEE,weight_monomialM418]
 simp [zchoose_natM37B,Nat.choose_eq_zero_of_lt (show d<d+1 by omega)]

theorem third_no_single_slotMC3E (q : ℕ) (r : Bool) (hq : (if r then 6 else 5) ≤ q) (a : ℝ) :
 (weightPolyMFEE (fun k => zchooseM37B (thirdExponentMC3E q r) k)
   (perturbLiftMC3E (q+3) (thirdExponentMC3E q r+1) a)).eval 1 <
 (threeRawM9E2 q r (thirdExponentMC3E q r+4) (q+3):ℝ) := by
 let d := thirdExponentMC3E q r
 have hn : sourceNME9C q r=2*(q+3)+1+d := by
   cases r <;> simp_all [d,sourceNME9C,thirdExponentMC3E] <;> omega
 have hl := lower_row_liftMAE9 d (q+3) (d+1)
 change (lowerRowMFFD (2*(q+3)+1+d) (q+3)).coeff (d+1+3)=liftOutputMAE9 d (q+3) (d+1) at hl
 rw [←hn,lower_row_formulaMFFD _ (q+3) (by omega) (d+1+3) (q+3) le_rfl,
   show d+1+3=d+4 by omega] at hl
 rw [single_slot_weight_zeroMC3E,third_row_edgeMC3E q r hq]
 change (liftOutputMAE9 d (q+3) (d+1):ℝ)<
   ((lowerRawME9C (sourceNME9C q r) (d+4) (q+3)+thirdQuadraticMC3E q r:ℤ):ℝ)
 rw [hl]
 push_cast
 have hq3 : 3 ≤ q := by cases r <;> simp_all <;> omega
 have hp : (0:ℝ)<thirdQuadraticMC3E q r := by exact_mod_cast third_quadratic_positiveMC3E q r hq3
 linarith

end
end MathGKM.Markov
