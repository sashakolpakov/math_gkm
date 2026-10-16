import MarkovThirdAdjacent32MF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird32rawMF8 (n : ℕ) (hn : 0≤n) (rest : List Bool)
 (ha : (frame rest).mid.a=1) (hb : (frame rest).mid.b=3) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m : ℕ := 0
 have hc (k : ℕ) : 720*coeff (frame path).mid.p 3 k=sThird32EMF8 (n+1) ((k:ℤ)+1) := by
   have h := sThird32coeffMF8 (6*X^1*((frame path).mid.p).coeff 3) 0 (n+1) (k+1)
     (by simpa only [pow_zero,one_mul,one_mul,Nat.cast_add,Nat.cast_one] using sThird32sourceMF8 n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Nat.cast_zero,sub_zero,mul_assoc] at h
   simp only [show (6:ℤ[X])=C (6:ℤ) from rfl,Polynomial.coeff_C_mul] at h
   rw [Polynomial.coeff_X_pow_mul] at h
   change 120*(6*coeff (frame path).mid.p 3 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : sThird32EMF8 (n+1) ((j:ℤ)+1)*sThird32EMF8 (n+1) (j+2+1) ≤ sThird32EMF8 (n+1) (j+1+1)^2 := by
   simpa only [show (j:ℤ)+1+1-1=j+1 by ring,
     show (j:ℤ)+1+1+1=j+2+1 by ring] using sThird32adjacentMF8 (n+1) (j+1+1) (by omega)
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]
end
end MathGKM.Markov
