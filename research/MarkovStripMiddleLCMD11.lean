import MarkovStripMiddleGapMD11
/-! Machine-authored d11e335e. Middle-cone gap and raw coefficient transfer. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000

theorem strip_middle_gap_nonnegMD11 (a k l t : ℕ)
 (he : 4*a=k+l+2+t) (hl : 3 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ stripMiddleGapMD11 a k l t := by
 have heR : (a:ℝ)=((k:ℝ)+l+2+t)/4 := by
   have : 4*(a:ℝ)=(k:ℝ)+l+2+t := by exact_mod_cast he
   linarith
 rw [heR]
 have hkR : 0 ≤ (k:ℝ) := by positivity
 have htR : 0 ≤ (t:ℝ) := by positivity
 by_cases h7 : 7 ≤ l
 · have hlR : 0 ≤ (l:ℝ)-7 := by
     have : (7:ℝ) ≤ l := by exact_mod_cast h7
     linarith
   simpa only [sub_add_cancel] using stripMiddle_largeMD11 k ((l:ℝ)-7) t hkR hlR htR
 · have hc : l=3 ∨ l=4 ∨ l=5 ∨ l=6 := by omega
   rcases hc with rfl|rfl|rfl|rfl
   · have hk4 : 0 ≤ (k:ℝ)-4 := by
       have : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using stripMiddle_threeMD11 ((k:ℝ)-4) 0 t hk4 (by norm_num) htR
   · have hk3 : 0 ≤ (k:ℝ)-3 := by
       have : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using stripMiddle_fourMD11 ((k:ℝ)-3) 0 t hk3 (by norm_num) htR
   · have hk2 : 0 ≤ (k:ℝ)-2 := by
       have : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using stripMiddle_fiveMD11 ((k:ℝ)-2) 0 t hk2 (by norm_num) htR
   · have hk1 : 0 ≤ (k:ℝ)-1 := by
       have : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using stripMiddle_sixMD11 ((k:ℝ)-1) 0 t hk1 (by norm_num) htR

theorem strip_middle_transferMD11 (a k l t C c₂ c₃ c₄ : ℝ)
 (hk : 0 ≤ k) (hl : 3 ≤ l) (hN : 7 ≤ k+l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*c₂=C*l*stripJMB9D a k l)
 (h₃ : 6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃=C*l*(l-1)*stripHMB9D a k l)
 (h₄ : 24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*c₄=
   C*l*(l-1)*(l-2)*stripMiddleIMD11 a k l t)
 (hg : 0 ≤ stripMiddleGapMD11 a k l t) : c₂*c₄ ≤ c₃^2 := by
 have he : 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6)*(k+1)*
   (c₃^2-c₂*c₄)=C^2*l^2*(l-1)*stripMiddleGapMD11 a k l t := by
   unfold stripMiddleGapMD11
   linear_combination
     4*(k+l-5)*(k+l-6)*(k+1)*(6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃+
       C*l*(l-1)*stripHMB9D a k l)*h₃-
     3*(k+l-3)*(k+l-4)*(24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*c₄*h₂+
       C*l*stripJMB9D a k l*h₄)
 have hp : 0 < 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6)*(k+1) := by
   have : 0<k+l := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-3 := by linarith
   have : 0<k+l-4 := by linarith
   have : 0<k+l-5 := by linarith
   have : 0<k+l-6 := by linarith
   have : 0<k+1 := by linarith
   positivity
 have hn : 0 ≤ C^2*l^2*(l-1)*stripMiddleGapMD11 a k l t :=
   mul_nonneg (mul_nonneg (by positivity) (by linarith)) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith
end
end MathGKM.Markov
