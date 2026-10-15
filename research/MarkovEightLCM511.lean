import MarkovHorizontalLCM13D
/-! Machine-authored request 5110b3fa. Eight-term CrossLC with explicit
interval support; leading zeros are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def eightSeqM511 (a b c d e f g h : ℝ) (k : ℤ) :=
 if k=0 then a else if k=1 then b else if k=2 then c else if k=3 then d
 else if k=4 then e else if k=5 then f else if k=6 then g else if k=7 then h else 0

theorem eight_crossM511 (a b c d e f g h : ℝ)
 (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hd : 0<d) (he : 0<e)
 (hf : 0<f) (hg : 0<g) (hh : 0<h) (hab : a ≤ b) (hbc : b ≤ c)
 (h1 : a*c ≤ b^2) (h2 : b*d ≤ c^2) (h3 : c*e ≤ d^2)
 (h4 : d*f ≤ e^2) (h5 : e*g ≤ f^2) (h6 : f*h ≤ g^2) :
 CrossLC (eightSeqM511 a b c d e f g h) := by
 have hn (k : ℤ) : 0 ≤ eightSeqM511 a b c d e f g h k := by
   unfold eightSeqM511; split_ifs <;> positivity
 have hz (k : ℤ) (hk : k<0 ∨ 7<k) : eightSeqM511 a b c d e f g h k=0 := by
   unfold eightSeqM511; split_ifs <;> first | omega | rfl
 apply crossLC_of_adjacent_interval774 _ hn
 · intro k
   by_cases hk : 0 ≤ k ∧ k ≤ 7
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k <;> norm_num [eightSeqM511] <;> first | assumption | positivity
   · by_cases hl : k<0
     · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
     · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _
 · intro i k j hik hkj hi hj
   have h0 : 0 ≤ i := by by_contra hi0; rw [hz i (Or.inl (by omega))] at hi; linarith
   have h7 : j ≤ 7 := by by_contra hj7; rw [hz j (Or.inr (by omega))] at hj; linarith
   have hk0 : 0 ≤ k := by omega
   have hk7 : k ≤ 7 := by omega
   interval_cases k
   · have ei : i=0 := by omega
     simpa [ei] using hi
   · have hi1 : i=0 ∨ i=1 := by omega
     rcases hi1 with rfl|rfl
     · norm_num [eightSeqM511] at hi ⊢; linarith
     · simpa using hi
   · have hi2 : i=0 ∨ i=1 ∨ i=2 := by omega
     rcases hi2 with rfl|rfl|rfl
     · norm_num [eightSeqM511] at hi ⊢; linarith
     · norm_num [eightSeqM511] at hi ⊢; linarith
     · simpa using hi
   all_goals norm_num [eightSeqM511]; assumption

theorem eight_coeffM511 (a b c d e f g h : ℝ) :
 CoeffSeq (C a+C b*X+C c*X^2+C d*X^3+C e*X^4+C f*X^5+C g*X^6+C h*X^7)=
 eightSeqM511 a b c d e f g h := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,hk,eightSeqM511,show k≠0 by omega,show k≠1 by omega,
     show k≠2 by omega,show k≠3 by omega,show k≠4 by omega,show k≠5 by omega,
     show k≠6 by omega,show k≠7 by omega]
 · lift k to ℕ using (show 0 ≤ k by omega)
   rw [coeffSeq_nat774]
   by_cases hl : k ≤ 7
   · interval_cases k <;> norm_num [eightSeqM511,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X]
   · simp [eightSeqM511,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X,
       show k≠0 by omega,show k≠1 by omega,show 1≠k by omega,show k≠2 by omega,
       show k≠3 by omega,show k≠4 by omega,show k≠5 by omega,show k≠6 by omega,show k≠7 by omega,
       show (k:ℤ)≠0 by omega,show (k:ℤ)≠1 by omega,show (k:ℤ)≠2 by omega,
       show (k:ℤ)≠3 by omega,show (k:ℤ)≠4 by omega,show (k:ℤ)≠5 by omega,
       show (k:ℤ)≠6 by omega,show (k:ℤ)≠7 by omega]

end
end MathGKM.Markov
