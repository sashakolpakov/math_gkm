import MarkovNextBinomial7955
import MarkovNextCertificate7955
/-! Machine-authored 7955df0c. Literal fourth/third/second layer coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem next_choose_up7955 (i j : ℕ) :
 ((i:ℝ)+1)*((i+1+j).choose (i+1) : ℝ)=
 ((i:ℝ)+j+1)*((i+j).choose i : ℝ) := by
 have h := Nat.add_one_mul_choose_eq (i+j) i
 have he : i+j+1=i+1+j := by omega
 rw [he] at h
 have hR := congrArg (fun z : ℕ => (z:ℝ)) h
 push_cast at hR
 nlinarith only [hR]

theorem source_next_middle7955 (path : List Bool) (i j : ℕ) (hij : 3 ≤ i+j)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 2*((i:ℝ)+j)*(i+1)*(coeff (frame path).mid.p (i+1) j : ℝ)=
 nextQ7955 i j ((frame path).mid.a-1) ((frame path).mid.b-1)*
 ((i+j).choose i : ℝ) := by
 have h := source_top_low58 path (i+1) j (by omega) (by omega)
 have hc := next_choose_up7955 i j
 have hi : 0<(i:ℝ)+j+1 := by positivity
 apply (mul_left_cancel₀ (ne_of_gt hi))
 unfold nextQ7955
 push_cast at h
 linear_combination ((i:ℝ)+1)*h +
   (((frame path).mid.b-1 : ℝ)*((frame path).mid.b-2)*(i+1)*i+
   2*((frame path).mid.a*(frame path).mid.b-4*(frame path).mid.a+2 : ℝ)*(i+1)*j+
   ((frame path).mid.a-1 : ℝ)*((frame path).mid.a-2)*j*(j-1))*hc

theorem source_next_last7955 (path : List Bool) (i j : ℕ)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 ((i:ℝ)+1)*(i+2)*(coeff (frame path).mid.p (i+2) j : ℝ)=
 ((i:ℝ)+j+1)*((i+j).choose i : ℝ)*
   (((frame path).mid.b-1 : ℝ)*(i+2)+((frame path).mid.a-1 : ℝ)*j) := by
 have h := source_top_middle58 path (i+1) j (by omega)
 have h0 := next_choose_up7955 i j
 have h1 := top_middle_binomial58 (i+1) j
 push_cast at h h1
 have he : i+1+1=i+2 := by omega
 rw [he] at h h1
 linear_combination ((i:ℝ)+1)*(i+2)*h +
   (((frame path).mid.b-1 : ℝ)*(i+2)+((frame path).mid.a-1 : ℝ)*j)*h0 +
   ((i:ℝ)+1)*((frame path).mid.a-1 : ℝ)*h1

theorem source_next_low7955 (path : List Bool) (i j : ℕ) (hij : 3 ≤ i+j)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 ∃ s : ℕ, 6*((i:ℝ)+j)*(i+j-1)*(i+j-2)*(coeff (frame path).mid.p i j : ℝ)=
 nextT7955 i j ((frame path).mid.a-1) ((frame path).mid.b-1) s*
 ((i+j).choose i : ℝ) := by
 obtain ⟨n,m,s,hn,hm,_,_,_,he⟩ := fourth_source_formula5a7 path (by omega)
 refine ⟨s,?_⟩
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

#print axioms source_next_middle7955
#print axioms source_next_last7955
#print axioms source_next_low7955
end
end MathGKM.Markov
