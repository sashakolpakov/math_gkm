import MarkovBlockAssembly274

/-! Machine-authored request 274e6973. Truncated arithmetic sequences. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def truncSeq274 (c t : ℝ) (q : ℕ) (k : ℤ) : ℝ :=
  if 0≤k ∧ k<q then c*(k+1) else if k=q then t else 0

theorem trunc_cross274 (c t : ℝ) (q : ℕ)
    (hc : 0<c) (ht : 0≤t) (hu : t≤c*(q+1)) : CrossLC (truncSeq274 c t q) := by
  have hz : ∀ k : ℤ, k<0 ∨ q<k → truncSeq274 c t q k=0 := by
    intro k hk; unfold truncSeq274; split_ifs <;> first | omega | rfl
  have hn : SeqNonneg (truncSeq274 c t q) := by
    intro k; unfold truncSeq274; split_ifs with h
    · have hk : (0:ℝ)≤k := by exact_mod_cast h.1
      positivity
    · exact ht
    · rfl
  apply crossLC_of_adjacent_interval774 _ hn
  · intro k
    by_cases hlo : k≤0
    · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
    by_cases hhi : q≤k
    · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _
    by_cases he : k+1=q
    · have her : (q:ℝ)=(k:ℝ)+1 := by exact_mod_cast he.symm
      have hk : (0:ℝ)≤k := by exact_mod_cast (show 0≤k by omega)
      simp only [truncSeq274,show 0≤k-1 ∧ k-1<q by omega,
        show 0≤k ∧ k<q by omega,show ¬(0≤k+1 ∧ k+1<q) by omega,
        he,if_true,if_false]
      simp only [and_self,lt_self_iff_false,and_false,if_false,if_true]
      push_cast
      rw [her] at hu
      nlinarith [mul_nonneg (show 0≤c*(k:ℝ) by positivity)
        (show 0≤c*((k:ℝ)+1+1)-t by linarith),sq_nonneg c]
    · simp only [truncSeq274,show 0≤k-1 ∧ k-1<q by omega,
        show 0≤k ∧ k<q by omega,show 0≤k+1 ∧ k+1<q by omega,if_true]
      push_cast
      nlinarith [sq_nonneg c]
  · intro i k j hik hkj hi hj
    have hi0 : 0≤i := by
      by_contra h; rw [hz i (Or.inl (by omega))] at hi; linarith
    have hjq : j≤q := by
      by_contra h; rw [hz j (Or.inr (by omega))] at hj; linarith
    by_cases he : k=q
    · have hej : j=k := by omega
      simpa [hej] using hj
    · have hk : (0:ℝ)≤k := by exact_mod_cast (show 0≤k by omega)
      rw [truncSeq274,if_pos (by omega)]
      positivity

def truncPoly274 (c t : ℝ) (q : ℕ) : Polynomial ℝ :=
  (∑ k ∈ Finset.range q, monomial k (c*(k+1)))+monomial q t

theorem trunc_coeff274 (c t : ℝ) (q : ℕ) :
    CoeffSeq (truncPoly274 c t q)=truncSeq274 c t q := by
  funext k
  by_cases hk : k<0
  · simp [CoeffSeq,hk,truncSeq274,show ¬0≤k by omega,show k≠q by omega]
  · lift k to ℕ using (show 0≤k by omega)
    simp only [CoeffSeq,show ¬(k:ℤ)<0 by omega,if_false,Int.toNat_natCast,
      truncPoly274,Polynomial.coeff_add,Polynomial.finsetSum_coeff,Polynomial.coeff_monomial]
    rw [Finset.sum_ite_eq']
    simp only [Finset.mem_range]
    by_cases hl : k<q
    · simp [truncSeq274,hl,show (k:ℤ)<q by omega,show q≠k by omega]
    · by_cases he : k=q
      · subst k; simp [truncSeq274]
      · simp [truncSeq274,hl,he,Ne.symm he,show ¬(k:ℤ)<q by omega,show (k:ℤ)≠q by omega]

theorem truncPoly_cross274 (c t : ℝ) (q s : ℕ)
    (hc : 0<c) (ht : 0≤t) (hu : t≤c*(q+1)) :
    CrossLC (CoeffSeq (X^s*truncPoly274 c t q)) := by
  apply crossLC_X_pow_mul46
  rw [trunc_coeff274]
  exact trunc_cross274 c t q hc ht hu

#print axioms truncPoly_cross274
end
end MathGKM.Markov
