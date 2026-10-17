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
def pc20MAD5 (g z T : ℚ) : ℚ := (ph00c8MAD5 g z T*ph01c12MAD5 g z T+ph00c9MAD5 g z T*ph01c11MAD5 g z T+ph00c10MAD5 g z T*ph01c10MAD5 g z T)+(ph10c8MAD5 g z T*ph11c12MAD5 g z T+ph10c9MAD5 g z T*ph11c11MAD5 g z T+ph10c10MAD5 g z T*ph11c10MAD5 g z T)-(ph20c10MAD5 g z T*ph21c10MAD5 g z T+ph20c11MAD5 g z T*ph21c9MAD5 g z T+ph20c12MAD5 g z T*ph21c8MAD5 g z T)-(ph30c10MAD5 g z T*ph31c10MAD5 g z T+ph30c11MAD5 g z T*ph31c9MAD5 g z T+ph30c12MAD5 g z T*ph31c8MAD5 g z T)
theorem pc20_nonnegMAD5 (g z T : ℚ) (hg : 0 ≤ g) (hz : 0 ≤ z) (hT : 0 ≤ T) :
 0 ≤ pc20MAD5 g z T := by
 have he : pc20MAD5 g z T = (((117624+T*(29508+T*1836))+z*((166416+T*(38122+T*2142))+z*((75002+T*(14148+T*612))+z*((11760+T*1232)+z*580))))+g*(((218926+T*(50837+T*2907))+z*((264793+T*(54916+T*2754))+z*((101318+T*(16752+T*612))+z*((13676+T*1232)+z*580))))+g*(((132407+T*(26189+T*1224))+z*((116651+T*(18474+T*612))+z*((28542+T*2604)+z*1916)))+g*(((35132+T*(5203+T*153))+z*((19353+T*1680)+z*2226))+g*(((4213+T*343)+z*1079)+g*186))))) := by
  unfold pc20MAD5 ph00c8MAD5 ph01c12MAD5 ph00c9MAD5 ph01c11MAD5 ph00c10MAD5 ph01c10MAD5 ph10c8MAD5 ph11c12MAD5 ph10c9MAD5 ph11c11MAD5 ph10c10MAD5 ph11c10MAD5 ph20c10MAD5 ph21c10MAD5 ph20c11MAD5 ph21c9MAD5 ph20c12MAD5 ph21c8MAD5 ph30c10MAD5 ph31c10MAD5 ph30c11MAD5 ph31c9MAD5 ph30c12MAD5 ph31c8MAD5
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
