import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored f8f306c0. Exact rational boundary certificate; no external axiom. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

def absorbedBoundary213MF8F (x g z : ℚ) : ℚ :=
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
 (b10+a1)^2-(b0+a0)*(b20+a2)

theorem absorbedBoundary213MF8F_nonnegMF8F (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ absorbedBoundary213MF8F x g z := by
 let num : ℚ := ((1153072972800+z*(390339129600+z*30775626000))+x*((2267832280320+z*(665461643040+z*46152968400))+x*((1987060164624+z*(509987975328+z*31079408760))+x*((1033312556496+z*(232356436848+z*12376615704))+x*((356914615096+z*(70031686592+z*3227969601))+x*((86554205928+z*(14677747826+z*576177093))+x*((15147126897+z*(2184805778+z*71285376))+x*((1930817421+z*(231137000+z*6036582))+x*((178168296+z*(17041700+z*334869))+x*((11619006+z*(834386+z*10989))+x*((508733+z*(24426+z*162))+x*((13437+z*324)+x*162))))))))))))
 let den : ℚ := (x+5)^1*(x+6)^2*(x+7)^1*(x+8)^2*(x+9)^2*(x+10)^2*(x+11)^1
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
 have he : absorbedBoundary213MF8F x g z = num/den := by
   dsimp [absorbedBoundary213MF8F,den]
   field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]
   <;> dsimp [num] <;> ring
 rw [he]
 exact div_nonneg hn (le_of_lt hd)

end
end MathGKM.Markov
