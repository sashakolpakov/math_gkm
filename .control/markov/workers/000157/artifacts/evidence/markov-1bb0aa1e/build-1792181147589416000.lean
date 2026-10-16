import MarkovFirstForceM1BB
/-! Machine-authored 1bb0aa1e. The first omitted source row has a concrete
forcing correction. No extrapolation of a negative natural exponent. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def firstGainM1BB (q : ℕ) (r : Bool) (i : ℕ) : ℤ :=
 4 * shiftRawM9E2 1 0
   (if r then (fun a b => addSRawM9E2 (fibRawM9E2 q) a b+fibRawM9E2 (q+1) a b)
   else (fun a b => shiftRawM9E2 0 1 (fibRawM9E2 q) a b+addSRawM9E2 (fibRawM9E2 (q+1)) a b)) i 0

theorem first_forceM1BB (q i : ℕ) (r : Bool) :
 threeForceM96A q r i (q+1)=lowerForceME9C (sourceNME9C q r) i (q+1)+firstGainM1BB q r i := by
 simp only [threeForceM96A,lowerForceME9C,sourceNME9C,fibDeltaME9C,firstGainM1BB,
   shiftRawM9E2,le_refl,and_true,Nat.sub_self,Nat.sub_zero]

theorem first_gain_zeroM1BB (q : ℕ) (r : Bool) : firstGainM1BB q r 0=0 := by
 simp [firstGainM1BB,shiftRawM9E2]

theorem first_gain_oneM1BB (q : ℕ) (r : Bool) (hq : 1 ≤ q) : firstGainM1BB q r 1=0 := by
 cases r <;> simp [firstGainM1BB,shiftRawM9E2,addSRawM9E2,fibRawM9E2,
   show 0≠q by omega,show 0≠q+1 by omega]

theorem first_gain_binomialM1BB (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 firstGainM1BB q r (i+2)=if r then 8*(q.choose i:ℤ) else 4*((q+1).choose i:ℤ) := by
 have hf (n k : ℕ) (hn : 0<n) : fibRawM9E2 n (k+1) 0=((n-1).choose k:ℤ) := by
   simpa using fib_raw_extendedME9C n k 0 hn
 cases i with
 | zero =>
   cases r <;> simp [firstGainM1BB,shiftRawM9E2,addSRawM9E2,
     hf q 0 (by omega),hf (q+1) 0 (by omega),fibRawM9E2,show 0≠q by omega]
 | succ i =>
   have hh : ((q-1).choose (i+1):ℤ)+((q-1).choose i:ℤ)=(q.choose (i+1):ℤ) := by
     rw [←Nat.cast_add,←Nat.choose_succ_succ,show q-1+1=q by omega]
   cases r <;>
     simp only [firstGainM1BB,Bool.false_eq_true,if_false,if_true,shiftRawM9E2,
       show 1 ≤ i+1+2 by omega,show 1 ≤ i+1+2-1 by omega,
       Nat.zero_le,and_self,if_true,Nat.sub_zero,show i+1+2-1=i+2 by omega,
       show i+2-1=i+1 by omega,show ¬1 ≤ (0:ℕ) by omega,and_false,if_false,
       addSRawM9E2,show 1 ≤ i+2 by omega,true_and,show i+2=(i+1)+1 by omega,
       hf q (i+1) (by omega),hf q i (by omega),hf (q+1) (i+1) (by omega),
       hf (q+1) i (by omega),Nat.add_sub_cancel,zero_add,add_zero]
   · rw [Nat.choose_succ_succ,Nat.cast_add]
     ring
   · linear_combination 4*hh

def firstDiffM1BB (q : ℕ) (r : Bool) (i : ℕ) : ℤ :=
 threeRawM9E2 q r i (q+1)-lowerRawME9C (sourceNME9C q r) i (q+1)

theorem first_diff_equationM1BB (q i : ℕ) (r : Bool) :
 firstDiffM1BB q r i+2*(if 1 ≤ i then firstDiffM1BB q r (i-1) else 0)+
 (if 2 ≤ i then firstDiffM1BB q r (i-2) else 0)=firstGainM1BB q r i := by
 have hs := three_raw_equationM96A q r i (q+1)
 have hl := lower_raw_equationME9C (sourceNME9C q r) i (q+1)
 rw [first_forceM1BB] at hs
 have he (a b : ℕ) (hb : 1 ≤ b) :
   shiftRawM9E2 a b (threeRawM9E2 q r) i (q+1)=
   shiftRawM9E2 a b (lowerRawME9C (sourceNME9C q r)) i (q+1) := by
   unfold shiftRawM9E2
   split_ifs with h
   · exact (lower_region_formulaME9C q r (i-a) (q+1-b) (by omega)).symm
   · rfl
 unfold discriminantActionM96A at hs hl
 rw [he 0 1 (by omega),he 1 1 (by omega),he 0 2 (by omega)] at hs
 simp only [shiftRawM9E2,Nat.zero_le,and_true,Nat.sub_zero] at hs hl
 unfold firstDiffM1BB
 split_ifs <;> simp_all <;> linarith

end
end MathGKM.Markov
