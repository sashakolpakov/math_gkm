import MarkovUpperCompleteM9F23
import MarkovMiddleLocalityM99A
/-! Machine-authored request 50c262c5. The complete correction vanishes
only beyond its proved degree. No extension through its support is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem source_high_templateM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : sourceNME9C q r ≤ 2*j) (hi : sourceNME9C q r < i+j+q)
 (hd : i+j ≤ sourceNME9C q r+2) :
 threeRawM9E2 q r i j=
 (topTemplateMB3E (sourceNME9C q r) (sourceNME9C q r+2-j)).coeff i := by
 by_cases ht : sourceNME9C q r ≤ j+q
 · have h := source_top_coeffMB3E q (sourceNME9C q r+2-j) i r hq (by omega)
   rwa [show sourceNME9C q r+2-(sourceNME9C q r+2-j)=j by omega] at h
 · let k := sourceNME9C q r-q-j-1
   have hk : k ≤ q := by
     dsimp [k]
     cases r <;> simp [sourceNME9C] at * <;> omega
   have he : q+3+k=sourceNME9C q r+2-j := by dsimp [k]; omega
   have hc : k+1 < i := by dsimp [k]; omega
   have h := source_middle_high_coeffM99A q k i r hq hk hc
   rwa [he,show sourceNME9C q r+2-(sourceNME9C q r+2-j)=j by omega] at h

theorem source_high_modelM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : 3 ≤ i) (hj : sourceNME9C q r ≤ 2*j)
 (hc : sourceNME9C q r < i+j+q) (hd : i+j ≤ sourceNME9C q r+2) :
 (threeRawM9E2 q r i j:ℝ)=lowerDiagMF88 (i-3) j (sourceNME9C q r+2-i-j) := by
 let n := sourceNME9C q r
 let T := n-j-1
 let h := 2*j-n
 have hdn : i+j ≤ n+2 := hd
 have hjn : n ≤ 2*j := hj
 have heN : n=2*T+h+2 := by dsimp [T,h]; omega
 have heT : T+3=n+2-j := by dsimp [T]; omega
 have hei : i-3 ≤ T := by dsimp [T]; omega
 have hs := source_high_templateM50C q i j r hq hj hc hd
 change threeRawM9E2 q r i j=(topTemplateMB3E n (n+2-j)).coeff i at hs
 rw [←heT,heN,show i=i-3+3 by omega,top_shift_massME10] at hs
 rw [show i-3+3=i by omega] at hs
 rw [hs,top_mass_diagonalM9F23 h T (i-3) hei]
 congr 1 <;> dsimp [T,h,n] <;> omega

end
end MathGKM.Markov
