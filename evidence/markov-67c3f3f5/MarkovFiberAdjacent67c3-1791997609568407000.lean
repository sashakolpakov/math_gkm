import MarkovSummandPairs67c3
/-! Machine-authored 67c3f3f5. Adjacent charge comparison for the exact
source horizontal summands, with all support boundaries retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem horizontal_adjacent_pairs67 (a j q s : ℕ) :
 horizontalTerm9a72 a j q s*horizontalTerm9a72 a j (q+1) (s+2) ≤
   horizontalTerm9a72 a j q (s+1)*horizontalTerm9a72 a j (q+1) (s+1) ∧
 horizontalTerm9a72 a j (q+1) s*horizontalTerm9a72 a j q (s+2) ≤
   horizontalTerm9a72 a j (q+1) (s+1)*horizontalTerm9a72 a j q (s+1) := by
 by_cases hqj : q+1 ≤ j
 · by_cases hqa : q+1 ≤ a
   · have h1 := binomial_pair_first67 (a-q-1) (s+1) q (j-q-1) (by omega)
     have h2 := binomial_pair_second67 (a-q-1) (s+1) q (j-q-1) (by omega)
     have e1 : a-q=a-q-1+1 := by omega
     have e2 : a-(q+1)=a-q-1 := by omega
     have e3 : j-q=j-q-1+1 := by omega
     have e4 : j-(q+1)=j-q-1 := by omega
     constructor
     · have hh :
         (horizontalTerm9a72 a j q s : ℚ)*horizontalTerm9a72 a j (q+1) (s+2) ≤
         (horizontalTerm9a72 a j q (s+1) : ℚ)*horizontalTerm9a72 a j (q+1) (s+1) := by
         simp only [horizontalTerm9a72,if_pos hqj,if_pos (show q ≤ j by omega),
           Int.cast_mul,Int.cast_natCast,e2,e4]
         convert h1 using 1 <;> congr 6 <;> omega
       exact_mod_cast hh
     · have hh :
         (horizontalTerm9a72 a j (q+1) s : ℚ)*horizontalTerm9a72 a j q (s+2) ≤
         (horizontalTerm9a72 a j (q+1) (s+1) : ℚ)*horizontalTerm9a72 a j q (s+1) := by
         simp only [horizontalTerm9a72,if_pos hqj,if_pos (show q ≤ j by omega),
           Int.cast_mul,Int.cast_natCast,e2,e4]
         convert h2 using 1 <;> congr 6 <;> omega
       exact_mod_cast hh
   · have he : a-(q+1)=0 := by omega
     simp [horizontalTerm9a72,hqj,show q ≤ j by omega,he]
 · have hz (k : ℕ) : horizontalTerm9a72 a j (q+1) k=0 := by
     simp [horizontalTerm9a72,hqj]
   simp only [hz,mul_zero,zero_mul,le_refl,and_self]

theorem horizontal_adjacent_mixed67 (a j q s : ℕ) :
 horizontalTerm9a72 a j q s*horizontalTerm9a72 a j (q+1) (s+2)+
 horizontalTerm9a72 a j (q+1) s*horizontalTerm9a72 a j q (s+2) ≤
 2*horizontalTerm9a72 a j q (s+1)*horizontalTerm9a72 a j (q+1) (s+1) := by
 obtain ⟨h1,h2⟩ := horizontal_adjacent_pairs67 a j q s
 nlinarith

def adjacentFiber67 (a j q s : ℕ) : Polynomial ℤ :=
 monomial q (horizontalTerm9a72 a j q s)+
 monomial (q+1) (horizontalTerm9a72 a j (q+1) s)

theorem adjacent_fiber_gap67 (a j q s : ℕ) (k : ℕ) :
 0 ≤ ((adjacentFiber67 a j q (s+1))^2-
   adjacentFiber67 a j q s*adjacentFiber67 a j q (s+2)).coeff k := by
 have h0 := horizontal_term_lc9a72 a j q s
 have h1 := horizontal_adjacent_mixed67 a j q s
 have h2 := horizontal_term_lc9a72 a j (q+1) s
 simp only [adjacentFiber67,pow_two,add_mul,mul_add,Polynomial.coeff_sub,
   Polynomial.coeff_add,Polynomial.monomial_mul_monomial,Polynomial.coeff_monomial]
 split_ifs <;> first | omega | nlinarith

theorem full_fiber_linear67 (n j s : ℕ) :
 0 ≤ ((horizontalFiberPoly9a72 n j (s+1))^2-
   horizontalFiberPoly9a72 n j s*horizontalFiberPoly9a72 n j (s+2)).coeff 1 := by
 rw [← truncated_zero65c4,← truncated_zero65c4,← truncated_zero65c4]
 rw [Polynomial.coeff_sub,pow_two,Polynomial.mul_coeff_one,Polynomial.mul_coeff_one]
 simp only [truncated_coeff65c4,show 0<n+2 by omega,show 1<n+2 by omega,
   Nat.zero_le,true_and,if_true]
 have h := horizontal_adjacent_mixed67 (n+1) j 0 s
 norm_num only [Nat.zero_add] at h
 nlinarith

#print axioms horizontal_adjacent_pairs67
#print axioms adjacent_fiber_gap67
#print axioms full_fiber_linear67
end
end MathGKM.Markov
