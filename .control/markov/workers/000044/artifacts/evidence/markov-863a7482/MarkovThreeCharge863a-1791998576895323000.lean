import MarkovDistanceFiber863a
/-! Machine-authored 863a7482. Aggregation of three consecutive charge
classes. This is not closure under an unrestricted charge sum. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem three_product_bound863 (x y z b c : ℤ)
 (hb : 0 ≤ b) (hx : x ≤ c) (hy : y ≤ c) (hz : z ≤ c)
 (hxy : x*y ≤ b^2) (hxz : x*z ≤ b*c) (hyz : y*z ≤ b*c) :
 x+y+z ≤ c+2*b := by
 by_cases hxb : x ≤ b
 · by_cases hyb : y ≤ b
   · linarith
   · have hyp : 0 < y := by linarith
     have hp := mul_nonneg (show 0 ≤ y-b by linarith) (show 0 ≤ b+c-y by linarith)
     have ht : 0 ≤ y*(c+2*b-x-y-z) := by nlinarith
     have := (mul_nonneg_iff_of_pos_left hyp).mp ht
     linarith
 · have hxp : 0 < x := by linarith
   have hp := mul_nonneg (show 0 ≤ x-b by linarith) (show 0 ≤ b+c-x by linarith)
   have ht : 0 ≤ x*(c+2*b-x-y-z) := by nlinarith
   have := (mul_nonneg_iff_of_pos_left hxp).mp ht
   linarith

theorem horizontal_three_mixed863 (a j q s : ℕ) :
 horizontalTerm9a72 a j q s*horizontalTerm9a72 a j (q+2) (s+2)+
 horizontalTerm9a72 a j (q+1) s*horizontalTerm9a72 a j (q+1) (s+2)+
 horizontalTerm9a72 a j (q+2) s*horizontalTerm9a72 a j q (s+2) ≤
 horizontalTerm9a72 a j (q+1) (s+1)^2+
 2*horizontalTerm9a72 a j q (s+1)*horizontalTerm9a72 a j (q+2) (s+1) := by
 have hn (k t : ℕ) : 0 ≤ horizontalTerm9a72 a j k t := by
   unfold horizontalTerm9a72
   split_ifs <;> positivity
 have h00 := horizontal_term_lc9a72 a j q s
 have h11 := horizontal_term_lc9a72 a j (q+1) s
 have h22 := horizontal_term_lc9a72 a j (q+2) s
 obtain ⟨h01,h10⟩ := horizontal_adjacent_pairs67 a j q s
 obtain ⟨h12,h21⟩ := horizontal_adjacent_pairs67 a j (q+1) s
 simp only [show q+1+1=q+2 by omega] at h12 h21
 have h02 := horizontal_forward_two863 a j q s
 have h20 := horizontal_reverse_two863 a j q s
 have hxy := mul_le_mul h00 h22 (mul_nonneg (hn _ _) (hn _ _)) (sq_nonneg _)
 have hxz := mul_le_mul h01 h12 (mul_nonneg (hn _ _) (hn _ _))
   (mul_nonneg (hn _ _) (hn _ _))
 have hyz := mul_le_mul h21 h10 (mul_nonneg (hn _ _) (hn _ _))
   (mul_nonneg (hn _ _) (hn _ _))
 have ht := three_product_bound863
   (horizontalTerm9a72 a j q s*horizontalTerm9a72 a j (q+2) (s+2))
   (horizontalTerm9a72 a j (q+2) s*horizontalTerm9a72 a j q (s+2))
   (horizontalTerm9a72 a j (q+1) s*horizontalTerm9a72 a j (q+1) (s+2))
   (horizontalTerm9a72 a j q (s+1)*horizontalTerm9a72 a j (q+2) (s+1))
   (horizontalTerm9a72 a j (q+1) (s+1)^2)
   (mul_nonneg (hn _ _) (hn _ _)) h02 h20 h11
   (by nlinarith only [hxy]) (by nlinarith only [hxz]) (by nlinarith only [hyz])
 nlinarith only [ht]

def threeFiber863 (a j q s : ℕ) : Polynomial ℤ :=
 monomial q (horizontalTerm9a72 a j q s)+
 monomial (q+1) (horizontalTerm9a72 a j (q+1) s)+
 monomial (q+2) (horizontalTerm9a72 a j (q+2) s)

theorem three_fiber_gap863 (a j q s k : ℕ) :
 0 ≤ ((threeFiber863 a j q (s+1))^2-
   threeFiber863 a j q s*threeFiber863 a j q (s+2)).coeff k := by
 have h0 := horizontal_term_lc9a72 a j q s
 have h1 := horizontal_adjacent_mixed67 a j q s
 have h2 := horizontal_three_mixed863 a j q s
 have h3 := horizontal_adjacent_mixed67 a j (q+1) s
 have h4 := horizontal_term_lc9a72 a j (q+2) s
 simp only [show q+1+1=q+2 by omega] at h3
 simp only [threeFiber863,pow_two,add_mul,mul_add,Polynomial.coeff_sub,
   Polynomial.coeff_add,Polynomial.monomial_mul_monomial,Polynomial.coeff_monomial]
 split_ifs <;> first | omega | nlinarith

#print axioms three_product_bound863
#print axioms horizontal_three_mixed863
#print axioms three_fiber_gap863
end
end MathGKM.Markov
