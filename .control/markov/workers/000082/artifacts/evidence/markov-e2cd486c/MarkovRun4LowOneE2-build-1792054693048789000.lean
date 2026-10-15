import MarkovCrossTail53D
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem run4_LowOne_0E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail153D 4 (1*v+4) 1 0*crossTail353D 4 (1*v+4) 1 0 ≤ (crossTail253D 4 (1*v+4) 1 0)^2 := by
 have he : (crossTail253D 4 (1*v+4) 1 0)^2-crossTail153D 4 (1*v+4) 1 0*crossTail353D 4 (1*v+4) 1 0=((((((113356800*v+2856729600)*v+29393280000)*v+151389216000)*v+410595004800)*v+559331136000)*v+301568313600) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((((113356800*v+2856729600)*v+29393280000)*v+151389216000)*v+410595004800)*v+559331136000)*v+301568313600) := by positivity
 omega
theorem run4_LowOne_1E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail253D 4 (1*v+4) 1 0*crossTail453D 4 (1*v+4) 1 0 ≤ (crossTail353D 4 (1*v+4) 1 0)^2 := by
 have he : (crossTail353D 4 (1*v+4) 1 0)^2-crossTail253D 4 (1*v+4) 1 0*crossTail453D 4 (1*v+4) 1 0=((((((13824000*v+388454400)*v+4546022400)*v+26006572800)*v+76510526400)*v+110362780800)*v+61500902400) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((((13824000*v+388454400)*v+4546022400)*v+26006572800)*v+76510526400)*v+110362780800)*v+61500902400) := by positivity
 omega
theorem run4_LowOne_2E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail353D 4 (1*v+4) 1 0*crossTail553D 4 (1*v+4) 1 0 ≤ (crossTail453D 4 (1*v+4) 1 0)^2 := by
 have he : (crossTail453D 4 (1*v+4) 1 0)^2-crossTail353D 4 (1*v+4) 1 0*crossTail553D 4 (1*v+4) 1 0=((((((921600*v+30412800)*v+449510400)*v+3048883200)*v+10213704000)*v+16275168000)*v+9798278400) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((((921600*v+30412800)*v+449510400)*v+3048883200)*v+10213704000)*v+16275168000)*v+9798278400) := by positivity
 omega
theorem run4_LowOne_3E2 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 crossTail453D 4 (1*v+4) 1 0*crossTail653D 4 (1*v+4) 1 0 ≤ (crossTail553D 4 (1*v+4) 1 0)^2 := by
 have he : (crossTail553D 4 (1*v+4) 1 0)^2-crossTail453D 4 (1*v+4) 1 0*crossTail653D 4 (1*v+4) 1 0=((((14169600*v+171763200)*v+792072000)*v+1544659200)*v+1068940800) := by
  simp only [crossTail153D,crossTail253D,crossTail353D,crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ ((((14169600*v+171763200)*v+792072000)*v+1544659200)*v+1068940800) := by positivity
 omega
end
end MathGKM.Markov
