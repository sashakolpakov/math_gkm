import MarkovThirdSep11I14M9FCDefs
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
theorem sSep11I14e2M9FC (x y u v : ℤ) : v3mid2M115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) ((16+2*v+3*u)+1)=cubicM03 (sSep11I14c00M9FC u v) (sSep11I14c01M9FC u v) (sSep11I14c02M9FC u v) (sSep11I14c03M9FC u v) (sSep11I14c10M9FC u v) (sSep11I14c11M9FC u v) (sSep11I14c12M9FC u v) (sSep11I14c20M9FC u v) (sSep11I14c21M9FC u v) (sSep11I14c30M9FC u v) x y := by
 simp only [cubicM03,v3mid2M115,sSep11I14c00M9FC,sSep11I14c01M9FC,sSep11I14c02M9FC,sSep11I14c03M9FC,sSep11I14c10M9FC,sSep11I14c11M9FC,sSep11I14c12M9FC,sSep11I14c20M9FC,sSep11I14c21M9FC,sSep11I14c30M9FC]
 ring
end
end MathGKM.Markov
