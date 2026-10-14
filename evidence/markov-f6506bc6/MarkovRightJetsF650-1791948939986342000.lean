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
    simp only [S,U,V,map_add,map_mul,map_one,map_ofNat]; ring
  rw [right_rec650,he]
  simp only [add_mul,U,V,pow_two,mul_assoc,Polynomial.coeff_sub,Polynomial.coeff_add,
    Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,Polynomial.coeff_X_pow_mul,
    Polynomial.mul_coeff_zero,Polynomial.coeff_X_zero,Polynomial.coeff_C_zero]
  norm_num
  constructor <;> ring

def rightCalc650 : ℕ → Polynomial ℤ × Polynomial ℤ × Polynomial ℤ
  | 0 => (X^2,2*X+1,1)
  | 1 => (X^3*(X+1),4*X^2*(X+1),1+5*X+6*X^2)
  | n+2 =>
    let a := rightCalc650 (n+1)
    let b := rightCalc650 n
    (X*(X+1)*a.1, X*(X+1)*a.2.1+(2*X+1)*a.1-X*b.1,
      X*(X+1)*a.2.2+(2*X+1)*a.2.1+a.1-X*b.2.1)

theorem right_calc650 (n : ℕ) :
    (rightP650 n).coeff 0=(rightCalc650 n).1 ∧
    (rightP650 n).coeff 1=(rightCalc650 n).2.1 ∧
    (rightP650 n).coeff 2=(rightCalc650 n).2.2 := by
  induction n using Nat.twoStepInduction with
  | zero =>
    have hp : rightP650 0=C (X^2)+C (2*X+1)*X+X^2 := by
      simp only [rightP650,frame,List.replicate_zero,List.foldl_nil,initial,S,U,V]
      simp only [map_add,map_mul,map_one,map_ofNat]; ring
    rw [hp]
    norm_num [rightCalc650,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul]
  | one =>
    have hp : rightP650 1=C (X^3+X^4)+C (4*X^2+4*X^3)*X+
        C (1+5*X+6*X^2)*X^2+C (2+4*X)*X^3+X^4 := by
      norm_num [rightP650,frame,initial,advance,S,U,V]
      simp only [map_add,map_mul,map_pow,map_one,map_ofNat]; ring
    rw [hp]
    norm_num [rightCalc650,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul]
    constructor <;> ring
  | more n h0 h1 =>
    obtain ⟨r0,r1,r2⟩ := right_jet_rec650 n
    rw [r0,r1,r2,h0.1,h0.2.1,h1.1,h1.2.1,h1.2.2]
    exact ⟨rfl,rfl,rfl⟩

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
    unfold RightJets650
    rw [(right_calc650 4).1,(right_calc650 4).2.1,(right_calc650 4).2.2]
    norm_num [rightCalc650,rightR650]
    constructor
    · ring
    constructor <;> ring
  | one =>
    unfold RightJets650
    rw [(right_calc650 5).1,(right_calc650 5).2.1,(right_calc650 5).2.2]
    norm_num [rightCalc650,rightR650]
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
    · simp only [pow_add,pow_succ,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,map_add,map_mul,map_ofNat,map_one]
      ring
    · rw [mul_sub,mul_add,mul_add]
      rw [show 2*(X*(X+1)*(rightP650 (n+1+4)).coeff 2)=
        X*(X+1)*(2*(rightP650 (n+1+4)).coeff 2) by ring,h12]
      simp only [rightR650,pow_add,pow_succ,Nat.cast_add,Nat.cast_one,
        Nat.cast_ofNat,map_add,map_mul,map_sub,map_pow,map_ofNat,map_one]
      ring

#print axioms right_rec650
#print axioms right_jets650
end
end MathGKM.Markov
