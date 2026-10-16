import MarkovSourceLinearM553
/-! Machine-authored 55306a3b. Exact raw values of the linear source certificate. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
attribute [local irreducible] frame coeff

theorem integer_linearMoment_tripleM553 (P : ℤ[X]) (n k : ℕ) (C : ℝ) :
 linearMomentM553 (P.map (Int.castRingHom ℝ)) n k C=tripleLinearM553 (n+2)
   ((((1+X)^n*P):ℤ[X]).coeff k) ((((1+X)^n*P):ℤ[X]).coeff (k+1))
   ((((1+X)^n*P):ℤ[X]).coeff (k+2)) C := by
 have h := linearMoment_tripleM553 (P.map (Int.castRingHom ℝ)) n k C
 have he : (1+(X:ℝ[X]))^n*P.map (Int.castRingHom ℝ)=
   (((1+X)^n*P):ℤ[X]).map (Int.castRingHom ℝ) := by simp
 rw [he] at h
 rw [show (k:ℤ)+2=((k+2:ℕ):ℤ) by omega,
   show (k:ℤ)+1=((k+1:ℕ):ℤ) by omega] at h
 have hc (Q : ℝ[X]) (t : ℕ) : CoeffSeq Q (t:ℤ)=Q.coeff t := by
   simp only [CoeffSeq,not_lt.mpr (Int.natCast_nonneg t),if_false,Int.toNat_natCast]
 simpa only [hc,Polynomial.coeff_map] using h

theorem source_horizontal_linear_valueM553 (path : List Bool) (i j : ℕ) (C : ℝ)
 (hb : 2*j+1≤(frame path).mid.b) :
 linearMomentM553
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).map (Int.castRingHom ℝ))
   ((frame path).mid.b-2*j-1) i C=
 tripleLinearM553 ((frame path).mid.b-2*j-1+2:ℕ)
   (coeff (frame path).mid.p i j) (coeff (frame path).mid.p (i+1) j)
   (coeff (frame path).mid.p (i+2) j) C := by
 have h := integer_linearMoment_tripleM553
   (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j)
   ((frame path).mid.b-2*j-1) i C
 rw [←horizontal_all_order_factorM511 path j hb] at h
 simpa only [swap_coeff46,Nat.cast_add,Nat.cast_ofNat] using h

end
end MathGKM.Markov
