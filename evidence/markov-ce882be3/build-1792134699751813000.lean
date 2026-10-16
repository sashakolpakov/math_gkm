import MarkovStripGapMCE8
/-! Machine-authored ce882be3. All index charts and positive-scalar transfer. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem strip_gap_nonnegMCE8 (a k l t : ℕ) (hl : 2 ≤ l) (hN : 5 ≤ k+l)
 (he : 3*a=k+l+2+t) : 0 ≤ stripGapMCE8 a k l t := by
 have haR : (a:ℝ)=((k:ℝ)+l+2+t)/3 := by
   have hh : 3*(a:ℝ)=(k:ℝ)+l+2+t := by exact_mod_cast he
   linarith
 rw [haR]
 by_cases h5 : 5 ≤ l
 · have hlR : 0 ≤ (l:ℝ)-5 := by exact_mod_cast (show (5:ℤ) ≤ l by exact_mod_cast h5) |>.trans_eq (by ring)
   have h := strip_largeMCE8 k ((l:ℝ)-5) t (by positivity) hlR (by positivity)
   simpa only [sub_add_cancel] using h
 · have hc : l=2 ∨ l=3 ∨ l=4 := by omega
   rcases hc with rfl|rfl|rfl
   · have hk : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_twoMCE8 ((k:ℝ)-3) t (by linarith) (by positivity)
   · have hk : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_threeMCE8 ((k:ℝ)-2) t (by linarith) (by positivity)
   · have hk : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip_fourMCE8 ((k:ℝ)-1) t (by linarith) (by positivity)

theorem strip_gap_transferMCE8 (a k l t C c₁ c₂ c₃ : ℝ)
 (hk : 0 ≤ k) (hl : 2 ≤ l) (hN : 5 ≤ k+l)
 (h₁ : (k+l)*c₁=C*stripTMB9D a k l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*c₂=C*l*stripJMB9D a k l)
 (h₃ : 6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*c₃=C*l*(l-1)*stripHMCE8 a k l t)
 (hg : 0 ≤ stripGapMCE8 a k l t) : c₁*c₃ ≤ c₂^2 := by
 have he : 12*((k+l)*(k+l-1)*(k+l-2))^2*(k+l-3)*(k+l-4)*(k+1)*(c₂^2-c₁*c₃)=
   C^2*l*stripGapMCE8 a k l t := by
   unfold stripGapMCE8
   linear_combination
     3*(k+l-3)*(k+l-4)*(k+1)*(2*(k+l)*(k+l-1)*(k+l-2)*c₂+C*l*stripJMB9D a k l)*h₂-
     2*(k+l-1)*(k+l-2)*(6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*c₃*h₁+C*stripTMB9D a k l*h₃)
 have hp : 0 < 12*((k+l)*(k+l-1)*(k+l-2))^2*(k+l-3)*(k+l-4)*(k+1) := by
   have : 0<k+l := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-3 := by linarith
   have : 0<k+l-4 := by linarith
   positivity
 have hn : 0 ≤ C^2*l*stripGapMCE8 a k l t := mul_nonneg (by positivity) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith
end
end MathGKM.Markov
