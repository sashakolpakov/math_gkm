import MarkovNextBinomial7955
import MarkovSecondSource8934
/-! Machine-authored 34071a88. Fourth falling-factorial coefficient bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def secondRow340 (n : ℕ) (m t : ℝ) : ℝ[X] :=
 (1+X)^(n-3)*CubicPoly5a7 (4*t) (secondB8934 m) (secondC8934 n m) (secondD8934 n m)

theorem cubic_falling_coeff340 (i j : ℕ) (hd : 3 ≤ i+j) (A B C D : ℝ) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*
 (((1+(X:ℝ[X]))^(i+j-3)*CubicPoly5a7 A B C D).coeff i)=
 ((i+j).choose i : ℝ)*(A*j*(j-1)*(j-2)+B*i*j*(j-1)+C*i*(i-1)*j+D*i*(i-1)*(i-2)) := by
 have hx : (1+(X:ℝ[X]))^(i+j-3)*CubicPoly5a7 A B C D=
   Polynomial.C A*(1+X)^(i+j-3)+Polynomial.C B*((1+X)^(i+j-3)*X)+
   Polynomial.C C*((1+X)^(i+j-3)*X^2)+Polynomial.C D*((1+X)^(i+j-3)*X^3) := by
   unfold CubicPoly5a7
   ring
 rw [hx]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]
 linear_combination A*next_coeff_zero7955 i j hd+B*next_coeff_one7955 i j hd+
   C*next_coeff_two7955 i j hd+D*next_coeff_three7955 i j

theorem source_second_row340 (path : List Bool) (hb : 5 ≤ (frame path).mid.b) :
 ∃ n m t : ℕ, n+2=(frame path).mid.b ∧ m+1=(frame path).mid.a ∧
 3 ≤ n ∧ m ≤ n ∧ t ≤ 2*m ∧ (n ≤ 2*m ∨ t=0) ∧
 ∀ h : ℕ, 2*(coeff (frame path).mid.p (m+h) 2 : ℝ)=(secondRow340 n m t).coeff h := by
 obtain ⟨n,m,t,hn,hm,hn3,hmn,ht,hz,he⟩ := second_source_formula8934 path hb
 refine ⟨n,m,t,hn,hm,hn3,hmn,ht,hz,?_⟩
 have hh := congrArg (Polynomial.map (Int.castRingHom ℝ)) he
 simp only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,
   Polynomial.map_add,Polynomial.map_X,Polynomial.map_one,secondExpr_map8934] at hh
 intro h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (h+m)) hh
 rw [mul_assoc] at hc
 rw [Polynomial.coeff_ofNat_mul,Polynomial.coeff_map,swap_coeff46,
   Polynomial.coeff_X_pow_mul] at hc
 simpa [secondRow340,add_comm] using hc

#print axioms cubic_falling_coeff340
#print axioms source_second_row340
end
end MathGKM.Markov
