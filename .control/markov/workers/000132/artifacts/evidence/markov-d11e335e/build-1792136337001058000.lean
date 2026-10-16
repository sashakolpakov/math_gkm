import MarkovStripGapMD11
/-! Machine-authored d11e335e. Gap sign and exact raw transfer. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000

theorem strip_gap_nonnegMD11 (a k l : ℕ) (ha : 1 ≤ a) (hl : 3 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ stripGapMD11 a k l := by
 have haR : 0 ≤ (a:ℝ)-1 := by
   have : (1:ℝ) ≤ a := by exact_mod_cast ha
   linarith
 have hkR : 0 ≤ (k:ℝ) := by positivity
 by_cases h7 : 7 ≤ l
 · have hlR : 0 ≤ (l:ℝ)-7 := by
     have : (7:ℝ) ≤ l := by exact_mod_cast h7
     linarith
   simpa only [sub_add_cancel] using strip_largeMD11 ((a:ℝ)-1) k ((l:ℝ)-7) haR hkR hlR
 · have hc : l=3 ∨ l=4 ∨ l=5 ∨ l=6 := by omega
   rcases hc with rfl|rfl|rfl|rfl
   · have hk4 : 0 ≤ (k:ℝ)-4 := by
       have : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_threeMD11 ((a:ℝ)-1) ((k:ℝ)-4) 0 haR hk4 (by norm_num)
   · have hk3 : 0 ≤ (k:ℝ)-3 := by
       have : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_fourMD11 ((a:ℝ)-1) ((k:ℝ)-3) 0 haR hk3 (by norm_num)
   · have hk2 : 0 ≤ (k:ℝ)-2 := by
       have : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_fiveMD11 ((a:ℝ)-1) ((k:ℝ)-2) 0 haR hk2 (by norm_num)
   · have hk1 : 0 ≤ (k:ℝ)-1 := by
       have : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_sixMD11 ((a:ℝ)-1) ((k:ℝ)-1) 0 haR hk1 (by norm_num)

theorem strip_gap_transferMD11 (a k l C c₂ c₃ c₄ : ℝ)
 (hl : 3 ≤ l) (hN : 7 ≤ k+l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*c₂=C*l*stripJMB9D a k l)
 (h₃ : 6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃=C*l*(l-1)*stripHMB9D a k l)
 (h₄ : 24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*c₄=
   C*l*(l-1)*(l-2)*stripIMD11 a k l)
 (hg : 0 ≤ stripGapMD11 a k l) : c₂*c₄ ≤ c₃^2 := by
 have he : 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6)*
   (c₃^2-c₂*c₄)=C^2*l^2*(l-1)*stripGapMD11 a k l := by
   unfold stripGapMD11
   linear_combination
     4*(k+l-5)*(k+l-6)*(6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃+
       C*l*(l-1)*stripHMB9D a k l)*h₃-
     3*(k+l-3)*(k+l-4)*(24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*c₄*h₂+
       C*l*stripJMB9D a k l*h₄)
 have hp : 0 < 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6) := by
   have : 0<k+l := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-3 := by linarith
   have : 0<k+l-4 := by linarith
   have : 0<k+l-5 := by linarith
   have : 0<k+l-6 := by linarith
   positivity
 have hn : 0 ≤ C^2*l^2*(l-1)*stripGapMD11 a k l :=
   mul_nonneg (mul_nonneg (by positivity) (by linarith)) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith
end
end MathGKM.Markov
