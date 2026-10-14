import MathGKM.MarkovLogConcavity
/-! Machine-authored 65c4dfb8. Finite Abel transfer, as in Wang--Yeh,
Log-concavity and LC-positivity, Lemma 2.1. No Markov tail positivity is assumed
as an axiom or proved here. Zero weights and signed summands are retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset

theorem tail_weight_nonneg65c4 (n : ℕ) (a w : ℕ → ℝ)
 (ha : ∀ r, r ≤ n → 0 ≤ ∑ k ∈ range (n-r), a (r+k))
 (hw : 0 ≤ w 0) (hm : ∀ k, k+1<n → w k ≤ w (k+1)) :
 0 ≤ ∑ k ∈ range n, a k*w k := by
 induction n generalizing a w with
 | zero => simp
 | succ n ih =>
   have ht : ∀ r, r ≤ n → 0 ≤ ∑ k ∈ range (n-r), a (r+k+1) := by
     intro r hr
     have h := ha (r+1) (by omega)
     simpa [show n+1-(r+1)=n-r by omega,add_assoc,add_comm,add_left_comm] using h
   by_cases hn : n=0
   · subst n
     have h := ha 0 (by omega)
     simp at h ⊢
     exact mul_nonneg h hw
   have hnext := hm 0 (by omega)
   have hi := ih (fun k => a (k+1)) (fun k => w (k+1)-w 0) ht
     (sub_nonneg.mpr hnext) (by intro k hk; exact sub_le_sub_right (hm (k+1) (by omega)) _)
   have htotal := mul_nonneg (ha 0 (by omega)) hw
   simp only [zero_add,Nat.sub_zero] at htotal
   rw [sum_range_succ'] at htotal ⊢
   have he : (∑ k ∈ range n, a (k+1)*(w (k+1)-w 0)) =
       (∑ k ∈ range n, a (k+1)*w (k+1))-(∑ k ∈ range n,a (k+1))*w 0 := by
     simp [mul_sub,sum_sub_distrib,sum_mul]
   rw [he] at hi
   nlinarith

theorem crossLC_center_weights65c4 (f : ℤ → ℝ) (hf : CrossLC f)
 (t : ℕ) (q : ℕ) (hq : 2*(q+1) ≤ t) :
 f q*f (t-q) ≤ f (q+1)*f (t-(q+1)) := by
 have h := hf q (t-(q+1)) (by omega)
 have hq1 : (↑(q+1):ℤ)=(q:ℤ)+1 := by omega
 have ht : (↑(t-q):ℤ)=(↑(t-(q+1)):ℤ)+1 := by omega
 rw [ht,hq1]
 exact h

/-- Any centered signed layer certificate survives a nonnegative CrossLC
weight. The unknown part in the Pell application is the tail hypothesis. -/
theorem centered_weight_nonneg65c4 (a : ℕ → ℝ) (f : ℤ → ℝ)
 (hf : CrossLC f) (hpos : ∀ k, 0 ≤ f k) (t : ℕ)
 (ha : ∀ r, r ≤ t/2+1 → 0 ≤ ∑ q ∈ range (t/2+1-r), a (r+q)) :
 0 ≤ ∑ q ∈ range (t/2+1), a q*(f q*f (t-q)) := by
 apply tail_weight_nonneg65c4 _ _ _ ha
 · exact mul_nonneg (hpos _) (hpos _)
 · intro q hq
   exact crossLC_center_weights65c4 f hf t q (by omega)

#print axioms tail_weight_nonneg65c4
#print axioms centered_weight_nonneg65c4
end
end MathGKM.Markov
