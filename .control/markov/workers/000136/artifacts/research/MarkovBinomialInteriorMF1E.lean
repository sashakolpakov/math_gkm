import MarkovBinomialMixedMF1E
/-! Machine-authored f1e4fe3b. Nonnegative mixtures of translated binomial
rows are raw-log-concave in a quantitative interior region. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem binomial_mixed_interval_orderedMF1E (n k lo hi r s : ℕ)
 (hr : lo ≤ r) (hrs : r ≤ s) (hs : s ≤ hi)
 (hk : hi+(hi-lo)^2 ≤ k) (hn : k+2+(hi-lo)^2 ≤ n+lo) :
 (n.choose (k-r):ℝ)*(n.choose (k+2-s):ℝ)+
 (n.choose (k-s):ℝ)*(n.choose (k+2-r):ℝ) ≤ 2*(n.choose (k+1-r):ℝ)*(n.choose (k+1-s):ℝ) := by
 have hd : s-r ≤ hi-lo := by omega
 have hd2 : (s-r)^2 ≤ (hi-lo)^2 := Nat.pow_le_pow_left hd 2
 have hks : s ≤ k := by omega
 have hkr : k-r+2 ≤ n := by omega
 have ha : (s-r)^2 ≤ k-s := by omega
 have hb : (s-r)^2 ≤ n-(k-r+2) := by omega
 have h := binomial_mixedMF1E (k-s) (n-(k-r+2)) (s-r) ha hb
 dsimp only at h
 have en : k-s+(n-(k-r+2))+(s-r)+2=n := by omega
 have e0 : k-s+(s-r)=k-r := by omega
 have e1 : k-s+(s-r)+1=k+1-r := by omega
 have e2 : k-s+(s-r)+2=k+2-r := by omega
 have f1 : k-s+1=k+1-s := by omega
 have f2 : k-s+2=k+2-s := by omega
 rw [en,e2,e1,e0,f1,f2] at h
 exact h

theorem binomial_mixed_intervalMF1E (n k lo hi r s : ℕ)
 (hr : lo ≤ r) (hr' : r ≤ hi) (hs : lo ≤ s) (hs' : s ≤ hi)
 (hk : hi+(hi-lo)^2 ≤ k) (hn : k+2+(hi-lo)^2 ≤ n+lo) :
 (n.choose (k-r):ℝ)*(n.choose (k+2-s):ℝ)+
 (n.choose (k-s):ℝ)*(n.choose (k+2-r):ℝ) ≤ 2*(n.choose (k+1-r):ℝ)*(n.choose (k+1-s):ℝ) := by
 rcases le_total r s with hrs | hsr
 · exact binomial_mixed_interval_orderedMF1E n k lo hi r s hr hrs hs' hk hn
 · have h := binomial_mixed_interval_orderedMF1E n k lo hi s r hs hsr hr' hk hn
   nlinarith only [h]

theorem finite_mixture_lcMF1E {ι : Type*} (S : Finset ι) (L M R : ι → ℝ)
 (h : ∀ r∈S, ∀ s∈S, L r*R s+L s*R r ≤ 2*M r*M s) :
 (∑ r∈S, L r)*(∑ r∈S, R r) ≤ (∑ r∈S, M r)^2 := by
 have hh := Finset.sum_le_sum (fun r hr =>
   Finset.sum_le_sum (fun s hs => h r hr s hs))
 have hleft : (∑ r∈S, ∑ s∈S, (L r*R s+L s*R r))=
   2*(∑ r∈S, L r)*(∑ r∈S, R r) := by
   simp only [Finset.sum_add_distrib,←Finset.mul_sum,←Finset.sum_mul]
   ring
 have hright : (∑ r∈S, ∑ s∈S, 2*M r*M s)=2*(∑ r∈S, M r)^2 := by
   simp only [←Finset.mul_sum,←Finset.sum_mul]
   ring
 rw [hleft,hright] at hh
 linarith

theorem binomial_coeff_sumMF1E (P : ℝ[X]) (n k d : ℕ)
 (hP : P.natDegree ≤ d) (hk : d ≤ k) :
 (((1+X)^n*P):ℝ[X]).coeff k=
 ∑ r∈Finset.range (d+1), P.coeff r*(n.choose (k-r):ℝ) := by
 conv_lhs => rw [P.as_sum_range_C_mul_X_pow' (show P.natDegree<d+1 by omega)]
 rw [Finset.mul_sum,Polynomial.finsetSum_coeff]
 apply Finset.sum_congr rfl
 intro r hr
 have hrk : r ≤ k := by have h:=Finset.mem_range.mp hr; omega
 have he : (1+(X:ℝ[X]))^n*(C (P.coeff r)*X^r)=
   C (P.coeff r)*((1+X)^n*X^r) := by ring
 rw [he,Polynomial.coeff_C_mul,Polynomial.coeff_mul_X_pow',if_pos hrk,
   Polynomial.coeff_one_add_X_pow]

theorem binomial_interior_lcMF1E (P : ℝ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0)
 (hk : hi+(hi-lo)^2 ≤ k) (hn : k+2+(hi-lo)^2 ≤ n+lo) :
 (((1+X)^n*P):ℝ[X]).coeff k * (((1+X)^n*P):ℝ[X]).coeff (k+2) ≤ (((1+X)^n*P):ℝ[X]).coeff (k+1)^2 := by
 rw [binomial_coeff_sumMF1E P n k hi hP (by omega),
   binomial_coeff_sumMF1E P n (k+2) hi hP (by omega),
   binomial_coeff_sumMF1E P n (k+1) hi hP (by omega)]
 apply finite_mixture_lcMF1E
 intro r hr s hs
 by_cases hrl : r<lo
 · simp [hlow r hrl]
 by_cases hsl : s<lo
 · simp [hlow s hsl]
 have hr' : r ≤ hi := by simpa using Finset.mem_range.mp hr
 have hs' : s ≤ hi := by simpa using Finset.mem_range.mp hs
 have h := binomial_mixed_intervalMF1E n k lo hi r s (by omega) hr' (by omega) hs' hk hn
 have hh := mul_le_mul_of_nonneg_left h (mul_nonneg (hpos r) (hpos s))
 nlinarith only [hh]

theorem integer_binomial_interior_lcMF1E (P : ℤ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0)
 (hk : hi+(hi-lo)^2 ≤ k) (hn : k+2+(hi-lo)^2 ≤ n+lo) :
 (((1+X)^n*P):ℤ[X]).coeff k * (((1+X)^n*P):ℤ[X]).coeff (k+2) ≤ (((1+X)^n*P):ℤ[X]).coeff (k+1)^2 := by
 have hd : (P.map (Int.castRingHom ℝ)).natDegree ≤ hi :=
   le_trans Polynomial.natDegree_map_le hP
 have he : (1+(X:ℝ[X]))^n*P.map (Int.castRingHom ℝ)=
   (((1+X)^n*P):ℤ[X]).map (Int.castRingHom ℝ) := by simp
 have h := binomial_interior_lcMF1E (P.map (Int.castRingHom ℝ)) n k lo hi hd
   (fun r => by simpa using hpos r) (fun r hr => by simp [hlow r hr]) hk hn
 rw [he] at h
 simp only [Polynomial.coeff_map] at h
 change ((((1+X)^n*P):ℤ[X]).coeff k:ℝ) *
   ((((1+X)^n*P):ℤ[X]).coeff (k+2):ℝ) ≤
   ((((1+X)^n*P):ℤ[X]).coeff (k+1):ℝ)^2 at h
 exact_mod_cast h
end
end MathGKM.Markov
