import MarkovThirdRowFormulaMC3E
import MarkovTwinKernelM964
/-! Machine-authored 9647c1ba. Exact two-slot weighting for the third
source row. The last nonzero correction is retained at t=d. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def thirdQM964 (d : ℕ) (r : Bool) : ℕ := d+(if r then 6 else 5)
def thirdJM964 (d : ℕ) (r : Bool) : ℕ := d+(if r then 9 else 8)
def thirdCM964 (r : Bool) : ℕ := if r then 96 else 72
def thirdLM964 (d : ℕ) (r : Bool) : ℕ := if r then 44*d+156 else 28*d+96
def thirdVM964 (d : ℕ) (r : Bool) : ℕ := (if r then 4 else 2)*(d+5)*(d+4)
def thirdExtraM964 (d s : ℕ) (r : Bool) : ℝ :=
 absorbedExtraM418 d s (thirdCM964 r)+thirdLM964 d r
def thirdOutputM964 (d t : ℕ) (r : Bool) : ℤ :=
 liftOutputMAE9 d (thirdJM964 d r) (t+1)+
 thirdCM964 r*(d.choose (t+2):ℤ)+thirdLM964 d r*(d.choose (t+1):ℤ)+
 thirdVM964 d r*(d.choose t:ℤ)

theorem third_parametersM964 (d : ℕ) (r : Bool) :
 thirdExponentMC3E (thirdQM964 d r) r=d ∧
 thirdJM964 d r=thirdQM964 d r+3 ∧
 sourceNME9C (thirdQM964 d r) r=2*(thirdJM964 d r)+1+d ∧
 thirdConstantMC3E r=(thirdCM964 r:ℤ) ∧
 thirdLinearMC3E (thirdQM964 d r) r=(thirdLM964 d r:ℤ) ∧
 thirdQuadraticMC3E (thirdQM964 d r) r=(thirdVM964 d r:ℤ) := by
 rw [third_quadratic_valueMC3E]
 cases r <;> simp [thirdExponentMC3E,thirdQM964,thirdJM964,sourceNME9C,
   thirdConstantMC3E,thirdCM964,thirdLinearMC3E,thirdLM964,thirdVM964]
   <;> push_cast <;> ring

theorem third_correction_coeffM964 (q i : ℕ) (r : Bool) :
 (thirdCorrectionMC3E q r).coeff i=
 (if 2 ≤ i then thirdConstantMC3E r*(thirdExponentMC3E q r).choose (i-2) else 0)+
 (if 3 ≤ i then thirdLinearMC3E q r*(thirdExponentMC3E q r).choose (i-3) else 0)+
 (if 4 ≤ i then thirdQuadraticMC3E q r*(thirdExponentMC3E q r).choose (i-4) else 0) := by
 have he : thirdCorrectionMC3E q r=
 C (thirdConstantMC3E r)*(X^2*(X+1)^thirdExponentMC3E q r)+
 C (thirdLinearMC3E q r)*(X^3*(X+1)^thirdExponentMC3E q r)+
 C (thirdQuadraticMC3E q r)*(X^4*(X+1)^thirdExponentMC3E q r) := by
   unfold thirdCorrectionMC3E; ring
 rw [he]
 simp only [coeff_add,coeff_C_mul,coeff_X_pow_mul',coeff_X_add_one_pow]
 split_ifs <;> ring

theorem source_third_outputM964 (d t : ℕ) (r : Bool) :
 threeRawM9E2 (thirdQM964 d r) r (t+4) (thirdJM964 d r)=thirdOutputM964 d t r := by
 obtain ⟨he,hj,hn,hc,hl,hv⟩ := third_parametersM964 d r
 have hq : (if r then 6 else 5) ≤ thirdQM964 d r := by unfold thirdQM964; omega
 rw [hj,third_row_sourceMC3E _ _ r hq,←hj,hn,
   ←lower_row_formulaMFFD _ (thirdJM964 d r) (by omega) (t+4) (thirdJM964 d r) le_rfl,
   show t+4=t+1+3 by omega,lower_row_liftMAE9,third_correction_coeffM964,he,hc,hl,hv]
 simp only [show 2 ≤ t+1+3 by omega,show 3 ≤ t+1+3 by omega,
   show 4 ≤ t+1+3 by omega,if_true,show t+1+3-2=t+2 by omega,
   show t+1+3-3=t+1 by omega,show t+1+3-4=t by omega]
 unfold thirdOutputM964 liftOutputMAE9
 ring

theorem third_weighted_outputM964 (d t : ℕ) (r : Bool) :
 (weightPolyMFEE (fun k => zchooseM37B d k)
   (twinLiftM964 (thirdJM964 d r) t (thirdExtraM964 d (t+1) r) (thirdVM964 d r))).eval 1=
 (thirdOutputM964 d t r:ℝ) := by
 rw [twinLiftM964,weight_addM418,weight_addM418,eval_add,eval_add,weighted_lift_outputMFEE,
   weight_monomialM418,weight_monomialM418]
 simp only [eval_mul,eval_C,eval_pow,eval_X,one_pow,mul_one,zchoose_natM37B,
   thirdExtraM964,mul_add,absorbed_chooseM418]
 simp [thirdOutputM964]
 <;> ring

theorem third_output_tailM964 (d t : ℕ) (r : Bool) (ht : d<t) :
 thirdOutputM964 d t r=liftOutputMAE9 d (thirdJM964 d r) (t+1) := by
 simp [thirdOutputM964,Nat.choose_eq_zero_of_lt ht,
   Nat.choose_eq_zero_of_lt (show d<t+1 by omega),Nat.choose_eq_zero_of_lt (show d<t+2 by omega)]

theorem third_extra_nonnegM964 (d s : ℕ) (r : Bool) : 0 ≤ thirdExtraM964 d s r := by
 unfold thirdExtraM964 absorbedExtraM418
 positivity

end
end MathGKM.Markov
