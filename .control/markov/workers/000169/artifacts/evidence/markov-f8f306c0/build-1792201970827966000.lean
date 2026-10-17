import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored f8f306c0. Exact rational boundary certificate; no external axiom. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

def absorbedBoundary313MF8F (x g z : ℚ) : ℚ :=
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
 (b10+a1)^2-(b0+a0)*(b20+a2)

theorem absorbedBoundary313MF8F_nonnegMF8F (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ absorbedBoundary313MF8F x g z := by
 let num : ℚ := ((1870457702400+z*(686499287040+z*53185628160))+x*((3707536790016+z*(1125423055872+z*75931218432))+x*((3207586307616+z*(826622364480+z*48610993440))+x*((1626349486272+z*(359933748800+z*18379598976))+x*((543053923472+z*(103417438560+z*4545592560))+x*((126516817248+z*(20616100704+z*768460032))+x*((21167694018+z*(2912764884+z*89943426))+x*((2569635636+z*(291923796+z*7197552))+x*((225074766+z*(20353320+z*376908))+x*((13893336+z*(940744+z*11664))+x*((574366+z*(25956+z*162))+x*((14292+z*324)+x*162))))))))))))
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
 have he : absorbedBoundary313MF8F x g z = num/den := by
   dsimp [absorbedBoundary313MF8F,den]
   field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]
   <;> dsimp [num] <;> ring
 rw [he]
 exact div_nonneg hn (le_of_lt hd)

end
end MathGKM.Markov
