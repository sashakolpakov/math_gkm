import MarkovFullRunCoeff1FA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullH1FA {A : Type*} [CommRing A] (N C R Q T U x : A) : A :=
 (runH1n0FA C R Q T U x) + N*(runH1n1FA C R Q T U x) + N^2*(runH1n2FA C R Q T U x) + N^3*(runH1n3FA C R Q T U x)
attribute [local irreducible] runF0n0FA runF0n1FA runF1n0FA runS0n0FA runS0n1FA runS0n2FA runS1n0FA runS1n1FA runS2n0FA runT0n0FA runT0n1FA runT1n0FA runT1n1FA runT1n2FA runT2n0FA runT2n1FA runT3n0FA runM0n0FA runM0n1FA runM1n0FA runM1n1FA runM1n2FA runM1n3FA runM2n0FA runM2n1FA runM2n2FA runM3n0FA runM3n1FA runM4n0FA partF0FA partF1FA partS0FA partS1FA partS2FA partT0FA partT1FA partT2FA partT3FA partM0FA partM1FA partM2FA partM3FA partM4FA runH1n0FA runH1n1FA runH1n2FA runH1n3FA fullH1FA

theorem fullH1FA_eq {A : Type*} [CommRing A] (N C R Q T U x : A) :
 (partM1FA N C R Q T U x) + 4*((partF0FA N C R Q T U x)*(partT1FA N C R Q T U x)+(partF1FA N C R Q T U x)*(partT0FA N C R Q T U x)) - 8*(partF1FA N C R Q T U x)*(1+x)^3*(1-x)^6 + 6*(partS0FA N C R Q T U x)*(partS1FA N C R Q T U x) - 8*(partF0FA N C R Q T U x)^3*(partF1FA N C R Q T U x)=fullH1FA N C R Q T U x := by
 unfold fullH1FA
 simp only [runF0FA_eq,runF1FA_eq,runM1FA_eq,runS0FA_eq,runS1FA_eq,runT0FA_eq,runT1FA_eq]
 rw [←runH1n0FA_eq,←runH1n1FA_eq,←runH1n2FA_eq,←runH1n3FA_eq]
 ring
end
end MathGKM.Markov
