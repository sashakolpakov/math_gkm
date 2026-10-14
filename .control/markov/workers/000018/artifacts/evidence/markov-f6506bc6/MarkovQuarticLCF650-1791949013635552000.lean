import MarkovRightJetsF650
import MarkovTransfer774

/-! Machine-authored request f6506bc6. Positive quartic and exact smoothing.
No assertion for other source columns or other directions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def fiveSeq650 (a b c d e : ℝ) (k : ℤ) : ℝ :=
  if k=0 then a else if k=1 then b else if k=2 then c else if k=3 then d
  else if k=4 then e else 0

theorem five_cross650 (a b c d e : ℝ)
    (ha : 0<a) (hb : 0<b) (hc : 0<c) (hd : 0<d) (he : 0<e)
    (h1 : a*c≤b^2) (h2 : b*d≤c^2) (h3 : c*e≤d^2) :
    CrossLC (fiveSeq650 a b c d e) := by
  have hn (k : ℤ) : 0≤fiveSeq650 a b c d e k := by
    unfold fiveSeq650; split_ifs <;> positivity
  have hz (k : ℤ) (h : k<0 ∨ 4<k) : fiveSeq650 a b c d e k=0 := by
    unfold fiveSeq650; split_ifs <;> omega
  apply crossLC_of_adjacent_interval774 _ hn
  · intro k
    by_cases hk : 0≤k ∧ k≤4
    · obtain ⟨hl,hu⟩ := hk
      interval_cases k <;> norm_num [fiveSeq650] <;> assumption
    · by_cases hl : k<0
      · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
      · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _
  · intro i k j hik hkj hi hj
    have h0 : 0≤i := by by_contra h; rw [hz i (Or.inl (by omega))] at hi; linarith
    have h4 : j≤4 := by by_contra h; rw [hz j (Or.inr (by omega))] at hj; linarith
    have hk0 : 0≤k := by omega
    have hk4 : k≤4 := by omega
    interval_cases k <;> simp [fiveSeq650] <;> assumption

theorem five_coeff650 (a b c d e : ℝ) :
    CoeffSeq (C a+C b*X+C c*X^2+C d*X^3+C e*X^4)=fiveSeq650 a b c d e := by
  funext k
  by_cases hk : k<0
  · simp [CoeffSeq,hk,fiveSeq650,show k≠0 by omega,show k≠1 by omega,
      show k≠2 by omega,show k≠3 by omega,show k≠4 by omega]
  · lift k to ℕ using (show 0≤k by omega)
    by_cases hl : k≤4
    · interval_cases k <;> norm_num [CoeffSeq,fiveSeq650,Polynomial.coeff_C_mul_X_pow]
    · simp [CoeffSeq,fiveSeq650,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,
        show k≠0 by omega,show k≠1 by omega,show k≠2 by omega,show k≠3 by omega,
        show k≠4 by omega,show (k:ℤ)≠0 by omega,show (k:ℤ)≠1 by omega,
        show (k:ℤ)≠2 by omega,show (k:ℤ)≠3 by omega,show (k:ℤ)≠4 by omega]

theorem right_residual_cross650 (n : ℕ) :
    CrossLC (CoeffSeq ((rightR650 (n+5)).map (Int.castRingHom ℝ))) := by
  have he : (rightR650 (n+5)).map (Int.castRingHom ℝ)=
      C 16+C (32*(n:ℝ)+144)*X+C (9*(n:ℝ)^2+119*n+344)*X^2+
      C (12*(n:ℝ)^2+122*n+304)*X^3+C (4*(n:ℝ)^2+38*n+90)*X^4 := by
    simp [rightR650]; push_cast; ring
  rw [he,five_coeff650]
  apply five_cross650 <;> try positivity
  · have h : 0≤880*(n:ℝ)^2+7312*n+15232 := by positivity
    nlinarith
  · have h : 0≤81*(n:ℝ)^4+1758*n^3+14721*n^2+54576*n+74560 := by positivity
    nlinarith
  · have h : 0≤108*(n:ℝ)^4+2110*n^3+15472*n^2+50394*n+61456 := by positivity
    nlinarith

theorem right_large_vertical_two650 (n j : ℕ) :
    coeff (rightP650 (n+4)) 2 j*coeff (rightP650 (n+4)) 2 (j+2)≤
      coeff (rightP650 (n+4)) 2 (j+1)^2 := by
  have he := congrArg (Polynomial.map (Int.castRingHom ℝ)) (right_jets650 n).2.2
  simp only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,
    Polynomial.map_X,Polynomial.map_add,Polynomial.map_one] at he
  have h := crossLC_pascal (right_residual_cross650 n) n
  rw [← coeffSeq_binomial_mul] at h
  have hs := crossLC_X_pow_mul46 _ h (n+4)
  rw [← mul_assoc,add_comm (1:Polynomial ℝ) X,← he] at hs
  have hh := crossLC_adjacent hs ((j:ℤ)+1)
  have h0 : (j:ℤ)+1-1=(j:ℤ) := by omega
  have h2 : (j:ℤ)+1+1=((j+2:ℕ):ℤ) := by omega
  have h1 : (j:ℤ)+1=((j+1:ℕ):ℤ) := by omega
  rw [h0,h2,h1] at hh
  simp only [coeffSeq_nat774,Polynomial.coeff_ofNat_mul,Polynomial.coeff_map] at hh
  have hi : (2*coeff (rightP650 (n+4)) 2 j)*(2*coeff (rightP650 (n+4)) 2 (j+2))≤
      (2*coeff (rightP650 (n+4)) 2 (j+1))^2 := by exact_mod_cast hh
  nlinarith

#print axioms five_cross650
#print axioms right_residual_cross650
#print axioms right_large_vertical_two650
end
end MathGKM.Markov
