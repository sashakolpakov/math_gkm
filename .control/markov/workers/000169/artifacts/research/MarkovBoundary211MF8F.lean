import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored f8f306c0. Exact rational boundary certificate; no external axiom. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

def absorbedBoundary211MF8F (x g z : ℚ) : ℚ :=
 let t:=x+4
 let d:=t+1
 let j:=d+2
 let B:=z+j+1
 let W := fun v m : ℚ => (v+m+4)*(v+m+5)+4*(j-m)*(v+j+4)
 let D := fun v m : ℚ => (v+m+4)*(v+m+5)
 let b0:=B*W t 0/((x+8)*(x+9))
 let b10:=B*(t+j+4)*W (t+1) 0/((x+8)*(x+9)*(x+10))
 let b11:=B*j*(t+j+4)*W (t+1) 1/((x+8)*(x+10)*(x+11))
 let b20:=B*(t+j+4)*(t+j+5)*W (t+2) 0/((x+8)*(x+9)*(x+10)*(x+11))
 let b21:=B*j*(t+j+4)*(t+j+5)*W (t+2) 1/((x+8)*(x+9)*(x+11)*(x+12))
 let b22:=B*j*(j-1)*(t+j+4)*(t+j+5)*W (t+2) 2/(2*(x+8)*(x+9)*(x+12)*(x+13))
 let a0:=4*(d-t)/(x+5)
 let a1:=4*(d-t-1)/(x+6)
 let a2:=0
 b11^2-(b0+a0)*b22

theorem absorbedBoundary211MF8F_nonnegMF8F (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ absorbedBoundary211MF8F x g z := by
 let num : ℚ := ((6047131289472000+z*(1520494264800000+z*95575356702000))+x*((11583978014822400+z*(2719687492317600+z*158825163770100))+x*((10320421656885360+z*(2250143907573480+z*121306861234320))+x*((5672760924717876+z*(1141353890173520+z*56382486886321))+x*((2151404065874240+z*(396517660957394+z*17791632195984))+x*((596307207408609+z*(99801323056968+z*4024569312226))+x*((124778901524376+z*(18765831607928+z*671317706319))+x*((20071170900598+z*(2677602056682+z*83591008554))+x*((2501969690715+z*(291288090372+z*7768175715))+x*((241666264410+z*(24038366902+z*531983456))+x*((17937026611+z*(1481019940+z*26087325))+x*((1004475108+z*(66041670+z*867149))+x*((41074089+z*(2014306+z*17505))+x*((1157525+z*(37602+z*162))+x*((20097+z*324)+x*162)))))))))))))))
 let den : ℚ := (x+5)^1*(x+8)^2*(x+9)^2*(x+10)^2*(x+11)^2*(x+12)^1*(x+13)^1
 have hn : 0 ≤ num := by dsimp [num]; positivity
 have hd : 0 < den := by dsimp [den]; positivity
 have h5 : x+5≠0 := by positivity
 have h6 : x+6≠0 := by positivity
 have h7 : x+7≠0 := by positivity
 have h8 : x+8≠0 := by positivity
 have h9 : x+9≠0 := by positivity
 have h10 : x+10≠0 := by positivity
 have h11 : x+11≠0 := by positivity
 have h12 : x+12≠0 := by positivity
 have h13 : x+13≠0 := by positivity
 have he : absorbedBoundary211MF8F x g z = num/den := by
   dsimp [absorbedBoundary211MF8F,num,den]
   field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]
   <;> ring
 rw [he]
 exact div_nonneg hn (le_of_lt hd)

end
end MathGKM.Markov
