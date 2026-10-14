import MarkovQuinticBoundsE582
/-! Machine-authored request e5822cfc. Small-count inequalities using lower local-count bounds. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 8000
set_option maxHeartbeats 8000000
theorem small_quintic_certificateE582 (x : ℝ) (hx : 0 ≤ x) (m : ℕ) (hm : 1 ≤ m) (hm8 : m ≤ 8) :
 let n := x+18
 0 ≤ qbE582 n m (2*m) (n-3*m-2) (n-4*m-3) 0 ∧
 0 ≤ qcE582 n m (2*m) (n-3*m-2) (2*(n-m)) 2 0 ∧
 0 ≤ qdE582 n m (2*m) ∧
 0 ≤ qeE582 n m ∧
 0 ≤ qfE582 n ∧
 0 ≤ qbE582 n m (2*m) (n-3*m-2) (n-4*m-3) 0^2-qaE582 m*qcE582 n m 0 (n-m) 0 0 2 ∧
 0 ≤ qcE582 n m (2*m) (n-3*m-2) (2*(n-m)) 2 0^2-qbE582 n m 0 (n-m) (n-m) 2*qdE582 n m 0 ∧
 0 ≤ qdE582 n m (2*m)^2-qcE582 n m 0 (n-m) 0 0 2*qeE582 n m ∧
 0 ≤ qeE582 n m^2-qdE582 n m 0*qfE582 n := by
 interval_cases m <;> (try simp only [Nat.cast_ofNat])
 all_goals try dsimp
 all_goals unfold qaE582 qbE582 qcE582 qdE582 qeE582 qfE582
 all_goals repeat' constructor
 all_goals ring_nf; positivity

theorem small_quintic_inequalitiesE582 (n : ℝ) (m : ℕ) (s t h k e f : ℝ)
 (hm : 1 ≤ m) (hm8 : m ≤ 8) (hn : 18 ≤ n)
 (hs : 0 ≤ s) (hsu : s ≤ 2*m)
 (ht : 0 ≤ t) (htl : n-3*m-2 ≤ t) (htu : t ≤ n-m)
 (hh : 0 ≤ h) (hhl : n-4*m-3 ≤ h) (hhu : h ≤ n-m)
 (hk : 0 ≤ k) (hku : k ≤ 2*(n-m))
 (he : 0 ≤ e) (heu : e ≤ 2) (hf : 0 ≤ f) (hfu : f ≤ 2) :
 qaE582 m*qcE582 n m s t k e f ≤ qbE582 n m s t h e^2 ∧
 qbE582 n m s t h e*qdE582 n m s ≤ qcE582 n m s t k e f^2 ∧
 qcE582 n m s t k e f*qeE582 n m ≤ qdE582 n m s^2 ∧
 qdE582 n m s*qfE582 n ≤ qeE582 n m^2 := by
 have cert := small_quintic_certificateE582 (n-18) (by linarith) m hm hm8
 dsimp at cert
 rw [show n-18+18=n by ring] at cert
 have hm1 : (1:ℝ) ≤ m := by exact_mod_cast hm
 obtain ⟨bl,cl,dl,ep,fp,g1,g2,g3,g4⟩ := cert
 have mb : 0 ≤ (m:ℝ)^2-3*m+3 := by nlinarith [sq_nonneg ((m:ℝ)-2)]
 have mc : 0 ≤ 2*m*(n-6)+9 := by
   have hm0 : 0 ≤ (m:ℝ) := by linarith
   have hn6 : 0 ≤ n-6 := by linarith
   positivity
 have md : 0 ≤ (n-3)*(n-4) := mul_nonneg (by linarith) (by linarith)
 have blo : qbE582 n m (2*m) (n-3*m-2) (n-4*m-3) 0 ≤ qbE582 n m s t h e := by
   unfold qbE582
   nlinarith [mul_nonneg mb (show 0 ≤ 2*(m:ℝ)-s by linarith),
     mul_nonneg (show 0 ≤ (m:ℝ)-1 by linarith) (show 0 ≤ t-(n-3*m-2) by linarith)]
 have bup : qbE582 n m s t h e ≤ qbE582 n m 0 (n-m) (n-m) 2 := by
   unfold qbE582
   nlinarith [mul_nonneg mb hs,mul_nonneg (show 0 ≤ (m:ℝ)-1 by linarith) (show 0 ≤ n-m-t by linarith)]
 have clo : qcE582 n m (2*m) (n-3*m-2) (2*(n-m)) 2 0 ≤ qcE582 n m s t k e f := by
   unfold qcE582
   nlinarith [mul_nonneg mc (show 0 ≤ 2*(m:ℝ)-s by linarith),
     mul_nonneg (show 0 ≤ n-5 by linarith) (show 0 ≤ t-(n-3*m-2) by linarith)]
 have cup : qcE582 n m s t k e f ≤ qcE582 n m 0 (n-m) 0 0 2 := by
   unfold qcE582
   nlinarith [mul_nonneg mc hs,mul_nonneg (show 0 ≤ n-5 by linarith) (show 0 ≤ n-m-t by linarith)]
 have dlo : qdE582 n m (2*m) ≤ qdE582 n m s := by
   unfold qdE582
   nlinarith [mul_nonneg md (show 0 ≤ 2*(m:ℝ)-s by linarith)]
 have dup : qdE582 n m s ≤ qdE582 n m 0 := by
   unfold qdE582
   nlinarith [mul_nonneg md hs]
 have ap : 0 ≤ qaE582 m := by interval_cases m <;> norm_num [qaE582]
 have bsq := (sq_le_sq₀ bl (le_trans bl blo)).mpr blo
 have csq := (sq_le_sq₀ cl (le_trans cl clo)).mpr clo
 have dsq := (sq_le_sq₀ dl (le_trans dl dlo)).mpr dlo
 have bd := mul_le_mul bup dup (le_trans dl dlo) (le_trans (le_trans bl blo) bup)
 exact ⟨by linarith [mul_le_mul_of_nonneg_left cup ap],
   by linarith,by linarith [mul_le_mul_of_nonneg_right cup ep],
   by linarith [mul_le_mul_of_nonneg_right dup fp]⟩

#print axioms small_quintic_inequalitiesE582
end
end MathGKM.Markov
