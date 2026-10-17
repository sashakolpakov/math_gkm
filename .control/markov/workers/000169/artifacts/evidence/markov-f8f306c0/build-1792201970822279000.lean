import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored f8f306c0. Exact rational boundary certificate; no external axiom. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

def absorbedBoundary311MF8F (x g z : ℚ) : ℚ :=
 let t:=x+4
 let d:=t+1
 let j:=d+3
 let B:=z+j+1
 let W := fun v m : ℚ => (v+m+4)*(v+m+5)+4*(j-m)*(v+j+4)
 let D := fun v m : ℚ => (v+m+4)*(v+m+5)
 let b0:=B*W t 0/((x+8)*(x+9))
 let b10:=B*(t+j+4)*W (t+1) 0/((x+8)*(x+9)*(x+10))
 let b11:=B*j*(t+j+4)*W (t+1) 1/((x+8)*(x+10)*(x+11))
 let b20:=B*(t+j+4)*(t+j+5)*W (t+2) 0/((x+8)*(x+9)*(x+10)*(x+11))
 let b21:=B*j*(t+j+4)*(t+j+5)*W (t+2) 1/((x+8)*(x+9)*(x+11)*(x+12))
 let b22:=B*j*(j-1)*(t+j+4)*(t+j+5)*W (t+2) 2/(2*(x+8)*(x+9)*(x+12)*(x+13))
 let a0:=8*(d-t)/(x+5)
 let a1:=8*(d-t-1)/(x+6)
 let a2:=0
 b11^2-(b0+a0)*b22

theorem absorbedBoundary311MF8F_nonnegMF8F (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ absorbedBoundary311MF8F x g z := by
 let num : ℚ := ((15695479407697920+z*(3519095631298560+z*197239274987520))+x*((28207105334590464+z*(5923619494336512+z*309558750567424))+x*((23565174716252544+z*(4610299900991232+z*223232680269184))+x*((12142181911393616+z*(2199291166489120+z*97950512254160))+x*((4315823733592308+z*(718487880386664+z*29179215500404))+x*((1121014380916360+z*(170056384799976+z*6232155202576))+x*((219830640717137+z*(30073307022818+z*981820964709))+x*((33141870816352+z*(4036673935998+z*115513198310))+x*((3872922863418+z*(413259233790+z*10148464721))+x*((350804033326+z*(32109696350+z*657492646))+x*((24427267620+z*(1863742146+z*30528095))+x*((1284015350+z*(78352842+z*961778))+x*((49315714+z*(2255026+z*18423))+x*((1306370+z*(39762+z*162))+x*((21339+z*324)+x*162)))))))))))))))
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
 have he : absorbedBoundary311MF8F x g z = num/den := by
   dsimp [absorbedBoundary311MF8F,den]
   field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]
   <;> dsimp [num] <;> ring
 rw [he]
 exact div_nonneg hn (le_of_lt hd)

end
end MathGKM.Markov
