import MarkovSecondHigh07F1
import MarkovSecondSmall07F1
import MarkovSecondCoefficients07F1
namespace MathGKM.Markov
noncomputable section
theorem second_shape_lc07F1 (n c r j : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c)
 (hj : n+5 ≤ j) (hn : j ≤ 2*n+1) :
 secondShape07F1 n c r (j-1)*secondShape07F1 n c r (j+1) ≤
 (secondShape07F1 n c r j)^2 := by
 by_cases h : r=1
 · subst r
   exact second_one_lc07F1 n c j (by omega) hj hn
 · exact second_high_lc07F1 n c r j (by omega) hc hj hn

theorem third_second_band_lc07F1 (n c r j : ℕ) (hr : 1 ≤ r) (hc : r+1 ≤ c)
 (hj : n+4 ≤ j) (hn : j ≤ 2*n) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 have h := second_shape_lc07F1 n c r (j+1)
   (by exact_mod_cast hr) (by exact_mod_cast hc) (by omega) (by omega)
 have h0 := second_run_coeff07F1 n c r j hj (by omega)
 have h1 := second_run_coeff07F1 n c r (j+1) (by omega) (by omega)
 have h2 := second_run_coeff07F1 n c r (j+2) (by omega) (by omega)
 have he0 : (j+1:ℤ)-1=(j:ℕ) := by omega
 have he2 : (j+1:ℤ)+1=((j+2:ℕ):ℤ) := by omega
 rw [he0,he2,h0,h2] at h
 simp only [Nat.cast_add,Nat.cast_one] at h1
 rw [h1] at h
 nlinarith only [h]
#print axioms third_second_band_lc07F1
end
end MathGKM.Markov
