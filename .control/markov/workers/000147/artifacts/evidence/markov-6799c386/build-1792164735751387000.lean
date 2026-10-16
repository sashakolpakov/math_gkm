import MarkovTwoKernelM679
/-! Machine-authored 6799c386. All columns of every numerator-two source,
as explicit positive finite polynomial sums. No log-concavity asserted. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000

def columnTermM679 (r e i : ℕ) : Polynomial ℤ :=
 if r+e ≤ i then (2*(X+1))^(r-(i-(r+e)))*(r.choose (i-(r+e)):Polynomial ℤ) else 0

theorem column_term_coeffM679 (r e i : ℕ) :
 (U^e*(U*(2*(V+1)+U))^r).coeff i=columnTermM679 r e i := by
 have he : U^e*(U*(2*(V+1)+U))^r=
   (X:BiPoly)^(r+e)*(X+C (2*((X:Polynomial ℤ)+1)))^r := by
   simp only [U,V,map_mul,map_add,map_ofNat,map_one,mul_pow,pow_add]
   ring
 rw [he,Polynomial.coeff_X_pow_mul']
 unfold columnTermM679
 split_ifs <;> simp only [Polynomial.coeff_X_add_C_pow]

def twoColumnM679 (q i : ℕ) : Polynomial ℤ :=
 (if i=0 then X^(2*q+1)*(X+1) else 0)+
 ∑ r∈range (q+1),
   (2*X*columnTermM679 r 1 i*shiftKernelM679 X r 1 (r+2) (q-r)+
   columnTermM679 r 2 i*shiftKernelM679 X (r+1) 0 (r+2) (q-r))

theorem two_column_formulaM679 (q i : ℕ) :
 (twoPolyMEC6 q).coeff i=twoColumnM679 q i := by
 rw [two_explicit_formulaM679]
 unfold twoExplicitM679 twoColumnM679
 rw [Polynomial.coeff_add,Polynomial.finsetSum_coeff]
 congr 1
 · simp only [V,←map_pow,←map_one Polynomial.C,←map_add,←map_mul,Polynomial.coeff_C]
 · apply sum_congr rfl
   intro r hr
   rw [Polynomial.coeff_add]
   have hk (m l s n : ℕ) : shiftKernelM679 V m l s n=
     C (shiftKernelM679 (X:Polynomial ℤ) m l s n) :=
       (shift_kernel_mapM679 Polynomial.C (X:Polynomial ℤ) m l s n).symm
   rw [hk,hk]
   have he : 2*U*V*(U*(2*(V+1)+U))^r=
     C (2*(X:Polynomial ℤ))*(U^1*(U*(2*(V+1)+U))^r) := by
     simp only [V,map_mul,map_ofNat,pow_one]; ring
   rw [he,Polynomial.coeff_mul_C,Polynomial.coeff_mul_C,
     Polynomial.coeff_C_mul,column_term_coeffM679,column_term_coeffM679]

theorem source_two_column_formulaM679 (path : List Bool) (ha : (frame path).mid.a=2) :
 ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
   ∀ i, ((frame path).mid.p).coeff i=twoColumnM679 q i := by
 obtain ⟨q,hq,hb,hp⟩ := source_two_squares3556 path ha
 refine ⟨q,hq,hb,?_⟩
 intro i
 rw [hp]
 exact two_column_formulaM679 q i

theorem source_two_raw_formulaM679 (path : List Bool) (ha : (frame path).mid.a=2) :
 ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
   ∀ i j, coeff (frame path).mid.p i j=(twoColumnM679 q i).coeff j := by
 obtain ⟨q,hq,hb,hp⟩ := source_two_column_formulaM679 path ha
 exact ⟨q,hq,hb,fun i j => by rw [coeff,hp]⟩

end
end MathGKM.Markov
