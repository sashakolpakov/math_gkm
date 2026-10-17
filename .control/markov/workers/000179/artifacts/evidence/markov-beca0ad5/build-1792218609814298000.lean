import MarkovReverseCoreMBEC
/-! Machine-authored beca0ad5. An exact integer certificate for every remaining
upper inequality. Positivity of these integers is NOT assumed or proved. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 6000000

def integerWeightMBEC (r : ℕ) : ℤ := if r=0 then 1 else 4*r

def clearedKernelMBEC (j s h r : ℕ) : ℤ :=
 integerWeightMBEC r*(j.descFactorial r:ℤ)*((s+j+3-r).descFactorial (h-r):ℤ)

def clearedConvMBEC (j s t h m : ℕ) : ℤ :=
 ∑ r ∈ range (m+1), clearedKernelMBEC j s h r*clearedKernelMBEC j t h (m-r)

def clearedGapMBEC (j s h : ℕ) : ℤ :=
 clearedConvMBEC j (s+1) (s+1) h (h-1)*clearedConvMBEC j s (s+2) h h-
 clearedConvMBEC j (s+1) (s+1) h h*clearedConvMBEC j s (s+2) h (h-1)

theorem integer_weight_castMBEC (r : ℕ) : (integerWeightMBEC r:ℝ)=qWeightM7E2 r := by
 by_cases hr : r=0
 · subst r; norm_num [integerWeightMBEC,qWeightM7E2]
 · simp [integerWeightMBEC,qWeightM7E2,hr,show ¬(r:ℤ)<0 by omega]

theorem cleared_kernel_castMBEC (j s h r : ℕ) (hh : h ≤ j) (hr : r ≤ h) :
 (clearedKernelMBEC j s h r:ℝ)=
 ((s+j+3).descFactorial h:ℝ)*reverseKernelMBEC j s r := by
 have hp : (0:ℝ)<(s+j+3).descFactorial r := by
   exact_mod_cast Nat.descFactorial_pos.mpr (show r ≤ s+j+3 by omega)
 have hi : ((s+j+3-r).descFactorial (h-r):ℝ)*((s+j+3).descFactorial r:ℝ)=
   ((s+j+3).descFactorial h:ℝ) := by
   exact_mod_cast Nat.descFactorial_mul_descFactorial (n:=s+j+3) (m:=h) (k:=r) hr
 unfold clearedKernelMBEC reverseKernelMBEC
 push_cast
 rw [integer_weight_castMBEC]
 apply (mul_right_injective₀ (ne_of_gt hp))
 field_simp
 nlinarith only [congrArg (fun x : ℝ => qWeightM7E2 r*(j.descFactorial r:ℝ)*x) hi]

theorem cleared_conv_castMBEC (j s t h m : ℕ) (hh : h ≤ j) (hm : m ≤ h) :
 (clearedConvMBEC j s t h m:ℝ)=
 ((s+j+3).descFactorial h:ℝ)*((t+j+3).descFactorial h:ℝ)*reverseConvMBEC j s t m := by
 unfold clearedConvMBEC reverseConvMBEC
 push_cast
 rw [mul_sum]
 apply sum_congr rfl
 intro r hr
 have hr' : r ≤ m := by simpa using hr
 rw [cleared_kernel_castMBEC j s h r hh (by omega),
   cleared_kernel_castMBEC j t h (m-r) hh (by omega)]
 ring

theorem cleared_gap_iffMBEC (j s h : ℕ) (hh : h ≤ j) :
 0 ≤ clearedGapMBEC j s h ↔
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1) ≤
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h := by
 have he : (clearedGapMBEC j s h:ℝ)=
 ((s+j+3).descFactorial h:ℝ)*((s+1+j+3).descFactorial h:ℝ)^2*
   ((s+2+j+3).descFactorial h:ℝ)*
 (reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h-
  reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1)) := by
   unfold clearedGapMBEC
   push_cast
   rw [cleared_conv_castMBEC _ _ _ _ _ hh (by omega),
     cleared_conv_castMBEC _ _ _ _ _ hh (by omega),
     cleared_conv_castMBEC _ _ _ _ _ hh (by omega),
     cleared_conv_castMBEC _ _ _ _ _ hh (by omega)]
   ring
 have hp (t : ℕ) : (0:ℝ)<(t+j+3).descFactorial h := by
   exact_mod_cast Nat.descFactorial_pos.mpr (show h ≤ t+j+3 by omega)
 have hs : 0<((s+j+3).descFactorial h:ℝ)*((s+1+j+3).descFactorial h:ℝ)^2*
   ((s+2+j+3).descFactorial h:ℝ) :=
   mul_pos (mul_pos (hp s) (sq_pos_of_pos (hp (s+1)))) (hp (s+2))
 constructor
 · intro H
   have H' : (0:ℝ) ≤ clearedGapMBEC j s h := by exact_mod_cast H
   rw [he] at H'
   exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hs).mp H')
 · intro H
   have H' : (0:ℝ) ≤ clearedGapMBEC j s h := by rw [he]; exact mul_nonneg hs.le (sub_nonneg.mpr H)
   exact_mod_cast H'

def ClearedCoreMBEC : Prop := ∀ j s h : ℕ, 4 ≤ h → h ≤ j → 0 ≤ clearedGapMBEC j s h

theorem cleared_core_iffMBEC : ClearedCoreMBEC ↔ UpperAdjacentMA45 := by
 rw [←reverse_core_iffMBEC]
 constructor
 · intro H j s h hh hj
   exact (cleared_gap_iffMBEC j s h hj).mp (H j s h hh hj)
 · intro H j s h hh hj
   exact (cleared_gap_iffMBEC j s h hj).mpr (H j s h hh hj)

theorem source_band_of_clearedMBEC (H : ClearedCoreMBEC)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_upperMA45 (cleared_core_iffMBEC.mp H) q k i r hq hn

end
end MathGKM.Markov
