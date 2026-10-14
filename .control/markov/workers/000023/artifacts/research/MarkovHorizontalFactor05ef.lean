import MarkovHorizontalWord05ef
import MarkovHorizontalLCB46
import MarkovCubicBounds5a7
/-! Machine-authored 05ef7fab. Exact factorization and cubic inequalities.
The source statistic dichotomy is not assumed proved by this module. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

theorem hword_second_factor05ef (d : Bool) (w : List Bool)
 (hn : 3 ≤ (d::w).length) :
 2*(hword46 (X : Polynomial ℤ) (d::w)).coeff 2 =
 X^((d::w).count true)*(X+1)^((d::w).length-3)*
 hseed05ef X (d::w).length ((d::w).count true)
   (4*(hbb05ef d w : Polynomial ℤ)+(if d then 2 else 0)+(if hlast05ef d w then 2 else 0)) := by
 have hz : (X+1 : Polynomial ℤ) ≠ 0 := by
   intro h
   have hh := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
   norm_num [Polynomial.coeff_one] at hh
 apply mul_left_cancel₀ (pow_ne_zero 3 hz)
 have hh := hword_second05ef (X : Polynomial ℤ) d w
 rw [htail_count05ef] at hh
 have he : (X+1 : Polynomial ℤ)^((d::w).length) =
   (X+1)^((d::w).length-3)*(X+1)^3 := by
   rw [← pow_add,Nat.sub_add_cancel hn]
 rw [he] at hh
 convert hh using 1 <;> ring

theorem hbb_bounds05ef (d : Bool) (w : List Bool) :
 hbb05ef d w+(if d then 1 else 0) ≤ (d::w).count true ∧
 hbb05ef d w+(if hlast05ef d w then 1 else 0) ≤ (d::w).count true := by
 induction w generalizing d with
 | nil => cases d <;> simp [hbb05ef,hlast05ef]
 | cons z zs ih =>
   obtain ⟨h1,h2⟩ := ih z
   cases d <;> cases z <;>
     simp [hbb05ef,hlast05ef,List.count_cons] at h1 h2 ⊢ <;>
     split_ifs at * <;> omega

theorem hscore_bound05ef (d : Bool) (w : List Bool) :
 4*hbb05ef d w+(if d then 2 else 0)+(if hlast05ef d w then 2 else 0) ≤
 4*(d::w).count true := by
 obtain ⟨h1,h2⟩ := hbb_bounds05ef d w
 split_ifs at * <;> omega

def hb05ef (m : ℝ) := 9*m^2+13*m+6
def hc05ef (n m : ℝ) := 2*(3*(m+1)*n+3*m^2+4*m+3)
def hd05ef (n m : ℝ) := (n+m+2)*(n+m+1)

theorem hseed_cert05ef (m y : ℝ) (hm : 0 ≤ m) (hy : 0 ≤ y) :
 0 ≤ hb05ef m^2-8*m*hc05ef (2*m) m ∧
 0 ≤ hc05ef (m+y) m^2-hb05ef m*hd05ef (m+y) m ∧
 0 ≤ hb05ef m*hc05ef m m-8*m*hd05ef (2*m) m := by
 unfold hb05ef hc05ef hd05ef
 repeat' constructor
 all_goals ring_nf; positivity

theorem hseed_cross05ef (n m a : ℝ) (hm : 0 ≤ m) (hn : m ≤ n)
 (ha : 0 ≤ a) (ham : a ≤ 4*m) (hs : a=0 ∨ n ≤ 2*m) :
 CrossLC (CubicSeq5a7 (2*a) (hb05ef m) (hc05ef n m) (hd05ef n m)) := by
 have hn0 : 0 ≤ n := le_trans hm hn
 have hb : 0 ≤ hb05ef m := by unfold hb05ef; positivity
 have hc : 0 ≤ hc05ef n m := by unfold hc05ef; positivity
 have hd : 0 ≤ hd05ef n m := by unfold hd05ef; positivity
 have H := hseed_cert05ef m (n-m) hm (by linarith)
 rw [show m+(n-m)=n by ring] at H
 apply cubic_crossLC5a7 (by positivity) hb hc hd
 · rcases hs with h | h
   · rw [h]; simp; positivity
   · have hcm : hc05ef n m ≤ hc05ef (2*m) m := by
       unfold hc05ef
       nlinarith [mul_nonneg (show 0 ≤ m+1 by linarith) (show 0 ≤ 2*m-n by linarith)]
     have hA := mul_le_mul_of_nonneg_right (show 2*a ≤ 8*m by linarith) hc
     have hC := mul_le_mul_of_nonneg_left hcm (show 0 ≤ 8*m by positivity)
     linarith [H.1]
 · linarith [H.2.1]
 · rcases hs with h | h
   · rw [h]; simp; exact mul_nonneg hb hc
   · have hdU : hd05ef n m ≤ hd05ef (2*m) m := by
       unfold hd05ef
       nlinarith [mul_nonneg (show 0 ≤ 2*m-n by linarith) (show 0 ≤ n+4*m+3 by positivity)]
     have hcL : hc05ef m m ≤ hc05ef n m := by
       unfold hc05ef
       nlinarith [mul_nonneg (show 0 ≤ m+1 by linarith) (show 0 ≤ n-m by linarith)]
     have hA := mul_le_mul_of_nonneg_right (show 2*a ≤ 8*m by linarith) hd
     have hD := mul_le_mul_of_nonneg_left hdU (show 0 ≤ 8*m by positivity)
     have hC := mul_le_mul_of_nonneg_left hcL hb
     linarith [H.2.2]

#print axioms hword_second_factor05ef
#print axioms hscore_bound05ef
#print axioms hseed_cross05ef
end
end MathGKM.Markov
