import MarkovLowSolutionsME9C
/-! Machine-authored 4687d03f. Exact polynomial candidate and checked identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
def deltaFiveM468 (n x : ℚ) : ℚ := (n-x-1)*(n-x-2)*(x+1)*(x+2)*(x+3)*(x+4)*(x+5)/240
def lowForceFiveM468 (n x : ℚ) : ℚ :=
 deltaFiveM468 n x+2*deltaFiveM468 n (x-1)+deltaFiveM468 n (x-2)+
 2*deltaFourME9C n x+2*deltaFourME9C n (x-1)+deltaThreeME9C x
def lowFiveM468 (n x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x+4)*(x+5)*(12*n^2*x^2+72*n^2*x+126*n^2-30*n*x^3-234*n*x^2-576*n*x-378*n+19*x^4+183*x^3+596*x^2+714*x+252)/30240
theorem low_five_equationM468 (n x : ℚ) :
 lowFiveM468 n (x+2)-2*lowFiveM468 n (x+1)+lowFiveM468 n x=
 lowForceFiveM468 n (x+2)-2*lowFourME9C n (x+2)-2*lowFourME9C n (x+1)-lowThreeME9C (x+2) := by
 unfold lowFiveM468 lowForceFiveM468 deltaFiveM468 lowFourME9C lowThreeME9C deltaFourME9C deltaThreeME9C
 ring
def firstHorizontalGapM468 (d x : ℚ) : ℚ := (112*d^2*x^12+3276*d^2*x^11+43778*d^2*x^10+353430*d^2*x^9+1919211*d^2*x^8+7378938*d^2*x^7+20569304*d^2*x^6+41806170*d^2*x^5+61330927*d^2*x^4+63139986*d^2*x^3+43144668*d^2*x^2+17501400*d^2*x+3175200*d^2+378*d*x^13+10976*d*x^12+145992*d*x^11+1177162*d*x^10+6412854*d*x^9+24881178*d*x^8+70547526*d*x^7+147457366*d*x^6+226069368*d*x^5+249408446*d*x^4+190756482*d*x^3+94622472*d*x^2+26800200*d*x+3175200*d+317*x^14+9128*x^13+120666*x^12+969556*x^11+5280436*x^10+20563284*x^9+58811098*x^8+124780348*x^7+195797847*x^6+223551188*x^5+179700836*x^4+95822496*x^3+30218400*x^2+4233600*x)/6350400
theorem first_horizontal_identityM468 (d x : ℚ) :
 lowFourME9C (3*x+1+d) x^2-lowThreeME9C x*lowFiveM468 (3*x+1+d) x=firstHorizontalGapM468 d x := by
 unfold lowFourME9C lowThreeME9C lowFiveM468 firstHorizontalGapM468
 ring
theorem first_horizontal_nonnegM468 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 ≤ firstHorizontalGapM468 d x := by
 unfold firstHorizontalGapM468
 positivity
end
end MathGKM.Markov
