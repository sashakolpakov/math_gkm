import MarkovRunDegree6d34
/-! Machine-authored 6d34. Repeated-B degree layers are exact increments
of the complete cut polynomial. Multiplicity and zero terms are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem degreeLayer_sum6d34 {R : Type*} [CommRing R]
    (y : R) (w : List Bool) (s d : ℕ) :
    degreeLayer07a7 y w s d=((cutMasksFe01 w s).map
      (fun m => if maskDegree07a7 1 m=d then maskWeight340 y y 1 m else 0)).sum := by
  unfold degreeLayer07a7
  generalize cutMasksFe01 w s=ms
  induction ms with
  | nil => simp
  | cons m ms ih =>
    by_cases h : maskDegree07a7 1 m=d <;> simp [h,ih]

theorem cut_run_increment6d34 {R : Type*} [CommRing R]
    (y : R) (n s : ℕ) :
    ((cutMasksFe01 (List.replicate n true) s).map
      (fun m => maskWeight340 y y 1 (m++[(true,true)]))).sum =
      cutCoeffA27 y y 1 (List.replicate (n+1) true) (s+1)-
      cutCoeffA27 y y 1 (List.replicate n true) (s+1) := by
  have h := maskSum_snoc6d34 (List.replicate n true) true (s+1)
    (maskWeight340 y y 1)
  simp only [maskWeight_skip_last6d34,Nat.succ_ne_zero,if_false,
    Nat.add_sub_cancel,cutMasks_sumFe01,← List.replicate_succ'] at h
  linear_combination h

theorem layer_run_step6d34 {R : Type*} [CommRing R]
    (y : R) (n s d : ℕ) :
    degreeLayer07a7 y (List.replicate (n+1) true) (s+1) d =
      degreeLayer07a7 y (List.replicate n true) (s+1) d +
      if d=n+s+2 then
        cutCoeffA27 y y 1 (List.replicate (n+1) true) (s+1)-
        cutCoeffA27 y y 1 (List.replicate n true) (s+1) else 0 := by
  rw [degreeLayer_sum6d34,List.replicate_succ',maskSum_snoc6d34]
  simp only [Nat.succ_ne_zero,if_false,Nat.add_sub_cancel,
    maskDegree_skip_last6d34,maskWeight_skip_last6d34,←degreeLayer_sum6d34]
  congr 1
  have he : ((cutMasksFe01 (List.replicate n true) s).map
      (fun m => if maskDegree07a7 1 (m++[(true,true)])=d then
        maskWeight340 y y 1 (m++[(true,true)]) else 0)).sum =
      ((cutMasksFe01 (List.replicate n true) s).map
      (fun m => if d=n+s+2 then maskWeight340 y y 1 (m++[(true,true)]) else 0)).sum := by
    apply congrArg List.sum
    apply List.map_congr_left
    intro m hm
    rw [sourceMask_last_degree6d34 n s m hm]
    simp only [eq_comm]
  rw [he]
  by_cases hd : d=n+s+2
  · simp only [hd,if_true]
    exact cut_run_increment6d34 y n s
  · simp [hd]

theorem layer_run_above6d34 {R : Type*} [CommRing R]
    (y : R) (n s d : ℕ) (hd : n+s+1<d) :
    degreeLayer07a7 y (List.replicate n true) (s+1) d=0 := by
  induction n with
  | zero => simp [degreeLayer07a7,cutMasksFe01]
  | succ n ih =>
    rw [layer_run_step6d34,ih (by omega),if_neg (by omega)]
    ring

theorem layer_run_exact6d34 {R : Type*} [CommRing R]
    (y : R) (n k s : ℕ) (hk : k<n) :
    degreeLayer07a7 y (List.replicate n true) (s+1) (k+s+2)=
      cutCoeffA27 y y 1 (List.replicate (k+1) true) (s+1)-
      cutCoeffA27 y y 1 (List.replicate k true) (s+1) := by
  induction n with
  | zero => omega
  | succ n ih =>
    by_cases he : k=n
    · subst k
      rw [layer_run_step6d34,if_pos rfl,layer_run_above6d34 y n s _ (by omega)]
      ring
    · rw [layer_run_step6d34,if_neg (by omega),add_zero]
      exact ih (by omega)

#print axioms layer_run_step6d34
#print axioms layer_run_exact6d34
end
end MathGKM.Markov
