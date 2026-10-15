import MarkovSecondParts07F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem second_gap_8_nonneg07F1 (t u v : ℤ) (ht : 0 ≤ t) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 0 ≤ secondGap807F1 t u v := by
 have he : secondGap807F1 t u v=((((((73280*u+(439680*v+960000))*u+((1099200*v+4800000)*v+5194880))*u+(((1465600*v+9600000)*v+20779520)*v+14918400))*u+((((1099200*v+9600000)*v+31169280)*v+44755200)*v+24096320))*u+(((((439680*v+4800000)*v+20779520)*v+44755200)*v+48192640)*v+20870400))*u+((((((73280*v+960000)*v+5194880)*v+14918400)*v+24096320)*v+20870400)*v+7614720)) := by
   unfold secondGap807F1 secondL307F1 secondL407F1 secondL507F1 secondC307F1 secondC407F1 secondC507F1 secondR307F1 secondR407F1 secondR507F1
   ring
 rw [he]
 positivity
end
end MathGKM.Markov
