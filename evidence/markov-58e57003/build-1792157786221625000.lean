import MarkovSourceOffsetM58E
/-! Machine-authored 58e57003. Exact lower-row support, zeros retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 1000000

theorem lower_highM58E (j d i : ℕ) (hi : j+2*d+2 < i) : lowerValM58E j d i=0 := by
 unfold lowerValM58E
 apply sum_eq_zero
 intro h hh
 have hh' := mem_range.mp hh
 by_cases hd : 2*d < h
 · rw [Nat.choose_eq_zero_of_lt hd]
   simp
 · rw [Nat.choose_eq_zero_of_lt (by omega : j+i+1 < 2*i-1-h),
     Nat.choose_eq_zero_of_lt (by omega : j+i < 2*i-1-h)]
   simp

theorem lower_positiveM58E (j d i : ℕ) :
 0 < lowerValM58E j d i ↔ 2 ≤ i ∧ i ≤ j+2*d+2 := by
 constructor
 · intro hp
   constructor
   · by_contra hn
     rw [lower_lowM58E _ _ _ (by omega)] at hp
     omega
   · by_contra hn
     rw [lower_highM58E _ _ _ (by omega)] at hp
     omega
 · rintro ⟨hi,hu⟩
   let h := i-j-2
   have hh : h < i-1 := by dsimp [h]; omega
   have hd : h ≤ 2*d := by dsimp [h]; omega
   have hc : i ≤ 2*i-2-h := by dsimp [h]; omega
   have hr : 2*i-1-h ≤ j+i+1 := by dsimp [h]; omega
   have h0 : 0 < ((2*d).choose h:ℤ) := by exact_mod_cast Nat.choose_pos hd
   have h1 : 0 < ((2*i-2-h).choose i:ℤ) := by exact_mod_cast Nat.choose_pos hc
   have h2 : 0 < ((j+i+1).choose (2*i-1-h):ℤ) := by exact_mod_cast Nat.choose_pos hr
   have h3 : 0 ≤ ((j+i).choose (2*i-1-h):ℤ) := by positivity
   have hp := mul_pos (mul_pos h0 h1) (lt_of_lt_of_le h2 (le_add_of_nonneg_right h3))
   unfold lowerValM58E
   apply lt_of_lt_of_le hp
   exact single_le_sum (fun _ _ => by positivity) (mem_range.mpr hh)

theorem lower_polygonM58E (j d i : ℕ) :
 InPolygon 2 (2*(j+d)+1) i j ↔ 2 ≤ i ∧ i ≤ j+2*d+2 := by
 unfold InPolygon
 constructor
 · intro h
   constructor
   · by_contra hi
     have hh : i ≤ 1 := by omega
     have hm := Nat.mul_le_mul_left (2*(j+d)+1) hh
     nlinarith
   · omega
 · rintro ⟨hi,hu⟩
   have hm := Nat.mul_le_mul_left (2*(j+d)+1) hi
   constructor
   · nlinarith
   · omega

theorem source_two_lower_supportM58E (path : List Bool) (j d i : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*(j+d)+1) :
 0 < coeff (frame path).mid.p i j ↔ InPolygon (frame path).mid.a (frame path).mid.b i j := by
 rw [source_two_lower_formulaM58E path j d i ha hb,ha,hb,lower_polygonM58E,lower_positiveM58E]

end
end MathGKM.Markov
