import MarkovThirdSep0I14M03Defs
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
theorem sSep0I14e2M03 (x y u v : ℤ) : v3mid2M115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) ((16+2*v+3*u)+1)=cubicM03 (sSep0I14c00M03 u v) (sSep0I14c01M03 u v) (sSep0I14c02M03 u v) (sSep0I14c03M03 u v) (sSep0I14c10M03 u v) (sSep0I14c11M03 u v) (sSep0I14c12M03 u v) (sSep0I14c20M03 u v) (sSep0I14c21M03 u v) (sSep0I14c30M03 u v) x y := by
 simp only [cubicM03,v3mid2M115,sSep0I14c00M03,sSep0I14c01M03,sSep0I14c02M03,sSep0I14c03M03,sSep0I14c10M03,sSep0I14c11M03,sSep0I14c12M03,sSep0I14c20M03,sSep0I14c21M03,sSep0I14c30M03]
 ring
end
end MathGKM.Markov
