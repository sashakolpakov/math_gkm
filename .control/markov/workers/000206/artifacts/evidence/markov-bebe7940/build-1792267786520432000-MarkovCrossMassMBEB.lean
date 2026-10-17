import MarkovThreeMassMBEB
/-! Machine-authored bebe7940. The two correction-entry rows, with the
vanishing summands kept explicitly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def crossQMBEB (n : ℕ) (s r : Bool) : ℕ := n+(if s then (if r then 4 else 3) else (if r then 3 else 2))
def crossJMBEB (n : ℕ) (s r : Bool) : ℕ := n+(if s then (if r then 4 else 3) else (if r then 2 else 1))
def crossCorrectionMBEB (n t : ℕ) (s r : Bool) : ℤ :=
 if s then
   if t=0 then 4*affineIntMBEB (if r then 2 else 1) 2 1 1 n
   else if t=1 then 4*affineIntMBEB (if r then 2 else 1) 3 2 0 (n+2)
   else 0
 else if t=0 then 4*((if r then 2 else 1:ℕ):ℤ)*(n+1) else 0
def crossMassMBEB (n t : ℕ) (s r : Bool) : ℤ :=
 liftOutputMAE9 (n+(if s then 0 else 1)+2*t) (crossJMBEB n s r+(2-t)) t+
 crossCorrectionMBEB n t s r

theorem cross_baseMBEB (n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 baseValueM13E (crossQMBEB n s r) r (t+3) (crossJMBEB n s r+(2-t))=
 (liftOutputMAE9 (n+(if s then 0 else 1)+2*t) (crossJMBEB n s r+(2-t)) t:ℝ) := by
 have hd : t+3+(crossJMBEB n s r+(2-t)) ≤ sourceNME9C (crossQMBEB n s r) r+2 := by
   cases s <;> cases r <;> simp [crossQMBEB,crossJMBEB,sourceNME9C] <;> omega
 rw [baseValueM13E,if_pos hd,show t+3-3=t by omega,lower_liftMBEB]
 · congr 2
   cases s <;> cases r <;> simp [crossQMBEB,crossJMBEB,sourceNME9C] <;> omega
 · cases s <;> cases r <;> simp [crossQMBEB,crossJMBEB,sourceNME9C] <;> omega

theorem cross_correctionMBEB (n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 correctionValueM13E (crossQMBEB n s r) r (t+3) (crossJMBEB n s r+(2-t))=
 (crossCorrectionMBEB n t s r:ℝ) := by
 interval_cases t <;> cases s <;> cases r
 all_goals
   simp only [crossCorrectionMBEB,crossQMBEB,crossJMBEB,correctionValueM13E,
     sourceNME9C,correctionEpsilonM13E,Bool.false_eq_true,if_false,if_true,
     Nat.reduceAdd,Nat.reduceSub,Int.cast_zero]
   split_ifs with hc
   · try omega
   · try omega
 all_goals
   simp only [show ∀ a b : ℕ, n+a+b=n+(a+b) by intros; omega,
     Nat.reduceAdd] at *
 all_goals
   first
   | (rw [affine_kernel_axisM13E]; simp [Nat.choose_one_right]; ring)
   | (rw [affine_shortMBEB _ 2 1 1 n n (by omega),←affine_int_realMBEB]; push_cast; rfl)
   | (rw [affine_shortMBEB _ 3 2 0 n (n+2) (by omega),←affine_int_realMBEB]; push_cast; rfl)
   | rfl

theorem source_cross_massMBEB (n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (crossQMBEB n s r) r (t+3) (crossJMBEB n s r+(2-t))=crossMassMBEB n t s r := by
 have hq : 1 ≤ crossQMBEB n s r := by cases s <;> cases r <;> simp [crossQMBEB] <;> omega
 have he := source_two_kernelMED6 (crossQMBEB n s r) (t+3) (crossJMBEB n s r+(2-t)) r hq (by omega)
 rw [cross_baseMBEB n t s r ht,cross_correctionMBEB n t s r ht] at he
 unfold crossMassMBEB
 exact_mod_cast he

end
end MathGKM.Markov
