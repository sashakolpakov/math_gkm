import MarkovThirdColumn4M964
import MarkovThirdColumn5M964
import MarkovThirdColumn6M964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdGap4M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (100650619524+x*((37974211406477/165)+x*((4217800500198763/17325)+x*((921589214498136157/5821200)+x*((24782332829023398707/349272000)+x*((158468285723555303/6804000)+x*((474229696807739381/81648000)+x*((26978405060482453/23950080)+x*((1238912349986208913/7185024000)+x*((16013176240159687/762048000)+x*((9354303026876057/4572288000)+x*((1585952506139/9979200)+x*((11719856988607/1197504000)+x*((282458731007/598752000)+x*((62588948077/3592512000)+x*((36277151/76204800)+x*((41466937/4572288000)+x*((18401/171072000)+x*(4297/7185024000))))))))))))))))))) else (17679991056+x*((7410976132568/165)+x*((304455130179059/5775)+x*((13822085610433739/363825)+x*((16453447316542129/873180)+x*((596914079883288803/87318000)+x*((422549257745955349/224532000)+x*((1204827000084431/2993760)+x*((24379166811011879/359251200)+x*((1734014378831659/190512000)+x*((4455907001987417/4572288000)+x*((69740719127297/838252800)+x*((8022141221/1425600)+x*((178279571171/598752000)+x*((6192152011/513216000)+x*((303097867/838252800)+x*((18992233/2514758400)+x*((411461/4191264000)+x*(4297/7185024000)))))))))))))))))))
theorem third_gap_identity4M964 (x : ℚ) (r : Bool) :
 thirdColumn5M964 x r^2-thirdColumn4M964 x r*thirdColumn6M964 x r=thirdGap4M964 x r := by
 cases r <;> simp only [thirdColumn4M964,thirdColumn5M964,thirdColumn6M964,
   thirdGap4M964,Bool.false_eq_true,if_false,if_true] <;> ring
theorem third_gap_nonneg4M964 (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ thirdGap4M964 x r := by
 cases r <;> simp only [thirdGap4M964,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_third_horizontal4M964 (d : ℕ) (r : Bool) :
 threeRawM9E2 (thirdQM964 d r) r 4 (thirdJM964 d r)*
 threeRawM9E2 (thirdQM964 d r) r 6 (thirdJM964 d r) ≤
 threeRawM9E2 (thirdQM964 d r) r 5 (thirdJM964 d r)^2 := by
 have h : (threeRawM9E2 (thirdQM964 d r) r 4 (thirdJM964 d r):ℚ)*
     (threeRawM9E2 (thirdQM964 d r) r 6 (thirdJM964 d r):ℚ) ≤
     (threeRawM9E2 (thirdQM964 d r) r 5 (thirdJM964 d r):ℚ)^2 := by
   rw [source_third_column4M964,source_third_column5M964,source_third_column6M964]
   have he := third_gap_identity4M964 (d:ℚ) r
   have hp := third_gap_nonneg4M964 (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h
end
end MathGKM.Markov
