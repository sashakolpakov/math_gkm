import MarkovThreeSourceM9E2
/-! Machine-authored 9e205206. A direct raw-integer arithmetic representation
using only guarded binomial sums. All outside-support zeros remain present. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000

def fibRawM9E2 (n i j : ℕ) : ℤ :=
 if i=0 then (if j=n then 1 else 0) else
 if i+j≤n then ((n-j-1).choose (i-1):ℤ)*((i+j).choose j:ℤ) else 0

theorem fib_raw_formulaM9E2 (n i j : ℕ) : coeff (fib6 n) i j=fibRawM9E2 n i j := by
 by_cases hi : i=0
 · subst i
   unfold fibRawM9E2
   rw [if_pos rfl]
   by_cases hj : j≤n
   · have h := fib_axis6 j (n-j)
     rw [Nat.add_sub_of_le hj] at h
     rw [h]
     by_cases he : j=n
     · subst j; simp
     · rw [if_neg he,if_neg (by omega)]
   · rw [fib_degree6 n 0 j (by omega),if_neg (by omega)]
 · unfold fibRawM9E2
   rw [if_neg hi]
   by_cases hn : i+j≤n
   · rw [if_pos hn]
     have h := fib_formula_aux6 n (i-1) j (n-i-j) (by omega)
     have hi' : i-1+1=i := by omega
     have he : i-1+(n-i-j)=n-j-1 := by omega
     simpa only [hi',he] using h
   · rw [if_neg hn]
     exact fib_degree6 n i j (by omega)

def biConvM9E2 (f g : ℕ → ℕ → ℤ) (i j : ℕ) : ℤ :=
 ∑ a∈range (i+1), ∑ b∈range (j+1), f a b*g (i-a) (j-b)

theorem coeff_productM9E2 (P Q : BiPoly) (i j : ℕ) :
 coeff (P*Q) i j=biConvM9E2 (coeff P) (coeff Q) i j := by
 simp only [coeff,Polynomial.coeff_mul,Polynomial.finsetSum_coeff]
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 unfold biConvM9E2
 apply sum_congr rfl
 intro a ha
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 rfl

def threeProductRawM9E2 (a b c : ℕ) : ℕ → ℕ → ℤ :=
 biConvM9E2 (biConvM9E2 (fibRawM9E2 a) (fibRawM9E2 b)) (fibRawM9E2 c)

theorem three_product_rawM9E2 (a b c i j : ℕ) :
 coeff (fib6 a*fib6 b*fib6 c) i j=threeProductRawM9E2 a b c i j := by
 rw [coeff_productM9E2]
 unfold threeProductRawM9E2 biConvM9E2
 simp only [coeff_productM9E2,fib_raw_formulaM9E2,biConvM9E2]

def shiftRawM9E2 (a b : ℕ) (f : ℕ → ℕ → ℤ) (i j : ℕ) : ℤ :=
 if a ≤ i ∧ b ≤ j then f (i-a) (j-b) else 0

theorem coeff_monomial_productM9E2 (a b : ℕ) (P : BiPoly) (i j : ℕ) :
 coeff (U^a*V^b*P) i j=shiftRawM9E2 a b (coeff P) i j := by
 have he : U^a*V^b*P=(Polynomial.X:BiPoly)^a*(Polynomial.C (Polynomial.X^b)*P) := by
   simp only [U,V,map_pow]; ring
 rw [he]
 simp only [coeff,Polynomial.coeff_X_pow_mul',Polynomial.coeff_C_mul]
 unfold shiftRawM9E2
 by_cases hi : a ≤ i
 · simp [hi,Polynomial.coeff_X_pow_mul',coeff]
 · simp [hi]

def addSRawM9E2 (f : ℕ → ℕ → ℤ) (i j : ℕ) : ℤ :=
 shiftRawM9E2 1 0 f i j+shiftRawM9E2 0 1 f i j+f i j

theorem coeff_S_productM9E2 (P : BiPoly) (i j : ℕ) :
 coeff (S*P) i j=addSRawM9E2 (coeff P) i j := by
 have he : S*P=U^1*V^0*P+U^0*V^1*P+P := by unfold S; ring
 rw [he]
 simp only [coeff_add0618,coeff_monomial_productM9E2,addSRawM9E2]

def threeRawM9E2 (q : ℕ) (r : Bool) (i j : ℕ) : ℤ :=
 if r then
 threeProductRawM9E2 (q+1) (q+1) (q+1) i j+
 shiftRawM9E2 0 1 (threeProductRawM9E2 (q+1) q q) i j+
 addSRawM9E2 (shiftRawM9E2 0 1 (threeProductRawM9E2 q q q)) i j
 else
 addSRawM9E2 (threeProductRawM9E2 (q+1) (q+1) (q+1)) i j+
 shiftRawM9E2 0 1 (threeProductRawM9E2 (q+1) (q+1) q) i j+
 shiftRawM9E2 0 2 (threeProductRawM9E2 q q q) i j

theorem three_raw_formulaM9E2 (q : ℕ) (r : Bool) (i j : ℕ) :
 coeff (threePolyM9E2 q r) i j=threeRawM9E2 q r i j := by
 have hc (a : ℕ) : fib6 a^3=fib6 a*fib6 a*fib6 a := by ring
 cases r
 · have he : threePolyM9E2 q false=
     S*(fib6 (q+1)*fib6 (q+1)*fib6 (q+1))+
     U^0*V^1*(fib6 (q+1)*fib6 (q+1)*fib6 q)+U^0*V^2*(fib6 q*fib6 q*fib6 q) := by
     unfold threePolyM9E2 threeCubicM9E2; simp only [Bool.false_eq_true,if_false]; ring
   rw [he]
   simp only [coeff_add0618,coeff_S_productM9E2,coeff_monomial_productM9E2,
     addSRawM9E2,shiftRawM9E2,three_product_rawM9E2,threeRawM9E2,Bool.false_eq_true,if_false]
 · have he : threePolyM9E2 q true=
     fib6 (q+1)*fib6 (q+1)*fib6 (q+1)+U^0*V^1*(fib6 (q+1)*fib6 q*fib6 q)+
     S*(U^0*V^1*(fib6 q*fib6 q*fib6 q)) := by
     unfold threePolyM9E2 threeCubicM9E2; simp only [if_true]; ring
   rw [he]
   simp only [coeff_add0618,coeff_S_productM9E2,coeff_monomial_productM9E2,
     addSRawM9E2,shiftRawM9E2,three_product_rawM9E2,threeRawM9E2,if_true]

theorem source_three_rawM9E2 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1≤q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
   ∀ i j, coeff (frame path).mid.p i j=threeRawM9E2 q r i j := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_cubicM9E2 path ha
 exact ⟨q,r,hq,hb,fun i j => by rw [hp,three_raw_formulaM9E2]⟩

end
end MathGKM.Markov
