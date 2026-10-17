import MarkovKernelStepM7E2
import MarkovKernelSupportMAD5
/-! Machine-authored ad504da6. Rational normalization with endpoint factors
kept as zero. These ratios are auxiliary and do not normalize source coefficients. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000

def pairAMAD5 (j t m : ℚ) : ℚ :=
 m*liftDenMAE9 t m*(liftWeightMAE9 j t m-2)/
 ((j-m+1)*(t+m+2)*(t+m+3)*liftWeightMAE9 j t m)
def pairBMAD5 (j t m : ℚ) : ℚ :=
 (j-m)*liftDenMAE9 t m*(liftWeightMAE9 j t m+2)/
 ((m+1)*(t+m+6)*(t+m+7)*liftWeightMAE9 j t m)
def leftTermMAD5 (j t m : ℕ) : ℤ := if m=0 then 0 else liftTermMAE9 j t (m-1)

theorem pair_left_stepMAD5 (j t m : ℕ) (hm : m+1 ≤ j) :
 (liftTermMAE9 j t m:ℚ)=(liftTermMAE9 j (t+1) (m+1):ℚ)*
 ((t+4)/(t+j+4))*pairAMAD5 j (t+1) (m+1) := by
 have hh := lift_diagonal_stepM7E2 j t m hm
 have hjm : (0:ℚ)<j-m := sub_pos.mpr (by exact_mod_cast (show m<j by omega))
 have hw : 0 < liftWeightMAE9 j t m := lift_weight_positiveMAE9 _ _ _ (by positivity) (by positivity) (by exact_mod_cast (show m ≤ j by omega))
 have hwp : liftWeightMAE9 j t m+2≠0 := ne_of_gt (by linarith)
 unfold pairAMAD5
 push_cast
 rw [lift_weight_stepM7E2]
 simp only [add_sub_cancel_right]
 unfold liftDenMAE9 at hh ⊢
 push_cast at hh
 have hd0 : (t:ℚ)+m+4≠0 := by positivity
 have hd1 : (t:ℚ)+m+5≠0 := by positivity
 have hd2 : (t:ℚ)+j+4≠0 := by positivity
 have hde : (j:ℚ)-(m+1)+1=j-m := by ring
 rw [hde]
 have he0 : (t:ℚ)+1+(m+1)+2=t+m+4 := by ring
 have he1 : (t:ℚ)+1+(m+1)+3=t+m+5 := by ring
 rw [he0,he1]
 field_simp
 <;> nlinarith only [hh]

theorem pair_right_stepMAD5 (j t m : ℕ) (hm : m ≤ j) :
 (liftTermMAE9 j (t+2) (m+1):ℚ)=(liftTermMAE9 j (t+1) m:ℚ)*
 ((t+j+5)/(t+5))*pairBMAD5 j (t+1) m := by
 by_cases he : m=j
 · subst m
   rw [lift_term_tailM7E2 _ _ _ (by omega)]
   simp [pairBMAD5]
 · have hh := lift_diagonal_stepM7E2 j (t+1) m (by omega)
   rw [show t+1+1=t+2 by omega] at hh
   have hw : 0 < liftWeightMAE9 j (t+1) m := lift_weight_positiveMAE9 _ _ _ (by positivity) (by positivity) (by exact_mod_cast hm)
   have hwp : liftWeightMAE9 j (t+1) m≠0 := ne_of_gt hw
   unfold pairBMAD5
   unfold liftDenMAE9 at hh ⊢
   push_cast at hh
   have hd0 : (t:ℚ)+5≠0 := by positivity
   have hd1 : (m:ℚ)+1≠0 := by positivity
   have hd2 : (t:ℚ)+1+m+6≠0 := by positivity
   have hd3 : (t:ℚ)+1+m+7≠0 := by positivity
   field_simp
   <;> nlinarith only [hh]

theorem pair_left_allMAD5 (j t m : ℕ) (hm : m ≤ j) :
 (leftTermMAD5 j t m:ℚ)=(liftTermMAE9 j (t+1) m:ℚ)*
 ((t+4)/(t+j+4))*pairAMAD5 j (t+1) m := by
 cases m with
 | zero => simp [leftTermMAD5,pairAMAD5]
 | succ m =>
   simp only [leftTermMAD5,Nat.succ_ne_zero,if_false,Nat.add_sub_cancel]
   simpa only [Nat.cast_add,Nat.cast_one] using pair_left_stepMAD5 j t m hm

end
end MathGKM.Markov
