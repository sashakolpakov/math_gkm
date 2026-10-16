import MarkovVertexStatMAA6
import MarkovSourceCount68a4
/-! Machine-authored aa6c518b. Literal raw vertex-column coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem second_low_coeffMAA6 (n m s : ℕ) :
 (secondExpr8934 (X:ℤ[X]) n m s).coeff 0=4*(s:ℤ) ∧
 (secondExpr8934 (X:ℤ[X]) n m s).coeff 1=9*(m:ℤ)^2+13*m+6 := by
 have he : secondExpr8934 (X:ℤ[X]) n m s=
   C (4*(s:ℤ))+C (9*(m:ℤ)^2+13*m+6)*X+
   C (6*(m:ℤ)^2+6*m*n+8*m+6*n+6)*X^2+
   C (((m:ℤ)+n+2)*(m+n+1))*X^3 := by
   simp only [secondExpr8934,map_add,map_mul,map_pow,map_natCast,map_ofNat,map_one]
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_X,Polynomial.coeff_C]
 norm_num

theorem source_vertex_zeroMAA6 (path : List Bool) :
 coeff (frame path).mid.p (frame path).mid.a 0=1 := by
 simpa using source_boundary_choose68 path 0

theorem source_vertex_oneMAA6 (path : List Bool) (hb : 3≤(frame path).mid.b) :
 coeff (frame path).mid.p (frame path).mid.a 1=3*((frame path).mid.a:ℤ)-1 := by
 have h := congrArg (fun p : ℤ[X] => p.coeff (0+(frame path).mid.a))
   (horizontal_one_formula46 path hb)
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,swap_coeff46] at h
 have ha := (frame_reduced path).1
 simpa [Polynomial.coeff_zero_eq_eval_zero,Nat.cast_sub (show 1≤3*(frame path).mid.a by omega)] using h

theorem source_vertex_twoMAA6 (path : List Bool) (hb : 5≤(frame path).mid.b) :
 2*coeff (frame path).mid.p (frame path).mid.a 2=
 8*((2*(frame path).mid.a-(frame path).mid.b:ℕ):ℤ)*((frame path).mid.b-5:ℤ)+
 9*((frame path).mid.a:ℤ)^2-5*(frame path).mid.a+2 := by
 obtain ⟨n,m,s,hn,hm,hn3,hs,he⟩ := source_second_exactMAA6 path hb
 have h := congrArg (fun p : ℤ[X] => p.coeff (1+m)) he
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,swap_coeff46] at h
 rw [coeff_mul_one46] at h
 obtain ⟨h0,h1⟩ := second_low_coeffMAA6 n m s
 rw [h0,h1,Polynomial.coeff_X_add_one_pow,Polynomial.coeff_X_add_one_pow] at h
 simp only [Nat.choose_zero_right,Nat.choose_one_right,Nat.cast_one,one_mul] at h
 rw [show 1+m=(frame path).mid.a by omega] at h
 have hnc : (n:ℤ)+2=(frame path).mid.b := by exact_mod_cast hn
 have hmc : (m:ℤ)+1=(frame path).mid.a := by exact_mod_cast hm
 have hsc : (s:ℤ)=2*((2*(frame path).mid.a-(frame path).mid.b:ℕ):ℤ) := by exact_mod_cast hs
 rw [Nat.cast_sub hn3] at h
 norm_num at h
 nlinarith [h]
end
end MathGKM.Markov
