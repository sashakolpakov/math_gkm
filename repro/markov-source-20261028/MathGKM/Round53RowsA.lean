import MathGKM.Round53ExtensionA
import MathGKM.Round52RowA

/-! Machine-authored round53. Extraction retains both natural-subtraction guards.
These are polynomial identities, with no factor-cone closure assertion. -/
namespace HorizontalR53
noncomputable section
open MathGKM.Markov Polynomial RealRowR52

theorem row_add (P Q : BiPoly) (j : ℕ) : row (P+Q) j=row P j+row Q j := by
  ext i
  simp [row_coeff,MathGKM.Markov.coeff]

theorem row_sub (P Q : BiPoly) (j : ℕ) : row (P-Q) j=row P j-row Q j := by
  ext i
  simp [row_coeff,MathGKM.Markov.coeff]

theorem row_shift (P : BiPoly) (a b j : ℕ) :
    row (U^a*V^b*P) j=if b≤j then X^a*row P (j-b) else 0 := by
  ext i
  rw [row_coeff,RightR30.coeff_shift]
  by_cases hb : b≤j
  · simp only [hb,ite_true,Polynomial.coeff_X_pow_mul']
    by_cases ha : a ≤ i <;> simp [RightR30.shift,ha,hb,row_coeff]
  · simp [RightR30.shift,hb]

theorem row_A (P : BiPoly) (j : ℕ) :
    row (A*P) j=(X^2+X)*row P j+
      (if 1≤j then (2*X+1)*row P (j-1) else 0)+
      (if 2≤j then row P (j-2) else 0) := by
  have he : A*P=U^2*V^0*P+U^1*V^0*P+
      (U^1*V^1*P+U^1*V^1*P)+U^0*V^1*P+U^0*V^2*P := by
    dsimp [A,RightR30.T]
    ring
  rw [he]
  simp only [row_add]
  rw [row_shift P 2 0 j,row_shift P 1 0 j,row_shift P 1 1 j,
    row_shift P 0 1 j,row_shift P 0 2 j]
  simp only [Nat.zero_le,ite_true,pow_zero,pow_one,one_mul,
    Nat.sub_zero]
  split_ifs <;> ring

theorem row_recurrence (n j : ℕ) :
    row (R (n+2)) j=(X^2+X)*row (R (n+1)) j+
      (if 1≤j then (2*X+1)*row (R (n+1)) (j-1) else 0)+
      (if 2≤j then row (R (n+1)) (j-2) else 0)-
      (if 1≤j then X*row (R n) (j-1) else 0) := by
  rw [R_recurrence,row_sub,row_A]
  have he : U*V*R n=U^1*V^1*R n := by simp
  rw [he,row_shift]
  simp

theorem realRow_recurrence (n j : ℕ) :
    realRow (R (n+2)) j=(X^2+X)*realRow (R (n+1)) j+
      (if 1≤j then (2*X+1)*realRow (R (n+1)) (j-1) else 0)+
      (if 2≤j then realRow (R (n+1)) (j-2) else 0)-
      (if 1≤j then X*realRow (R n) (j-1) else 0) := by
  unfold realRow
  rw [row_recurrence]
  simp only [Polynomial.map_sub,Polynomial.map_add,Polynomial.map_mul,
    Polynomial.map_pow,Polynomial.map_X,map_ofNat,map_one]
  split_ifs <;> simp_all

theorem actual_row_recurrence (n j : ℕ) (hn : 1 ≤ n) :
    realRow (frame (List.replicate (n+1) true)).mid.p j=
      (X^2+X)*realRow (frame (List.replicate n true)).mid.p j+
      (if 1≤j then (2*X+1)*realRow (frame (List.replicate n true)).mid.p (j-1) else 0)+
      (if 2≤j then realRow (frame (List.replicate n true)).mid.p (j-2) else 0)-
      (if 1≤j then X*realRow (frame (List.replicate (n-1) true)).mid.p (j-1) else 0) := by
  have h := realRow_recurrence n j
  rw [R_actual n hn,R_actual (n+1) (by omega),R_actual (n+2) (by omega)] at h
  simpa using h

end
end HorizontalR53
#print axioms HorizontalR53.realRow_recurrence
