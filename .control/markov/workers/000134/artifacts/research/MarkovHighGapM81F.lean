import MarkovHighCone0GapM81F
import MarkovHighCone1GapM81F
import MarkovHighCone2GapM81F
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
theorem high_source_gapM81F (a b k l : ℕ) (hab : a ≤ b) (hs : b ≤ 2*a)
 (hbl : b=k+l+2) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ highGapM81F a k l (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ)
   (h4vM511 a b) (h4wM511 a b) (h4zM511 a b) := by
 have ht : min (b-a) (3*a-b)=b-a := by omega
 have hv : h4vM511 a b=0 := by unfold h4vM511; split_ifs <;> omega
 rw [ht,hv]
 by_cases h0 : 3*a ≤ 2*b
 · have hu : 3*a-2*b=0 := by omega
   have hw : h4wM511 a b=2*a-b := by unfold h4wM511; split_ifs <;> omega
   have hz : h4zM511 a b=0 := by unfold h4zM511; omega
   rw [hu,hw,hz]
   have h := high_cone0_nonnegM81F k l (2*a-b:ℕ) hl hN (by positivity)
   unfold highCone0M81F at h
   have he : ((k:ℝ)+l+2+(2*a-b:ℕ))/2=a := by
     rw [Nat.cast_sub hs]
     push_cast
     have hbR : (b:ℝ)=k+l+2 := by exact_mod_cast hbl
     linarith
   rw [he] at h
   have htR : ((b-a:ℕ):ℝ)=(k:ℝ)+l+2-a := by
     rw [Nat.cast_sub hab,hbl]; push_cast; ring
   simpa only [htR,Nat.cast_zero] using h
 have hw : h4wM511 a b=b-a := by unfold h4wM511; split_ifs <;> omega
 have hu : 2*b ≤ 3*a := by omega
 rw [hw]
 by_cases h1 : 4*a ≤ 3*b
 · have hz : h4zM511 a b=0 := by unfold h4zM511; omega
   rw [hz]
   have h := high_cone1_nonnegM81F k l (3*a-2*b:ℕ) hl hN (by positivity)
   unfold highCone1M81F at h
   have he : (2*((k:ℝ)+l+2)+(3*a-2*b:ℕ))/3=a := by
     rw [Nat.cast_sub hu]
     push_cast
     have hbR : (b:ℝ)=k+l+2 := by exact_mod_cast hbl
     linarith
   rw [he] at h
   have hqR : ((2*a-b:ℕ):ℝ)=2*a-((k:ℝ)+l+2) := by
     rw [Nat.cast_sub hs,hbl]; push_cast; ring
   have htR : ((b-a:ℕ):ℝ)=(k:ℝ)+l+2-a := by
     rw [Nat.cast_sub hab,hbl]; push_cast; ring
   simpa only [hqR,htR,Nat.cast_zero] using h
 · have hz : 3*b ≤ 4*a := by omega
   have h := high_cone2_nonnegM81F k l (4*a-3*b:ℕ) hl hN (by positivity)
   unfold highCone2M81F at h
   have he : (3*((k:ℝ)+l+2)+(4*a-3*b:ℕ))/4=a := by
     rw [Nat.cast_sub hz]
     push_cast
     have hbR : (b:ℝ)=k+l+2 := by exact_mod_cast hbl
     linarith
   rw [he] at h
   have hqR : ((2*a-b:ℕ):ℝ)=2*a-((k:ℝ)+l+2) := by
     rw [Nat.cast_sub hs,hbl]; push_cast; ring
   have htR : ((b-a:ℕ):ℝ)=(k:ℝ)+l+2-a := by
     rw [Nat.cast_sub hab,hbl]; push_cast; ring
   have huR : ((3*a-2*b:ℕ):ℝ)=3*a-2*((k:ℝ)+l+2) := by
     rw [Nat.cast_sub hu,hbl]; push_cast; ring
   simpa only [hqR,htR,huR,h4zM511,Nat.cast_zero] using h
end
end MathGKM.Markov
