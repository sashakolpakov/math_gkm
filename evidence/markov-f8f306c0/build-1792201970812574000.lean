import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored f8f306c0. Exact rational boundary certificate; no external axiom. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

def absorbedBoundary312MF8F (x g z : ℚ) : ℚ :=
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
 2*b11*(b10+a1)-(b0+a0)*b21

theorem absorbedBoundary312MF8F_nonnegMF8F (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ absorbedBoundary312MF8F x g z := by
 let num : ℚ := ((198669578895360+z*(44627083591680+z*2505853992960))+x*((328334257631232+z*(68635445354496+z*3566746447872))+x*((249253162311168+z*(48140895292416+z*2295593217536))+x*((115111565709888+z*(20366619349632+z*881993572416))+x*((36089787226960+z*(5789249549472+z*224797537616))+x*((8112791064792+z*(1164967303888+z*39911295928))+x*((1345446080708+z*(170185885400+z*5036954660))+x*((166690223062+z*(18186851332+z*451862278))+x*((15428804186+z*(1411067360+z*28236762))+x*((1053795352+z*(77517856+z*1170478))+x*((51624424+z*(2861984+z*28962))+x*((1717750+z*(63756+z*324))+x*((34794+z*648)+x*324)))))))))))))
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
 have he : absorbedBoundary312MF8F x g z = num/den := by
   dsimp [absorbedBoundary312MF8F,den]
   field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]
   <;> dsimp [num] <;> ring
 rw [he]
 exact div_nonneg hn (le_of_lt hd)

end
end MathGKM.Markov
