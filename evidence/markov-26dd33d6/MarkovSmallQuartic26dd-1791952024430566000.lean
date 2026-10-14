import MarkovQuarticSource4f8

/-! Machine-authored request 26dd33d6. Sharper small-count quartic bounds. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem switches_true_bound26dd (e : Bool) (w : List Bool) :
 switchesFrom5a7 e w ≤ 2*w.count true+(if e then 1 else 0) := by
 induction w generalizing e with
 | nil => simp [switchesFrom5a7]
 | cons r rs ih =>
   have h := ih r
   cases e <;> cases r <;> simp [switchesFrom5a7,List.count_cons] at h ⊢ <;> omega

theorem switches_true_core26dd (e : Bool) (w : List Bool) :
 switchesFrom5a7 e w ≤ 2*(e::w).count true := by
 have h := switches_true_bound26dd e w
 cases e <;> simp [List.count_cons] at h ⊢ <;> omega

theorem small_quartic_cert26dd (x : ℝ) (hx : 0 ≤ x) (m : ℕ)
 (hm : 1 ≤ m) (hm' : m ≤ 5) :
 0 ≤ qb4f8 (x+10) m (2*m) 0 ∧
 0 ≤ qc4f8 (x+10) m (2*m) ∧
 0 ≤ qb4f8 (x+10) m (2*m) 0^2-qa4f8 m*qc4f8 (x+10) m 0 ∧
 0 ≤ qc4f8 (x+10) m (2*m)^2-qb4f8 (x+10) m 0 (x+10-m)*qd4f8 (x+10) m ∧
 0 ≤ qd4f8 (x+10) m^2-qc4f8 (x+10) m 0*qe4f8 (x+10) := by
 interval_cases m <;> (try simp only [Nat.cast_ofNat])
 all_goals unfold qa4f8 qb4f8 qc4f8 qd4f8 qe4f8
 all_goals repeat' constructor
 all_goals ring_nf; positivity

theorem small_quartic_inequalities26dd (n : ℝ) (m : ℕ) (s t : ℝ)
 (hm : 1 ≤ m) (hm' : m ≤ 5) (hn : 10 ≤ n)
 (hs : 0 ≤ s) (hsu : s ≤ 2*m) (ht : 0 ≤ t) (htu : t ≤ n-m) :
 qa4f8 m*qc4f8 n m s ≤ qb4f8 n m s t^2 ∧
 qb4f8 n m s t*qd4f8 n m ≤ qc4f8 n m s^2 ∧
 qc4f8 n m s*qe4f8 n ≤ qd4f8 n m^2 := by
 have hc := small_quartic_cert26dd (n-10) (by linarith) m hm hm'
 rw [show n-10+10=n by ring] at hc
 obtain ⟨bl,cl,g1,g2,g3⟩ := hc
 have hm1 : (1:ℝ) ≤ m := by exact_mod_cast hm
 have blo : qb4f8 n m (2*m) 0 ≤ qb4f8 n m s t := by
   unfold qb4f8
   nlinarith [mul_nonneg (show 0 ≤ (m:ℝ)-1 by linarith) (show 0 ≤ 2*(m:ℝ)-s by linarith)]
 have bup : qb4f8 n m s t ≤ qb4f8 n m 0 (n-m) := by
   unfold qb4f8
   nlinarith [mul_nonneg (show 0 ≤ (m:ℝ)-1 by linarith) hs]
 have clo : qc4f8 n m (2*m) ≤ qc4f8 n m s := by
   unfold qc4f8
   nlinarith [mul_nonneg (show 0 ≤ n-3 by linarith) (show 0 ≤ 2*(m:ℝ)-s by linarith)]
 have cup : qc4f8 n m s ≤ qc4f8 n m 0 := by
   unfold qc4f8
   nlinarith [mul_nonneg (show 0 ≤ n-3 by linarith) hs]
 have ap : 0 ≤ qa4f8 m := by interval_cases m <;> norm_num [qa4f8]
 have dp : 0 ≤ qd4f8 n m := by
   unfold qd4f8
   have h1 : 0 ≤ n-1 := by linarith
   have h2 : 0 ≤ n-2 := by linarith
   have h6 : 0 ≤ n-6 := by linarith
   positivity
 have ep : 0 ≤ qe4f8 n := by
   unfold qe4f8
   have h1 : 0 ≤ n-1 := by linarith
   have h2 : 0 ≤ n-2 := by linarith
   have h0 : 0 ≤ n := by linarith
   positivity
 have bsq := (sq_le_sq₀ bl (le_trans bl blo)).mpr blo
 have csq := (sq_le_sq₀ cl (le_trans cl clo)).mpr clo
 exact ⟨by linarith [mul_le_mul_of_nonneg_left cup ap],
   by linarith [mul_le_mul_of_nonneg_right bup dp],
   by linarith [mul_le_mul_of_nonneg_right cup ep]⟩

#print axioms small_quartic_inequalities26dd
end
end MathGKM.Markov
