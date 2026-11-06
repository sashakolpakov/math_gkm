import MathGKM.Round64ProjectionA
import MathGKM.Acceptedd5eee9c4567a9bc2d46f3ad0
/- Machine-authored round82. Fresh deletion proof; no round81 fiber imports. -/
namespace AlphaZeroR82
open Polynomial MatchingProjectionR64
noncomputable section
set_option maxHeartbeats 2000000
abbrev Three := Polynomial (Polynomial (Polynomial ℤ))
def u : Three := X
def v : Three := C X
def z : Three := C (C X)
def dropAlpha : Four →+* Three :=
  Polynomial.mapRingHom (Polynomial.mapRingHom (Polynomial.evalRingHom (0 : Polynomial ℤ)))
def G (n : ℕ) : Three := dropAlpha (F n 1)
theorem Gzero : G 0=1 := by
  simp [G,F,FiniteMatchingR61.boundaries]
theorem Gone : G 1=u+v := by
  simp [G,F,FiniteMatchingR61.boundaries,dropAlpha,fu,fv,u,v]
theorem Gstep (n : ℕ) :
    G (n+2)=(u+v)*G (n+1)+(if n%2=0 then z*v else 0)*G n := by
  unfold G F
  rw [Acceptedd5eee9c4567a9bc2d46f3ad0.obligation]
  simp only [map_add,map_mul]
  congr 1
  · congr 1
    simp [dropAlpha,fu,fv,u,v]
  · congr 1
    rcases Nat.mod_two_eq_zero_or_one n with h|h
    · have hn : (n+1)%2=1 := by omega
      simp [coloredEdge,hn,h,dropAlpha,beta,fv,z,v]
    · have hn : (n+1)%2=0 := by omega
      simp [coloredEdge,hn,h,dropAlpha,alpha,fu]
theorem even_odd (n : ℕ) :
    G (2*n)=((u+v)^2+z*v)^n ∧
    G (2*n+1)=(u+v)*((u+v)^2+z*v)^n := by
  induction n with
  | zero => simp [Gzero,Gone]
  | succ n ih =>
    have he := Gstep (2*n)
    have ho := Gstep (2*n+1)
    have hn : (2*n)%2=0 := by omega
    have hn1 : (2*n+1)%2=1 := by omega
    rw [if_pos hn,ih.1,ih.2] at he
    rw [if_neg (by omega : ¬(2*n+1)%2=0),zero_mul,add_zero] at ho
    constructor
    · rw [show 2*(n+1)=2*n+2 by omega,he,pow_succ]
      ring
    · rw [show 2*(n+1)+1=(2*n+1)+2 by omega,ho]
      rw [show 2*n+1+1=2*n+2 by omega,he,pow_succ]
      ring
theorem specialization (n : ℕ) :
    dropAlpha (F (2*n) 1)=((u+v)^2+z*v)^n := (even_odd n).1
end
end AlphaZeroR82
#print axioms AlphaZeroR82.specialization
