import MarkovLowerLCMAF6
/-! Machine-authored af6200bf. An actual-source upper-row obstruction to a
different summand certificate. It does not refute raw coefficient log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 2000

def fibCoeffMAF6 (n i j : ℕ) : ℤ :=
 if i=0 then if j=n then 1 else 0
 else if j<n then ((n-j-1).choose (i-1):ℤ)*((j+i).choose i:ℤ) else 0

theorem fib_coeff_allMAF6 (n i j : ℕ) : coeff (fib6 n) i j=fibCoeffMAF6 n i j := by
 by_cases hi : i=0
 · subst i
   change ((fib6 n).coeff 0).coeff j= _
   rw [fib_zero_jet3556,Polynomial.coeff_X_pow]
   simp [fibCoeffMAF6]
 · by_cases hj : j<n
   · simpa [fibCoeffMAF6,hi,hj] using fib_globalM6E1 n i j (by omega) hj
   · rw [(fib_degree6 n) i j (by omega)]
     simp [fibCoeffMAF6,hi,hj]

def squareSummandMAF6 (q j i h : ℕ) : ℤ :=
 if h ≤ i then
  (∑ t∈range (j+1),fibCoeffMAF6 (q+1) h t*fibCoeffMAF6 (q+1) (i-h) (j-t))+
  (if j=0 then 0 else ∑ t∈range j,fibCoeffMAF6 q h t*fibCoeffMAF6 q (i-h) (j-1-t))
 else 0

theorem fib_square_sumMAF6 (n i j : ℕ) :
 coeff (fib6 n^2) i j=∑ h∈range (i+1),∑ t∈range (j+1),
 fibCoeffMAF6 n h t*fibCoeffMAF6 n (i-h) (j-t) := by
 rw [pow_two,bicoeff_mulM3A1,sum_comm]
 simp only [fib_coeff_allMAF6]

theorem square_summand_formulaMAF6 (q i j : ℕ) :
 coeff (fib6 (q+1)^2+V*fib6 q^2) i j=
 ∑ h∈range (i+1),squareSummandMAF6 q j i h := by
 cases j with
 | zero =>
   have he : coeff (fib6 (q+1)^2+V*fib6 q^2) i 0=coeff (fib6 (q+1)^2) i 0 := by
     simp [coeff,V,Polynomial.coeff_X_mul]
   rw [he,fib_square_sumMAF6]
   apply sum_congr rfl
   intro h hh
   simp [squareSummandMAF6,show h ≤ i by have := mem_range.mp hh; omega]
 | succ j =>
   have he : coeff (fib6 (q+1)^2+V*fib6 q^2) i (j+1)=
     coeff (fib6 (q+1)^2) i (j+1)+coeff (fib6 q^2) i j := by
     simp [coeff,V,Polynomial.coeff_X_mul]
   rw [he,fib_square_sumMAF6,fib_square_sumMAF6,←sum_add_distrib]
   apply sum_congr rfl
   intro h hh
   simp [squareSummandMAF6,show h ≤ i by have := mem_range.mp hh; omega]

theorem square_summand_failsMAF6 :
 squareSummandMAF6 7 8 2 1*squareSummandMAF6 7 8 2 0 <
 squareSummandMAF6 7 8 1 0*squareSummandMAF6 7 8 3 1 := by
 norm_num [squareSummandMAF6,fibCoeffMAF6,Finset.sum_range_succ,Nat.choose_two_right]

theorem square_obstruction_sourceMAF6 :
 let m := (frame (lowerPathM58E 7 0)).mid
 m.a=2 ∧ m.b=15 ∧ InPolygon m.a m.b 1 8 ∧ InPolygon m.a m.b 2 8 ∧
 InPolygon m.a m.b 3 8 ∧ coeff m.p 1 8=4 ∧ coeff m.p 2 8=277 ∧ coeff m.p 3 8=3378 ∧
 coeff m.p 1 8*coeff m.p 3 8 ≤ coeff m.p 2 8^2 := by
 dsimp only
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E 7 0 (by omega)
 obtain ⟨q,hq,hq',hp⟩ := source_two_squares3556 (lowerPathM58E 7 0) ha
 have he : q=7 := by omega
 subst q
 rw [ha,hb,hp,square_summand_formulaMAF6,square_summand_formulaMAF6,square_summand_formulaMAF6]
 norm_num [InPolygon,squareSummandMAF6,fibCoeffMAF6,Finset.sum_range_succ,Nat.choose_two_right]

end
end MathGKM.Markov
