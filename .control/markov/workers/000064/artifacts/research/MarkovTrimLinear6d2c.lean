import MarkovAlignedLC6d2c
import MarkovWindowLC6d34
/-! Machine-authored 6d2c5a67. A head-trimming preservation lemma used
for aligned interval aggregation. All zero entries are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def trimSeq6d (f : ℤ → ℝ) (c : ℝ) (k : ℤ) : ℝ :=
 if k ≤ 0 then 0 else if k=1 then c else f k

theorem trimSeq_nonneg6d (f : ℤ → ℝ) (c : ℝ)
 (hf : ∀ k,0 ≤ f k) (hc : 0 ≤ c) (k : ℤ) : 0 ≤ trimSeq6d f c k := by
 unfold trimSeq6d
 split_ifs <;> first | exact le_rfl | exact hc | exact hf k

theorem crossLC_trimSeq6d (f : ℤ → ℝ) (c : ℝ)
 (hf : CrossLC f) (hn : ∀ k,0 ≤ f k) (hc : 0 ≤ c) (hcf : c ≤ f 1) :
 CrossLC (trimSeq6d f c) := by
 intro i j hij
 by_cases hi : i ≤ 0
 · rw [show trimSeq6d f c i=0 by simp [trimSeq6d,hi],zero_mul]
   exact mul_nonneg (trimSeq_nonneg6d f c hn hc _) (trimSeq_nonneg6d f c hn hc _)
 by_cases hi1 : i=1
 · subst i
   by_cases hj : j=1
   · subst j; simp [mul_comm]
   have h := (mul_le_mul_of_nonneg_right hcf (hn (j+1))).trans (hf 1 j hij)
   simpa [trimSeq6d,show ¬j ≤ 0 by omega,show ¬j+1 ≤ 0 by omega,
     hj,show j+1≠1 by omega] using h
 · simpa [trimSeq6d,hi,hi1,show ¬i+1 ≤ 0 by omega,show i+1≠1 by omega,
     show ¬j ≤ 0 by omega,show j≠1 by omega,show ¬j+1 ≤ 0 by omega,
     show j+1≠1 by omega] using hf i j hij

theorem coeffSeq_trim6d (p : ℝ[X]) (D : ℝ) :
 CoeffSeq (p-C (p.coeff 0)-C D*X)=trimSeq6d (CoeffSeq p) (p.coeff 1-D) := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,trimSeq6d,hk,show k ≤ 0 by omega]
 lift k to ℕ using (show 0 ≤ k by omega)
 by_cases h0 : k=0
 · subst k; simp [CoeffSeq,trimSeq6d]
 by_cases h1 : k=1
 · subst k; simp [CoeffSeq,trimSeq6d]
 simp [CoeffSeq,trimSeq6d,h0,h1,Ne.symm h1,hk,Polynomial.coeff_sub,Polynomial.coeff_C,
   Polynomial.coeff_C_mul,Polynomial.coeff_X,show ¬(k:ℤ) ≤ 0 by omega]

theorem crossLC_trim_poly6d (p : ℝ[X]) (D : ℝ)
 (hp : CrossLC (CoeffSeq p)) (hn : ∀ k,0 ≤ p.coeff k)
 (hD : 0 ≤ D) (hDp : D ≤ p.coeff 1) :
 CrossLC (CoeffSeq (p-C (p.coeff 0)-C D*X)) := by
 rw [coeffSeq_trim6d]
 apply crossLC_trimSeq6d _ _ hp (coeffSeq_nonneg6d34 p hn) (by linarith)
 simpa [CoeffSeq] using (show p.coeff 1-D ≤ p.coeff 1 by linarith)

theorem trimmed_binomial_cross6d (N : ℕ) (C D : ℝ)
 (hC : 0 ≤ C) (hD : 0 ≤ D) (h : D ≤ N+C) :
 CrossLC (CoeffSeq ((1+X)^N*(1+Polynomial.C C*X)-1-Polynomial.C D*X)) := by
 let p : ℝ[X] := (1+X)^N*(1+Polynomial.C C*X)
 have hp : CrossLC (CoeffSeq p) := by
   simpa [p] using linear_binomial_cross6d 0 N 1 C (by norm_num) hC
 have hn : ∀ k,0 ≤ p.coeff k := by
   apply polyNN_mulFe01
   · intro k
     rw [Polynomial.coeff_one_add_X_pow]
     positivity
   · apply polyNN_addFe01 polyNN_oneFe01
     apply polyNN_mulFe01 _ polyNN_XFe01
     intro k
     simp only [Polynomial.coeff_C]
     split_ifs <;> first | exact hC | exact le_rfl
 have h0 : p.coeff 0=1 := by simp [p,Polynomial.coeff_one_add_X_pow]
 have h1 : p.coeff 1=(N:ℝ)+C := by
   simp [p,mul_add,←mul_assoc,Polynomial.coeff_add,Polynomial.coeff_mul_X,
     Polynomial.coeff_mul_C,Polynomial.coeff_one_add_X_pow]
 have hh := crossLC_trim_poly6d p D hp hn hD (by rwa [h1])
 simpa only [h0,map_one] using hh

#print axioms crossLC_trimSeq6d
#print axioms trimmed_binomial_cross6d
end
end MathGKM.Markov
