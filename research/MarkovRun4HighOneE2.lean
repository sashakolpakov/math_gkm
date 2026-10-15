import MarkovCrossTail53D
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem run4_HighOne_0E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail153D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail353D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)) ≤ (crossTail253D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2 := by
 have he : (crossTail253D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2-crossTail153D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail353D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))=((((((6659366400*u+103769683200)*u+674264088000)*u+2336637974400)*u+4551171883200)*u+4719910176000)*u+2034745920000) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((((6659366400*u+103769683200)*u+674264088000)*u+2336637974400)*u+4551171883200)*u+4719910176000)*u+2034745920000) := by positivity
 omega
theorem run4_HighOne_1E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail253D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail453D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)) ≤ (crossTail353D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2 := by
 have he : (crossTail353D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2-crossTail253D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail453D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))=((((((2238624000*u+33795705600)*u+212906836800)*u+715680316800)*u+1352075976000)*u+1358846150400)*u+566467603200) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((((2238624000*u+33795705600)*u+212906836800)*u+715680316800)*u+1352075976000)*u+1358846150400)*u+566467603200) := by positivity
 omega
theorem run4_HighOne_2E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail353D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail553D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)) ≤ (crossTail453D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2 := by
 have he : (crossTail453D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2-crossTail353D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail553D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))=((((((524160000*u+7921843200)*u+49902840000)*u+167433350400)*u+315170193600)*u+315134409600)*u+130551782400) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((((524160000*u+7921843200)*u+49902840000)*u+167433350400)*u+315170193600)*u+315134409600)*u+130551782400) := by positivity
 omega
theorem run4_HighOne_3E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail453D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail653D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)) ≤ (crossTail553D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2 := by
 have he : (crossTail553D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4)))^2-crossTail453D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))*crossTail653D 4 (1*u+4) (1*u+3) (2*(1*u+3)-(1*u+4))=((((((96768000*u+1461888000)*u+9235814400)*u+31125254400)*u+58907260800)*u+59276966400)*u+24741676800) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((((96768000*u+1461888000)*u+9235814400)*u+31125254400)*u+58907260800)*u+59276966400)*u+24741676800) := by positivity
 omega
end
end MathGKM.Markov
