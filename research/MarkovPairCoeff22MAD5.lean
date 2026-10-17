import MarkovPairHalf00MAD5
import MarkovPairHalf01MAD5
import MarkovPairHalf10MAD5
import MarkovPairHalf11MAD5
import MarkovPairHalf20MAD5
import MarkovPairHalf21MAD5
import MarkovPairHalf30MAD5
import MarkovPairHalf31MAD5/-! Machine-authored ad504da6. Generated algebra; all identities checked by Lean ring. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false
def pc22MAD5 (g z T : ℚ) : ℚ := (ph00c10MAD5 g z T*ph01c12MAD5 g z T)+(ph10c10MAD5 g z T*ph11c12MAD5 g z T)-(ph20c12MAD5 g z T*ph21c10MAD5 g z T)-(ph30c12MAD5 g z T*ph31c10MAD5 g z T)
theorem pc22_nonnegMAD5 (g z T : ℚ) (hg : 0 ≤ g) (hz : 0 ≤ z) (hT : 0 ≤ T) :
 0 ≤ pc22MAD5 g z T := by
 have he : pc22MAD5 g z T = ((12+z*(14+z*4))+g*((19+z*(18+z*4))+g*((8+z*4)+g*1))) := by
  unfold pc22MAD5 ph00c10MAD5 ph01c12MAD5 ph10c10MAD5 ph11c12MAD5 ph20c12MAD5 ph21c10MAD5 ph30c12MAD5 ph31c10MAD5
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
