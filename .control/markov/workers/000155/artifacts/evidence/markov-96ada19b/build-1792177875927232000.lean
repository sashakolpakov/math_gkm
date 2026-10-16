import MarkovThreeSparseM96A
import MarkovThreeArithmeticM9E2
/-! Machine-authored 96ada19b. Explicit signed binomial forcing, no convolution. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def threeForceM96A (q : ℕ) (r : Bool) : ℕ → ℕ → ℤ :=
 let n := 3*q+(if r then 1 else 2)
 let f := fun i j => fibRawM9E2 (n+2) i j-2*fibRawM9E2 (n+1) i j+fibRawM9E2 n i j
 let g := if r then (fun i j => addSRawM9E2 (fibRawM9E2 q) i j+fibRawM9E2 (q+1) i j)
   else (fun i j => shiftRawM9E2 0 1 (fibRawM9E2 q) i j+addSRawM9E2 (fibRawM9E2 (q+1)) i j)
 fun i j => addSRawM9E2 (addSRawM9E2 f) i j+4*shiftRawM9E2 1 (q+1) g i j

theorem three_force_coeffM96A (q : ℕ) (r : Bool) (i j : ℕ) :
 coeff (threeSparseM96A q r) i j=threeForceM96A q r i j := by
 rw [three_sparse_differenceM96A]
 have hc (P : BiPoly) : coeff (S^2*P) i j=
   addSRawM9E2 (addSRawM9E2 (coeff P)) i j := by
   rw [show S^2*P=S*(S*P) by ring,coeff_S_productM9E2]
   congr 1
   funext a b
   exact coeff_S_productM9E2 P a b
 have hs (P : BiPoly) : coeff (4*U*V^(q+1)*P) i j=
   4*shiftRawM9E2 1 (q+1) (coeff P) i j := by
   rw [show 4*U*V^(q+1)*P=4*(U^1*V^(q+1)*P) by ring]
   simp only [coeff,Polynomial.coeff_ofNat_mul]
   change 4*coeff (U^1*V^(q+1)*P) i j=_
   rw [coeff_monomial_productM9E2]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,coeff_add0618,hc,hs]
 · simp only [threeForceM96A,Bool.false_eq_true,if_false]
   congr 1
   · congr 1
     congr 1
     funext a b
     simp [coeff,Polynomial.coeff_ofNat_mul,show 3*q+2+2=3*q+4 by omega,
       show 3*q+2+1=3*q+3 by omega,←fib_raw_formulaM9E2]
   · congr 1
     congr 1
     funext a b
     rw [coeff_add0618,coeff_S_productM9E2,
       show V*fib6 q=U^0*V^1*fib6 q by ring,coeff_monomial_productM9E2]
     simp only [fib_raw_formulaM9E2]
 · simp only [threeForceM96A,if_true]
   congr 1
   · congr 1
     congr 1
     funext a b
     simp [coeff,Polynomial.coeff_ofNat_mul,show 3*q+1+2=3*q+3 by omega,
       show 3*q+1+1=3*q+2 by omega,←fib_raw_formulaM9E2]
   · congr 1
     congr 1
     funext a b
     rw [coeff_add0618,coeff_S_productM9E2]
     simp only [fib_raw_formulaM9E2]

def discriminantActionM96A (f : ℕ → ℕ → ℤ) (i j : ℕ) : ℤ :=
 f i j+2*shiftRawM9E2 1 0 f i j-2*shiftRawM9E2 0 1 f i j+
 shiftRawM9E2 2 0 f i j+2*shiftRawM9E2 1 1 f i j+shiftRawM9E2 0 2 f i j

theorem discriminant_coeffM96A (P : BiPoly) (i j : ℕ) :
 coeff ((S^2-4*V)*P) i j=discriminantActionM96A (coeff P) i j := by
 have he : (S^2-4*V)*P=P+2*(U^1*V^0*P)-2*(U^0*V^1*P)+
   U^2*V^0*P+2*(U^1*V^1*P)+U^0*V^2*P := by unfold S; ring
 rw [he]
 simp only [coeff,Polynomial.coeff_add,Polynomial.coeff_sub,Polynomial.coeff_ofNat_mul]
 change coeff P i j+2*coeff (U^1*V^0*P) i j-2*coeff (U^0*V^1*P) i j+
   coeff (U^2*V^0*P) i j+2*coeff (U^1*V^1*P) i j+coeff (U^0*V^2*P) i j=_
 simp only [coeff_monomial_productM9E2,discriminantActionM96A]

theorem three_raw_equationM96A (q : ℕ) (r : Bool) (i j : ℕ) :
 discriminantActionM96A (threeRawM9E2 q r) i j=threeForceM96A q r i j := by
 have he := congrArg (fun P => coeff P i j) (three_sparse_identityM96A q r)
 rw [discriminant_coeffM96A,three_force_coeffM96A] at he
 simpa only [three_raw_formulaM9E2] using he

end
end MathGKM.Markov
