import MarkovVertexCoefficientsMAA6
import MarkovSecondCoeff340
import MarkovSourceAmbient77c2
import MarkovBottomGapMAA6
/-! Machine-authored aa6c518b. Common-binomial identities for raw bottom triples. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem bottom_linear_scaledMAA6 (k l : ℕ) (hN : 2≤k+l) (A B : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(linearRow77 (k+l-2) A B).coeff k=
 ((k+l).choose k:ℝ)*l*((l-1)*A+k*B) := by
 have he : linearRow77 (k+l-2) A B=
   C A*(1+X)^(k+l-2)+C B*((1+X)^(k+l-2)*X) := by
   unfold linearRow77; ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]
 linear_combination A*top_coeff_zero58 k l hN+B*top_coeff_one58 k l hN

theorem bottom_choose_shiftMAA6 (k l : ℕ) (hl : 2≤l) :
 ((k:ℝ)+l)*(k+1)*((k+l-1).choose (k+1):ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1) := by
 have h := Nat.choose_mul_succ_eq (k+l-1) (k+1)
 rw [show k+l-1+1=k+l by omega,show k+l-(k+1)=l-1 by omega] at h
 have hr : ((k+l-1).choose (k+1):ℝ)*((k:ℝ)+l)=
   ((k+l).choose (k+1):ℝ)*((l:ℝ)-1) := by
   have hh := congrArg (fun z : ℕ => (z:ℝ)) h
   push_cast [Nat.cast_sub (show 1≤l by omega)] at hh
   exact hh
 linear_combination ((k:ℝ)+1)*hr+((l:ℝ)-1)*top_middle_binomial58 k l

theorem bottom_cubic_scaledMAA6 (k l : ℕ) (hl : 2≤l) (hN : 4≤k+l)
 (A B C D : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+1)*
 (((1+(X:ℝ[X]))^(k+l-4)*CubicPoly5a7 A B C D).coeff (k+1))=
 ((k+l).choose k:ℝ)*l*(l-1)*
 (A*(l-2)*(l-3)*(l-4)+(k+1)*(B*(l-2)*(l-3)+C*k*(l-2)+D*k*(k-1))) := by
 have h := cubic_falling_coeff340 (k+1) (l-2) (by omega) A B C D
 rw [show k+1+(l-2)=k+l-1 by omega,
   show k+l-1-3=k+l-4 by omega] at h
 push_cast [Nat.cast_sub hl] at h
 have hb := bottom_choose_shiftMAA6 k l hl
 linear_combination ((k:ℝ)+l)*(k+1)*h+
   (A*(l-2)*(l-3)*(l-4)+(k+1)*(B*(l-2)*(l-3)+C*k*(l-2)+D*k*(k-1)))*hb

theorem source_bottom_firstMAA6 (path : List Bool) (k l : ℕ)
 (hb : 5≤(frame path).mid.b) (hbl : (frame path).mid.b=k+l+1) :
 ((k:ℝ)+l)*(k+l-1)*(coeff (frame path).mid.p ((frame path).mid.a+k) 1:ℝ)=
 ((k+l).choose k:ℝ)*l*bottomTMAA6 (frame path).mid.a k l := by
 rw [source_first_linear_row77 path (by omega) k]
 have he : (frame path).mid.b-3=k+l-2 := by omega
 rw [he,bottom_linear_scaledMAA6 k l (by omega)]
 have ha := (frame_reduced path).1
 rw [hbl]
 push_cast
 unfold bottomTMAA6
 ring

theorem source_bottom_secondMAA6 (path : List Bool) (k l : ℕ)
 (hb : 5≤(frame path).mid.b) (hbl : (frame path).mid.b=k+l+1) (hl : 2≤l) :
 2*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+1)*
 (coeff (frame path).mid.p ((frame path).mid.a+k) 2:ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*bottomJMAA6 (frame path).mid.a k l
 (2*((2*(frame path).mid.a-(frame path).mid.b:ℕ):ℝ)) := by
 obtain ⟨n,m,s,hn,hm,hn3,hs,he⟩ := source_second_exactMAA6 path hb
 have hh := congrArg (Polynomial.map (Int.castRingHom ℝ)) he
 simp only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,
   Polynomial.map_add,Polynomial.map_X,Polynomial.map_one,secondExpr_map8934] at hh
 have hc := congrArg (fun p : ℝ[X] => p.coeff ((k+1)+m)) hh
 rw [mul_assoc,Polynomial.coeff_ofNat_mul,Polynomial.coeff_map,swap_coeff46,
   Polynomial.coeff_X_pow_mul] at hc
 have hind : k+1+m=(frame path).mid.a+k := by omega
 rw [hind,show n-3=k+l-4 by omega] at hc
 have h := bottom_cubic_scaledMAA6 k l hl (by omega)
   (4*s) (secondB8934 m) (secondC8934 n m) (secondD8934 n m)
 rw [show (1+(X:ℝ[X]))^(k+l-4)=(X+1)^(k+l-4) by rw [add_comm]] at h
 rw [←hc] at h
 have hmR : (m:ℝ)=(frame path).mid.a-1 := by
   have hh : (m:ℝ)+1=(frame path).mid.a := by exact_mod_cast hm
   linarith
 have hnR : (n:ℝ)=(k:ℝ)+l-1 := by
   have hh : (n:ℝ)+2=(k:ℝ)+l+1 := by exact_mod_cast (hn.trans hbl)
   linarith
 have hsR : (s:ℝ)=2*((2*(frame path).mid.a-(frame path).mid.b:ℕ):ℝ) := by exact_mod_cast hs
 simp only [secondB8934,secondC8934,secondD8934] at h
 rw [hmR,hnR,hsR] at h
 unfold bottomJMAA6
 linear_combination h
end
end MathGKM.Markov
