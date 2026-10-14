import MarkovTopBinomial58d2
import MarkovTopCertificate58d2
/-! Machine-authored 58d2f411. Literal source top-crossing coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem source_top_middle58 (path : List Bool) (i j : ℕ)
 (hd : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
 (coeff (frame path).mid.p (i+1) j : ℝ)=
 ((frame path).mid.b-1 : ℝ)*((i+j).choose i : ℝ)+
 ((frame path).mid.a-1 : ℝ)*((i+j).choose (i+1) : ℝ) := by
 have h := upper_slice_factor774 path 1 (by omega)
 rw [quotient_linear5a7] at h
 have he : (frame path).mid.a+(frame path).mid.b-1-2*1=i+j := by omega
 rw [he] at h
 have hc := congrArg (fun p : Polynomial ℤ => (p.map (Int.castRingHom ℝ)).coeff (i+1)) h
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
   Polynomial.map_sub,Polynomial.map_X,Polynomial.map_one,Polynomial.map_natCast] at hc
 simp only [Polynomial.coeff_map] at hc
 rw [diagonal_raw_coeff_on16 path 1 (i+1) j (by omega)] at hc
 change (coeff (frame path).mid.p (i+1) j : ℝ)=_ at hc
 rw [hc]
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
   Polynomial.map_sub,Polynomial.map_X,Polynomial.map_one,Polynomial.map_natCast]
 have hs : ((1+X : Polynomial ℝ)^(i+j)*
   (((frame path).mid.b:Polynomial ℝ)-1)*X+
   (1+X)^(i+j)*(((frame path).mid.a:Polynomial ℝ)-1)) =
   (1+X)^(i+j)*((((frame path).mid.b:Polynomial ℝ)-1)*X+
     (((frame path).mid.a:Polynomial ℝ)-1)) := by ring
 rw [← hs]
 simp [Polynomial.coeff_add,Polynomial.coeff_mul_X,Polynomial.coeff_mul_C,
   Polynomial.coeff_mul_natCast,Polynomial.coeff_sub,Polynomial.coeff_one_add_X_pow]
 <;> ring

theorem source_top_low58 (path : List Bool) (i j : ℕ) (hij : 2 ≤ i+j)
 (hd : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
 2*((i:ℝ)+j)*(i+j-1)*(coeff (frame path).mid.p i j : ℝ)=
 (((frame path).mid.b-1 : ℝ)*((frame path).mid.b-2)*i*(i-1)+
 2*((frame path).mid.a*(frame path).mid.b-4*(frame path).mid.a+2 : ℝ)*i*j+
 ((frame path).mid.a-1 : ℝ)*((frame path).mid.a-2)*j*(j-1))*
 ((i+j).choose i : ℝ) := by
 have h := upper_slice_factor774 path 2 (by omega)
 have he : (frame path).mid.a+(frame path).mid.b-1-2*2=i+j-2 := by omega
 rw [he] at h
 have hp : 2*(diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff 2=
   (1+X)^(i+j-2)*
   ((((frame path).mid.b:Polynomial ℤ)-1)*((frame path).mid.b-2 : Polynomial ℤ)*X^2+
   2*((frame path).mid.a*(frame path).mid.b-4*(frame path).mid.a+2 : Polynomial ℤ)*X+
   ((frame path).mid.a-1 : Polynomial ℤ)*((frame path).mid.a-2 : Polynomial ℤ)) := by
   rw [h,show (2:Polynomial ℤ)*((1+X)^(i+j-2)*quotientSlice774 path 2)=
     (1+X)^(i+j-2)*(2*quotientSlice774 path 2) by ring,
     quotient_quadratic_twice774]
 have hc := congrArg (fun p : Polynomial ℤ => (p.map (Int.castRingHom ℝ)).coeff i) hp
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
   Polynomial.map_sub,Polynomial.map_X,Polynomial.map_one,Polynomial.map_natCast,
   Polynomial.map_ofNat] at hc
 rw [show (2:Polynomial ℝ)=C (2:ℝ) by norm_num,Polynomial.coeff_C_mul,
   Polynomial.coeff_map,diagonal_raw_coeff_on16 path 2 i j (by omega)] at hc
 have hex (a b : ℝ) : (1+(X:Polynomial ℝ))^(i+j-2)*
   ((C b-1)*(C b-2)*X^2+2*(C a*C b-4*C a+2)*X+(C a-1)*(C a-2))=
   C (b-1)*C (b-2)*((1+X)^(i+j-2)*X^2)+
   C (2*(a*b-4*a+2))*((1+X)^(i+j-2)*X)+
   C ((a-1)*(a-2))*(1+X)^(i+j-2) := by simp; ring
 simp only [← Polynomial.C_natCast] at hc
 rw [hex] at hc
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul] at hc
 have h0 := top_coeff_zero58 i j hij
 have h1 := top_coeff_one58 i j hij
 have h2 := top_coeff_two58 i j hij
 linear_combination ((i:ℝ)+j)*(i+j-1)*hc +
   ((frame path).mid.b-1 : ℝ)*((frame path).mid.b-2)*h2 +
   2*((frame path).mid.a*(frame path).mid.b-4*(frame path).mid.a+2 : ℝ)*h1 +
   ((frame path).mid.a-1 : ℝ)*((frame path).mid.a-2)*h0

#print axioms source_top_middle58
#print axioms source_top_low58
end
end MathGKM.Markov
