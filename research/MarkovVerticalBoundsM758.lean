import MarkovVerticalCertificatesM758
/-! Machine-authored 7584c5d0. Natural source-parameter bounds. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

theorem vChartM758 (P : ℤ → ℤ → ℤ → Prop)
 (lo : ∀ x y, 0 ≤ x → 0 ≤ y → P (2*(x+1)+y) (x+1) 0)
 (hi : ∀ x y, 0 ≤ x → 0 ≤ y → P (2*(x+1)+y) (x+1+y) y)
 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a) : P a r (2*r-a:ℕ) := by
 have hr' : (1:ℤ) ≤ r := by exact_mod_cast hr
 have ha' : (r:ℤ)+1 ≤ a := by exact_mod_cast hra
 by_cases hh : 2*r ≤ a
 · have hh' : 2*(r:ℤ) ≤ a := by exact_mod_cast hh
   have h := lo (r-1) (a-2*(r:ℤ)) (by omega) (by omega)
   have h1 : 2*((r:ℤ)-1+1)+(a-2*r)=a := by ring
   rw [h1,sub_add_cancel] at h
   simpa [Nat.sub_eq_zero_of_le hh] using h
 · have h := hi ((a:ℤ)-r-1) (2*(r:ℤ)-a) (by omega) (by omega)
   have h1 : 2*((a:ℤ)-r-1+1)+(2*r-a)=a := by ring
   have h2 : (a:ℤ)-r-1+1+(2*r-a)=r := by ring
   rw [h1,h2] at h
   rw [Nat.cast_sub (by omega : a ≤ 2*r),Nat.cast_mul,Nat.cast_ofNat]
   exact h

theorem v_pos_lowM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ j) :
 0 < vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) := by
 apply vChartM758 (fun a r s => 0 < vlowM758 (a) (r) (s) (q) (j)) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_pos_low_loM758 x y (j-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_pos_low_hiM758 x y (j-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_pos_midM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : q+3 ≤ j ∧ j ≤ 2*q+1) :
 0 < vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) := by
 apply vChartM758 (fun a r s => 0 < vmidM758 (a) (r) (s) (q) (j)) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_pos_mid_loM758 x y (j-q-3) (2*q+1-j) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_pos_mid_hiM758 x y (j-q-3) (2*q+1-j) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_pos_bridgeM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 0 < vbridgeM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) := by
 apply vChartM758 (fun a r s => 0 < vbridgeM758 (a) (r) (s) (q) (j)) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_pos_bridge_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_pos_bridge_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_pos_tail2M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 0 < vtail2M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) := by
 apply vChartM758 (fun a r s => 0 < vtail2M758 (a) (r) (s) (q) (j)) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_pos_tail2_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_pos_tail2_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_pos_tail3M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 0 < vtail3M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) := by
 apply vChartM758 (fun a r s => 0 < vtail3M758 (a) (r) (s) (q) (j)) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_pos_tail3_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_pos_tail3_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_pos_tail4M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 0 < vtail4M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) := by
 apply vChartM758 (fun a r s => 0 < vtail4M758 (a) (r) (s) (q) (j)) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_pos_tail4_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_pos_tail4_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_firstM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : True) :
 48*(((2*r-a:ℕ):ℤ))*vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) (3) ≤ vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) (2)^2 := by
 apply vChartM758 (fun a r s => 48*s*vlowM758 (a) (r) (s) (q) (3) ≤ vlowM758 (a) (r) (s) (q) (2)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_first_loM758 x y (0) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_first_hiM758 x y (0) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_lowM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 3 ≤ j) :
 vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)-1)*vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)+1) ≤ vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j))^2 := by
 apply vChartM758 (fun a r s => vlowM758 (a) (r) (s) (q) (j-1)*vlowM758 (a) (r) (s) (q) (j+1) ≤ vlowM758 (a) (r) (s) (q) (j)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_low_loM758 x y (j-3) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_low_hiM758 x y (j-3) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_cross1M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((q))*vbridgeM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) ≤ vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((q)+1)^2 := by
 apply vChartM758 (fun a r s => vlowM758 (a) (r) (s) (q) (q)*vbridgeM758 (a) (r) (s) (q) (j) ≤ vlowM758 (a) (r) (s) (q) (q+1)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_cross1_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_cross1_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_cross2M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 vlowM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((q)+1)*vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((q)+3) ≤ vbridgeM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j))^2 := by
 apply vChartM758 (fun a r s => vlowM758 (a) (r) (s) (q) (q+1)*vmidM758 (a) (r) (s) (q) (q+3) ≤ vbridgeM758 (a) (r) (s) (q) (j)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_cross2_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_cross2_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_cross3M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 3 ≤ q) :
 vbridgeM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j))*vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((q)+4) ≤ vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((q)+3)^2 := by
 apply vChartM758 (fun a r s => vbridgeM758 (a) (r) (s) (q) (j)*vmidM758 (a) (r) (s) (q) (q+4) ≤ vmidM758 (a) (r) (s) (q) (q+3)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_cross3_loM758 x y (q-3) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_cross3_hiM758 x y (q-3) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_midM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : q+4 ≤ j ∧ j ≤ 2*q) :
 vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)-1)*vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)+1) ≤ vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j))^2 := by
 apply vChartM758 (fun a r s => vmidM758 (a) (r) (s) (q) (j-1)*vmidM758 (a) (r) (s) (q) (j+1) ≤ vmidM758 (a) (r) (s) (q) (j)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_mid_loM758 x y (j-q-4) (2*q-j) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_mid_hiM758 x y (j-q-4) (2*q-j) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_tail1M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 3 ≤ q) :
 vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) (2*(q))*vtail2M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) ≤ vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) (2*(q)+1)^2 := by
 apply vChartM758 (fun a r s => vmidM758 (a) (r) (s) (q) (2*q)*vtail2M758 (a) (r) (s) (q) (j) ≤ vmidM758 (a) (r) (s) (q) (2*q+1)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_tail1_loM758 x y (q-3) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_tail1_hiM758 x y (q-3) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_tail2M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) (2*(q)+1)*vtail3M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) ≤ vtail2M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j))^2 := by
 apply vChartM758 (fun a r s => vmidM758 (a) (r) (s) (q) (2*q+1)*vtail3M758 (a) (r) (s) (q) (j) ≤ vtail2M758 (a) (r) (s) (q) (j)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_tail2_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_tail2_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_tail3M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : 2 ≤ q) :
 vtail2M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j))*vtail4M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j)) ≤ vtail3M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) ((q)) ((j))^2 := by
 apply vChartM758 (fun a r s => vtail2M758 (a) (r) (s) (q) (j)*vtail4M758 (a) (r) (s) (q) (j) ≤ vtail3M758 (a) (r) (s) (q) (j)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_tail3_loM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_tail3_hiM758 x y (q-2) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

theorem v_gap_twoM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (h : True) :
 vbridgeM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) (2) ((j))*vtail2M758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) (2) ((j)) ≤ vmidM758 (((a:ℤ))) (((r:ℤ))) ((((2*r-a:ℕ):ℤ))) (2) (5)^2 := by
 apply vChartM758 (fun a r s => vbridgeM758 (a) (r) (s) (2) (j)*vtail2M758 (a) (r) (s) (2) (j) ≤ vmidM758 (a) (r) (s) (2) (5)^2) ?_ ?_ a r hr hra
 · intro x y hx hy
   have hh := v_gap_two_loM758 x y (0) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring
 · intro x y hx hy
   have hh := v_gap_two_hiM758 x y (0) (0) hx hy (by omega) (by omega)
   convert hh using 1 <;> simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758] <;> ring

end
end MathGKM.Markov
