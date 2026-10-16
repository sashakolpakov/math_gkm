import MarkovThirdAdjacent21MF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird21rawMF8 (n j : ℕ) :
 let path := List.replicate n false++[true]
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++[true]
 have hc (k : ℕ) : 720*coeff (frame path).mid.p 3 k=sThird21EMF8 (n+1) ((k:ℤ)+(n+3)) := by
   have h := sThird21coeffMF8 (6*X^(n+3)*((frame path).mid.p).coeff 3) 0 (n+1) (k+(n+3))
     (by simpa only [pow_zero,one_mul,Nat.cast_add,Nat.cast_one] using sThird21sourceMF8 n)
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Nat.cast_zero,sub_zero,mul_assoc] at h
   simp only [show (6:ℤ[X])=C (6:ℤ) from rfl,Polynomial.coeff_C_mul] at h
   rw [Polynomial.coeff_X_pow_mul] at h
   change 120*(6*coeff (frame path).mid.p 3 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : sThird21EMF8 (n+1) ((j:ℤ)+(n+3))*sThird21EMF8 (n+1) (j+2+(n+3)) ≤ sThird21EMF8 (n+1) (j+1+(n+3))^2 := by
   simpa only [show (j:ℤ)+1+(n+3)-1=j+(n+3) by ring,
     show (j:ℤ)+1+(n+3)+1=j+2+(n+3) by ring] using sThird21adjacentMF8 (n+1) (j+1+(n+3)) (by omega)
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]
end
end MathGKM.Markov
