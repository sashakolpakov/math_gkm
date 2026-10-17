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
end
end MathGKM.Markov
