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
def horizontalGap2MAE9 (d x : ℚ) : ℚ := (x+2)*(x+2)*(x+3)*(x+3)*(x+4)*(x+4)*(x+5)*(x+5)*(x+6)*(x+6)*(x+7)*(235950*d^6*x^5+5426850*d^6*x^4+50965200*d^6*x^3+245152050*d^6*x^2+605683650*d^6*x+614413800*d^6+2501070*d^5*x^6+57949320*d^5*x^5+555615060*d^5*x^4+2793506430*d^5*x^3+7592068770*d^5*x^2+9966292050*d^5*x+4043239200*d^5+11068915*d^4*x^7+258507535*d^4*x^6+2531017060*d^4*x^5+13273906360*d^4*x^4+39202535515*d^4*x^3+61798398805*d^4*x^2+43506001110*d^4*x+10127917800*d^4+26180440*d^3*x^8+616646030*d^3*x^7+6166425980*d^3*x^6+33671495000*d^3*x^5+107054253020*d^3*x^4+194368417100*d^3*x^3+184784888860*d^3*x^2+80761665270*d^3*x+12010798800*d^3+34904144*d^2*x^9+829599122*d^2*x^8+8474434881*d^2*x^7+48100325493*d^2*x^6+163427777106*d^2*x^5+332952793668*d^2*x^4+388939168189*d^2*x^3+242135190517*d^2*x^2+70296572280*d^2*x+6738732000*d^2+24871022*d*x^10+596836746*d*x^9+6228807178*d*x^8+36695683354*d*x^7+132464059288*d*x^6+297559477534*d*x^5+406893312122*d*x^4+323670287446*d*x^3+138307957590*d*x^2+26823747720*d*x+1427025600*d+7399929*x^11+179388347*x^10+1912954861*x^9+11682113913*x^8+44592724601*x^7+109076322653*x^6+169569275099*x^5+162703199367*x^4+91254195910*x^3+26838974120*x^2+3143448000*x)/2589195248640000
theorem horizontal_identity2MAE9 (d x : ℚ) :
 column3MAE9 (3*(x+1)+1+d) (x+1)^2-column2MAE9 (3*(x+1)+1+d) (x+1)*column4MAE9 (3*(x+1)+1+d) (x+1)=horizontalGap2MAE9 d x := by
 unfold column2MAE9 column3MAE9 column4MAE9 horizontalGap2MAE9
 ring
theorem horizontal_nonneg2MAE9 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 ≤ horizontalGap2MAE9 d x := by
 unfold horizontalGap2MAE9
 positivity
end
end MathGKM.Markov
