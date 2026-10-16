import MarkovTailSourceM1BB
/-! Machine-authored 1bb0aa1e. Exact polynomial certificates for crossing LC.
Generated rational expressions are checked by Lean ring, not an oracle. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def crossGap3FM1BB (x : ℚ) : ℚ := (5400 + 14274 * x + 16299 * x^2 + 10656 * x^3 + 4444 * x^4 + 1236 * x^5 + 226 * x^6 + 24 * x^7 + 1 * x^8) / 180

theorem cross_identity3FM1BB (x : ℚ) :
 lowThreeME9C (x+1)^2-lowThreeME9C (x)*(lowThreeME9C (x+2)+tailThreeM1BB (x+1) false)=crossGap3FM1BB x := by
 simp only [lowThreeME9C,lowFourME9C,tailThreeM1BB,tailFourM1BB,crossGap3FM1BB]
 norm_num only [Bool.false_eq_true,if_false,if_true]
 ring

theorem cross_positive3FM1BB (x : ℚ) (hx : 0 ≤ x) : 0 < crossGap3FM1BB x := by
 unfold crossGap3FM1BB
 positivity

def crossGap3TM1BB (x : ℚ) : ℚ := (6840 + 17346 * x + 18243 * x^2 + 10656 * x^3 + 3964 * x^4 + 1044 * x^5 + 202 * x^6 + 24 * x^7 + 1 * x^8) / 180

theorem cross_identity3TM1BB (x : ℚ) :
 lowThreeME9C (x+1)^2-lowThreeME9C (x)*(lowThreeME9C (x+2)+tailThreeM1BB (x+1) true)=crossGap3TM1BB x := by
 simp only [lowThreeME9C,lowFourME9C,tailThreeM1BB,tailFourM1BB,crossGap3TM1BB]
 norm_num only [Bool.false_eq_true,if_false,if_true]
 ring

theorem cross_positive3TM1BB (x : ℚ) (hx : 0 ≤ x) : 0 < crossGap3TM1BB x := by
 unfold crossGap3TM1BB
 positivity

def crossGap4FM1BB (x : ℚ) : ℚ := (99489600 + 420611040 * x + 798719844 * x^2 + 904261132 * x^3 + 682815445 * x^4 + 363801660 * x^5 + 140681802 * x^6 + 39851676 * x^7 + 8207025 * x^8 + 1195700 * x^9 + 116504 * x^10 + 6792 * x^11 + 180 * x^12) / 302400

theorem cross_identity4FM1BB (x : ℚ) :
 lowFourME9C (3*(x+1)+2) (x+1)^2-lowFourME9C (3*(x+1)+2) (x)*(lowFourME9C (3*(x+1)+2) (x+2)+tailFourM1BB (x+1) false)=crossGap4FM1BB x := by
 simp only [lowThreeME9C,lowFourME9C,tailThreeM1BB,tailFourM1BB,crossGap4FM1BB]
 norm_num only [Bool.false_eq_true,if_false,if_true]
 ring

theorem cross_positive4FM1BB (x : ℚ) (hx : 0 ≤ x) : 0 < crossGap4FM1BB x := by
 unfold crossGap4FM1BB
 positivity

def crossGap4TM1BB (x : ℚ) : ℚ := (45662400 + 228797280 * x + 493764156 * x^2 + 613517760 * x^3 + 495381625 * x^4 + 277455480 * x^5 + 111810078 * x^6 + 32951340 * x^7 + 7079145 * x^8 + 1078740 * x^9 + 109616 * x^10 + 6600 * x^11 + 180 * x^12) / 302400

theorem cross_identity4TM1BB (x : ℚ) :
 lowFourME9C (3*(x+1)+1) (x+1)^2-lowFourME9C (3*(x+1)+1) (x)*(lowFourME9C (3*(x+1)+1) (x+2)+tailFourM1BB (x+1) true)=crossGap4TM1BB x := by
 simp only [lowThreeME9C,lowFourME9C,tailThreeM1BB,tailFourM1BB,crossGap4TM1BB]
 norm_num only [Bool.false_eq_true,if_false,if_true]
 ring

theorem cross_positive4TM1BB (x : ℚ) (hx : 0 ≤ x) : 0 < crossGap4TM1BB x := by
 unfold crossGap4TM1BB
 positivity

def lowThreeGapM1BB (x : ℚ) : ℚ := (5400 + 14994 * x + 18195 * x^2 + 12576 * x^3 + 5404 * x^4 + 1476 * x^5 + 250 * x^6 + 24 * x^7 + 1 * x^8) / 180

theorem low_three_strictM1BB (x : ℚ) (hx : 0 ≤ x) :
 lowThreeME9C x*lowThreeME9C (x+2)<lowThreeME9C (x+1)^2 := by
 have he : lowThreeME9C (x+1)^2-lowThreeME9C x*lowThreeME9C (x+2)=lowThreeGapM1BB x := by
  unfold lowThreeME9C lowThreeGapM1BB
  ring
 have hp : 0<lowThreeGapM1BB x := by unfold lowThreeGapM1BB; positivity
 linarith

end
end MathGKM.Markov
