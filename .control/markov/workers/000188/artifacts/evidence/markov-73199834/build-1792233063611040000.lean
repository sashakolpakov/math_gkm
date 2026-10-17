import MarkovTopWeightedBetaMeanMCA9
/-! Machine-authored 20825094. Positive endpoint margin at m=r.
The comparison-mass and endpoint-sum attachment are separate statements. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 14000000
set_option maxRecDepth 20000
def firstCentralDenM731 (a : ℤ) : ℤ :=
 (2*a)*(2*a+1)*(2*a+2)*(2*a+3)*(2*a+4)*(2*a+5)
def firstCentralMeanM731 (a r H : ℤ) : ℤ :=
 2*a^2*(a+1)*r*(r-1)*betaWeightedPolynomialMCA9 a r r H
def firstCentralMarginM731 (a r H : ℤ) : ℤ :=
 2*firstCentralMeanM731 a r H*(r+1)+
 r*betaScalarMCA9 a H 0 r*firstCentralDenM731 a
def firstCentralReducedM731 (a r H : ℤ) : ℤ :=
64*r
  -720*r*H
  -400*r*H^2
  -592*r^2
  -1120*r^2*H
  +640*r^2*H^2
  -592*r^3
  +640*r^3*H
  +320*r^3*H^2
  +128*r^4
  +320*r^4*H
  +64*r^5
  +128*a
  +640*a*H^2
  +336*a*r
  -1688*a*r*H
  -840*a*r*H^2
  -2152*a*r^2
  -2928*a*r^2*H
  +1856*a*r^2*H^2
  -1816*a*r^3
  +1856*a*r^3*H
  +528*a*r^3*H^2
  +464*a*r^4
  +288*a*r^4*H
  -80*a*r^5
  +160*a^2
  -480*a^2*H
  +1856*a^2*H^2
  +56*a^2*r
  -40*a^2*r*H
  -592*a^2*r*H^2
  -1856*a^2*r^2
  -2432*a^2*r^2*H
  +1600*a^2*r^2*H^2
  -1688*a^2*r^3
  +880*a^2*r^3*H
  +360*a^2*r^3*H^2
  -88*a^2*r^4
  +64*a^2*r^4*H
  -152*a^2*r^5
  -48*a^3
  -592*a^3*H
  +1600*a^3*H^2
  -224*a^3*r
  +1128*a^3*r*H
  -168*a^3*r*H^2
  -448*a^3*r^2
  -816*a^3*r^2*H
  +544*a^3*r^2*H^2
  -688*a^3*r^3
  -344*a^3*r^3*H
  +120*a^3*r^3*H^2
  -480*a^3*r^4
  -64*a^3*r^5
  -112*a^4
  -240*a^4*H
  +544*a^4*H^2
  -120*a^4*r
  +568*a^4*r*H
  -16*a^4*r*H^2
  +72*a^4*r^2
  -96*a^4*r^2*H
  +64*a^4*r^2*H^2
  -144*a^4*r^3
  -296*a^4*r^3*H
  +16*a^4*r^3*H^2
  -232*a^4*r^4
  -8*a^4*r^5
  -32*a^5
  -32*a^5*H
  +64*a^5*H^2
  -16*a^5*r
  +80*a^5*r*H
  +32*a^5*r^2
  -16*a^5*r^3
  -48*a^5*r^3*H
  -32*a^5*r^4

end
end MathGKM.Markov
