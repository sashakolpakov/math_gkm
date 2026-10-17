import MarkovMassBridgeM9C28
/-! Machine-authored request 9c28b628. The four vertical correction boundary
chambers in arbitrary columns. Zero summands are kept explicitly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def vEntryQM9C28 (c n : ℕ) (s r : Bool) : ℕ :=
 c+n+(if s then (if r then 5 else 4) else (if r then 4 else 3))
def vEntryJM9C28 (c n : ℕ) (s r : Bool) : ℕ :=
 c+n+(if s then (if r then 5 else 4) else (if r then 3 else 2))
def vEntryCorrectionM9C28 (c n t : ℕ) (s r : Bool) : ℤ :=
 if s then
  if t=1 then 4*affineIntMBEB (if r then 2 else 1) (c+3) (c+2) 0 (n+c+3)
  else if t=2 then 4*affineIntMBEB (if r then 2 else 1) (c+3) (c+2) 1 (n+c+1)
  else 0
 else if t=2 then 4*affineIntMBEB (if r then 2 else 1) (c+3) (c+2) 0 (n+c+2) else 0
def vEntryMassM9C28 (c n t : ℕ) (s r : Bool) : ℤ :=
 liftOutputMAE9 (c+n+(if s then 5 else 6)-2*t) (vEntryJM9C28 c n s r+t) (c+1)+
 vEntryCorrectionM9C28 c n t s r

def vExitQM9C28 (c n : ℕ) (s r : Bool) : ℕ :=
 c+n+(if s then (if r then 5 else 4) else (if r then 4 else 3))
def vExitJM9C28 (c n : ℕ) (s r : Bool) : ℕ :=
 2*n+c+(if s then (if r then 6 else 5) else (if r then 5 else 4))
def vExitCorrectionM9C28 (c n t : ℕ) (s r : Bool) : ℤ :=
 if s then
  if t=0 then 4*affineIntMBEB (if r then 2 else 1) (c+2) (c+3) 1 (n+c+2)
  else if t=1 then 4*affineIntMBEB (if r then 2 else 1) (c+2) (c+3) 0 (n+c+4)
  else 0
 else if t=0 then 4*affineIntMBEB (if r then 2 else 1) (c+2) (c+3) 0 (n+c+3) else 0
def vExitMassM9C28 (c n t : ℕ) (s r : Bool) : ℤ :=
 shortValueMBEB (n+c+(if s then 2 else 3)+2*t)
  (vExitQM9C28 c n s r+c+(if s then 4 else 3)-t) (c+1)+vExitCorrectionM9C28 c n t s r

theorem ventry_baseM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 baseValueM13E (vEntryQM9C28 c n s r) r (c+4) (vEntryJM9C28 c n s r+t)=
 (liftOutputMAE9 (c+n+(if s then 5 else 6)-2*t) (vEntryJM9C28 c n s r+t) (c+1):ℝ) := by
 rw [base_liftM9C28 _ _ _ (c+n+(if s then 5 else 6)-2*t) _ (by omega)
   (by cases s <;> cases r <;> simp [vEntryQM9C28,vEntryJM9C28,sourceNME9C] <;> omega)
   (by cases s <;> cases r <;> simp [vEntryQM9C28,vEntryJM9C28,sourceNME9C] <;> omega),
   show c+4-3=c+1 by omega]

theorem ventry_correctionM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 correctionValueM13E (vEntryQM9C28 c n s r) r (c+4) (vEntryJM9C28 c n s r+t)=
 (vEntryCorrectionM9C28 c n t s r:ℝ) := by
 cases s <;> interval_cases t
 all_goals norm_num only [vEntryCorrectionM9C28,Bool.false_eq_true,if_false,if_true,Nat.reduceEqDiff,Int.cast_zero]
 all_goals first
 | (rw [correctionValueM13E,if_neg (by cases r <;> simp [vEntryQM9C28,vEntryJM9C28,sourceNME9C] <;> omega)])
 | (rw [correction_liftM9C28 _ _ _ _ _ _ (by omega)
      (by cases r <;> simp [vEntryQM9C28,vEntryJM9C28,sourceNME9C] <;> omega)
      (by cases r <;> simp [vEntryQM9C28,vEntryJM9C28] <;> omega)
      (by cases r <;> simp [vEntryQM9C28,vEntryJM9C28,sourceNME9C] <;> omega),
      show c+4-1=c+3 by omega,show c+4-2=c+2 by omega])

theorem source_ventry_massM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (vEntryQM9C28 c n s r) r (c+4) (vEntryJM9C28 c n s r+t)=vEntryMassM9C28 c n t s r := by
 have hq : 1 ≤ vEntryQM9C28 c n s r := by cases s <;> cases r <;> simp [vEntryQM9C28] <;> omega
 have he := source_two_kernelMED6 _ (c+4) (vEntryJM9C28 c n s r+t) r hq (by omega)
 rw [ventry_baseM9C28 c n t s r ht,ventry_correctionM9C28 c n t s r ht] at he
 unfold vEntryMassM9C28
 exact_mod_cast he

theorem vexit_baseM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 baseValueM13E (vExitQM9C28 c n s r) r (c+4) (vExitJM9C28 c n s r+t)=
 (shortValueMBEB (n+c+(if s then 2 else 3)+2*t)
  (vExitQM9C28 c n s r+c+(if s then 4 else 3)-t) (c+1):ℝ) := by
 rw [base_shortM9C28 _ _ _ (n+c+(if s then 2 else 3)+2*t)
   (vExitQM9C28 c n s r+c+(if s then 4 else 3)-t) _ (by omega)
   (by cases s <;> cases r <;> simp [vExitQM9C28,vExitJM9C28,sourceNME9C] <;> omega)
   (by cases s <;> cases r <;> simp [vExitQM9C28,vExitJM9C28,sourceNME9C] <;> omega)
   (by cases s <;> cases r <;> simp [vExitQM9C28,vExitJM9C28,sourceNME9C] <;> omega),
   show c+4-3=c+1 by omega]

theorem vexit_correctionM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 correctionValueM13E (vExitQM9C28 c n s r) r (c+4) (vExitJM9C28 c n s r+t)=
 (vExitCorrectionM9C28 c n t s r:ℝ) := by
 cases s <;> interval_cases t
 all_goals norm_num only [vExitCorrectionM9C28,Bool.false_eq_true,if_false,if_true,Nat.reduceEqDiff,Int.cast_zero]
 all_goals first
 | (rw [correctionValueM13E,if_neg (by cases r <;> simp [vExitQM9C28,vExitJM9C28,sourceNME9C] <;> omega)])
 | (rw [correction_shortM9C28 _ _ _ _ _ _ (by omega)
      (by cases r <;> simp [vExitQM9C28,vExitJM9C28,sourceNME9C] <;> omega)
      (by cases r <;> simp [vExitQM9C28,vExitJM9C28,sourceNME9C] <;> omega)
      (by cases r <;> simp [vExitQM9C28,vExitJM9C28] <;> omega),
      show c+4-1=c+3 by omega,show c+4-2=c+2 by omega])

theorem source_vexit_massM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (vExitQM9C28 c n s r) r (c+4) (vExitJM9C28 c n s r+t)=vExitMassM9C28 c n t s r := by
 have hq : 1 ≤ vExitQM9C28 c n s r := by cases s <;> cases r <;> simp [vExitQM9C28] <;> omega
 have he := source_two_kernelMED6 _ (c+4) (vExitJM9C28 c n s r+t) r hq (by omega)
 rw [vexit_baseM9C28 c n t s r ht,vexit_correctionM9C28 c n t s r ht] at he
 unfold vExitMassM9C28
 exact_mod_cast he

end
end MathGKM.Markov
