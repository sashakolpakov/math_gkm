"""Machine-authored actual-source fourth-row bridge candidates for the next cone."""
from pathlib import Path
R=Path('research')
old=(R/'MarkovStripMiddleSourceMD11.lean').read_text()
src='''import MarkovStripSourceMD11
/-! Machine-authored 5703599b. Source bridge for 2a<=b<=3a. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
def nextC0M570 (a b t : ℝ) : ℝ := -480*t+288*a*t+96*(b-2*a)
def nextC1M570 (a b t : ℝ) : ℝ := (96*a+96*b-864)*t
def nextQuarticM570 (a b t : ℝ) : ℝ[X] := stripQuarticMD11 a b+C (nextC1M570 a b t)

theorem strip_next_seedM570 (a b : ℕ) (hs : 2*a ≤ b) (hu : b ≤ 3*a) :
 (h4sourceSeedM511 a b : ℝ[X])=
 X^2*(C (nextC0M570 a b (3*a-b:ℕ))+X*nextQuarticM570 a b (3*a-b:ℕ)) := by
 have hq : 2*a-b=0 := by omega
 have ht : min (b-a) (3*a-b)=3*a-b := by omega
 have hv : h4vM511 a b=b-2*a := by simp only [h4vM511,if_pos hs]; omega
 have hw : h4wM511 a b=0 := by simp [h4wM511,hs]
 have hz : h4zM511 a b=0 := by unfold h4zM511; omega
 have hu0 : 3*a-2*b=0 := by omega
 simp only [h4sourceSeedM511,hq,ht,hu0,hv,hw,hz,Nat.cast_zero]
 simp only [h4seedM511,stripQuarticMD11,nextQuarticM570,nextC0M570,nextC1M570,
   h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,
   map_add,map_sub,map_mul,map_pow,map_ofNat,map_natCast,map_zero,map_one]
 rw [Nat.cast_sub hs]
 push_cast
 ring
'''
s=old[old.index('theorem source_strip_middle_fourMD11'):old.index('theorem strip_middle_four_coeffMD11')]
s=s.replace('source_strip_middle_fourMD11','source_strip_next_fourM570').replace('strip_middle_seedMD11','strip_next_seedM570')
s=s.replace('3*(frame path).mid.a ≤','2*(frame path).mid.a ≤').replace('≤ 4*(frame path).mid.a','≤ 3*(frame path).mid.a')
s=s.replace('C (96*(4*(frame path).mid.a-(frame path).mid.b:ℕ):ℝ)','C (nextC0M570 (frame path).mid.a (frame path).mid.b (3*(frame path).mid.a-(frame path).mid.b:ℕ))')
s=s.replace('stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b','nextQuarticM570 ((frame path).mid.a:ℝ) (frame path).mid.b (3*(frame path).mid.a-(frame path).mid.b:ℕ)')
s=s.replace('C (96*(4*a-b:ℕ):ℝ)','C (nextC0M570 a b (3*a-b:ℕ))').replace('stripQuarticMD11 (a:ℝ) b','nextQuarticM570 (a:ℝ) b (3*a-b:ℕ)')
src+=s
s=old[old.index('theorem strip_middle_four_coeffMD11'):]
s=s.replace('strip_middle_four_coeffMD11','strip_next_four_coeffM570').replace('source_strip_middle_fourMD11','source_strip_next_fourM570')
s=s.replace('3*(frame path).mid.a ≤','2*(frame path).mid.a ≤').replace('≤ 4*(frame path).mid.a','≤ 3*(frame path).mid.a')
s=s.replace('96*(4*(frame path).mid.a-(frame path).mid.b:ℕ)','nextC0M570 (frame path).mid.a (frame path).mid.b (3*(frame path).mid.a-(frame path).mid.b:ℕ)')
s=s.replace('stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b','nextQuarticM570 ((frame path).mid.a:ℝ) (frame path).mid.b (3*(frame path).mid.a-(frame path).mid.b:ℕ)')
src+=s
(R/'MarkovNextSourceM570.lean').write_text(src)
src='''import MarkovNextSourceM570
import MarkovNextDefsM570
import MarkovStripMiddleChooseMD11
import MarkovStripCoefficientsMD11
/-! Machine-authored 5703599b. Next-cone raw fourth-row identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
attribute [local irreducible] frame coeff

theorem source_next_four_scaledM570 (path : List Bool) (k l : ℕ)
 (hb : 9 ≤ (frame path).mid.b) (hs : 2*(frame path).mid.a ≤ (frame path).mid.b)
 (hu : (frame path).mid.b ≤ 3*(frame path).mid.a)
 (hbl : (frame path).mid.b=k+l+2) (hl : 3 ≤ l) :
 24*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*
 (coeff (frame path).mid.p ((frame path).mid.a+k) 4:ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*
 stripNextIM570 (frame path).mid.a k l (3*(frame path).mid.a-(frame path).mid.b:ℕ) := by
 have hc := strip_next_four_coeffM570 path hb hs hu k
 have h := strip_quartic_scaledMD11 k l hl (by omega) (frame path).mid.a
 have hq := strip_choose_correctionMD11 k l (by omega)
 have h0 := strip_choose_sevenMD11 (k+l) k (by omega)
 rw [hbl,show k+l+2-9=k+l-7 by omega] at hc
 push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc h0
 simp only [nextQuarticM570,mul_add,Polynomial.coeff_add,Polynomial.coeff_mul_C,
   Polynomial.coeff_one_add_X_pow] at hc
 unfold stripNextIM570 nextC0M570 nextC1M570 at *
 rw [hbl]
 linear_combination
   ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*hc+
   (k+1)*h+
   (-480*(3*(frame path).mid.a-(k+l+2):ℕ)+288*(frame path).mid.a*(3*(frame path).mid.a-(k+l+2):ℕ)+96*((k:ℝ)+l+2-2*(frame path).mid.a))*hq+
   (96*(frame path).mid.a+96*((k:ℝ)+l+2)-864)*(3*(frame path).mid.a-(k+l+2):ℕ)*(k+1)*h0
end
end MathGKM.Markov
'''
(R/'MarkovNextCoefficientsM570.lean').write_text(src)
print('Next source and coefficient candidates written.')
