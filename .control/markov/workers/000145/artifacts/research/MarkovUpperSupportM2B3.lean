import MarkovSourceUpperM2B3
/-! Machine-authored 2b34268b. Exact support, with all zero coefficients retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem upper_val_zeroM2B3 (N d i : ℕ) (hi : i=0 ∨ N+2 < i) :
 upperValM2B3 N d i=0 := by
 rcases hi with hi | hi
 · simp [upperValM2B3,hi]
 · unfold upperValM2B3
   rw [if_neg (by omega : i≠0)]
   apply sum_eq_zero
   intro h hh
   have hh' := mem_range.mp hh
   rw [Nat.choose_eq_zero_of_lt (by omega : N+i-h+1 < 2*i-1-h),
     Nat.choose_eq_zero_of_lt (by omega : N+i-h < 2*i-1-h)]
   simp

theorem upper_val_posM2B3 (N d i : ℕ) (hd : 1 ≤ d) (hi : 1 ≤ i) (hN : i ≤ N+2) :
 0 < upperValM2B3 N d i := by
 unfold upperValM2B3
 rw [if_neg (by omega : i≠0)]
 apply sum_pos'
 · intro h hh
   positivity
 · refine ⟨i,mem_range.mpr (by omega),?_⟩
   rw [Nat.sub_self,show N+i-i=N by omega,show 2*i-1-i=i-1 by omega,
     Nat.choose_zero_right]
   have h1 : 0 < ((2*d+i-1).choose i:ℤ) := by
     exact_mod_cast Nat.choose_pos (by omega : i ≤ 2*d+i-1)
   have h2 : 0 < ((N+1).choose (i-1):ℤ) := by
     exact_mod_cast Nat.choose_pos (by omega : i-1 ≤ N+1)
   have h3 : 0 ≤ (N.choose (i-1):ℤ) := by positivity
   positivity

theorem upper_val_supportM2B3 (N d i : ℕ) (hd : 1 ≤ d) :
 0 < upperValM2B3 N d i ↔ 1 ≤ i ∧ i ≤ N+2 := by
 constructor
 · intro h
   by_contra hn
   have hz := upper_val_zeroM2B3 N d i (by omega)
   omega
 · rintro ⟨hi,hN⟩
   exact upper_val_posM2B3 N d i hd hi hN

theorem upper_polygonM2B3 (N d i : ℕ) (hN : 1 ≤ N) (hd : 1 ≤ d) :
 InPolygon 2 (2*(N+d)+1) i (N+2*d) ↔ 1 ≤ i ∧ i ≤ N+2 := by
 unfold InPolygon
 constructor
 · rintro ⟨ha,hb⟩
   constructor
   · by_contra hn
     have hi : i=0 := by omega
     subst i
     simp only [mul_zero,zero_add] at ha
     omega
   · omega
 · rintro ⟨hi,hj⟩
   constructor
   · have hm := Nat.mul_le_mul_left (2*(N+d)+1) hi
     nlinarith
   · omega

theorem source_upper_supportM2B3 (path : List Bool) (N d i : ℕ)
 (hN : 1 ≤ N) (hd : 1 ≤ d) (ha : (frame path).mid.a=2)
 (hb : (frame path).mid.b=2*(N+d)+1) :
 0 < coeff (frame path).mid.p i (N+2*d) ↔
 InPolygon (frame path).mid.a (frame path).mid.b i (N+2*d) := by
 rw [source_two_upper_formulaM2B3 path N d i hN hd ha hb,
   ha,hb,upper_polygonM2B3 N d i hN hd,upper_val_supportM2B3 N d i hd]

end
end MathGKM.Markov
