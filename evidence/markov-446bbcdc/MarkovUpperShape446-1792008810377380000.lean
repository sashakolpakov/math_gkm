import MarkovCubicBounds446
/-! Machine-authored 446bbcdc. Abstract upper-tail polynomial certificate.
The coefficient-to-expression bridge is not assumed or proved here. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
def upperShape446 (c r t : ℤ) : ℤ :=
 (t^3-t)*c^2+6*t*(t+1)*c*r+6*(t+1)*r^2-6*t*(t+2)*r-(t^3-4*t)*c
theorem upperShape_lc446 (c r t : ℤ) (hr : 1≤r) (hc : r+1≤c) (ht : 1≤t) :
 upperShape446 c r (t-1)*upperShape446 c r (t+1)≤upperShape446 c r t^2 := by
 let u := t-1
 let v := r-1
 let w := c-r-1
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have hw : 0≤w := by dsimp [w]; omega
 have he : upperShape446 c r t^2-upperShape446 c r (t-1)*upperShape446 c r (t+1)=
  180 + 360*w + 189*w^2 + 648*v + 918*v*w + 288*v*w^2 + 981*v^2 + 864*v^2*w + 108*v^2*w^2 + 720*v^3 + 288*v^3*w + 216*v^4 + 336*u + 744*u*w + 486*u*w^2 + 84*u*w^3 + 6*u*w^4 + 1272*u*v + 2040*u*v*w + 840*u*v*w^2 + 72*u*v*w^3 + 1842*u*v^2 + 1896*u*v^2*w + 360*u*v^2*w^2 + 1212*u*v^3 + 600*u*v^3*w + 306*u*v^4 + 276*u^2 + 684*u^2*w + 555*u^2*w^2 + 162*u^2*w^3 + 15*u^2*w^4 + 972*u^2*v + 1758*u^2*v*w + 918*u^2*v*w^2 + 132*u^2*v*w^3 + 1275*u^2*v^2 + 1494*u^2*v^2*w + 378*u^2*v^2*w^2 + 738*u^2*v^3 + 420*u^2*v^3*w + 159*u^2*v^4 + 96*u^3 + 264*u^3*w + 252*u^3*w^2 + 96*u^3*w^3 + 12*u^3*w^4 + 312*u^3*v + 624*u^3*v*w + 384*u^3*v*w^2 + 72*u^3*v*w^3 + 372*u^3*v^2 + 480*u^3*v^2*w + 144*u^3*v^2*w^2 + 192*u^3*v^3 + 120*u^3*v^3*w + 36*u^3*v^4 + 12*u^4 + 36*u^4*w + 39*u^4*w^2 + 18*u^4*w^3 + 3*u^4*w^4 + 36*u^4*v + 78*u^4*v*w + 54*u^4*v*w^2 + 12*u^4*v*w^3 + 39*u^4*v^2 + 54*u^4*v^2*w + 18*u^4*v^2*w^2 + 18*u^4*v^3 + 12*u^4*v^3*w + 3*u^4*v^4 := by dsimp [upperShape446,u,v,w]; ring
 have hp : 0≤180 + 360*w + 189*w^2 + 648*v + 918*v*w + 288*v*w^2 + 981*v^2 + 864*v^2*w + 108*v^2*w^2 + 720*v^3 + 288*v^3*w + 216*v^4 + 336*u + 744*u*w + 486*u*w^2 + 84*u*w^3 + 6*u*w^4 + 1272*u*v + 2040*u*v*w + 840*u*v*w^2 + 72*u*v*w^3 + 1842*u*v^2 + 1896*u*v^2*w + 360*u*v^2*w^2 + 1212*u*v^3 + 600*u*v^3*w + 306*u*v^4 + 276*u^2 + 684*u^2*w + 555*u^2*w^2 + 162*u^2*w^3 + 15*u^2*w^4 + 972*u^2*v + 1758*u^2*v*w + 918*u^2*v*w^2 + 132*u^2*v*w^3 + 1275*u^2*v^2 + 1494*u^2*v^2*w + 378*u^2*v^2*w^2 + 738*u^2*v^3 + 420*u^2*v^3*w + 159*u^2*v^4 + 96*u^3 + 264*u^3*w + 252*u^3*w^2 + 96*u^3*w^3 + 12*u^3*w^4 + 312*u^3*v + 624*u^3*v*w + 384*u^3*v*w^2 + 72*u^3*v*w^3 + 372*u^3*v^2 + 480*u^3*v^2*w + 144*u^3*v^2*w^2 + 192*u^3*v^3 + 120*u^3*v^3*w + 36*u^3*v^4 + 12*u^4 + 36*u^4*w + 39*u^4*w^2 + 18*u^4*w^3 + 3*u^4*w^4 + 36*u^4*v + 78*u^4*v*w + 54*u^4*v*w^2 + 12*u^4*v*w^3 + 39*u^4*v^2 + 54*u^4*v^2*w + 18*u^4*v^2*w^2 + 18*u^4*v^3 + 12*u^4*v^3*w + 3*u^4*v^4 := by positivity
 omega
#print axioms upperShape_lc446
end
end MathGKM.Markov
