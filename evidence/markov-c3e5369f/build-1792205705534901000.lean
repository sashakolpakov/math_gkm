import MarkovSecondRowFormulaMC3E
import MarkovSecondMarginsMC3E
import MarkovPerturbCutsMC3E
/-! Machine-authored c3e5369f. Ordinary binomial weighting, including its
zero tail, connects the generic kernel bounds to the second source row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def secondQMC3E (d : ℕ) (r : Bool) : ℕ := d+(if r then 4 else 3)
def secondOutputMC3E (d t : ℕ) (r : Bool) : ℤ :=
 liftOutputMAE9 d (secondJMC3E d r) t+
 (if r then 36 else 24)*(d.choose (t+1):ℤ)+
 (if r then (8*d+24:ℕ) else (4*d+12:ℕ))*(d.choose t:ℤ)

theorem second_weighted_outputMC3E (d t : ℕ) (r : Bool) :
 (weightPolyMFEE (fun k => zchooseM37B d k)
   (perturbLiftMC3E (secondJMC3E d r) t (secondExtraMC3E d t r))).eval 1=
 (secondOutputMC3E d t r:ℝ) := by
 rw [perturbLiftMC3E,weight_addM418,eval_add,weighted_lift_outputMFEE,weight_monomialM418]
 simp only [eval_mul,eval_C,eval_pow,eval_X,one_pow,mul_one,zchoose_natM37B,
   secondExtraMC3E,mul_add,absorbed_chooseM418]
 cases r <;> simp [secondOutputMC3E] <;> ring

theorem source_second_outputMC3E (d t : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r (t+3) (secondJMC3E d r)=secondOutputMC3E d t r := by
 have hq : (if r then 4 else 3) ≤ secondQMC3E d r := by unfold secondQMC3E; omega
 have hj : secondJMC3E d r=secondQMC3E d r+2 := by cases r <;> simp [secondJMC3E,secondQMC3E] <;> omega
 have he : secondExponentMC3E (secondQMC3E d r) r=d := by cases r <;> simp [secondExponentMC3E,secondQMC3E]
 have hn : sourceNME9C (secondQMC3E d r) r=2*(secondJMC3E d r)+1+d := by
   cases r <;> simp [sourceNME9C,secondQMC3E,secondJMC3E] <;> omega
 rw [hj,second_row_sourceMC3E _ _ r hq,←hj,hn,
   ←lower_row_formulaMFFD _ (secondJMC3E d r) (by omega) (t+3) (secondJMC3E d r) le_rfl,
   lower_row_liftMAE9,second_correction_coeffMC3E,he]
 simp only [show 2 ≤ t+3 by omega,show 3 ≤ t+3 by omega,if_true,
   show t+3-2=t+1 by omega,show t+3-3=t by omega]
 cases r <;> simp [secondOutputMC3E,liftOutputMAE9,secondConstantMC3E,secondSlopeMC3E,secondQMC3E]
   <;> ring

theorem second_output_tailMC3E (d t : ℕ) (r : Bool) (ht : d<t) :
 secondOutputMC3E d t r=liftOutputMAE9 d (secondJMC3E d r) t := by
 simp [secondOutputMC3E,Nat.choose_eq_zero_of_lt ht,
   Nat.choose_eq_zero_of_lt (show d<t+1 by omega)]

theorem second_output_lcMC3E (d t : ℕ) (r : Bool) (ht : 4 ≤ t) :
 secondOutputMC3E d t r*secondOutputMC3E d (t+2) r ≤ secondOutputMC3E d (t+1) r^2 := by
 by_cases hd : d<t
 · rw [second_output_tailMC3E d t r hd,second_output_tailMC3E d (t+1) r (by omega),
     second_output_tailMC3E d (t+2) r (by omega)]
   exact lift_output_lcM7A3 d (secondJMC3E d r) t
 · have hf : CrossLC (zchooseM37B d) := by
     have he : zchooseM37B d=CoeffSeq ((1+X)^d) := by ext k; exact zchoose_coeffM37B d k
     rw [he]
     exact crossLC_binomial d
   have hp (k : ℤ) : 0 ≤ zchooseM37B d k := by
     unfold zchooseM37B
     split_ifs <;> positivity
   have hcut : ∀ h k, 0 ≤ (perturbGapMC3E (secondJMC3E d r) t h
     (secondExtraMC3E d t r) (secondExtraMC3E d (t+1) r) (secondExtraMC3E d (t+2) r)).coeff k := by
     intro h k
     apply perturb_all_cutsMC3E _ _ _ _ _ _ _ (secondExtraMC3E d t r)
     · unfold secondJMC3E; split_ifs <;> omega
     · exact second_extra_nonnegMC3E d t r
     · exact second_extra_nonnegMC3E d (t+1) r
     · exact second_extra_nonnegMC3E d (t+2) r
     · exact second_extra_nonnegMC3E d t r
     · exact le_rfl
     · exact second_extra_monoMC3E d t 2 r
     · exact second_kernel_marginMC3E d t r ht (by omega)
     · exact second_border_marginMC3E d t r ht (by omega)
   have hh := weighted_value_lcMFEE _ _ _ hcut (zchooseM37B d) hf hp
   simp only [second_weighted_outputMC3E] at hh
   exact_mod_cast hh

theorem source_second_highMC3E (d i : ℕ) (r : Bool) (hi : 7 ≤ i) :
 threeRawM9E2 (secondQMC3E d r) r i (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r (i+2) (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r (i+1) (secondJMC3E d r)^2 := by
 have h := second_output_lcMC3E d (i-3) r (by omega)
 rw [←source_second_outputMC3E,←source_second_outputMC3E,←source_second_outputMC3E] at h
 convert h using 1 <;> congr 2 <;> omega

end
end MathGKM.Markov
