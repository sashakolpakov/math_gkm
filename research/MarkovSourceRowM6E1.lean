import MarkovCentralFormulaM6E1
import MarkovCentralLCM6E1
import MarkovSquares3556
/-! Machine-authored 6e1369de. All horizontal triples in the central row
of every numerator-two source. This is not full Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

theorem central_square_lowM6E1 (n i : ℕ) (hi : i ≤ 1) :
 coeff (fib6 (n+1)^2) i n=0 := by
 rw [pow_two,bicoeff_mulM3A1]
 apply sum_eq_zero
 intro t ht
 have ht0 := mem_range.mp ht
 have ht1 : n-t<n+1 := by omega
 interval_cases i <;>
   simp [sum_range_succ,fib_low_zeroM3A1 _ _ ht0,fib_low_zeroM3A1 _ _ ht1]

theorem central_two_formulaM6E1 (q k : ℕ) :
 coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) (k+2) (q+1)=centralValM6E1 (q+1) k := by
 have hc : coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) (k+2) (q+1)=
   coeff (fib6 (q+2)^2) (k+2) (q+1)+coeff (fib6 (q+1)^2) (k+2) q := by
   simp [coeff,V,Polynomial.coeff_X_mul]
 rw [hc,show q+2=(q+1)+1 by omega,
   central_square_formulaM6E1 (q+1) (k+2) (by omega),
   central_square_formulaM6E1 q (k+2) (by omega)]
 unfold centralValM6E1
 rw [show 2*(k+2)-2=2*k+2 by omega,show k+2-2=k by omega,
   show 2*(k+2)-1=2*k+3 by omega]
 simp only [Nat.add_assoc]
 ring

theorem central_two_lowM6E1 (q i : ℕ) (hi : i ≤ 1) :
 coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) i (q+1)=0 := by
 have hc : coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) i (q+1)=
   coeff (fib6 (q+2)^2) i (q+1)+coeff (fib6 (q+1)^2) i q := by
   simp [coeff,V,Polynomial.coeff_X_mul]
 rw [hc,show q+2=(q+1)+1 by omega,central_square_lowM6E1 _ _ hi,
   central_square_lowM6E1 _ _ hi,add_zero]

theorem central_two_fullM6E1 (q i : ℕ) :
 let P := fib6 (q+2)^2+V*fib6 (q+1)^2
 coeff P i (q+1)*coeff P (i+2) (q+1) ≤ coeff P (i+1) (q+1)^2 := by
 dsimp only
 by_cases hi : i ≤ 1
 · rw [central_two_lowM6E1 _ _ hi,zero_mul]
   exact sq_nonneg _
 · obtain ⟨k,rfl⟩ : ∃ k, i=k+2 := ⟨i-2,by omega⟩
   rw [central_two_formulaM6E1,
     show k+2+2=(k+2)+2 by omega,central_two_formulaM6E1,
     show k+2+1=(k+1)+2 by omega,central_two_formulaM6E1]
   exact central_lcM6E1 (q+1) k

theorem source_two_rowM6E1 (path : List Bool) (j i : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,hq,hb',hp⟩ := source_two_squares3556 path ha
 have he : q=j := by omega
 subst q
 obtain ⟨k,rfl⟩ : ∃ k, j=k+1 := ⟨j-1,by omega⟩
 rw [hp]
 simpa only [Nat.add_assoc] using central_two_fullM6E1 k i

theorem source_two_row_formulaM6E1 (path : List Bool) (j k : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1) :
 coeff (frame path).mid.p (k+2) j=centralValM6E1 j k := by
 obtain ⟨q,hq,hb',hp⟩ := source_two_squares3556 path ha
 have he : q=j := by omega
 subst q
 obtain ⟨r,rfl⟩ : ∃ r, j=r+1 := ⟨j-1,by omega⟩
 rw [hp]
 simpa only [Nat.add_assoc] using central_two_formulaM6E1 r k

end
end MathGKM.Markov
