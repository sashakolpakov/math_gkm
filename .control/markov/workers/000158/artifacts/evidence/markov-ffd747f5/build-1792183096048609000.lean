import MarkovCross774
/-! Machine-authored ffd747f5. A degree-five residual family with interval
support and raw log-concavity. Source identification is a separate theorem. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def fifthCoeffMFFD {R : Type*} [Field R] (d : R) : ℕ → R
 | 0 => 560
 | 1 => 3030+406*d
 | 2 => 7140+1684*d+100*d^2
 | 3 => 8652+(8338/3)*d+298*d^2+(32/3)*d^3
 | 4 => 5280+(6269/3)*d+(619/2)*d^2+(61/3)*d^3+d^4/2
 | 5 => 1287+(11899/20)*d+(2629/24)*d^2+(241/24)*d^3+(11/24)*d^4+d^5/120
 | _ => 0

def fifthPolyMFFD {R : Type*} [Field R] (d : R) : Polynomial R :=
 C (fifthCoeffMFFD d 0)*X^0+C (fifthCoeffMFFD d 1)*X^1+
 C (fifthCoeffMFFD d 2)*X^2+C (fifthCoeffMFFD d 3)*X^3+
 C (fifthCoeffMFFD d 4)*X^4+C (fifthCoeffMFFD d 5)*X^5

theorem fifth_coeffMFFD {R : Type*} [Field R] (d : R) (k : ℕ) :
 (fifthPolyMFFD d).coeff k=fifthCoeffMFFD d k := by
 rcases k with _|_|_|_|_|_|k
 all_goals simp [fifthPolyMFFD,fifthCoeffMFFD,Polynomial.coeff_C_mul_X_pow]

theorem fifth_mapMFFD (d : ℚ) :
 (fifthPolyMFFD d).map (Rat.castHom ℝ)=fifthPolyMFFD (d:ℝ) := by
 simp [fifthPolyMFFD,fifthCoeffMFFD]

theorem fifth_positiveMFFD (d : ℝ) (hd : 0 ≤ d) (k : ℕ) (hk : k ≤ 5) :
 0 < fifthCoeffMFFD d k := by
 interval_cases k <;> simp only [fifthCoeffMFFD] <;> positivity

theorem fifth_zeroMFFD {R : Type*} [Field R] (d : R) (k : ℕ) (hk : 5 < k) :
 fifthCoeffMFFD d k=0 := by
 rcases k with _|_|_|_|_|_|k <;> simp_all [fifthCoeffMFFD]

theorem fifth_adjacentMFFD (d : ℝ) (hd : 0 ≤ d) (k : ℕ) (hk : k ≤ 3) :
 fifthCoeffMFFD d k*fifthCoeffMFFD d (k+2) ≤ fifthCoeffMFFD d (k+1)^2 := by
 apply sub_nonneg.mp
 interval_cases k <;> simp only [fifthCoeffMFFD]
 all_goals ring_nf; positivity

theorem fifth_crossMFFD (d : ℝ) (hd : 0 ≤ d) :
 CrossLC (CoeffSeq (fifthPolyMFFD d)) := by
 let f := CoeffSeq (fifthPolyMFFD d)
 have hz (k : ℤ) (hk : k<0 ∨ 5<k) : f k=0 := by
   dsimp [f,CoeffSeq]
   rcases hk with hk|hk
   · rw [if_pos hk]
   · rw [if_neg (by omega),fifth_coeffMFFD,fifth_zeroMFFD d _ (by omega)]
 have hp (k : ℤ) (hk0 : 0 ≤ k) (hk5 : k ≤ 5) : 0 < f k := by
   dsimp [f,CoeffSeq]
   rw [if_neg (by omega),fifth_coeffMFFD]
   exact fifth_positiveMFFD d hd _ (by omega)
 have hn (k : ℤ) : 0 ≤ f k := by
   by_cases h0 : 0 ≤ k
   · by_cases h5 : k ≤ 5
     · exact (hp k h0 h5).le
     · rw [hz k (Or.inr (by omega))]
   · rw [hz k (Or.inl (by omega))]
 apply crossLC_of_adjacent_interval774 f hn
 · intro k
   by_cases h0 : k ≤ 0
   · rw [hz (k-1) (Or.inl (by omega)),zero_mul]
     exact sq_nonneg _
   by_cases h5 : 5 ≤ k
   · rw [hz (k+1) (Or.inr (by omega)),mul_zero]
     exact sq_nonneg _
   have hh := fifth_adjacentMFFD d hd (k-1).toNat (by omega)
   dsimp [f,CoeffSeq]
   simp only [show ¬k-1<0 by omega,show ¬k<0 by omega,show ¬k+1<0 by omega,
     if_false,fifth_coeffMFFD]
   convert hh using 1 <;> congr 1 <;> omega
 · intro i k j hik hkj hi hj
   have hi0 : 0 ≤ i := by
     by_contra h
     rw [hz i (Or.inl (by omega))] at hi
     linarith
   have hj5 : j ≤ 5 := by
     by_contra h
     rw [hz j (Or.inr (by omega))] at hj
     linarith
   exact hp k (by omega) (by omega)

end
end MathGKM.Markov
