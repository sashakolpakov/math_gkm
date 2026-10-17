import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored f8f306c0. Exact rational boundary certificate; no external axiom. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

def absorbedBoundary212MF8F (x g z : ℚ) : ℚ :=
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
 2*b11*(b10+a1)-(b0+a0)*b21

theorem absorbedBoundary212MF8F_nonnegMF8F (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ absorbedBoundary212MF8F x g z := by
 let num : ℚ := ((86646163968000+z*(21818305152000+z*1373441832000))+x*((152157493094400+z*(35529419145600+z*2061267123600))+x*((122860849308480+z*(26410727625120+z*1400010547320))+x*((60403390469904+z*(11850991898736+z*568028694756))+x*((20174911266936+z*(3575257238920+z*152963576246))+x*((4834401360036+z*(763952647324+z*28703611606))+x*((855048304934+z*(118550068452+z*3829430126))+x*((113016244942+z*(13460408596+z*363165604))+x*((11162752742+z*(1109698368+z*23986922))+x*((813676252+z*(64771372+z*1050574))+x*((42540098+z*(2540204+z*27450))+x*((1510366+z*(60084+z*324))+x*((32634+z*648)+x*324)))))))))))))
 let den : ℚ := (x+5)^1*(x+6)^1*(x+8)^2*(x+9)^2*(x+10)^2*(x+11)^1*(x+12)^1
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
 have he : absorbedBoundary212MF8F x g z = num/den := by
   dsimp [absorbedBoundary212MF8F,num,den]
   field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]
   <;> ring
 rw [he]
 exact div_nonneg hn (le_of_lt hd)

end
end MathGKM.Markov
