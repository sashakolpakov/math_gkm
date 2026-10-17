import MarkovTopFirstCentralDefsM731
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 14000000
set_option maxRecDepth 20000
theorem first_central_margin_identityM731 (a r H : ℤ) :
 firstCentralMarginM731 a r H=a^2*(a+1)*r*(r-1)*firstCentralReducedM731 a r H := by
 have hdiag : betaWeightedPolynomialMCA9 a r r H=
  16*r
  +80*r*H^2
  +16*r^2
  +80*r^2*H
  +80*r^2*H^2
  +16*r^3
  +80*r^3*H
  +16*r^4
  +32*a
  +160*a*H^2
  +52*a*r
  +280*a*r*H
  +332*a*r*H^2
  +112*a*r^2
  +392*a*r^2*H
  +132*a*r^2*H^2
  +136*a*r^3
  +72*a*r^3*H
  -20*a*r^4
  +40*a^2
  -120*a^2*H
  +464*a^2*H^2
  -26*a^2*r
  +1032*a^2*r*H
  +310*a^2*r*H^2
  +484*a^2*r^2
  +204*a^2*r^2*H
  +90*a^2*r^2*H^2
  +16*a^2*r^3
  +16*a^2*r^3*H
  -38*a^2*r^4
  -12*a^3
  -148*a^3*H
  +400*a^3*H^2
  -44*a^3*r
  +978*a^3*r*H
  +106*a^3*r*H^2
  +480*a^3*r^2
  -86*a^3*r^2*H
  +30*a^3*r^2*H^2
  -104*a^3*r^3
  -16*a^3*r^4
  -28*a^4
  -60*a^4*H
  +136*a^4*H^2
  -2*a^4*r
  +354*a^4*r*H
  +12*a^4*r*H^2
  +172*a^4*r^2
  -74*a^4*r^2*H
  +4*a^4*r^2*H^2
  -56*a^4*r^3
  -2*a^4*r^4
  -8*a^5
  -8*a^5*H
  +16*a^5*H^2
  +4*a^5*r
  +44*a^5*r*H
  +20*a^5*r^2
  -12*a^5*r^2*H
  -8*a^5*r^3 := by unfold betaWeightedPolynomialMCA9; ring
 unfold firstCentralMarginM731 firstCentralMeanM731 firstCentralDenM731
 rw [hdiag]
 unfold betaScalarMCA9 firstCentralReducedM731
 ring
end
end MathGKM.Markov
