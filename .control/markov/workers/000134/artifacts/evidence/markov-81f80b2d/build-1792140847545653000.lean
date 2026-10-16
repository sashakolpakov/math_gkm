import MarkovHighSourceM81F
import MarkovHighScalingM81F
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
theorem source_high2_scaledM81F (path : List Bool) (k l : ℕ)
 (ha : 3 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b) (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 2*((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*(coeff (frame path).mid.p ((frame path).mid.a-1+k) 2:ℝ)=
 ((k+l).choose k:ℝ)*highJM81F (frame path).mid.a k l (2*(frame path).mid.a-(frame path).mid.b:ℕ) := by
 have hc := high_second_coeffM81F path (by omega) k
 rw [hbl,show k+l+2-5=k+l-3 by omega] at hc
 push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc
 have h := high_seed2_scaledM81F k l hl (by omega) (frame path).mid.a (2*(frame path).mid.a-(frame path).mid.b:ℕ)
 rw [hbl] at h
 rw [←hc] at h
 rw [hbl]
 linear_combination h
theorem source_high3_scaledM81F (path : List Bool) (k l : ℕ)
 (ha : 3 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b) (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 6*((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*((k:ℝ)+l-3)*((k:ℝ)+l-4)*(k+1)*(coeff (frame path).mid.p ((frame path).mid.a-1+k) 3:ℝ)=
 ((k+l).choose k:ℝ)*l*highHM81F (frame path).mid.a k l (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) := by
 have hc := high_third_coeffM81F path (by omega) (by omega) k
 rw [hbl,show k+l+2-7=k+l-5 by omega] at hc
 push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc
 have h := high_seed3_scaledM81F k l hl (by omega) (frame path).mid.a (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)
 rw [hbl] at h
 rw [←hc] at h
 rw [hbl]
 linear_combination h
theorem source_high4_scaledM81F (path : List Bool) (k l : ℕ)
 (ha : 3 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b) (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 24*((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*((k:ℝ)+l-3)*((k:ℝ)+l-4)*((k:ℝ)+l-5)*((k:ℝ)+l-6)*(k+1)*(k+2)*(coeff (frame path).mid.p ((frame path).mid.a-1+k) 4:ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*highIM81F (frame path).mid.a k l (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) (h4vM511 (frame path).mid.a (frame path).mid.b) (h4wM511 (frame path).mid.a (frame path).mid.b) (h4zM511 (frame path).mid.a (frame path).mid.b) := by
 have hc := high_fourth_coeffM81F path (by omega) (by omega) k
 unfold h4sourceSeedM511 at hc
 rw [hbl,show k+l+2-9=k+l-7 by omega] at hc
 push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc
 have h := high_seed4_scaledM81F k l hl (by omega) (frame path).mid.a (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) (h4vM511 (frame path).mid.a (frame path).mid.b) (h4wM511 (frame path).mid.a (frame path).mid.b) (h4zM511 (frame path).mid.a (frame path).mid.b)
 rw [hbl] at h
 rw [←hc] at h
 rw [hbl]
 linear_combination h
end
end MathGKM.Markov
