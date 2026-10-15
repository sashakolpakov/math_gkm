import MarkovThreeJets0N6604
import MarkovThreeJets1N6604
import MarkovThreeJets2N6604
import MarkovThreeJets3N6604
import MarkovThreeLocalDefN6604
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem runLocalFour_three_1N6604 (r s : Bool) :
 runLocalFourBE 3 false true r s=threeLocalFourN6604 false true r s := by
 cases r <;> cases s <;>
   simp only [runLocalFourBE,localFour01F,threeLocalFourN6604,map_intCast,map_ofNat,map_neg,map_zero,map_one,jet3_00_a1N6604,jet3_00_a2N6604,jet3_00_b2N6604,jet3_00_b3N6604,jet3_00_c1N6604,jet3_00_c2N6604,jet3_00_c3N6604,jet3_00_d1N6604,jet3_00_d2N6604,jet3_00_d3N6604,jet3_00_d4N6604,jet3_01_a1N6604,jet3_01_a2N6604,jet3_01_b2N6604,jet3_01_b3N6604,jet3_01_c1N6604,jet3_01_c2N6604,jet3_01_c3N6604,jet3_01_d1N6604,jet3_01_d2N6604,jet3_01_d3N6604,jet3_01_d4N6604,jet3_10_a1N6604,jet3_10_a2N6604,jet3_10_b2N6604,jet3_10_b3N6604,jet3_10_c1N6604,jet3_10_c2N6604,jet3_10_c3N6604,jet3_10_d1N6604,jet3_10_d2N6604,jet3_10_d3N6604,jet3_10_d4N6604,jet3_11_a1N6604,jet3_11_a2N6604,jet3_11_b2N6604,jet3_11_b3N6604,jet3_11_c1N6604,jet3_11_c2N6604,jet3_11_c3N6604,jet3_11_d1N6604,jet3_11_d2N6604,jet3_11_d3N6604,jet3_11_d4N6604] <;> ring
end
end MathGKM.Markov
