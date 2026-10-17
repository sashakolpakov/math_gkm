import MarkovGeneralMassM9C28
/-! Machine-authored request 9c28b628. All columns of the two correction-entry rows, with the
vanishing summands kept explicitly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def crossQM9C28 (c n : ℕ) (s r : Bool) : ℕ  := c+n+(if s then (if r then 4 else 3) else (if r then 3 else 2))
def crossJM9C28 (c n : ℕ) (s r : Bool) : ℕ  := c+n+(if s then (if r then 4 else 3) else (if r then 2 else 1))
def crossCorrectionM9C28 (c n t : ℕ) (s r : Bool) : ℤ :=
 if s then
   if t=0 then 4*affineIntMBEB (if r then 2 else 1) (c+2) (c+1) 1 (n+c)
   else if t=1 then 4*affineIntMBEB (if r then 2 else 1) (c+3) (c+2) 0 (n+c+2)
   else 0
 else if t=0 then 4*((if r then 2 else 1:ℕ):ℤ)*((n+c+1).choose (c+1):ℤ) else 0
def crossMassM9C28 (c n t : ℕ) (s r : Bool) : ℤ :=
 liftOutputMAE9 (c+n+(if s then 0 else 1)+2*t) (crossJM9C28 c n s r+(2-t)) (c+t)+
 crossCorrectionM9C28 c n t s r

theorem cross_baseM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 baseValueM13E (crossQM9C28 c n s r) r (c+t+3) (crossJM9C28 c n s r+(2-t))=
 (liftOutputMAE9 (c+n+(if s then 0 else 1)+2*t) (crossJM9C28 c n s r+(2-t)) (c+t):ℝ) := by
 have hd : c+t+3+(crossJM9C28 c n s r+(2-t)) ≤ sourceNME9C (crossQM9C28 c n s r) r+2 := by
   cases s <;> cases r <;> simp [crossQM9C28,crossJM9C28,sourceNME9C] <;> omega
 rw [baseValueM13E,if_pos hd,show c+t+3-3=c+t by omega,lower_liftMBEB]
 · congr 2
   cases s <;> cases r <;> simp [crossQM9C28,crossJM9C28,sourceNME9C] <;> omega
 · cases s <;> cases r <;> simp [crossQM9C28,crossJM9C28,sourceNME9C] <;> omega

theorem cross_correctionM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 correctionValueM13E (crossQM9C28 c n s r) r (c+t+3) (crossJM9C28 c n s r+(2-t))=
 (crossCorrectionM9C28 c n t s r:ℝ) := by
 have hK : sourceNME9C (crossQM9C28 c n s r) r-crossQM9C28 c n s r-(c+t+3)-(crossJM9C28 c n s r+(2-t))=n := by
   cases s <;> cases r <;> simp [crossQM9C28,crossJM9C28,sourceNME9C] <;> omega
 have hJ : crossJM9C28 c n s r+(2-t)-crossQM9C28 c n s r-1=(if s then 1 else 0)-t := by
   cases s <;> cases r <;> simp [crossQM9C28,crossJM9C28] <;> omega
 have hc : (crossQM9C28 c n s r+1 ≤ crossJM9C28 c n s r+(2-t) ∧
   (c+t+3)+(crossJM9C28 c n s r+(2-t))+crossQM9C28 c n s r ≤ sourceNME9C (crossQM9C28 c n s r) r) ↔
   t ≤ (if s then 1 else 0) := by
   cases s <;> cases r <;> simp [crossQM9C28,crossJM9C28,sourceNME9C] <;> omega
 have heps : correctionEpsilonM13E r=((if r then 2 else 1:ℕ):ℝ) := by cases r <;> norm_num [correctionEpsilonM13E]
 simp only [correctionValueM13E,hc,hJ,hK,heps,show c+t+3-1=c+t+2 by omega,show c+t+3-2=c+t+1 by omega]
 cases s <;> interval_cases t
 all_goals norm_num only [crossCorrectionM9C28,Bool.false_eq_true,if_false,if_true,
   Nat.reduceLeDiff,Nat.reduceEqDiff,Nat.reduceSub,Nat.reduceAdd,Int.cast_zero,Nat.add_zero]
 · rw [affine_kernel_axisM13E]
   push_cast
   ring
 · rw [affine_shortMBEB _ (c+2) (c+1) 1 n (n+c) (by omega),←affine_int_realMBEB]
   push_cast
   rfl
 · rw [affine_shortMBEB _ (c+3) (c+2) 0 n (n+c+2) (by omega),←affine_int_realMBEB]
   push_cast
   rfl

theorem source_cross_massM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (crossQM9C28 c n s r) r (c+t+3) (crossJM9C28 c n s r+(2-t))=crossMassM9C28 c n t s r := by
 have hq : 1 ≤ crossQM9C28 c n s r := by cases s <;> cases r <;> simp [crossQM9C28] <;> omega
 have he := source_two_kernelMED6 (crossQM9C28 c n s r) (c+t+3) (crossJM9C28 c n s r+(2-t)) r hq (by omega)
 rw [cross_baseM9C28 c n t s r ht,cross_correctionM9C28 c n t s r ht] at he
 unfold crossMassM9C28
 exact_mod_cast he

end
end MathGKM.Markov
