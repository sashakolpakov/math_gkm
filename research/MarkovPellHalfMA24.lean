import MarkovPellOrderMA24
import MarkovPellRowMA24
/-! Machine-authored a24fe23d. Uniform ordered half of the midpoint criterion.
The opposite ordering and summation theorem remain separate obligations. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem pell_order_globalMA24 (a j s q r : ℕ) (hqr : q ≤ r) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+1) r ≤
 pellTermMA24 a j s r*pellTermMA24 a j (s+1) q := by
 obtain ⟨d,rfl⟩ := Nat.exists_eq_add_of_le hqr
 induction d with
 | zero => simp
 | succ d ih =>
   by_cases h0 : pellTermMA24 a j s q=0
   · rw [h0,zero_mul]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
   by_cases h1 : pellTermMA24 a j (s+1) (q+(d+1))=0
   · rw [h1,mul_zero]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
   have hp0 := (pell_term_posMA24 a j s q).mp
     (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h0))
   have hp1 := (pell_term_posMA24 a j (s+1) (q+(d+1))).mp
     (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h1))
   have hp : 0 < pellTermMA24 a j s (q+d) := (pell_term_posMA24 _ _ _ _).mpr (by omega)
   have hm := pell_rr2MA24 a j s (q+d)
   have hm' := mul_le_mul_of_nonneg_left hm (pell_term_nonnegMA24 a j s q)
   have hi' := mul_le_mul_of_nonneg_right (ih (by omega)) (pell_term_nonnegMA24 a j s (q+d+1))
   have hh : pellTermMA24 a j s (q+d)*
       (pellTermMA24 a j s q*pellTermMA24 a j (s+1) (q+(d+1))) ≤
       pellTermMA24 a j s (q+d)*
       (pellTermMA24 a j s (q+(d+1))*pellTermMA24 a j (s+1) q) := by
     simp only [Nat.add_assoc] at hm' hi' ⊢
     nlinarith only [hm',hi']
   exact (mul_le_mul_iff_right₀ hp).mp (by nlinarith only [hh])

theorem pell_parameter_lcMA24 (a j s q : ℕ) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+2) q ≤ pellTermMA24 a j (s+1) q^2 := by
 unfold pellTermMA24
 exact_mod_cast horizontal_term_lc9a72 a j q s

theorem pell_ordered_productMA24 (a j s q r : ℕ) (hqr : q ≤ r) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+2) r ≤
 pellTermMA24 a j (s+1) q*pellTermMA24 a j (s+1) r := by
 by_cases h0 : pellTermMA24 a j s q=0
 · rw [h0,zero_mul]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
 by_cases h1 : pellTermMA24 a j (s+2) r=0
 · rw [h1,mul_zero]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
 have hp0 := (pell_term_posMA24 a j s q).mp
   (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h0))
 have hp1 := (pell_term_posMA24 a j (s+2) r).mp
   (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h1))
 have hp : 0 < pellTermMA24 a j (s+1) r := (pell_term_posMA24 _ _ _ _).mpr (by omega)
 have hm := pell_order_globalMA24 a j s q r hqr
 have hl := pell_parameter_lcMA24 a j s r
 have hleft := mul_le_mul_of_nonneg_right hm (pell_term_nonnegMA24 a j (s+2) r)
 have hright := mul_le_mul_of_nonneg_left hl (pell_term_nonnegMA24 a j (s+1) q)
 have hh : pellTermMA24 a j (s+1) r*
     (pellTermMA24 a j s q*pellTermMA24 a j (s+2) r) ≤
     pellTermMA24 a j (s+1) r*
     (pellTermMA24 a j (s+1) q*pellTermMA24 a j (s+1) r) := by
   nlinarith only [hleft,hright]
 exact (mul_le_mul_iff_right₀ hp).mp (by nlinarith only [hh])

theorem pell_half_midpointMA24 (a j s q r : ℕ) (hqr : q ≤ r) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+2) r ≤
 pellTermMA24 a j (s+1) ((q+r)/2)*pellTermMA24 a j (s+1) ((q+r+1)/2) :=
 le_trans (pell_ordered_productMA24 a j s q r hqr)
   (pell_row_midpointMA24 a j (s+1) q r)

end
end MathGKM.Markov
