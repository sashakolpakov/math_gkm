"""Machine-authored extension of checked second-moment bridges to a>=3."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');D=R/'research'
header='''import MarkovVerticalSmallMomentM758
import MarkovVerticalSeedLCM758
/-! Machine-authored 7584c5d0. Exact small-numerator source formula.
The quotient's log-concavity is not asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame
'''
def part(file,start,end):
 s=(D/file).read_text();return s[s.index(start):s.index(end,s.index(start))]
s=part('MarkovVerticalGeneralMomentMDE6.lean','theorem vertical_second_general_momentMDE6','theorem vertical_second_raw_momentMDE6')
s=s.replace('vertical_second_general_momentMDE6','vertical_second_general_momentM758').replace('4 ≤ (frame rest).mid.b','3 ≤ (frame rest).mid.b').replace('hsource_momentsM13D','hsource_moments_twoM758').replace('⟨h0,h1,h2,_⟩','⟨h0,h1,h2⟩')
t=part('MarkovVerticalCandidateBridgeMDE6.lean','theorem vertical_second_candidate_bridgeMDE6','\nend\n')
t=t.replace('vertical_second_candidate_bridgeMDE6','vertical_second_candidate_bridgeM758').replace('vertical_second_general_momentMDE6','vertical_second_general_momentM758').replace('4 ≤ (frame rest).mid.b','3 ≤ (frame rest).mid.b')
u=part('MarkovVerticalAllRunFactorMDE6.lean','theorem vSecond_residual_factorMDE6','theorem vertical_second_all_run_factorMDE6')
u=u.replace('vSecond_residual_factorMDE6','vSecond_residual_factorM758').replace('vertical_second_candidate_bridgeMDE6','vertical_second_candidate_bridgeM758').replace('5 ≤ (frame rest).mid.b','3 ≤ (frame rest).mid.b')
tail='''
theorem vertical_second_small_clearedM758 (n : ℕ) (rest : List Bool)
 (ha : 3 ≤ (frame rest).mid.b) (hb : (frame rest).mid.b ≤ 5) :
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let r := (frame rest).mid.b-(frame rest).mid.a
 2*(1+X)^(5-a)*((frame path).mid.p).coeff 2=
 X^(b-(2*n+4))*vNseedMDE6 n a r (2*r-a) := by
 dsimp only
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 have hi : a=(frame rest).mid.b := (source_vertical_indicesMDE6 n rest).1
 have hc := vertical_all_order_clearedM9E1 path 2
 have hf := vSecond_residual_factorM758 n rest ha
 dsimp only at hf
 have hp : 2*(1+X)^4*((frame path).mid.p).coeff 2=
   (1+X)^(a-1)*(X^((frame path).mid.b-(2*n+4))*
     vNseedMDE6 n a ((frame rest).mid.b-(frame rest).mid.a)
       (2*((frame rest).mid.b-(frame rest).mid.a)-a)) := by
   rw [add_comm X 1] at hc
   linear_combination 2*hc+(1+X)^(a-1)*hf
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero (a-1) hn)
 have he : (1+X:ℤ[X])^4=(1+X)^(a-1)*(1+X)^(5-a) := by
   rw [←pow_add]; congr 1; omega
 rw [he] at hp
 linear_combination hp
end
end MathGKM.Markov
'''
(D/'MarkovVerticalSmallSourceM758.lean').write_text(header+s+t+u+tail)
print('Generated a>=3 source bridge and 3<=a<=5 cleared raw identity.')
