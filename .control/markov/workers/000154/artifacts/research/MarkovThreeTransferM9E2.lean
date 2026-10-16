import MarkovThreeSourceM9E2
/-! Machine-authored 9e205206. Four-state positive transfer for numerator three.
The coordinate ordering is (f^3,f^2 g,f g^2,g^3). -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

abbrev FourM9E2 (R : Type*) := R × R × R × R
def fibPairM9E2 {R : Type*} [CommRing R] (u v : R) : ℕ → R × R
 | 0 => (1,0)
 | n+1 => let z := fibPairM9E2 u v n
          ((u+v)*z.1+z.2,u*z.1+z.2)
def cubeVecM9E2 {R : Type*} [CommRing R] (x y : R) : FourM9E2 R :=
 (x^3,x^2*y,x*y^2,y^3)
def cubeStepM9E2 {R : Type*} [CommRing R] (u v : R) (z : FourM9E2 R) : FourM9E2 R :=
 ((u+v)^3*z.1+3*(u+v)^2*z.2.1+3*(u+v)*z.2.2.1+z.2.2.2,
  u*(u+v)^2*z.1+((u+v)^2+2*u*(u+v))*z.2.1+(2*(u+v)+u)*z.2.2.1+z.2.2.2,
  u^2*(u+v)*z.1+(2*u*(u+v)+u^2)*z.2.1+((u+v)+2*u)*z.2.2.1+z.2.2.2,
  u^3*z.1+3*u^2*z.2.1+3*u*z.2.2.1+z.2.2.2)
def cubeStateM9E2 {R : Type*} [CommRing R] (u v : R) : ℕ → FourM9E2 R
 | 0 => (1,0,0,0)
 | n+1 => cubeStepM9E2 u v (cubeStateM9E2 u v n)

theorem cube_step_pairM9E2 {R : Type*} [CommRing R] (u v x y : R) :
 cubeStepM9E2 u v (cubeVecM9E2 x y)=cubeVecM9E2 ((u+v)*x+y) (u*x+y) := by
 simp only [cubeStepM9E2,cubeVecM9E2]
 apply Prod.ext
 · ring
 apply Prod.ext
 · ring
 apply Prod.ext <;> ring

theorem cube_state_pairM9E2 {R : Type*} [CommRing R] (u v : R) (n : ℕ) :
 cubeStateM9E2 u v n=cubeVecM9E2 (fibPairM9E2 u v n).1 (fibPairM9E2 u v n).2 := by
 induction n with
 | zero => simp [cubeStateM9E2,cubeVecM9E2,fibPairM9E2]
 | succ n ih => rw [cubeStateM9E2,ih,cube_step_pairM9E2]; rfl

theorem fib_pair_firstM9E2 (n : ℕ) : (fibPairM9E2 U V n).1=fib6 n := by
 induction n using Nat.twoStepInduction with
 | zero => exact fib_zero6.symm
 | one => simp [fibPairM9E2,fib_one6]
 | more n h0 h1 =>
   have he : (fibPairM9E2 U V (n+2)).1=
     S*(fibPairM9E2 U V (n+1)).1-V*(fibPairM9E2 U V n).1 := by
     simp only [fibPairM9E2,S]
     ring
   rw [he,h0,h1,fib_rec6]

theorem fib_pair_secondM9E2 (n : ℕ) :
 (fibPairM9E2 U V n).2=fib6 (n+1)-(U+V)*fib6 n := by
 have h := fib_pair_firstM9E2 (n+1)
 change (U+V)*(fibPairM9E2 U V n).1+(fibPairM9E2 U V n).2=fib6 (n+1) at h
 rw [fib_pair_firstM9E2] at h
 linear_combination h

def threeOutputM9E2 {R : Type*} [CommRing R] (u v : R) (r : Bool) (z : FourM9E2 R) : R :=
 if r then
 ((u+v)^3+v*(2*(u+v)+1))*z.1+(3*(u+v)^2+v)*z.2.1+
   3*(u+v)*z.2.2.1+z.2.2.2
 else
 ((u+v+1)*(u+v)^3+v*(u+v)^2+v^2)*z.1+
 (3*(u+v+1)*(u+v)^2+2*v*(u+v))*z.2.1+
 (3*(u+v+1)*(u+v)+v)*z.2.2.1+(u+v+1)*z.2.2.2

theorem three_positive_transferM9E2 (q : ℕ) (r : Bool) :
 threePolyM9E2 q r=threeOutputM9E2 U V r (cubeStateM9E2 U V q) := by
 rw [cube_state_pairM9E2,fib_pair_firstM9E2,fib_pair_secondM9E2]
 cases r <;> simp only [threePolyM9E2,threeCubicM9E2,threeOutputM9E2,cubeVecM9E2,
   Bool.false_eq_true,if_false,if_true,S] <;> ring

def cubeFirstM9E2 {R : Type*} [CommRing R] (v : R) (z : FourM9E2 R) : FourM9E2 R :=
 (3*v^2*z.1+6*v*z.2.1+3*z.2.2.1,
  v^2*z.1+4*v*z.2.1+3*z.2.2.1,2*v*z.2.1+3*z.2.2.1,3*z.2.2.1)
def cubeSecondStepM9E2 {R : Type*} [CommRing R] (v : R) (z : FourM9E2 R) : FourM9E2 R :=
 (3*v*z.1+3*z.2.1,2*v*z.1+3*z.2.1,v*z.1+3*z.2.1,3*z.2.1)
def cubeThirdM9E2 {R : Type*} [CommRing R] (z : FourM9E2 R) : FourM9E2 R :=
 (z.1,z.1,z.1,z.1)

theorem cube_step_splitM9E2 {R : Type*} [CommRing R] (u v : R) (z : FourM9E2 R) :
 cubeStepM9E2 u v z=cubeStepM9E2 0 v z+u • cubeFirstM9E2 v z+
   u^2 • cubeSecondStepM9E2 v z+u^3 • cubeThirdM9E2 z := by
 rcases z with ⟨z0,z1,z2,z3⟩
 simp only [cubeStepM9E2,cubeFirstM9E2,cubeSecondStepM9E2,cubeThirdM9E2,
   Prod.smul_mk,Prod.mk_add_mk,smul_eq_mul]
 apply Prod.ext
 · ring
 apply Prod.ext
 · ring
 apply Prod.ext <;> ring

theorem source_three_transferM9E2 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1≤q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
   (frame path).mid.p=threeOutputM9E2 U V r (cubeStateM9E2 U V q) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_cubicM9E2 path ha
 exact ⟨q,r,hq,hb,hp.trans (three_positive_transferM9E2 q r)⟩

end
end MathGKM.Markov
