import MarkovLaurent2d1

/-! Machine-authored worker 2d1cb040. Restore z by projective scaling.
This proves rational-function evaluation correspondence, not degree bounds. -/
namespace MathGKM.Markov
noncomputable section

def scaleValues2d1 {K : Type*} [Field K] (z : K) (t : K × K × K) : K × K × K :=
  (z*t.1, z*t.2.1, z*t.2.2)

theorem scale_vieta_2d1 {K : Type*} [Field K] (z k : K) (hz : z ≠ 0)
    (t : K × K × K) (r : Bool) :
    scaleValues2d1 z (vieta2d1 k t r) =
      vieta2d1 (k/z) (scaleValues2d1 z t) r := by
  cases r <;> simp only [vieta2d1, Bool.false_eq_true, if_false, if_true, scaleValues2d1]
  all_goals apply Prod.ext
  all_goals first | rfl | (apply Prod.ext <;> first | rfl | (field_simp; ring))

theorem scale_fold_2d1 {K : Type*} [Field K] (z k : K) (hz : z ≠ 0)
    (path : List Bool) (t : K × K × K) :
    scaleValues2d1 z (path.foldl (vieta2d1 k) t) =
      path.foldl (vieta2d1 (k/z)) (scaleValues2d1 z t) := by
  induction path generalizing t with
  | nil => rfl
  | cons r rs ih =>
    simp only [List.foldl_cons]
    rw [ih, scale_vieta_2d1 z k hz t r]

def sourceValues2d1 {K : Type*} [Field K] (x y z : K) (f : Frame) : K × K × K :=
  scaleValues2d1 z (values2d1 (squaredEval2d1 (x/z) (y/z)) (x/z) (y/z) f)

theorem source_full_evaluation_2d1 {K : Type*} [Field K]
    (x y z : K) (hx : x ≠ 0) (hy : y ≠ 0) (hz : z ≠ 0) (path : List Bool) :
    sourceValues2d1 x y z (frame path) =
      path.foldl (vieta2d1 ((x^2+y^2+z^2)/(x*y*z)))
        (x, ((x^2+y^2)^2+x^2*z^2)/(y*z^2), (x^2+y^2)/z) := by
  unfold sourceValues2d1
  rw [source_specialization_2d1 (x/z) (y/z) (div_ne_zero hx hz) (div_ne_zero hy hz),
    scale_fold_2d1 z _ hz]
  have hk : (((x/z)^2+(y/z)^2+1)/((x/z)*(y/z)))/z =
      (x^2+y^2+z^2)/(x*y*z) := by field_simp; ring
  rw [hk]
  congr 1
  simp only [scaleValues2d1]
  apply Prod.ext
  · field_simp
  · apply Prod.ext <;> field_simp <;> ring

#print axioms scale_vieta_2d1
#print axioms scale_fold_2d1
#print axioms source_full_evaluation_2d1
end
end MathGKM.Markov
