import MarkovDegreeBridge07a7
import MarkovAbel65c4
/-! Machine-authored 7d905904. Exact diagonal graded-tail certificate.
Tail positivity is an explicit unproved hypothesis for general sources. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

def CoeffTailNonneg7d (p : ℝ[X]) : Prop :=
 ∀ r, r≤p.natDegree+1 →
   0≤∑ k ∈ range (p.natDegree+1-r),p.coeff (r+k)

theorem tail_eval_nonneg7d (p : ℝ[X]) (hp : CoeffTailNonneg7d p)
 (z : ℝ) (hz : 1≤z) : 0≤p.eval z := by
 rw [Polynomial.eval_eq_sum_range]
 apply tail_weight_nonneg65c4 _ _ _ hp
 · simp
 · intro k hk
   rw [pow_succ]
   have h0 : 0≤z^k := pow_nonneg (by linarith) k
   nlinarith

def markedCoeff7d (w : List Bool) (s j : ℕ) : ℝ[X] :=
 ((cutMasksFe01 w s).map (fun m =>
   C ((maskWeight340 (X:ℝ[X]) X 1 m).coeff j)*X^(maskDegree07a7 1 m))).sum

theorem markedCoeff_layer7d (w : List Bool) (s j d : ℕ) :
 (markedCoeff7d w s j).coeff d=
 (degreeLayer07a7 (X:ℝ[X]) w s d).coeff j := by
 unfold markedCoeff7d degreeLayer07a7
 rw [Polynomial.coeff_list_sum_map,Polynomial.coeff_list_sum_map]
 generalize cutMasksFe01 w s=ms
 induction ms with
 | nil => simp
 | cons m ms ih =>
   by_cases h : maskDegree07a7 1 m=d
   · simp [h,ih,Polynomial.coeff_C_mul_X_pow]
   · simp [h,Ne.symm h,ih,Polynomial.coeff_C_mul_X_pow]

theorem markedCoeff_at_one7d (w : List Bool) (s j : ℕ) :
 (markedCoeff7d w s j).eval 1=(cutCoeffA27 (X:ℝ[X]) X 1 w s).coeff j := by
 rw [←cutMasks_sumFe01,Polynomial.coeff_list_sum_map]
 simp [markedCoeff7d,Polynomial.eval_list_sum,List.map_map,Function.comp_def]

theorem source_markedCoeff_at_one7d (path : List Bool) (i j s : ℕ)
 (hs : i+j=(frame path).mid.a+s) :
 (markedCoeff7d (central28 path++[true]) s j).eval 1=
 (coeff (frame path).mid.p i j:ℝ) := by
 rw [markedCoeff_at_one7d,sourceTerms_coeffFe01 path i j s hs]
 simp [sourceTermsFe01,cutMasks_sumFe01]

def diagonalGradeGap7d (w : List Bool) (s j : ℕ) : ℝ[X] :=
 (markedCoeff7d w s (j+1))^2-markedCoeff7d w s j*markedCoeff7d w s (j+2)

theorem diagonal_deformed_of_tail7d (w : List Bool) (s j : ℕ)
 (h : CoeffTailNonneg7d (diagonalGradeGap7d w s j))
 (z : ℝ) (hz : 1≤z) :
 (markedCoeff7d w s j).eval z*(markedCoeff7d w s (j+2)).eval z≤
 ((markedCoeff7d w s (j+1)).eval z)^2 := by
 have hh := tail_eval_nonneg7d _ h z hz
 simpa [diagonalGradeGap7d,sub_nonneg] using hh

theorem source_diagonal_of_tail7d (path : List Bool) (i j s : ℕ)
 (hs : i+j+2=(frame path).mid.a+s)
 (h : CoeffTailNonneg7d (diagonalGradeGap7d (central28 path++[true]) s j)) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have hh := diagonal_deformed_of_tail7d _ s j h 1 le_rfl
 rw [source_markedCoeff_at_one7d path (i+2) j s (by omega),
   source_markedCoeff_at_one7d path i (j+2) s (by omega),
   source_markedCoeff_at_one7d path (i+1) (j+1) s (by omega)] at hh
 have hh' : (coeff (frame path).mid.p i (j+2):ℝ)*
     (coeff (frame path).mid.p (i+2) j:ℝ)≤
     (coeff (frame path).mid.p (i+1) (j+1):ℝ)^2 := by simpa [mul_comm] using hh
 exact_mod_cast hh'

#print axioms tail_eval_nonneg7d
#print axioms markedCoeff_layer7d
#print axioms source_diagonal_of_tail7d
end
end MathGKM.Markov
