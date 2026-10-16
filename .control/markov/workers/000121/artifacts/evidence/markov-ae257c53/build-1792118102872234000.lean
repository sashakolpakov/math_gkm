import MarkovThirdSep3I14MAE2Defs
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
theorem sSep3I14e1MAE2 (x y u v : ℤ) : v3mid2M115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) ((16+2*v+3*u))=cubicM03 (sSep3I14b00MAE2 u v) (sSep3I14b01MAE2 u v) (sSep3I14b02MAE2 u v) (sSep3I14b03MAE2 u v) (sSep3I14b10MAE2 u v) (sSep3I14b11MAE2 u v) (sSep3I14b12MAE2 u v) (sSep3I14b20MAE2 u v) (sSep3I14b21MAE2 u v) (sSep3I14b30MAE2 u v) x y := by
 simp only [cubicM03,v3mid2M115,sSep3I14b00MAE2,sSep3I14b01MAE2,sSep3I14b02MAE2,sSep3I14b03MAE2,sSep3I14b10MAE2,sSep3I14b11MAE2,sSep3I14b12MAE2,sSep3I14b20MAE2,sSep3I14b21MAE2,sSep3I14b30MAE2]
 ring
end
end MathGKM.Markov
