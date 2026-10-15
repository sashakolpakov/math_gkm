import MarkovFirstSource07F1
import MarkovSecondLC07F1
import MarkovCrossGap107F1
import MarkovCrossGap207F1
import MarkovCrossGap307F1
import MarkovCrossGap407F1
/-! Machine-authored 07f1d410. Raw third-lower-slice inequalities across
the first two bands; remaining coefficients and directions are not asserted. -/
namespace MathGKM.Markov
noncomputable section

theorem third_crossing_lc07F1 (n c r j : ℕ) (hr : 1 ≤ r) (hc : r+1 ≤ c)
 (hn : 4 ≤ n) (hj : n ≤ j) (hj' : j ≤ n+3) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 have hh : j=n ∨ j=n+1 ∨ j=n+2 ∨ j=n+3 := by omega
 rcases hh with h | h | h | h <;> subst j
 · have h := cross_gap_107F1 n c r (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)
   rw [cross_coeff_007F1 n c r hn,cross_coeff_107F1 n c r hn,cross_coeff_207F1 n c r hn] at h
   simp only [Nat.add_zero] at h
   nlinarith only [h]
 · have h := cross_gap_207F1 n c r (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)
   rw [cross_coeff_107F1 n c r hn,cross_coeff_207F1 n c r hn,cross_coeff_307F1 n c r hn] at h
   have h2 : n+1+2=n+3 := by omega
   have h1 : n+1+1=n+2 := by omega
   rw [h2,h1]
   nlinarith only [h]
 · have h := cross_gap_307F1 n c r (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)
   rw [cross_coeff_207F1 n c r hn,cross_coeff_307F1 n c r hn,cross_coeff_407F1 n c r hn] at h
   have h2 : n+2+2=n+4 := by omega
   have h1 : n+2+1=n+3 := by omega
   rw [h2,h1]
   nlinarith only [h]
 · have h := cross_gap_407F1 n c r (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)
   rw [cross_coeff_307F1 n c r hn,cross_coeff_407F1 n c r hn,cross_coeff_507F1 n c r hn] at h
   have h2 : n+3+2=n+5 := by omega
   have h1 : n+3+1=n+4 := by omega
   rw [h2,h1]
   nlinarith only [h]

theorem third_two_bands_lc07F1 (n c r j : ℕ) (hr : 1 ≤ r) (hc : r+1 ≤ c)
 (hn : 4 ≤ n) (hj : j ≤ 2*n) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases h1 : j+1 ≤ n
 · exact third_first_band_lc07F1 n c r j hr hc h1
 · by_cases h2 : j ≤ n+3
   · exact third_crossing_lc07F1 n c r j hr hc hn (by omega) h2
   · exact third_second_band_lc07F1 n c r j hr hc (by omega) hj

theorem source_third_two_bands07F1 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 4 ≤ n) (hj : j ≤ 2*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have h := third_two_bands_lc07F1 n (frame rest).mid.b (frame rest).mid.a j
   (by omega) (by omega) hn hj
 have hc : ∀ k ≤ 2*n+2,k<(frame rest).mid.b*(n+1)+(frame rest).mid.a := by
   intro k hk
   have hm := Nat.mul_le_mul_right (n+1) (show 2 ≤ (frame rest).mid.b by omega)
   omega
 rw [←correctedThird_coeff_below8BBB _ _ _ j (hc j (by omega)),
   ←source_third_all_cycles_raw8BBB n rest (i+2) j (by omega),
   ←correctedThird_coeff_below8BBB _ _ _ (j+2) (hc (j+2) (by omega)),
   ←source_third_all_cycles_raw8BBB n rest i (j+2) (by omega),
   ←correctedThird_coeff_below8BBB _ _ _ (j+1) (hc (j+1) (by omega)),
   ←source_third_all_cycles_raw8BBB n rest (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms third_two_bands_lc07F1
#print axioms source_third_two_bands07F1
end
end MathGKM.Markov
