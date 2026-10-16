import MathGKM.Markov
/-! Machine-authored 9e205206. Symmetric-cube recurrence over any commutative
ring. It is an identity, not an inequality or an external theorem assumption. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def cubicOrbitM9E2 {R : Type*} [CommRing R] (f : ℕ → R)
 (c0 c1 c2 c3 : R) (n : ℕ) : R :=
 c0*f (n+1)^3+c1*f (n+1)^2*f n+c2*f (n+1)*f n^2+c3*f n^3

def cubeTraceM9E2 {R : Type*} [CommRing R] (s v : R) : R := s^3-2*v*s
def cubeSecondM9E2 {R : Type*} [CommRing R] (s v : R) : R :=
 v*s^4-3*v^2*s^2+2*v^3

theorem cubic_orbit_recM9E2 {R : Type*} [CommRing R]
 (f : ℕ → R) (s v c0 c1 c2 c3 : R)
 (h : ∀ n, f (n+2)=s*f (n+1)-v*f n) (n : ℕ) :
 cubicOrbitM9E2 f c0 c1 c2 c3 (n+4)=
 cubeTraceM9E2 s v*cubicOrbitM9E2 f c0 c1 c2 c3 (n+3)-
 cubeSecondM9E2 s v*cubicOrbitM9E2 f c0 c1 c2 c3 (n+2)+
 v^3*cubeTraceM9E2 s v*cubicOrbitM9E2 f c0 c1 c2 c3 (n+1)-
 v^6*cubicOrbitM9E2 f c0 c1 c2 c3 n := by
 have h3 : f (n+3)=s*f (n+2)-v*f (n+1) := by simpa [Nat.add_assoc] using h (n+1)
 have h4 : f (n+4)=s*f (n+3)-v*f (n+2) := by simpa [Nat.add_assoc] using h (n+2)
 have h5 : f (n+5)=s*f (n+4)-v*f (n+3) := by simpa [Nat.add_assoc] using h (n+3)
 simp only [cubicOrbitM9E2,Nat.add_assoc]
 rw [h5,h4,h3,h n]
 unfold cubeTraceM9E2 cubeSecondM9E2
 ring

theorem cube_denominator_factorM9E2 {R : Type*} [CommRing R] (s v t : R) :
 1-cubeTraceM9E2 s v*t+cubeSecondM9E2 s v*t^2-
   v^3*cubeTraceM9E2 s v*t^3+v^6*t^4=
 (1-v*s*t+v^3*t^2)*(1-(s^3-3*v*s)*t+v^3*t^2) := by
 unfold cubeTraceM9E2 cubeSecondM9E2
 ring

end
end MathGKM.Markov
