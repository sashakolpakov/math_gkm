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
def pc21MAD5 (g z T : ℚ) : ℚ := (ph00c9MAD5 g z T*ph01c12MAD5 g z T+ph00c10MAD5 g z T*ph01c11MAD5 g z T)+(ph10c9MAD5 g z T*ph11c12MAD5 g z T+ph10c10MAD5 g z T*ph11c11MAD5 g z T)-(ph20c11MAD5 g z T*ph21c10MAD5 g z T+ph20c12MAD5 g z T*ph21c9MAD5 g z T)-(ph30c11MAD5 g z T*ph31c10MAD5 g z T+ph30c12MAD5 g z T*ph31c9MAD5 g z T)
theorem pc21_nonnegMAD5 (g z T : ℚ) (hg : 0 ≤ g) (hz : 0 ≤ z) (hT : 0 ≤ T) :
 0 ≤ pc21MAD5 g z T := by
 have he : pc21MAD5 g z T = (((1728+T*216)+z*((2232+T*252)+z*((828+T*72)+z*72)))+g*(((2976+T*342)+z*((3214+T*324)+z*((980+T*72)+z*72)))+g*(((1532+T*144)+z*((1080+T*72)+z*152))+g*(((304+T*18)+z*98)+g*20)))) := by
  unfold pc21MAD5 ph00c9MAD5 ph01c12MAD5 ph00c10MAD5 ph01c11MAD5 ph10c9MAD5 ph11c12MAD5 ph10c10MAD5 ph11c11MAD5 ph20c11MAD5 ph21c10MAD5 ph20c12MAD5 ph21c9MAD5 ph30c11MAD5 ph31c10MAD5 ph30c12MAD5 ph31c9MAD5
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
