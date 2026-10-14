import MarkovRowNormalization77c2
/-! Machine-authored 77c26ca3. Universal source first-row ambient-binomial
inequality. It proves only j=1, and does not resolve Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem source_first_linear_row77 (path : List Bool)
 (hb : 3 ≤ (frame path).mid.b) (k : ℕ) :
 (coeff (frame path).mid.p ((frame path).mid.a+k) 1 : ℝ) =
 (linearRow77 ((frame path).mid.b-3)
   (3*(frame path).mid.a-1) ((frame path).mid.a+(frame path).mid.b-1)).coeff k := by
 let m := (frame path).mid
 have hi := frame_reduced path
 have he := congrArg (fun p : Polynomial ℤ => p.map (Int.castRingHom ℝ))
   (horizontal_one_formula46 path hb)
 have hA : 1 ≤ 3*m.a := by dsimp [m]; omega
 have hB : 1 ≤ m.a+m.b := by dsimp [m]; omega
 have hf : ((Bivariate.swap m.p).coeff 1).map (Int.castRingHom ℝ) =
   X^m.a*linearRow77 (m.b-3) (3*m.a-1) (m.a+m.b-1) := by
   dsimp [m] at hA hB ⊢
   rw [he]
   simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
     Polynomial.map_X,Polynomial.map_natCast,Polynomial.map_one]
   simp only [linearRow77,Nat.cast_sub hA,Nat.cast_sub hB,Nat.cast_add,
     Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,map_sub,map_add,map_mul,
     map_natCast,map_ofNat,map_one]
   ring
 have hh := congrArg (fun p : ℝ[X] => p.coeff (k+m.a)) hf
 rw [Polynomial.coeff_X_pow_mul] at hh
 simpa [Polynomial.coeff_map,swap_coeff46,Nat.add_comm,m] using hh

theorem source_first_ambient_normalized77 (path : List Bool)
 (hb : 3 ≤ (frame path).mid.b) (k : ℕ) (hk : k+3 ≤ (frame path).mid.b-1) :
 ((coeff (frame path).mid.p ((frame path).mid.a+k) 1 : ℝ) /
   (((frame path).mid.b-1).choose (k+1) : ℝ))*
 ((coeff (frame path).mid.p ((frame path).mid.a+(k+2)) 1 : ℝ) /
   (((frame path).mid.b-1).choose (k+3) : ℝ)) ≤
 ((coeff (frame path).mid.p ((frame path).mid.a+(k+1)) 1 : ℝ) /
   (((frame path).mid.b-1).choose (k+2) : ℝ))^2 := by
 rw [source_first_linear_row77 path hb k,source_first_linear_row77 path hb (k+2),
   source_first_linear_row77 path hb (k+1)]
 have hi := frame_reduced path
 have hA : (0:ℝ) ≤ 3*(frame path).mid.a-1 := by
   have hh : (1:ℝ) ≤ (frame path).mid.a := by exact_mod_cast hi.1
   linarith
 have hB : (0:ℝ) ≤ (frame path).mid.a+(frame path).mid.b-1 := by
   have hh : (1:ℝ) ≤ (frame path).mid.a := by exact_mod_cast hi.1
   have hh2 : (0:ℝ) ≤ (frame path).mid.b := by positivity
   linarith
 have h := linear_row_normalized_lc77 ((frame path).mid.b-3) k (by omega)
   (3*(frame path).mid.a-1) ((frame path).mid.a+(frame path).mid.b-1) hA hB
 simpa only [show (frame path).mid.b-3+2=(frame path).mid.b-1 by omega] using h

#print axioms source_first_linear_row77
#print axioms source_first_ambient_normalized77
end
end MathGKM.Markov
