import MarkovShapeLC07F1
import MarkovFirstGap007F1
import MarkovFirstGap107F1
import MarkovFirstGap207F1
import MarkovFirstGap307F1
/-! Machine-authored 07f1d410. All positions in the first coefficient band. -/
namespace MathGKM.Markov
noncomputable section

theorem third_first_band_lc07F1 (n c r j : ℕ)
 (hr : 1≤r) (hc : r+1≤c) (hn : j+1≤n) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2)≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases hj : 4≤j
 · have h := thirdShape_lc07F1 n c r (j+1)
     (by exact_mod_cast hr) (by exact_mod_cast hc) (by omega) (by omega)
   have h0 := third_run_interior_coeffFDDA n c r j hj (by omega)
   have h1 := third_run_interior_coeffFDDA n c r (j+1) (by omega) (by omega)
   have h2 := third_run_interior_coeffFDDA n c r (j+2) (by omega) (by omega)
   have he0 : (j+1:ℤ)-1=(j:ℕ) := by omega
   have he2 : (j+1:ℤ)+1=((j+2:ℕ):ℤ) := by omega
   rw [he0,he2,h0,h2] at h
   simp only [Nat.cast_add,Nat.cast_one] at h1
   rw [h1] at h
   nlinarith only [h]
 · interval_cases j
   · rw [first_coeff_007F1 n c r (by omega),first_coeff_207F1 n c r (by omega),
       first_coeff_107F1 n c r (by omega)]
     exact first_gap_007F1 _ _ _ (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)
   · rw [first_coeff_107F1 n c r (by omega),first_coeff_307F1 n c r (by omega),
       first_coeff_207F1 n c r (by omega)]
     exact first_gap_107F1 _ _ _ (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)
   · rw [first_coeff_207F1 n c r (by omega),first_coeff_407F1 n c r (by omega),
       first_coeff_307F1 n c r (by omega)]
     exact first_gap_207F1 _ _ _ (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)
   · rw [first_coeff_307F1 n c r (by omega),first_coeff_507F1 n c r (by omega),
       first_coeff_407F1 n c r (by omega)]
     exact first_gap_307F1 _ _ _ (by omega) (by exact_mod_cast hr) (by exact_mod_cast hc)

theorem source_third_first_band07F1 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : j+1≤n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have h := third_first_band_lc07F1 n (frame rest).mid.b (frame rest).mid.a j
   (by omega) (by omega) hn
 have hc : ∀ k≤n+1,k<(frame rest).mid.b*(n+1)+(frame rest).mid.a := by
   intro k hk
   have hm := Nat.mul_le_mul_right (n+1) (show 1≤(frame rest).mid.b by omega)
   simp only [Nat.one_mul] at hm
   omega
 rw [←correctedThird_coeff_below8BBB _ _ _ j (hc j (by omega)),
   ←source_third_all_cycles_raw8BBB n rest (i+2) j (by omega),
   ←correctedThird_coeff_below8BBB _ _ _ (j+2) (hc (j+2) (by omega)),
   ←source_third_all_cycles_raw8BBB n rest i (j+2) (by omega),
   ←correctedThird_coeff_below8BBB _ _ _ (j+1) (hc (j+1) (by omega)),
   ←source_third_all_cycles_raw8BBB n rest (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms third_first_band_lc07F1
#print axioms source_third_first_band07F1
end
end MathGKM.Markov
