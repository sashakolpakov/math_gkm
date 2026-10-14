import MarkovSquares3556

/-! Machine-authored request 3556cd95. Exact integer cubic gap certificates. -/
namespace MathGKM.Markov

def cubic3556 (x : ℤ) : ℤ := (x+1)*(x+2)*(2*x+3)
def highCubic3556 (q x : ℤ) : ℤ := cubic3556 x-8*cubic3556 (x-q-1)

theorem cubic_lc3556 (x : ℤ) (hx : 0≤x) :
    cubic3556 x*cubic3556 (x+2)≤cubic3556 (x+1)^2 := by
  have he : cubic3556 (x+1)^2-cubic3556 x*cubic3556 (x+2)=
      12*x^4+120*x^3+438*x^2+690*x+396 := by unfold cubic3556; ring
  have hp : 0≤12*x^4+120*x^3+438*x^2+690*x+396 := by positivity
  linarith

theorem high_cubic_lc3556 (q x : ℤ) (hq : 1≤q) (hx : q≤x) (ht : x+1≤2*q) :
    highCubic3556 q (x-1)*highCubic3556 q (x+1)≤highCubic3556 q x^2 := by
  let t := x-q
  let h := 2*q-x-1
  have ht0 : 0≤t := by dsimp [t]; omega
  have hh0 : 0≤h := by dsimp [h]; omega
  have he : highCubic3556 q x^2-highCubic3556 q (x-1)*highCubic3556 q (x+1)=
      684+3060*t+3528*t^2+2016*t^3+576*t^4+
      1314*h+4824*h*t+3456*h*t^2+576*h*t^3+
      870*h^2+2160*h^2*t+864*h^2*t^2+216*h^3+288*h^3*t+12*h^4 := by
    unfold highCubic3556 cubic3556
    dsimp [t,h]
    ring
  have hp : 0≤684+3060*t+3528*t^2+2016*t^3+576*t^4+
      1314*h+4824*h*t+3456*h*t^2+576*h*t^3+
      870*h^2+2160*h^2*t+864*h^2*t^2+216*h^3+288*h^3*t+12*h^4 := by positivity
  linarith

#print axioms cubic_lc3556
#print axioms high_cubic_lc3556
end MathGKM.Markov
