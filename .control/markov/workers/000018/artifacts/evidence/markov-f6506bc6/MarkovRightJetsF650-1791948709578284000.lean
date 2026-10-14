import MarkovSourceReduction3af
import MarkovSecondJet8934

/-! Machine-authored request f6506bc6. Exact right-spine jets.
All coefficients are raw; no log-concavity assumption occurs. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def rightP650 (n : ℕ) : BiPoly := (frame (List.replicate n true)).mid.p

theorem right_hi650 (n : ℕ) : (frame (List.replicate n true)).hi=initial.hi := by
  induction n with
  | zero => rfl
  | succ n ih => rw [List.replicate_succ',frame_append18]; simpa [advance] using ih

theorem right_labels650 (n : ℕ) :
    (frame (List.replicate n true)).mid.a=n+1 ∧
    (frame (List.replicate n true)).mid.b=n+2 := by
  induction n with
  | zero => simp [frame,initial]
  | succ n ih =>
    rw [List.replicate_succ',frame_append18]
    simp [advance,right_hi650,initial,ih.1,ih.2]
    omega

theorem right_rec650 (n : ℕ) :
    rightP650 (n+2)=S*(U+V)*rightP650 (n+1)-U*V*rightP650 n := by
  unfold rightP650
  rw [show n+2=(n+1)+1 by omega,List.replicate_succ',frame_append18]
  simp only [advance,if_true,right_hi650,initial,pow_one]
  rw [List.replicate_succ',frame_append18]
  rfl

theorem right_jet_rec650 (n : ℕ) :
    (rightP650 (n+2)).coeff 0=(X*(X+1))*(rightP650 (n+1)).coeff 0 ∧
    (rightP650 (n+2)).coeff 1=(X*(X+1))*(rightP650 (n+1)).coeff 1+
      (2*X+1)*(rightP650 (n+1)).coeff 0-X*(rightP650 n).coeff 0 ∧
    (rightP650 (n+2)).coeff 2=(X*(X+1))*(rightP650 (n+1)).coeff 2+
      (2*X+1)*(rightP650 (n+1)).coeff 1+(rightP650 (n+1)).coeff 0-
      X*(rightP650 n).coeff 1 := by
  have he : S*(U+V)=U^2+C (2*X+1)*U+C (X*(X+1)) := by
    simp [S,U,V]; ring
  rw [right_rec650,he]
  simp [add_mul,sub_mul,U,V,Polynomial.coeff_X_pow_mul,
    Polynomial.coeff_C_mul,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul]
  constructor
  · ring
  constructor <;> ring

def rightR650 (a : ℤ) : Polynomial ℤ :=
  16+C (32*a-16)*X+C (9*a^2+29*a-26)*X^2+
    C (12*a^2+2*a-6)*X^3+C (4*a^2-2*a)*X^4

def RightJets650 (n : ℕ) : Prop :=
  (rightP650 (n+4)).coeff 0=X^(n+6)*(X+1)^(n+4) ∧
  (rightP650 (n+4)).coeff 1=X^(n+5)*(X+1)^(n+2)*
    (4+C (3*(n:ℤ)+17)*X+C (2*(n:ℤ)+10)*X^2) ∧
  2*(rightP650 (n+4)).coeff 2=X^(n+4)*(X+1)^n*rightR650 (n+5)

theorem right_jets650 (n : ℕ) : RightJets650 n := by
  induction n using Nat.twoStepInduction with
  | zero =>
    norm_num [RightJets650,rightP650,frame,initial,advance,List.replicate_succ,
      S,U,V,rightR650]
    simp only [map_add,map_mul,map_pow,map_ofNat]
    constructor
    · ring
    constructor <;> ring
  | one =>
    norm_num [RightJets650,rightP650,frame,initial,advance,List.replicate_succ,
      S,U,V,rightR650]
    simp only [map_add,map_mul,map_pow,map_ofNat]
    constructor
    · ring
    constructor <;> ring
  | more n h0 h1 =>
    obtain ⟨h00,h01,h02⟩ := h0
    obtain ⟨h10,h11,h12⟩ := h1
    obtain ⟨r0,r1,r2⟩ := right_jet_rec650 (n+4)
    unfold RightJets650
    rw [show n+2+4=n+4+2 by omega,r0,r1,r2]
    rw [show n+4+1=n+1+4 by omega,h10,h11,h00,h01]
    constructor
    · simp only [pow_add,pow_succ]; ring
    constructor
    · simp only [pow_add,pow_succ,Nat.cast_add,Nat.cast_one,map_add,map_mul,map_ofNat]
      ring
    · rw [mul_sub,mul_add,mul_add]
      rw [show 2*(X*(X+1)*(rightP650 (n+1+4)).coeff 2)=
        X*(X+1)*(2*(rightP650 (n+1+4)).coeff 2) by ring,h12]
      simp only [rightR650,pow_add,pow_succ,Nat.cast_add,Nat.cast_one,
        map_add,map_mul,map_sub,map_pow,map_ofNat]
      ring

#print axioms right_rec650
#print axioms right_jets650
end
end MathGKM.Markov
