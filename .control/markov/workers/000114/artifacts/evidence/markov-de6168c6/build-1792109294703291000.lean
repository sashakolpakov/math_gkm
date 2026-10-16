import MarkovVerticalRunJetsMDE6
import MarkovVerticalGeneralMomentMDE6
/-! Machine-authored de6168c6. Actual source bridge for the second vertical
block-moment candidate. The coefficient inequality for general runs is open. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem vbinary_momentsMDE6 (x a b q t u α β A B f g : ℝ) :
 boolMomentADB2 (fun p _ _ => if p then α else A) a b q t u=b*α+(a-b)*A ∧
 boolMomentADB2 (fun p r _ => 2*(if p then β else B)-(if p then α else A)^2+
   2*(if p then f else g)*(x*(if r then f else g))) a b q t u=
 b*(2*β-α^2)+(a-b)*(2*B-A^2)+
   2*x*(a*f^2+2*(a-b)*f*(g-f)+(a-2*b+q)*(g-f)^2) := by
 constructor <;> simp [boolMomentADB2,boolJetADB2] <;> ring

theorem vGeneral_DK_explicitMDE6 (x : ℝ) (n : ℕ) (rest : List Bool) :
 let a := (frame rest).mid.b
 let r := a-(frame rest).mid.a
 let s := 2*r-a
 let α := vAlphaMDE6 x n
 let A := vAlphaMDE6 x (n+1)
 let β := vBetaMDE6 x n
 let B := vBetaMDE6 x (n+1)
 let f := vFMDE6 x n
 let g := vFMDE6 x (n+1)
 vGeneralDMDE6 x n rest=((a:ℝ)-r)*α+r*A ∧
 vGeneralKMDE6 x n rest=((a:ℝ)-r)*(2*β-α^2)+r*(2*B-A^2)+
   2*x*(a*f^2+2*r*f*(g-f)+s*(g-f)^2) := by
 dsimp only
 let a := (frame rest).mid.b
 let b := (frame rest).mid.a
 let r := a-b
 let q := 2*b-a
 have hd (p : Bool) := (vGeneral_jetsMDE6 x n p).1
 have he (p : Bool) := (vGeneral_jetsMDE6 x n p).2.1
 have hc (p : Bool) := (vGeneral_jetsMDE6 x n p).2.2.1
 have hb (p : Bool) := (vGeneral_jetsMDE6 x n p).2.2.2
 simp only [vGeneralDMDE6,vGeneralKMDE6,hsourceMomentM13D,
   hlocalKM13D,hsingleKM13D,hd,he,hc,hb]
 have h := vbinary_momentsMDE6 x a b q
   (min (a-b) (3*b-a):ℕ) (3*b-2*a:ℕ)
   (vAlphaMDE6 x n) (vBetaMDE6 x n) (vAlphaMDE6 x (n+1))
   (vBetaMDE6 x (n+1)) (vFMDE6 x n) (vFMDE6 x (n+1))
 have hab : b ≤ a := Nat.le_of_lt (frame_reduced rest).2.1
 have er : (a:ℝ)-b=(r:ℝ) := by dsimp [r]; rw [Nat.cast_sub hab]
 have esNat : (2*r-a)+2*b=a+q := by dsimp [r,q]; omega
 have esR : ((2*r-a:ℕ):ℝ)+2*b=(a:ℝ)+q := by exact_mod_cast esNat
 have es : (a:ℝ)-2*b+q=((2*r-a:ℕ):ℝ) := by linarith
 have eb : (b:ℝ)=(a:ℝ)-r := by linarith
 rw [er,es] at h
 rw [eb] at h
 exact h

def vSecondMomentMDE6 (x : ℝ) (n a r s : ℕ) : ℝ :=
 let α := vAlphaMDE6 x n
 let A := vAlphaMDE6 x (n+1)
 let β := vBetaMDE6 x n
 let B := vBetaMDE6 x (n+1)
 let f := vFMDE6 x n
 let δ := 2/x^(n+2)
 let D := ((a:ℝ)-r)*α+r*A
 let K := ((a:ℝ)-r)*(2*β-α^2)+r*(2*B-A^2)+
   2*x*(a*f^2+2*r*f*δ+s*δ^2)
 D^2+K-2*(x+1)*D+2*(x+1)^2

theorem vertical_second_candidate_bridgeMDE6 (n : ℕ) (rest : List Bool)
 (ha : 4 ≤ (frame rest).mid.b) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 let r := (frame rest).mid.b-(frame rest).mid.a
 let s := 2*r-a
 2*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2)=
 x^(frame path).mid.b*vSecondMomentMDE6 x n a r s := by
 dsimp only
 have h := vertical_second_general_momentMDE6 n rest ha x hx
 dsimp only at h
 obtain ⟨hd,hk⟩ := vGeneral_DK_explicitMDE6 x n rest
 dsimp only at hd hk
 rw [hd,hk,vF_stepMDE6 x hx] at h
 rw [(source_vertical_indicesMDE6 n rest).1]
 exact h

end
end MathGKM.Markov
