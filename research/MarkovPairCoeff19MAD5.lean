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
def pc19MAD5 (g z T : ℚ) : ℚ := (ph00c7MAD5 g z T*ph01c12MAD5 g z T+ph00c8MAD5 g z T*ph01c11MAD5 g z T+ph00c9MAD5 g z T*ph01c10MAD5 g z T+ph00c10MAD5 g z T*ph01c9MAD5 g z T)+(ph10c7MAD5 g z T*ph11c12MAD5 g z T+ph10c8MAD5 g z T*ph11c11MAD5 g z T+ph10c9MAD5 g z T*ph11c10MAD5 g z T+ph10c10MAD5 g z T*ph11c9MAD5 g z T)-(ph20c9MAD5 g z T*ph21c10MAD5 g z T+ph20c10MAD5 g z T*ph21c9MAD5 g z T+ph20c11MAD5 g z T*ph21c8MAD5 g z T+ph20c12MAD5 g z T*ph21c7MAD5 g z T)-(ph30c9MAD5 g z T*ph31c10MAD5 g z T+ph30c10MAD5 g z T*ph31c9MAD5 g z T+ph30c11MAD5 g z T*ph31c8MAD5 g z T+ph30c12MAD5 g z T*ph31c7MAD5 g z T)
theorem pc19_nonnegMAD5 (g z T : ℚ) (hg : 0 ≤ g) (hz : 0 ≤ z) (hT : 0 ≤ T) :
 0 ≤ pc19MAD5 g z T := by
 have he : pc19MAD5 g z T = (((5033400+T*(1900572+T*(237252+T*9792)))+z*((7731620+T*(2689990+T*(306578+T*11424)))+z*((4067088+T*(1213228+T*(113832+T*3264)))+z*((884698+T*(190520+T*9928))+z*((82946+T*9416)+z*2752)))))+g*(((10068992+T*(3539855+T*(408901+T*15504)))+z*((13454179+T*(4283466+T*(441830+T*14688)))+z*((6140841+T*(1640200+T*(134844+T*3264)))+z*((1167898+T*(221672+T*9928))+z*((95626+T*9416)+z*2752)))))+g*(((6966959+T*(2143640+T*(210817+T*6528)))+z*((7244996+T*(1890302+T*(148818+T*3264)))+z*((2415767+T*(463212+T*21012))+z*((305314+T*31152)+z*12680))))+g*(((2286653+T*(569824+T*(41939+T*816)))+z*((1695896+T*(314410+T*13566))+z*((360285+T*36240)+z*22114)))+g*(((386685+T*(68500+T*2771))+z*((180620+T*17584)+z*18271))+g*(((32467+T*3033)+z*7161)+g*1068)))))) := by
  unfold pc19MAD5 ph00c7MAD5 ph01c12MAD5 ph00c8MAD5 ph01c11MAD5 ph00c9MAD5 ph01c10MAD5 ph00c10MAD5 ph01c9MAD5 ph10c7MAD5 ph11c12MAD5 ph10c8MAD5 ph11c11MAD5 ph10c9MAD5 ph11c10MAD5 ph10c10MAD5 ph11c9MAD5 ph20c9MAD5 ph21c10MAD5 ph20c10MAD5 ph21c9MAD5 ph20c11MAD5 ph21c8MAD5 ph20c12MAD5 ph21c7MAD5 ph30c9MAD5 ph31c10MAD5 ph30c10MAD5 ph31c9MAD5 ph30c11MAD5 ph31c8MAD5 ph30c12MAD5 ph31c7MAD5
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
