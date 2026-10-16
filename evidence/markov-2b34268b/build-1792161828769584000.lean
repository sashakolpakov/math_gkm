import MathGKM.Markov
/-! Machine-authored 2b34268b. Nonnegative upper-core scalar certificates.
These signs alone do not assert the global summand inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false
def upperHNumM2B3 (N i h : ℤ) : ℤ := (N+i-h+1)*(N-i+2)*(2*i-1-h)
def upperHDenM2B3 (i h : ℤ) : ℤ := (i-h+1)*(i-1)*(2*i+1-h)
def upperDNumM2B3 (N i h : ℤ) : ℤ := (N-i+2)*(2*i-1-h)*(2*N+2-h)
def upperDDenM2B3 (N i h : ℤ) : ℤ := (i-1)*(2*i-h)*(2*N+3-h)
def upperHGapM2B3 (N i h k : ℤ) : ℤ :=
 upperHNumM2B3 N i h*upperHDenM2B3 (i+1) k-upperHNumM2B3 N (i+1) k*upperHDenM2B3 i h
def upperDGapM2B3 (N i h k : ℤ) : ℤ :=
 upperDNumM2B3 N i h*upperDDenM2B3 N (i+1) k-upperDNumM2B3 N (i+1) k*upperDDenM2B3 N i h
def upperLGapM2B3 (N i h : ℤ) : ℤ :=
 upperHNumM2B3 N i h*upperHDenM2B3 (i+1) (h+1)-upperHNumM2B3 N (i+1) (h+1)*upperHDenM2B3 i h

theorem upper_horizontal0M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperHGapM2B3 ((k+2)+(p)+(r)+t) ((k+2)+(p)+(r)) ((k+2)+(p)) (k+2) := by
 have he : upperHGapM2B3 ((k+2)+(p)+(r)+t) ((k+2)+(p)+(r)) ((k+2)+(p)) (k+2)=84+55*t+11*t^2+350*r+212*r*t+38*r*t^2+478*r^2+236*r^2*t+32*r^2*t^2+290*r^3+104*r^3*t+8*r^3*t^2+80*r^4+16*r^4*t+8*r^5+238*p+152*p*t+30*p*t^2+712*p*r+393*p*r*t+65*p*r*t^2+692*p*r^2+295*p*r^2*t+34*p*r^2*t^2+270*p*r^3+76*p*r^3*t+4*p*r^3*t^2+36*p*r^4+4*p*r^4*t+262*p^2+162*p^2*t+30*p^2*t^2+544*p^2*r+275*p^2*r*t+39*p^2*r*t^2+338*p^2*r^2+125*p^2*r^2*t+10*p^2*r^2*t^2+64*p^2*r^3+14*p^2*r^3*t+142*p^3+84*p^3*t+13*p^3*t^2+186*p^3*r+86*p^3*r*t+8*p^3*r*t^2+56*p^3*r^2+18*p^3*r^2*t+38*p^4+21*p^4*t+2*p^4*t^2+24*p^4*r+10*p^4*r*t+4*p^5+2*p^5*t+175*k+106*k*t+19*k*t^2+478*k*r+236*k*r*t+32*k*r*t^2+435*k*r^2+156*k*r^2*t+12*k*r^2*t^2+160*k*r^3+32*k*r^3*t+20*k*r^4+374*k*p+219*k*p*t+37*k*p*t^2+725*k*p*r+334*k*p*r*t+40*k*p*r*t^2+425*k*p*r^2+136*k*p*r^2*t+8*k*p*r^2*t^2+76*k*p*r^3+12*k*p*r^3*t+299*k*p^2+169*k*p^2*t+24*k*p^2*t^2+371*k*p^2*r+161*k*p^2*r*t+13*k*p^2*r*t^2+106*k*p^2*r^2+31*k*p^2*r^2*t+106*k*p^3+57*k*p^3*t+5*k*p^3*t^2+64*k*p^3*r+26*k*p^3*r*t+14*k*p^4+7*k*p^4*t+121*k^2+64*k^2*t+9*k^2*t^2+211*k^2*r+80*k^2*r*t+6*k^2*r*t^2+112*k^2*r^2+24*k^2*r^2*t+18*k^2*r^3+190*k^2*p+99*k^2*p*t+12*k^2*p*t^2+217*k^2*p*r+83*k^2*p*r*t+5*k^2*p*r*t^2+57*k^2*p*r^2+13*k^2*p*r^2*t+101*k^2*p^2+52*k^2*p^2*t+4*k^2*p^2*t^2+57*k^2*p^2*r+22*k^2*p^2*r*t+18*k^2*p^3+9*k^2*p^3*t+33*k^3+14*k^3*t+1*k^3*t^2+32*k^3*r+8*k^3*r*t+7*k^3*r^2+36*k^3*p+17*k^3*p*t+1*k^3*p*t^2+18*k^3*p*r+6*k^3*p*r*t+10*k^3*p^2+5*k^3*p^2*t+3*k^4+1*k^4*t+1*k^4*r+2*k^4*p+1*k^4*p*t := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_diagonal0M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperDGapM2B3 ((k+2)+(p)+(r)+t) ((k+2)+(p)+(r)) (k+2) ((k+2)+(p)+1) := by
 have he : upperDGapM2B3 ((k+2)+(p)+(r)+t) ((k+2)+(p)+(r)) (k+2) ((k+2)+(p)+1)=132+164*t+64*t^2+8*t^3+556*r+636*r*t+232*r*t^2+28*r*t^3+780*r^2+724*r^2*t+200*r^2*t^2+16*r^2*t^3+492*r^3+320*r^3*t+48*r^3*t^2+144*r^4+48*r^4*t+16*r^5+494*p+582*p*t+220*p*t^2+28*p*t^3+1320*p*r+1244*p*r*t+346*p*r*t^2+28*p*r*t^3+1218*p*r^2+804*p*r^2*t+120*p*r^2*t^2+468*p*r^3+160*p*r^3*t+64*p*r^4+546*p^2+522*p^2*t+146*p^2*t^2+12*p^2*t^3+984*p^2*r+660*p^2*r*t+98*p^2*r*t^2+558*p^2*r^2+196*p^2*r^2*t+100*p^2*r^3+258*p^3+176*p^3*t+26*p^3*t^2+288*p^3*r+104*p^3*r*t+76*p^3*r^2+54*p^4+20*p^4*t+28*p^4*r+4*p^5+296*k+328*k*t+112*k*t^2+12*k*t^3+864*k*r+792*k*r*t+212*k*r*t^2+16*k*r*t^3+840*k*r^2+544*k*r^2*t+80*k*r^2*t^2+336*k*r^3+112*k*r^3*t+48*k*r^4+741*k*p+699*k*p*t+194*k*p*t^2+16*k*p*t^3+1391*k*p*r+920*k*p*r*t+136*k*p*r*t^2+816*k*p*r^2+280*k*p*r^2*t+152*k*p*r^3+562*k*p^2+379*k*p^2*t+56*k*p^2*t^2+645*k*p^2*r+228*k*p^2*r*t+176*k*p^2*r^2+165*k*p^3+60*k*p^3*t+88*k*p^3*r+16*k*p^4+237*k^2+215*k^2*t+56*k^2*t^2+4*k^2*t^3+471*k^2*r+304*k^2*r*t+44*k^2*r*t^2+288*k^2*r^2+96*k^2*r^2*t+56*k^2*r^3+391*k^2*p+259*k^2*p*t+38*k^2*p*t^2+465*k^2*p*r+160*k^2*p*r*t+132*k^2*p*r^2+183*k^2*p^2+65*k^2*p^2*t+101*k^2*p^2*r+25*k^2*p^3+87*k^3+56*k^3*t+8*k^3*t^2+108*k^3*r+36*k^3*r*t+32*k^3*r^2+87*k^3*p+30*k^3*p*t+50*k^3*p*r+19*k^3*p^2+15*k^4+5*k^4*t+9*k^4*r+7*k^4*p+1*k^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_horizontal1M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperHGapM2B3 ((1)+(p+1)+(r)+t) ((1)+(p+1)+(r)) ((1)+(p+1)) (1) := by
 have he : upperHGapM2B3 ((1)+(p+1)+(r)+t) ((1)+(p+1)+(r)) ((1)+(p+1)) (1)=156+108*t+24*t^2+614*r+390*r*t+76*r*t^2+760*r^2+388*r^2*t+56*r^2*t^2+406*r^3+150*r^3*t+12*r^3*t^2+96*r^4+20*r^4*t+8*r^5+406*p+270*p*t+56*p*t^2+1108*p*r+628*p*r*t+106*p*r*t^2+956*p*r^2+414*p*r^2*t+46*p*r^2*t^2+322*p*r^3+92*p*r^3*t+4*p*r^3*t^2+36*p*r^4+4*p*r^4*t+400*p^2+252*p^2*t+46*p^2*t^2+740*p^2*r+376*p^2*r*t+50*p^2*r*t^2+400*p^2*r^2+148*p^2*r^2*t+10*p^2*r^2*t^2+64*p^2*r^3+14*p^2*r^3*t+190*p^3+112*p^3*t+16*p^3*t^2+218*p^3*r+100*p^3*r*t+8*p^3*r*t^2+56*p^3*r^2+18*p^3*r^2*t+44*p^4+24*p^4*t+2*p^4*t^2+24*p^4*r+10*p^4*r*t+4*p^5+2*p^5*t := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_diagonal1M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperDGapM2B3 ((1)+(p+1)+(r)+t) ((1)+(p+1)+(r)) (1) ((1)+(p+1)+1) := by
 have he : upperDGapM2B3 ((1)+(p+1)+(r)+t) ((1)+(p+1)+(r)) (1) ((1)+(p+1)+1)=372+456*t+180*t^2+24*t^3+1076*r+1132*r*t+372*r*t^2+40*r*t^3+1188*r^2+996*r^2*t+240*r^2*t^2+16*r^2*t^3+628*r^3+368*r^3*t+48*r^3*t^2+160*r^4+48*r^4*t+16*r^5+886*p+956*p*t+322*p*t^2+36*p*t^3+1936*p*r+1660*p*r*t+406*p*r*t^2+28*p*r*t^3+1526*p*r^2+916*p*r^2*t+120*p*r^2*t^2+516*p*r^3+160*p*r^3*t+64*p*r^4+770*p^2+676*p^2*t+168*p^2*t^2+12*p^2*t^3+1208*p^2*r+744*p^2*r*t+98*p^2*r*t^2+610*p^2*r^2+196*p^2*r^2*t+100*p^2*r^3+310*p^3+196*p^3*t+26*p^3*t^2+312*p^3*r+104*p^3*r*t+76*p^3*r^2+58*p^4+20*p^4*t+28*p^4*r+4*p^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_horizontal2M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperHGapM2B3 ((1)+(0)+(r+1)+t) ((1)+(0)+(r+1)) ((1)+(0)) (1) := by
 have he : upperHGapM2B3 ((1)+(0)+(r+1)+t) ((1)+(0)+(r+1)) ((1)+(0)) (1)=416+240*t+40*t^2+1072*r+536*r*t+76*r*t^2+1032*r^2+416*r^2*t+44*r^2*t^2+468*r^3+136*r^3*t+8*r^3*t^2+100*r^4+16*r^4*t+8*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_diagonal2M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperDGapM2B3 ((1)+(0)+(r+1)+t) ((1)+(0)+(r+1)) (1) ((1)+(0)+1) := by
 have he : upperDGapM2B3 ((1)+(0)+(r+1)+t) ((1)+(0)+(r+1)) (1) ((1)+(0)+1)=584+644*t+232*t^2+28*t^3+1556*r+1480*r*t+448*r*t^2+44*r*t^3+1568*r^2+1188*r^2*t+264*r^2*t^2+16*r^2*t^3+756*r^3+400*r^3*t+48*r^3*t^2+176*r^4+48*r^4*t+16*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_horizontal3M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperHGapM2B3 ((0)+(p+2)+(r)+t) ((0)+(p+2)+(r)) ((0)+(p+2)) (0) := by
 have he : upperHGapM2B3 ((0)+(p+2)+(r)+t) ((0)+(p+2)+(r)) ((0)+(p+2)) (0)=246+175*t+41*t^2+938*r+610*r*t+124*r*t^2+1092*r^2+566*r^2*t+84*r^2*t^2+534*r^3+200*r^3*t+16*r^3*t^2+112*r^4+24*r^4*t+8*r^5+610*p+414*p*t+88*p*t^2+1570*p*r+901*p*r*t+153*p*r*t^2+1246*p*r^2+543*p*r^2*t+58*p*r^2*t^2+374*p*r^3+108*p*r^3*t+4*p*r^3*t^2+36*p*r^4+4*p*r^4*t+560*p^2+356*p^2*t+64*p^2*t^2+954*p^2*r+485*p^2*r*t+61*p^2*r*t^2+462*p^2*r^2+171*p^2*r^2*t+10*p^2*r^2*t^2+64*p^2*r^3+14*p^2*r^3*t+242*p^3+142*p^3*t+19*p^3*t^2+250*p^3*r+114*p^3*r*t+8*p^3*r*t^2+56*p^3*r^2+18*p^3*r^2*t+50*p^4+27*p^4*t+2*p^4*t^2+24*p^4*r+10*p^4*r*t+4*p^5+2*p^5*t := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_diagonal3M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperDGapM2B3 ((0)+(p+2)+(r)+t) ((0)+(p+2)+(r)) (0) ((0)+(p+2)+1) := by
 have he : upperDGapM2B3 ((0)+(p+2)+(r)+t) ((0)+(p+2)+(r)) (0) ((0)+(p+2)+1)=696+824*t+312*t^2+40*t^3+1724*r+1716*r*t+524*r*t^2+52*r*t^3+1656*r^2+1292*r^2*t+280*r^2*t^2+16*r^2*t^3+772*r^3+416*r^3*t+48*r^3*t^2+176*r^4+48*r^4*t+16*r^5+1360*p+1388*p*t+432*p*t^2+44*p*t^3+2630*p*r+2108*p*r*t+466*p*r*t^2+28*p*r*t^3+1850*p*r^2+1028*p*r^2*t+120*p*r^2*t^2+564*p*r^3+160*p*r^3*t+64*p*r^4+1018*p^2+840*p^2*t+190*p^2*t^2+12*p^2*t^3+1442*p^2*r+828*p^2*r*t+98*p^2*r*t^2+662*p^2*r^2+196*p^2*r^2*t+100*p^2*r^3+364*p^3+216*p^3*t+26*p^3*t^2+336*p^3*r+104*p^3*r*t+76*p^3*r^2+62*p^4+20*p^4*t+28*p^4*r+4*p^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_horizontal4M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperHGapM2B3 ((0)+(1)+(r+1)+t) ((0)+(1)+(r+1)) ((0)+(1)) (0) := by
 have he : upperHGapM2B3 ((0)+(1)+(r+1)+t) ((0)+(1)+(r+1)) ((0)+(1)) (0)=656+392*t+72*t^2+1616*r+840*r*t+132*r*t^2+1460*r^2+614*r^2*t+72*r^2*t^2+608*r^3+186*r^3*t+12*r^3*t^2+116*r^4+20*r^4*t+8*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_diagonal4M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperDGapM2B3 ((0)+(1)+(r+1)+t) ((0)+(1)+(r+1)) (0) ((0)+(1)+1) := by
 have he : upperDGapM2B3 ((0)+(1)+(r+1)+t) ((0)+(1)+(r+1)) (0) ((0)+(1)+1)=1104+1176*t+408*t^2+48*t^3+2464*r+2212*r*t+620*r*t^2+56*r*t^3+2148*r^2+1516*r^2*t+304*r^2*t^2+16*r^2*t^3+916*r^3+448*r^3*t+48*r^3*t^2+192*r^4+48*r^4*t+16*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_horizontal5M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperHGapM2B3 ((0)+(0)+(r+2)+t) ((0)+(0)+(r+2)) ((0)+(0)) (0) := by
 have he : upperHGapM2B3 ((0)+(0)+(r+2)+t) ((0)+(0)+(r+2)) ((0)+(0)) (0)=1230+651*t+93*t^2+2422*r+1068*r*t+126*r*t^2+1852*r^2+644*r^2*t+56*r^2*t^2+682*r^3+168*r^3*t+8*r^3*t^2+120*r^4+16*r^4*t+8*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_diagonal5M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperDGapM2B3 ((0)+(0)+(r+2)+t) ((0)+(0)+(r+2)) (0) ((0)+(0)+1) := by
 have he : upperDGapM2B3 ((0)+(0)+(r+2)+t) ((0)+(0)+(r+2)) (0) ((0)+(0)+1)=1600+1576*t+512*t^2+56*t^3+3320*r+2748*r*t+720*r*t^2+60*r*t^3+2692*r^2+1748*r^2*t+328*r^2*t^2+16*r^2*t^3+1068*r^3+480*r^3*t+48*r^3*t^2+208*r^4+48*r^4*t+16*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_local0M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperLGapM2B3 ((k+2)+(r)+t) ((k+2)+(r)) (k+2) := by
 have he : upperLGapM2B3 ((k+2)+(r)+t) ((k+2)+(r)) (k+2)=30+16*t+2*t^2+146*r+76*r*t+10*r*t^2+246*r^2+110*r^2*t+12*r^2*t^2+186*r^3+62*r^3*t+4*r^3*t^2+64*r^4+12*r^4*t+8*r^5+61*k+28*k*t+3*k*t^2+208*k*r+81*k*r*t+7*k*r*t^2+247*k*r^2+73*k*r^2*t+4*k*r^2*t^2+120*k*r^3+20*k*r^3*t+20*k*r^4+41*k^2+14*k^2*t+1*k^2*t^2+99*k^2*r+25*k^2*r*t+1*k^2*r*t^2+76*k^2*r^2+11*k^2*r^2*t+18*k^2*r^3+11*k^3+2*k^3*t+18*k^3*r+2*k^3*r*t+7*k^3*r^2+1*k^4+1*k^4*r := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_local1M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperLGapM2B3 ((1)+(r+1)+t) ((1)+(r+1)) (1) := by
 have he : upperLGapM2B3 ((1)+(r+1)+t) ((1)+(r+1)) (1)=224+120*t+16*t^2+624*r+288*r*t+32*r*t^2+664*r^2+246*r^2*t+20*r^2*t^2+340*r^3+90*r^3*t+4*r^3*t^2+84*r^4+12*r^4*t+8*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

theorem upper_local2M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ upperLGapM2B3 ((0)+(r+2)+t) ((0)+(r+2)) (0) := by
 have he : upperLGapM2B3 ((0)+(r+2)+t) ((0)+(r+2)) (0)=780+396*t+48*t^2+1622*r+678*r*t+64*r*t^2+1324*r^2+428*r^2*t+28*r^2*t^2+530*r^3+118*r^3*t+4*r^3*t^2+104*r^4+12*r^4*t+8*r^5 := by
   simp only [upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3]
   ring
 rw [he]
 positivity

end
end MathGKM.Markov
