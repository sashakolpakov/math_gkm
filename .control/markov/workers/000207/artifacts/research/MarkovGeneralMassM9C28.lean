import MarkovThreeMassMBEB
import MarkovTwoKernelSourceMED6
/-! Machine-authored request 9c28b628. Universal source attachments for every diagonal
starting column c+3, including c=0. These formulas retain the whole correction. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def lowQM9C28 (c x h : ℕ) (r : Bool) : ℕ := 2*x+h+c+(if r then 6 else 5)
def lowJM9C28 (c x h : ℕ) (r : Bool) : ℕ := 3*x+h+c+(if r then 7 else 6)
def upperQM9C28 (c x h : ℕ) (r : Bool) : ℕ := 2*x+h+c+(if r then 5 else 4)
def upperJM9C28 (c x h : ℕ) (r : Bool) : ℕ := 3*x+2*h+c+(if r then 6 else 5)
def upperKM9C28 (c x h : ℕ) (r : Bool) : ℕ := 3*x+h+c+(if r then 7 else 6)
def lowMassM9C28 (c x h t : ℕ) (r : Bool) : ℤ :=
 liftOutputMAE9 (c+h+2*t) (lowJM9C28 c x h r+(2-t)) (c+t)+
 4*affineIntMBEB (if r then 2 else 1) (c+t+2) (c+t+1) (x+(2-t)) (c+h+2*t)
def upperMassM9C28 (c x h t : ℕ) (r : Bool) : ℤ :=
 shortValueMBEB (c+h+4) (upperKM9C28 c x h r+c+t) (c+t)+
 4*affineIntMBEB (if r then 2 else 1) (c+t+1) (c+t+2) x (c+h+4)

theorem source_low_massM9C28 (c x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (lowQM9C28 c x h r) r (c+t+3) (lowJM9C28 c x h r+(2-t))=lowMassM9C28 c x h t r := by
 have hq : 1 ≤ lowQM9C28 c x h r := by cases r <;> simp [lowQM9C28] <;> omega
 have hn : sourceNME9C (lowQM9C28 c x h r) r+2-(c+t+3)-(lowJM9C28 c x h r+(2-t))=
   3*x+2*h+c+(if r then 9 else 8) := by
   cases r <;> simp [sourceNME9C,lowQM9C28,lowJM9C28] <;> omega
 have hd : (c+t+3)+(lowJM9C28 c x h r+(2-t)) ≤ sourceNME9C (lowQM9C28 c x h r) r+2 := by
   cases r <;> simp [sourceNME9C,lowQM9C28,lowJM9C28] <;> omega
 have hc : lowQM9C28 c x h r+1 ≤ lowJM9C28 c x h r+(2-t) ∧
   (c+t+3)+(lowJM9C28 c x h r+(2-t))+lowQM9C28 c x h r ≤ sourceNME9C (lowQM9C28 c x h r) r := by
   cases r <;> simp [sourceNME9C,lowQM9C28,lowJM9C28] <;> omega
 have he := source_two_kernelMED6 (lowQM9C28 c x h r) (c+t+3) (lowJM9C28 c x h r+(2-t)) r hq (by omega)
 rw [baseValueM13E,if_pos hd,correctionValueM13E,if_pos hc,hn] at he
 have hJ : lowJM9C28 c x h r+(2-t)-lowQM9C28 c x h r-1=x+(2-t) := by
   cases r <;> simp [lowQM9C28,lowJM9C28] <;> omega
 have hK : sourceNME9C (lowQM9C28 c x h r) r-lowQM9C28 c x h r-(c+t+3)-(lowJM9C28 c x h r+(2-t))=x+1+h := by
   cases r <;> simp [sourceNME9C,lowQM9C28,lowJM9C28] <;> omega
 rw [hJ,hK,show c+t+3-3=c+t by omega,show c+t+3-1=c+t+2 by omega,show c+t+3-2=c+t+1 by omega,
   lower_liftMBEB (c+t) (lowJM9C28 c x h r+(2-t)) _ (by cases r <;> simp [lowJM9C28] <;> omega),
   affine_shortMBEB _ (c+t+2) (c+t+1) (x+(2-t)) (x+1+h) (c+h+2*t) (by omega)] at he
 have hD : c+t+(3*x+2*h+c+(if r then 9 else 8))-(lowJM9C28 c x h r+(2-t))=c+h+2*t := by
   cases r <;> simp [lowJM9C28] <;> omega
 rw [hD] at he
 have heps : correctionEpsilonM13E r=((if r then 2 else 1:ℕ):ℝ) := by cases r <;> norm_num [correctionEpsilonM13E]
 rw [heps,←affine_int_realMBEB] at he
 unfold lowMassM9C28
 exact_mod_cast he

theorem source_upper_massM9C28 (c x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (upperQM9C28 c x h r) r (c+t+3) (upperJM9C28 c x h r+(2-t))=upperMassM9C28 c x h t r := by
 have hq : 1 ≤ upperQM9C28 c x h r := by cases r <;> simp [upperQM9C28] <;> omega
 have hn : sourceNME9C (upperQM9C28 c x h r) r+2-(c+t+3)-(upperJM9C28 c x h r+(2-t))=upperKM9C28 c x h r := by
   cases r <;> simp [sourceNME9C,upperQM9C28,upperJM9C28,upperKM9C28] <;> omega
 have hd : (c+t+3)+(upperJM9C28 c x h r+(2-t)) ≤ sourceNME9C (upperQM9C28 c x h r) r+2 := by
   cases r <;> simp [sourceNME9C,upperQM9C28,upperJM9C28] <;> omega
 have hc : upperQM9C28 c x h r+1 ≤ upperJM9C28 c x h r+(2-t) ∧
   (c+t+3)+(upperJM9C28 c x h r+(2-t))+upperQM9C28 c x h r ≤ sourceNME9C (upperQM9C28 c x h r) r := by
   cases r <;> simp [sourceNME9C,upperQM9C28,upperJM9C28] <;> omega
 have he := source_two_kernelMED6 (upperQM9C28 c x h r) (c+t+3) (upperJM9C28 c x h r+(2-t)) r hq (by omega)
 rw [baseValueM13E,if_pos hd,correctionValueM13E,if_pos hc,hn] at he
 have hJ : upperJM9C28 c x h r+(2-t)-upperQM9C28 c x h r-1=x+h+(2-t) := by
   cases r <;> simp [upperQM9C28,upperJM9C28] <;> omega
 have hK : sourceNME9C (upperQM9C28 c x h r) r-upperQM9C28 c x h r-(c+t+3)-(upperJM9C28 c x h r+(2-t))=x := by
   cases r <;> simp [sourceNME9C,upperQM9C28,upperJM9C28] <;> omega
 rw [hJ,hK,show c+t+3-3=c+t by omega,show c+t+3-1=c+t+2 by omega,show c+t+3-2=c+t+1 by omega,
   lower_shortMBEB (c+t) (upperJM9C28 c x h r+(2-t)) (upperKM9C28 c x h r) (c+h+4)
     (by cases r <;> simp [upperJM9C28,upperKM9C28] <;> omega),
   affine_kernel_swapM13E,affine_shortMBEB _ (c+t+1) (c+t+2) x (x+h+(2-t)) (c+h+4) (by omega)] at he
 have heps : correctionEpsilonM13E r=((if r then 2 else 1:ℕ):ℝ) := by cases r <;> norm_num [correctionEpsilonM13E]
 rw [heps,←affine_int_realMBEB,show (c+t)+upperKM9C28 c x h r=upperKM9C28 c x h r+c+t by omega] at he
 unfold upperMassM9C28
 exact_mod_cast he

end
end MathGKM.Markov
