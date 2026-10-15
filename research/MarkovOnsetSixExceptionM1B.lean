import MarkovOnsetValues5M1B
/-! Machine-authored 1b02dddc. Sixth onset position via a nonpositive correction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff

theorem onset_six_exceptionM1B (n : ℤ) (hn : 7≤n) :
 onsetValue5_6M1B n 5 4*onsetValue5_8M1B n 5 4≤onsetValue5_7M1B n 5 4^2 := by
 let x := n-7
 have hx : 0≤x := by dsimp [x]; omega
 have he : n=x+7 := by dsimp [x]; ring
 rw [he]
 have hgap : onsetValue5_7M1B (x+7) 5 4^2-
   onsetValue5_6M1B (x+7) 5 4*onsetValue5_8M1B (x+7) 5 4=746620441573708800 + 1163185263301662720*x^1 + 835940360645720064*x^2 + 366433721958850560*x^3 + 109110654531809280*x^4 + 23248012324884480*x^5 + 3634113809313792*x^6 + 419898515742720*x^7 + 35588603473920*x^8 + 2157694156800*x^9 + 88827346944*x^10 + 2229534720*x^11 + 25804800*x^12 := by
  unfold onsetValue5_6M1B onsetValue5_7M1B onsetValue5_8M1B
  unfold backShape5M94 onsetCorrection5_6M1B onsetCorrection5_7M1B onsetCorrection5_8M1B
  norm_num
  ring
 apply sub_nonneg.mp
 rw [hgap]
 positivity
end
end MathGKM.Markov
