import MarkovSwitchLower7d80
import MarkovNextSource7955
/-! Machine-authored 7d80a785. Literal source coefficient with switch lower bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
theorem source_vertical_low_mixed7d80 (path : List Bool) (i j : ℕ) (hij : 3 ≤ i+j)
 (ha : 2 ≤ (frame path).mid.a) (hab : (frame path).mid.a+2 ≤ (frame path).mid.b)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 ∃ s : ℕ, 2 ≤ s ∧ 6*((i:ℝ)+j)*(i+j-1)*(i+j-2)*(coeff (frame path).mid.p i j : ℝ)=
 nextT7955 i j ((frame path).mid.a-1) ((frame path).mid.b-1) s*
 ((i+j).choose i : ℝ) := by
 obtain ⟨n,m,s,hn,hm,hs,he⟩ := source_fourth_mixed7d80 path ha hab
 refine ⟨s,hs,?_⟩
 have hf := upper_slice_factor774 path 3 (by omega)
 have hex : (frame path).mid.a+(frame path).mid.b-1-2*3=i+j-3 := by omega
 rw [hex] at hf
 have hmap := congrArg (Polynomial.map (Int.castRingHom ℝ)) hf
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
   Polynomial.map_one,Polynomial.map_X] at hmap
 have hpoly : 6*((diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff 3).map
   (Int.castRingHom ℝ) =
   (1+(X:ℝ[X]))^(i+j-3)*CubicPoly5a7 (cubicA5a7 m) (cubicB5a7 n m s)
     (cubicC5a7 n m) (cubicD5a7 n) := by
   rw [hmap,show (6:ℝ[X])*((1+X)^(i+j-3)*(quotientSlice774 path 3).map (Int.castRingHom ℝ))=
     (1+X)^(i+j-3)*(6*(quotientSlice774 path 3).map (Int.castRingHom ℝ)) by ring,he]
 have hc := congrArg (fun p : ℝ[X] => p.coeff i) hpoly
 rw [Polynomial.coeff_ofNat_mul,Polynomial.coeff_map,
   diagonal_raw_coeff_on16 path 3 i j (by omega)] at hc
 have hx (A B C D : ℝ) : (1+(X:ℝ[X]))^(i+j-3)*CubicPoly5a7 A B C D=
   Polynomial.C A*(1+X)^(i+j-3)+Polynomial.C B*((1+X)^(i+j-3)*X)+
   Polynomial.C C*((1+X)^(i+j-3)*X^2)+Polynomial.C D*((1+X)^(i+j-3)*X^3) := by
   unfold CubicPoly5a7
   ring
 rw [hx] at hc
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul] at hc
 have h0 := next_coeff_zero7955 i j hij
 have h1 := next_coeff_one7955 i j hij
 have h2 := next_coeff_two7955 i j hij
 have h3 := next_coeff_three7955 i j
 have hnR : (n:ℝ)=(frame path).mid.b-2 := by
   have h : (n:ℝ)+2=(frame path).mid.b := by exact_mod_cast hn
   linarith
 have hmR : (m:ℝ)=(frame path).mid.a-1 := by
   have h : (m:ℝ)+1=(frame path).mid.a := by exact_mod_cast hm
   linarith
 unfold nextT7955
 rw [show ((frame path).mid.b:ℝ)-1-1=n by linarith,←hmR]
 linear_combination ((i:ℝ)+j)*(i+j-1)*(i+j-2)*hc +
   cubicA5a7 m*h0+cubicB5a7 n m s*h1+cubicC5a7 n m*h2+cubicD5a7 n*h3


#print axioms source_vertical_low_mixed7d80
end
end MathGKM.Markov
