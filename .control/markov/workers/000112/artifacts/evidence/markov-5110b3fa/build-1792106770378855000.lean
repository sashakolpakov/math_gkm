import MarkovHorizontalPositiveM511
import MarkovHorizontalAllOrderM511
/-! Machine-authored request 5110b3fa. Every coefficient of the uniform
horizontal residual is nonnegative. This does not prove its log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false

theorem poly_pow_nonnegM511 (p : BiPoly) (hp : PolyNonneg16 p) (n : ℕ) :
 PolyNonneg16 (p^n) := by
 induction n with
 | zero => simpa using poly_one_nonneg16
 | succ n ih => simpa [pow_succ] using poly_mul_nonneg16 ih hp

theorem poly_nat_nonnegM511 (n : ℕ) : PolyNonneg16 (n:BiPoly) := by
 induction n with
 | zero => intro i j; simp [coeff]
 | succ n ih => simpa only [Nat.cast_add,Nat.cast_one] using poly_add_nonneg16 ih poly_one_nonneg16

theorem hKletter_nonnegM511 (r : Bool) : MatNonneg16 (hKletterM511 (X:ℤ[X]) r) := by
 have hu := poly_U_nonneg16
 have hv := poly_V_nonneg16
 cases r
 · change MatNonneg16 ⟨U,U,V*U,1+V*U⟩
   exact ⟨hu,hu,poly_mul_nonneg16 hv hu,poly_add_nonneg16 poly_one_nonneg16 (poly_mul_nonneg16 hv hu)⟩
 · simp only [hKletterM511,if_true,map_add,map_mul,map_pow,map_one,map_ofNat,MatNonneg16]
   change PolyNonneg16 (U+(V+1)^2*U^2) ∧
     PolyNonneg16 ((V+2)*U+(V+1)^2*U^2) ∧
     PolyNonneg16 (V*(V+2)*U+V*(V+1)^2*U^2) ∧
     PolyNonneg16 (V+V*(2*V+3)*U+V*(V+1)^2*U^2)
   refine ⟨?_,?_,?_,?_⟩
   all_goals repeat' first
   | exact hu
   | exact hv
   | exact poly_one_nonneg16
   | exact poly_nat_nonnegM511 _
   | apply poly_add_nonneg16
   | apply poly_mul_nonneg16
   | apply poly_pow_nonnegM511

theorem hKword_nonnegM511 (w : List Bool) : MatNonneg16 (hKwordM511 (X:ℤ[X]) w) := by
 induction w with
 | nil =>
   change PolyNonneg16 1 ∧ PolyNonneg16 0 ∧ PolyNonneg16 0 ∧ PolyNonneg16 1
   exact ⟨poly_one_nonneg16,poly_nat_nonnegM511 0,poly_nat_nonnegM511 0,poly_one_nonneg16⟩
 | cons r rs ih => exact mat_mul_nonneg16 (hKletter_nonnegM511 r) ih

theorem hdiff_source_nonnegM511 (path : List Bool) :
 PolyNonneg16 (hdiffM511 (hKwordM511 (X:ℤ[X]) (sourceWord28 path))) := by
 rw [sourceWord_central28]
 have he : false::(central28 path++[true])=(false::central28 path)++[true] := rfl
 rw [he,hKwordM511,List.map_append,projProduct_append6905]
 simp only [List.map_cons,List.map_nil,projProduct_single6905]
 rw [hdiff_lastM511]
 obtain ⟨ha,hb,hc,hd⟩ := hKword_nonnegM511 (false::central28 path)
 change PolyNonneg16
   (((hKwordM511 (X:ℤ[X]) (false::central28 path)).a+
      (hKwordM511 (X:ℤ[X]) (false::central28 path)).c)*C (X+1)*X+
    ((hKwordM511 (X:ℤ[X]) (false::central28 path)).b+
      (hKwordM511 (X:ℤ[X]) (false::central28 path)).d)*C X*(1+C (X+1)*X))
 have hh : PolyNonneg16 (C (X+1)) := by
   simpa only [map_add,map_one] using poly_add_nonneg16 poly_V_nonneg16 poly_one_nonneg16
 exact poly_add_nonneg16
   (poly_mul_nonneg16 (poly_mul_nonneg16 (poly_add_nonneg16 ha hc) hh) poly_U_nonneg16)
   (poly_mul_nonneg16 (poly_mul_nonneg16 (poly_add_nonneg16 hb hd) poly_V_nonneg16)
     (poly_add_nonneg16 poly_one_nonneg16 (poly_mul_nonneg16 hh poly_U_nonneg16)))

theorem hresidual_coeff_nonnegM511 (path : List Bool) (j i : ℕ) :
 0 ≤ (hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).coeff i := by
 rw [hresidual_diffM511]
 exact hdiff_source_nonnegM511 path j i

theorem horizontal_positive_factorM511 (path : List Bool) (j : ℕ)
 (hb : 2*j+1 ≤ (frame path).mid.b) :
 ∃ Q : ℤ[X], (∀ i, 0 ≤ Q.coeff i) ∧
 (Bivariate.swap (frame path).mid.p).coeff j=(1+X)^((frame path).mid.b-2*j-1)*Q := by
 exact ⟨hresidualM511 X (sourceWord28 path) j,hresidual_coeff_nonnegM511 path j,
   horizontal_all_order_factorM511 path j hb⟩

end
end MathGKM.Markov
