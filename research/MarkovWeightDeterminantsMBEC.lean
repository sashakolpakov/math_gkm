import MarkovWeightRepresentationMA45
/-! Machine-authored beca0ad5. Exact four-row weight determinants.
These are auxiliary identities, not a Schur expansion theorem. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
set_option maxRecDepth 4000

def weightDetMBEC (a b c d : ℕ) : ℝ := Matrix.det
 !![qWeightM7E2 a, qWeightM7E2 ((a:ℤ)+1), qWeightM7E2 ((a:ℤ)+2), qWeightM7E2 ((a:ℤ)+3);
    qWeightM7E2 ((b:ℤ)-1), qWeightM7E2 b, qWeightM7E2 ((b:ℤ)+1), qWeightM7E2 ((b:ℤ)+2);
    qWeightM7E2 ((c:ℤ)-2), qWeightM7E2 ((c:ℤ)-1), qWeightM7E2 c, qWeightM7E2 ((c:ℤ)+1);
    qWeightM7E2 ((d:ℤ)-3), qWeightM7E2 ((d:ℤ)-2), qWeightM7E2 ((d:ℤ)-1), qWeightM7E2 d]

theorem weight_positive_indexMBEC (n : ℤ) (hn : 0<n) : qWeightM7E2 n=4*(n:ℝ) := by
 simp [qWeightM7E2,show ¬n<0 by omega,show n≠0 by omega]

theorem weight_det_forbiddenMBEC (a b c d : ℕ) (hab : b≤a) (hbc : c≤b)
 (hc : 3≤c) : weightDetMBEC a b c d=0 := by
 unfold weightDetMBEC
 simp only [weight_positive_indexMBEC _ (by omega : (0:ℤ)<a),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+2),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+3),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(b:ℤ)-1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<b),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(b:ℤ)+1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(b:ℤ)+2),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(c:ℤ)-2),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(c:ℤ)-1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<c),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(c:ℤ)+1)]
 push_cast
 convert affine_four_det_zeroMA45 (4*a) (4*(b:ℝ)-4) (4*(c:ℝ)-8) 0 4 8 12
   (qWeightM7E2 ((d:ℤ)-3)) (qWeightM7E2 ((d:ℤ)-2))
   (qWeightM7E2 ((d:ℤ)-1)) (qWeightM7E2 d) using 1 <;> congr 1 <;> ring

theorem weight_det_rectangleMBEC (a b c d : ℕ) (hab : b≤a) (hb : 2≤b)
 (hc : c≤2) (hd : d≤c) :
 weightDetMBEC a b c d = 16*((a:ℝ)-b+1)*
   (1+(if c=1 then 1 else 0)+(if d=1 then 1 else 0)) := by
 unfold weightDetMBEC
 simp only [weight_positive_indexMBEC _ (by omega : (0:ℤ)<a),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+2),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+3),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(b:ℤ)-1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<b),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(b:ℤ)+1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(b:ℤ)+2)]
 interval_cases c <;> interval_cases d <;>
   rw [Matrix.det_succ_row _ 3] <;>
   simp only [Fin.sum_univ_four]
 all_goals norm_num only [ite_true,ite_false,Matrix.cons_val_zero,Matrix.cons_val_one,Matrix.of_apply,Fin.coe_ofNat_eq_mod,Fin.val_castSucc,Fin.val_succ,Fin.castSucc_mk,Fin.succ_mk,qWeightM7E2,Matrix.det_fin_three,
     Fin.sum_univ_four,Matrix.submatrix,Fin.succAbove,Fin.lt_def,Matrix.cons_val',Matrix.cons_val,Matrix.cons_val_fin_one] <;> simp <;> push_cast <;> ring

theorem weight_det_hookMBEC (a b c d : ℕ) (ha : 1≤a) (hb : b≤1)
 (hc : c≤b) (hd : d≤c) :
 weightDetMBEC a b c d =
 4*((2*((b:ℝ)+c+d)+1)*a-((b:ℝ)+c+d)) := by
 unfold weightDetMBEC
 simp only [weight_positive_indexMBEC _ (by omega : (0:ℤ)<a),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+1),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+2),
   weight_positive_indexMBEC _ (by omega : (0:ℤ)<(a:ℤ)+3)]
 interval_cases b <;> interval_cases c <;> interval_cases d <;>
   rw [Matrix.det_succ_row _ 3] <;>
   simp only [Fin.sum_univ_four]
 all_goals norm_num only [ite_true,ite_false,Matrix.cons_val_zero,Matrix.cons_val_one,Matrix.of_apply,Fin.coe_ofNat_eq_mod,Fin.val_castSucc,Fin.val_succ,Fin.castSucc_mk,Fin.succ_mk,qWeightM7E2,Matrix.det_fin_three,
     Fin.sum_univ_four,Matrix.submatrix,Fin.succAbove,Fin.lt_def,Matrix.cons_val',Matrix.cons_val,Matrix.cons_val_fin_one] <;> simp <;> push_cast <;> ring

theorem weight_det_emptyMBEC : weightDetMBEC 0 0 0 0=1 := by
 unfold weightDetMBEC
 rw [Matrix.det_succ_row _ 3]
 simp only [Fin.sum_univ_four]
 all_goals norm_num only [ite_true,ite_false,Matrix.cons_val_zero,Matrix.cons_val_one,Matrix.of_apply,Fin.coe_ofNat_eq_mod,Fin.val_castSucc,Fin.val_succ,Fin.castSucc_mk,Fin.succ_mk,qWeightM7E2,Matrix.det_fin_three,
   Fin.sum_univ_four,Matrix.submatrix,Fin.succAbove,Fin.lt_def,Matrix.cons_val',Matrix.cons_val,Matrix.cons_val_fin_one]
 all_goals simp

theorem weight_det_positiveMBEC (a b c d : ℕ) (hab : b≤a) (hbc : c≤b)
 (hcd : d≤c) (hc : c≤2) : 0<weightDetMBEC a b c d := by
 by_cases hb : 2≤b
 · rw [weight_det_rectangleMBEC a b c d hab hb hc hcd]
   have h : (b:ℝ)≤a := by exact_mod_cast hab
   have hpos : 0<(a:ℝ)-b+1 := by linarith
   positivity
 · by_cases ha : 1≤a
   · rw [weight_det_hookMBEC a b c d ha (by omega) hbc hcd]
     have ha' : (1:ℝ)≤a := by exact_mod_cast ha
     have hn : 0≤(b:ℝ)+c+d := by positivity
     nlinarith
   · have h0 : a=0 ∧ b=0 ∧ c=0 ∧ d=0 := by omega
     rcases h0 with ⟨rfl,rfl,rfl,rfl⟩
     rw [weight_det_emptyMBEC]
     norm_num

theorem weight_det_nonnegMBEC (a b c d : ℕ) (hab : b≤a) (hbc : c≤b)
 (hcd : d≤c) : 0≤weightDetMBEC a b c d := by
 by_cases hc : c≤2
 · exact (weight_det_positiveMBEC a b c d hab hbc hcd hc).le
 · rw [weight_det_forbiddenMBEC a b c d hab hbc (by omega)]

theorem weight_det_zero_iffMBEC (a b c d : ℕ) (hab : b≤a) (hbc : c≤b)
 (hcd : d≤c) : weightDetMBEC a b c d=0 ↔ 3≤c := by
 constructor
 · intro he
   by_contra hn
   have hp := weight_det_positiveMBEC a b c d hab hbc hcd (by omega)
   linarith
 · exact weight_det_forbiddenMBEC a b c d hab hbc

end
end MathGKM.Markov
