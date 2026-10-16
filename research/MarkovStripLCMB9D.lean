import MarkovStripGapMB9D
/-! Machine-authored b9d0d341. Low-slope vertical strip, raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000
attribute [local irreducible] frame coeff

theorem strip_gap_nonnegMB9D (a k l : ℕ) (ha : 1 ≤ a) (hl : 2 ≤ l) (hN : 5 ≤ k+l) :
 0 ≤ stripGapMB9D a k l := by
 have haR : 0 ≤ (a:ℝ)-1 := by
   have : (1:ℝ) ≤ a := by exact_mod_cast ha
   linarith
 have hkR : 0 ≤ (k:ℝ) := by positivity
 by_cases h5 : 5 ≤ l
 · have hlR : 0 ≤ (l:ℝ)-5 := by
     have : (5:ℝ) ≤ l := by exact_mod_cast h5
     linarith
   simpa only [sub_add_cancel] using strip_largeMB9D ((a:ℝ)-1) k ((l:ℝ)-5) haR hkR hlR
 · have hc : l=2 ∨ l=3 ∨ l=4 := by omega
   rcases hc with rfl|rfl|rfl
   · have hk3 : 0 ≤ (k:ℝ)-3 := by
       have : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_twoMB9D ((a:ℝ)-1) ((k:ℝ)-3) 0 haR hk3 (by norm_num)
   · have hk2 : 0 ≤ (k:ℝ)-2 := by
       have : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_threeMB9D ((a:ℝ)-1) ((k:ℝ)-2) 0 haR hk2 (by norm_num)
   · have hk1 : 0 ≤ (k:ℝ)-1 := by
       have : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_fourMB9D ((a:ℝ)-1) ((k:ℝ)-1) 0 haR hk1 (by norm_num)

theorem strip_gap_transferMB9D (a k l C c₁ c₂ c₃ : ℝ)
 (hk : 0 ≤ k) (hl : 2 ≤ l) (hN : 5 ≤ k+l)
 (h₁ : (k+l)*c₁=C*stripTMB9D a k l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*c₂=C*l*stripJMB9D a k l)
 (h₃ : 6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃=C*l*(l-1)*stripHMB9D a k l)
 (hg : 0 ≤ stripGapMB9D a k l) : c₁*c₃ ≤ c₂^2 := by
 have he : 12*((k+l)*(k+l-1)*(k+l-2))^2*(k+l-3)*(k+l-4)*(c₂^2-c₁*c₃)=
   C^2*l*stripGapMB9D a k l := by
   unfold stripGapMB9D
   linear_combination
     3*(k+l-3)*(k+l-4)*(2*(k+l)*(k+l-1)*(k+l-2)*c₂+C*l*stripJMB9D a k l)*h₂-
     2*(k+l-1)*(k+l-2)*(6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃*h₁+C*stripTMB9D a k l*h₃)
 have hp : 0 < 12*((k+l)*(k+l-1)*(k+l-2))^2*(k+l-3)*(k+l-4) := by
   have : 0<k+l := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-3 := by linarith
   have : 0<k+l-4 := by linarith
   positivity
 have hn : 0 ≤ C^2*l*stripGapMB9D a k l := mul_nonneg (by positivity) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith
end
end MathGKM.Markov
