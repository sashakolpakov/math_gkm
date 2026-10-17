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
   norm_num [qWeightM7E2,Matrix.det_fin_three,
     Fin.sum_univ_succ,Matrix.submatrix,Fin.succAbove,Fin.lt_def] <;> ring

end
end MathGKM.Markov
