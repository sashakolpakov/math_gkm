import MarkovColumn2MAE9
import MarkovColumn3MAE9
import MarkovColumn4MAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def diagonalGap2MAE9 (d x : ℚ) : ℚ := (x+2)*(x+3)*(x+3)*(x+4)*(x+4)*(x+5)*(x+5)*(x+6)*(x+6)*(x+7)*(x+7)*(235950*d^6*x^5+5190900*d^6*x^4+46718100*d^6*x^3+213534750*d^6*x^2+493135500*d^6*x+460102500*d^6+2501070*d^5*x^6+58704360*d^5*x^5+581805510*d^5*x^4+3091275330*d^5*x^3+9232865070*d^5*x^2+14664481260*d^5*x+9662152500*d^5+11068915*d^4*x^7+276264560*d^4*x^6+2985917935*d^4*x^5+17982282890*d^4*x^4+64872880930*d^4*x^3+139975657250*d^4*x^2+167023076220*d^4*x+84705578100*d^4+26180440*d^3*x^8+692762070*d^3*x^7+8102398590*d^3*x^6+54345149430*d^3*x^5+227793598890*d^3*x^4+610227888270*d^3*x^3+1018923864530*d^3*x^2+966811911780*d^3*x+397210027500*d^3+34904144*d^2*x^9+976599382*d^2*x^8+12282181461*d^2*x^7+90574108548*d^2*x^6+430235641011*d^2*x^5+1363411925568*d^2*x^4+2878712552914*d^2*x^3+3895412904152*d^2*x^2+3053386196520*d^2*x+1051052488200*d^2+24871022*d*x^10+734047490*d*x^9+9874838930*d*x^8+79278774190*d*x^7+419397369446*d*x^6+1525566975460*d*x^5+3859017857310*d*x^4+6687502631480*d*x^3+7571784013992*d*x^2+5035799609280*d*x+1487096582400*d+7399929*x^11+229881338*x^10+3293269620*x^9+28560536450*x^8+166122297267*x^7+679479004044*x^6+1991391229920*x^5+4172455753000*x^4+6105126231504*x^3+5917526575168*x^2+3405141336960*x+877824604800)/2589195248640000
theorem diagonal_identity2MAE9 (d x : ℚ) :
 column3MAE9 (3*x+7+d) (x+1)^2-column2MAE9 (3*x+7+d) (x+2)*column4MAE9 (3*x+7+d) x=diagonalGap2MAE9 d x := by
 unfold column2MAE9 column3MAE9 column4MAE9 diagonalGap2MAE9
 ring
theorem diagonal_nonneg2MAE9 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 ≤ diagonalGap2MAE9 d x := by
 unfold diagonalGap2MAE9
 positivity
end
end MathGKM.Markov
