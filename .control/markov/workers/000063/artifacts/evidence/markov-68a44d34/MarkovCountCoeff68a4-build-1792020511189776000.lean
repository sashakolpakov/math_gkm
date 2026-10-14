import MarkovCountTransfer68a4
/-! Machine-authored 68a44d34. Ordinary coefficient extraction for the
mixed-run degree-layer counts. No asymptotic or numerical normalization. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem count_power_coeff68 {R : Type*} [CommRing R] (z : R) (n s : ℕ) :
 ((C z+X*C (z^2))^n).coeff s=(n.choose s:R)*z^(n+s) := by
 have hp : (C z+X*C (z^2))^n=
     C (z^n)*(((1+X)^n).comp (C z*X)) := by
   simp only [Polynomial.add_comp,Polynomial.pow_comp,Polynomial.one_comp,
     Polynomial.X_comp]
   simp only [map_pow]
   rw [←mul_pow]
   congr 1
   simp only [mul_add,mul_one,←mul_assoc,←map_mul]
   ring
 rw [hp,Polynomial.coeff_C_mul,Polynomial.comp_C_mul_X_coeff,
   Polynomial.coeff_one_add_X_pow,pow_add]
 ring

def countAtom68 (r h n s d : ℕ) : ℤ :=
 if r ≤ s ∧ h+n+(s-r)=d then (n.choose (s-r):ℤ) else 0

theorem count_atom_coeff68 (r h n s d : ℕ) :
 ((X^r*(C (X^h)*(C X+X*C (X^2))^n) : (ℤ[X])[X]).coeff s).coeff d=
 countAtom68 r h n s d := by
 rw [Polynomial.coeff_X_pow_mul']
 by_cases hrs : r ≤ s
 · rw [if_pos hrs,Polynomial.coeff_C_mul,count_power_coeff68]
   have hp : (X^h*((n.choose (s-r):ℤ[X])*X^(n+(s-r))) : ℤ[X])=
       C (n.choose (s-r):ℤ)*X^(h+n+(s-r)) := by
     simp only [map_natCast,pow_add]
     ring
   rw [hp,Polynomial.coeff_C_mul_X_pow]
   simp only [countAtom68,hrs,true_and,eq_comm]
 · simp [hrs,countAtom68]

def singleACount68 (p q s d : ℕ) : ℤ :=
 (if s=0 ∧ d=0 then 1 else 0)+
 (∑ k ∈ range q,countAtom68 1 1 k s d)+
 (∑ k ∈ range p,countAtom68 1 2 k s d)+
 countAtom68 1 1 p s d+
 ∑ k ∈ range (p+1),∑ l ∈ range q,countAtom68 2 3 (k+l) s d

theorem count_expansion68 {R : Type*} [CommRing R] (x z : R) (p q : ℕ) :
 1+x*z*geomCount68 (z+x*z^2) q+x*z^2*geomCount68 (z+x*z^2) p+
   x*z*(z+x*z^2)^p+
   x^2*z^3*geomCount68 (z+x*z^2) (p+1)*geomCount68 (z+x*z^2) q =
 1+(∑ k ∈ range q,x^1*(z^1*(z+x*z^2)^k))+
   (∑ k ∈ range p,x^1*(z^2*(z+x*z^2)^k))+
   x^1*(z^1*(z+x*z^2)^p)+
   ∑ k ∈ range (p+1),∑ l ∈ range q,x^2*(z^3*(z+x*z^2)^(k+l)) := by
 simp only [geomCount68,Finset.mul_sum,Finset.sum_mul,pow_add,pow_one]
 rw [Finset.sum_comm]
 ring

theorem singleA_layer_count68 (p q s d : ℕ) :
 (degreeLayer07a7 (X:ℤ[X])
   (List.replicate p true++false::List.replicate q true) s d).coeff 0=
 singleACount68 p q s d := by
 rw [←marked_count_coeff68,singleA_count_formula68]
 rw [count_expansion68]
 simp only [←map_pow]
 simp only [Polynomial.coeff_add,Polynomial.finsetSum_coeff,count_atom_coeff68]
 unfold singleACount68
 congr 4
 simp only [Polynomial.coeff_one]
 split_ifs <;> simp_all [Polynomial.coeff_one]

#print axioms count_atom_coeff68
#print axioms singleA_layer_count68
end
end MathGKM.Markov
