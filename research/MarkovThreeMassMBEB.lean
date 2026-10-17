import MarkovAffineShortMBEB
import MarkovTwoKernelSourceMED6
/-! Machine-authored bebe7940. Two unbounded chambers for the actual diagonal
starting at column three. These formulas retain the whole correction. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def affineIntMBEB (e a b J H : ℕ) : ℤ :=
 ∑ l ∈ range (b+1), ((a+l).choose a:ℤ)*(H.choose (b-l):ℤ)*
   ((e:ℤ)*((J+a+1).choose (a+l+1):ℤ)+3*((J+a+1).choose (a+l+2):ℤ))

theorem affine_int_realMBEB (e a b J H : ℕ) :
 (affineIntMBEB e a b J H:ℝ)=affineShortMBEB e a b J H := by
 simp only [affineIntMBEB,affineShortMBEB,Int.cast_sum,Int.cast_mul,Int.cast_add,
   Int.cast_natCast,Int.cast_ofNat]

def lowQMBEB (x h : ℕ) (r : Bool) : ℕ := 2*x+h+(if r then 6 else 5)
def lowJMBEB (x h : ℕ) (r : Bool) : ℕ := 3*x+h+(if r then 7 else 6)
def upperQMBEB (x h : ℕ) (r : Bool) : ℕ := 2*x+h+(if r then 5 else 4)
def upperJMBEB (x h : ℕ) (r : Bool) : ℕ := 3*x+2*h+(if r then 6 else 5)
def upperKMBEB (x h : ℕ) (r : Bool) : ℕ := 3*x+h+(if r then 7 else 6)
def lowMassMBEB (x h t : ℕ) (r : Bool) : ℤ :=
 liftOutputMAE9 (h+2*t) (lowJMBEB x h r+(2-t)) t+
 4*affineIntMBEB (if r then 2 else 1) (t+2) (t+1) (x+(2-t)) (h+2*t)
def upperMassMBEB (x h t : ℕ) (r : Bool) : ℤ :=
 shortValueMBEB (h+4) (upperKMBEB x h r+t) t+
 4*affineIntMBEB (if r then 2 else 1) (t+1) (t+2) x (h+4)

theorem source_low_massMBEB (x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (lowQMBEB x h r) r (t+3) (lowJMBEB x h r+(2-t))=lowMassMBEB x h t r := by
 have hq : 1 ≤ lowQMBEB x h r := by cases r <;> simp [lowQMBEB] <;> omega
 have hn : sourceNME9C (lowQMBEB x h r) r+2-(t+3)-(lowJMBEB x h r+(2-t))=
   3*x+2*h+(if r then 9 else 8) := by
   cases r <;> simp [sourceNME9C,lowQMBEB,lowJMBEB] <;> omega
 have hd : (t+3)+(lowJMBEB x h r+(2-t)) ≤ sourceNME9C (lowQMBEB x h r) r+2 := by
   cases r <;> simp [sourceNME9C,lowQMBEB,lowJMBEB] <;> omega
 have hc : lowQMBEB x h r+1 ≤ lowJMBEB x h r+(2-t) ∧
   (t+3)+(lowJMBEB x h r+(2-t))+lowQMBEB x h r ≤ sourceNME9C (lowQMBEB x h r) r := by
   cases r <;> simp [sourceNME9C,lowQMBEB,lowJMBEB] <;> omega
 have he := source_two_kernelMED6 (lowQMBEB x h r) (t+3) (lowJMBEB x h r+(2-t)) r hq (by omega)
 rw [baseValueM13E,if_pos hd,correctionValueM13E,if_pos hc,hn] at he
 have hJ : lowJMBEB x h r+(2-t)-lowQMBEB x h r-1=x+(2-t) := by
   cases r <;> simp [lowQMBEB,lowJMBEB] <;> omega
 have hK : sourceNME9C (lowQMBEB x h r) r-lowQMBEB x h r-(t+3)-(lowJMBEB x h r+(2-t))=x+1+h := by
   cases r <;> simp [sourceNME9C,lowQMBEB,lowJMBEB] <;> omega
 rw [hJ,hK,show t+3-3=t by omega,show t+3-1=t+2 by omega,show t+3-2=t+1 by omega,
   lower_liftMBEB t (lowJMBEB x h r+(2-t)) _ (by cases r <;> simp [lowJMBEB] <;> omega),
   affine_shortMBEB _ (t+2) (t+1) (x+(2-t)) (x+1+h) (h+2*t) (by omega)] at he
 have hD : t+(3*x+2*h+(if r then 9 else 8))-(lowJMBEB x h r+(2-t))=h+2*t := by
   cases r <;> simp [lowJMBEB] <;> omega
 rw [hD] at he
 have heps : correctionEpsilonM13E r=((if r then 2 else 1:ℕ):ℝ) := by cases r <;> norm_num [correctionEpsilonM13E]
 rw [heps,←affine_int_realMBEB] at he
 unfold lowMassMBEB
 exact_mod_cast he

theorem source_upper_massMBEB (x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 threeRawM9E2 (upperQMBEB x h r) r (t+3) (upperJMBEB x h r+(2-t))=upperMassMBEB x h t r := by
 have hq : 1 ≤ upperQMBEB x h r := by cases r <;> simp [upperQMBEB] <;> omega
 have hn : sourceNME9C (upperQMBEB x h r) r+2-(t+3)-(upperJMBEB x h r+(2-t))=upperKMBEB x h r := by
   cases r <;> simp [sourceNME9C,upperQMBEB,upperJMBEB,upperKMBEB] <;> omega
 have hd : (t+3)+(upperJMBEB x h r+(2-t)) ≤ sourceNME9C (upperQMBEB x h r) r+2 := by
   cases r <;> simp [sourceNME9C,upperQMBEB,upperJMBEB] <;> omega
 have hc : upperQMBEB x h r+1 ≤ upperJMBEB x h r+(2-t) ∧
   (t+3)+(upperJMBEB x h r+(2-t))+upperQMBEB x h r ≤ sourceNME9C (upperQMBEB x h r) r := by
   cases r <;> simp [sourceNME9C,upperQMBEB,upperJMBEB] <;> omega
 have he := source_two_kernelMED6 (upperQMBEB x h r) (t+3) (upperJMBEB x h r+(2-t)) r hq (by omega)
 rw [baseValueM13E,if_pos hd,correctionValueM13E,if_pos hc,hn] at he
 have hJ : upperJMBEB x h r+(2-t)-upperQMBEB x h r-1=x+h+(2-t) := by
   cases r <;> simp [upperQMBEB,upperJMBEB] <;> omega
 have hK : sourceNME9C (upperQMBEB x h r) r-upperQMBEB x h r-(t+3)-(upperJMBEB x h r+(2-t))=x := by
   cases r <;> simp [sourceNME9C,upperQMBEB,upperJMBEB] <;> omega
 rw [hJ,hK,show t+3-3=t by omega,show t+3-1=t+2 by omega,show t+3-2=t+1 by omega,
   lower_shortMBEB t (upperJMBEB x h r+(2-t)) (upperKMBEB x h r) (h+4)
     (by cases r <;> simp [upperJMBEB,upperKMBEB] <;> omega),
   affine_kernel_swapM13E,affine_shortMBEB _ (t+1) (t+2) x (x+h+(2-t)) (h+4) (by omega)] at he
 have heps : correctionEpsilonM13E r=((if r then 2 else 1:ℕ):ℝ) := by cases r <;> norm_num [correctionEpsilonM13E]
 rw [heps,←affine_int_realMBEB,show t+upperKMBEB x h r=upperKMBEB x h r+t by omega] at he
 unfold upperMassMBEB
 exact_mod_cast he

end
end MathGKM.Markov
