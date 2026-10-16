import MarkovThirdSep11I14MAE2Defs
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
theorem sSep11I14e1MAE2 (x y u v : ℤ) : v3mid2M115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) ((16+2*v+3*u))=cubicM03 (sSep11I14b00MAE2 u v) (sSep11I14b01MAE2 u v) (sSep11I14b02MAE2 u v) (sSep11I14b03MAE2 u v) (sSep11I14b10MAE2 u v) (sSep11I14b11MAE2 u v) (sSep11I14b12MAE2 u v) (sSep11I14b20MAE2 u v) (sSep11I14b21MAE2 u v) (sSep11I14b30MAE2 u v) x y := by
 simp only [cubicM03,v3mid2M115,sSep11I14b00MAE2,sSep11I14b01MAE2,sSep11I14b02MAE2,sSep11I14b03MAE2,sSep11I14b10MAE2,sSep11I14b11MAE2,sSep11I14b12MAE2,sSep11I14b20MAE2,sSep11I14b21MAE2,sSep11I14b30MAE2]
 ring
end
end MathGKM.Markov
