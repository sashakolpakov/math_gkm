import MarkovVerticalShapesM758
/-! Machine-authored 7584c5d0. Exact nonnegative polynomial certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

theorem v_pos_low_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((0)) ((z+2)) := by
 by_cases hz0 : z=0
 · subst z
   simp only [vlowM758]
   ring_nf
   positivity
 · let t := z-1
   have ht : 0 ≤ t := by dsimp [t]; omega
   have he : z=t+1 := by dsimp [t]; ring
   rw [he]
   simp only [vlowM758]
   ring_nf
   positivity

theorem v_pos_low_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((0)) ((z+2)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_mid_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+w+2)) ((2*z+w+5)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_mid_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+w+2)) ((2*z+w+5)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_bridge_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vbridgeM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_bridge_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vbridgeM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_tail2_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vtail2M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_tail2_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vtail2M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_tail3_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vtail3M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_tail3_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vtail3M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_tail4_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vtail4M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_pos_tail4_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 0 < vtail4M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0)) := by
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_first_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 48*(0)*vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((0)) (3) ≤ vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((0)) (2)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_first_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 48*(y)*vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((0)) (3) ≤ vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((0)) (2)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_low_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((0)) ((z+3)-1)*vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((0)) ((z+3)+1) ≤ vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((0)) ((z+3))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_low_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((0)) ((z+3)-1)*vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((0)) ((z+3)+1) ≤ vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((0)) ((z+3))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_cross1_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((z+2))*vbridgeM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0)) ≤ vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((z+2)+1)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_cross1_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((z+2))*vbridgeM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0)) ≤ vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((z+2)+1)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_cross2_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vlowM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((z+2)+1)*vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((z+2)+3) ≤ vbridgeM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_cross2_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vlowM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((z+2)+1)*vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((z+2)+3) ≤ vbridgeM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_cross3_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vbridgeM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+3)) ((0))*vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+3)) ((z+3)+4) ≤ vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+3)) ((z+3)+3)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_cross3_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vbridgeM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+3)) ((0))*vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+3)) ((z+3)+4) ≤ vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+3)) ((z+3)+3)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_mid_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+w+4)) ((2*z+w+8)-1)*vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+w+4)) ((2*z+w+8)+1) ≤ vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+w+4)) ((2*z+w+8))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_mid_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+w+4)) ((2*z+w+8)-1)*vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+w+4)) ((2*z+w+8)+1) ≤ vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+w+4)) ((2*z+w+8))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_tail1_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+3)) (2*(z+3))*vtail2M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+3)) ((0)) ≤ vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+3)) (2*(z+3)+1)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_tail1_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+3)) (2*(z+3))*vtail2M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+3)) ((0)) ≤ vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+3)) (2*(z+3)+1)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_tail2_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) (2*(z+2)+1)*vtail3M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0)) ≤ vtail2M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_tail2_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) (2*(z+2)+1)*vtail3M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0)) ≤ vtail2M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_tail3_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vtail2M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0))*vtail4M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0)) ≤ vtail3M758 ((2*(x+1)+y)) ((x+1)) ((0)) ((z+2)) ((0))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_tail3_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vtail2M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0))*vtail4M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0)) ≤ vtail3M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) ((z+2)) ((0))^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_two_loM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vbridgeM758 ((2*(x+1)+y)) ((x+1)) ((0)) (2) ((0))*vtail2M758 ((2*(x+1)+y)) ((x+1)) ((0)) (2) ((0)) ≤ vmidM758 ((2*(x+1)+y)) ((x+1)) ((0)) (2) (5)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

theorem v_gap_two_hiM758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hz : 0 ≤ z) (hw : 0 ≤ w) :
 vbridgeM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) (2) ((0))*vtail2M758 ((2*(x+1)+y)) ((x+1+y)) ((y)) (2) ((0)) ≤ vmidM758 ((2*(x+1)+y)) ((x+1+y)) ((y)) (2) (5)^2 := by
 apply sub_nonneg.mp
 simp only [vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]
 ring_nf
 positivity

end
end MathGKM.Markov
