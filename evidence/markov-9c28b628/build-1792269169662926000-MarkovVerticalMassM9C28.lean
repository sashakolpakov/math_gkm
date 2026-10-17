import MarkovMassBridgeM9C28
/-! Machine-authored request 9c28b628. Universal vertical mass formulas.
All parameters are unbounded. This module asserts no log-concavity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def vLowMassM9C28 (c x h t : ℕ) (r : Bool) : ℤ :=
 liftOutputMAE9 (c+h+4-2*t) (lowJM9C28 c x h r+t) (c+1)+
 4*affineIntMBEB (if r then 2 else 1) (c+3) (c+2) (x+t) (c+h+4-2*t)
def vUpperQM9C28 (c x h : ℕ) (r : Bool) : ℕ := 2*x+h+c+(if r then 7 else 6)
def vUpperJM9C28 (c x h : ℕ) (r : Bool) : ℕ := 3*x+2*h+c+(if r then 9 else 8)
def vUpperKM9C28 (c x h : ℕ) (r : Bool) : ℕ := 3*x+h+c+(if r then 11 else 10)
def vUpperMassM9C28 (c x h t : ℕ) (r : Bool) : ℤ :=
 shortValueMBEB (c+h+2+2*t) (vUpperKM9C28 c x h r+c+1-t) (c+1)+
 4*affineIntMBEB (if r then 2 else 1) (c+2) (c+3) (x+2-t) (c+h+2+2*t)

theorem source_vlow_massM9C28 (c x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (lowQM9C28 c x h r) r (c+4) (lowJM9C28 c x h r+t)=vLowMassM9C28 c x h t r := by
 have hq : 1 ≤ lowQM9C28 c x h r := by cases r <;> simp [lowQM9C28] <;> omega
 have he := source_two_kernelMED6 _ (c+4) (lowJM9C28 c x h r+t) r hq (by omega)
 rw [base_liftM9C28 _ _ _ (c+h+4-2*t) _ (by omega)
     (by cases r <;> simp [lowQM9C28,lowJM9C28,sourceNME9C] <;> omega)
     (by cases r <;> simp [lowQM9C28,lowJM9C28,sourceNME9C] <;> omega),
   correction_liftM9C28 _ _ _ (c+h+4-2*t) (x+t) _ (by omega)
     (by cases r <;> simp [lowQM9C28,lowJM9C28,sourceNME9C] <;> omega)
     (by cases r <;> simp [lowQM9C28,lowJM9C28] <;> omega)
     (by cases r <;> simp [lowQM9C28,lowJM9C28,sourceNME9C] <;> omega)] at he
 simp only [show c+4-3=c+1 by omega,show c+4-1=c+3 by omega,show c+4-2=c+2 by omega] at he
 unfold vLowMassM9C28
 exact_mod_cast he

theorem source_vupper_massM9C28 (c x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (vUpperQM9C28 c x h r) r (c+4) (vUpperJM9C28 c x h r+t)=vUpperMassM9C28 c x h t r := by
 have hq : 1 ≤ vUpperQM9C28 c x h r := by cases r <;> simp [vUpperQM9C28] <;> omega
 have he := source_two_kernelMED6 _ (c+4) (vUpperJM9C28 c x h r+t) r hq (by omega)
 rw [base_shortM9C28 _ _ _ (c+h+2+2*t) (vUpperKM9C28 c x h r+c+1-t) _ (by omega)
     (by cases r <;> simp [vUpperQM9C28,vUpperJM9C28,vUpperKM9C28,sourceNME9C] <;> omega)
     (by cases r <;> simp [vUpperQM9C28,vUpperJM9C28,vUpperKM9C28,sourceNME9C] <;> omega)
     (by cases r <;> simp [vUpperQM9C28,vUpperJM9C28,vUpperKM9C28,sourceNME9C] <;> omega),
   correction_shortM9C28 _ _ _ (c+h+2+2*t) (x+2-t) _ (by omega)
     (by cases r <;> simp [vUpperQM9C28,vUpperJM9C28,sourceNME9C] <;> omega)
     (by cases r <;> simp [vUpperQM9C28,vUpperJM9C28,sourceNME9C] <;> omega)
     (by cases r <;> simp [vUpperQM9C28,vUpperJM9C28] <;> omega)] at he
 simp only [show c+4-3=c+1 by omega,show c+4-1=c+3 by omega,show c+4-2=c+2 by omega] at he
 unfold vUpperMassM9C28
 exact_mod_cast he

end
end MathGKM.Markov
