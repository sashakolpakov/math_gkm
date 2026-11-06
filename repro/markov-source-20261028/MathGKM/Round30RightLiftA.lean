import MathGKM.Round30RightCoefficientsA
import MathGKM.Accepted13c39de6e1dbb404698c5095
import MathGKM.Acceptedc0bb11f1c027b7231eedce49

/-! Machine-authored homogeneous substitution candidate, round30. -/
namespace RightLiftR30
open MathGKM.Markov
open RightR30
noncomputable section
set_option maxHeartbeats 1000000

abbrev Tri := Polynomial (Polynomial (Polynomial ℤ))
def H (P : BiPoly) (d : ℕ) : Tri := P.support.sum (fun i => Polynomial.monomial i
  ((P.coeff i).support.sum (fun j => Polynomial.monomial j
    (Polynomial.monomial (d-i-j) (coeff P i j)))))
def Uh : Tri := Polynomial.X
def Vh : Tri := Polynomial.C Polynomial.X
def W : Tri := Polynomial.C (Polynomial.C Polynomial.X)

theorem initial_lifts : H 1 0=1 ∧ H ((U+V)^2+U) 2=(Uh+Vh)^2+Uh*W ∧
    H (U+V) 1=Uh+Vh :=
  Accepted13c39de6e1dbb404698c5095.obligation.2.2.2.2.2.1

theorem left_hom_step (k : ℕ) :
    H (RenewalR28.P (k+3)) (k+3)=(Uh+Vh+W)*H (RenewalR28.P (k+2)) (k+2)-
      Vh*W*H (RenewalR28.P (k+1)) (k+1) := by
  have h := Accepted13c39de6e1dbb404698c5095.obligation.2.2.2.2.2.2
    (List.replicate k false) false
  have ep := RenewalR28.endpoint_frame k
  have en := RenewalR28.endpoint_frame (k+1)
  have lb := Acceptedc0bb11f1c027b7231eedce49.obligation k
  have step : advance (frame (List.replicate k false)) false=
      frame (List.replicate (k+1) false) := by
    simp [frame,List.replicate_succ',List.foldl_append]
  change H (advance (frame (List.replicate k false)) false).mid.p
      ((advance (frame (List.replicate k false)) false).mid.a+
        (advance (frame (List.replicate k false)) false).mid.b-1)=
      (Uh+Vh+W)*H (frame (List.replicate k false)).lo.p
        ((frame (List.replicate k false)).lo.a+(frame (List.replicate k false)).lo.b-1)*
        H (frame (List.replicate k false)).mid.p
        ((frame (List.replicate k false)).mid.a+(frame (List.replicate k false)).mid.b-1)-
      Uh^(frame (List.replicate k false)).lo.a*Vh^(frame (List.replicate k false)).lo.b*
        W^((frame (List.replicate k false)).lo.a+(frame (List.replicate k false)).lo.b)*
        H (frame (List.replicate k false)).hi.p
        ((frame (List.replicate k false)).hi.a+(frame (List.replicate k false)).hi.b-1) at h
  rw [step,ep.1,ep.2.1,ep.2.2.1,ep.2.2.2.1,ep.2.2.2.2,
    en.2.1,en.2.2.1,en.2.2.2.1,lb.2.2.2.1,lb.2.2.2.2.1] at h
  simpa only [Nat.one_add,Nat.add_sub_cancel,Nat.zero_add,Nat.sub_self,
    Nat.succ_sub_one,pow_zero,pow_one,one_mul,initial_lifts.1,mul_one,Nat.add_assoc] using h

theorem hom_recurrence (n : ℕ) :
    H (RenewalR28.P (n+2)) (n+2)=(Uh+Vh+W)*H (RenewalR28.P (n+1)) (n+1)-
      Vh*W*H (RenewalR28.P n) n := by
  cases n with
  | zero =>
    have hp : RenewalR28.P 2=(U+V)^2+U := by simp [RenewalR28.P,S]; ring
    rw [hp,RenewalR28.P_one,RenewalR28.P_zero,initial_lifts.1,
      initial_lifts.2.1,initial_lifts.2.2]
    ring
  | succ n => simpa only [Nat.add_assoc] using left_hom_step n

def ev : Tri →+* BiPoly := Polynomial.eval₂RingHom
  (Polynomial.eval₂RingHom (Polynomial.eval₂RingHom (Int.castRingHom BiPoly) V) U) (T^2)

theorem ev_Uh : ev Uh=T^2 := by simp [ev,Uh]
theorem ev_Vh : ev Vh=U := by simp [ev,Vh]
theorem ev_W : ev W=V := by simp [ev,W]

theorem hom_state (n : ℕ) : ev (H (RenewalR28.P n) n)=
    (RenewalR28.state (T^2) U V 1 0 n).1 := by
  induction n using Nat.twoStepInduction with
  | zero => simp [RenewalR28.P_zero,initial_lifts.1,RenewalR28.state_zero]
  | one => simp [RenewalR28.P_one,initial_lifts.2.2,map_add,ev_Uh,ev_Vh,
      RenewalR28.state_step,RenewalR28.state_zero]
  | more n ih0 ih1 =>
    rw [hom_recurrence]
    simp only [map_sub ev,map_mul ev,map_add ev,ev_Uh,ev_Vh,ev_W,ih0,ih1]
    rw [RenewalR28.state_recurrence]

theorem right_lift (k : ℕ) : M k=ev (H (RenewalR28.P (k+1)) (k+1)) := by
  rw [hom_state]
  have hs : RenewalR28.state (T^2) U V 1 0 (k+1)=
      RenewalR28.state (T^2) U V (T^2+U) (T^2) k := by
    unfold RenewalR28.state
    rw [Function.iterate_succ_apply]
    simp
  rw [hs]
  exact congrArg Prod.fst (right_state k)

end
end RightLiftR30
