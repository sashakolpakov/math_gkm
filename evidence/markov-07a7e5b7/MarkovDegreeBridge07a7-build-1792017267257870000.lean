import MarkovDegreeTransfer07a7
/-! Machine-authored 07a7e5b7. Ordinary coefficient extraction bridges for
the degree-refined generating function, with the literal source numerator. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem degreeEval_coeff07a7 {R : Type*} [CommRing R]
    (y z p q : R) (d : ℕ) (w : List Bool) (s : ℕ) :
    (degreeEval07a7 (X:R[X]) (C y) (C z) (C p) (C q) d w).coeff s =
      degreeCoeff07a7 y z p q d w s := by
  induction w generalizing p q d s with
  | nil => cases s <;> simp [degreeEval07a7,degreeCoeff07a7]
  | cons r rs ih =>
    have hc : cutChargeA27 (C y) (C p) (C q) r=C (cutChargeA27 y p q r) := by
      cases r <;> simp [cutChargeA27,map_mul,map_add,map_ofNat]
    have hf : cutFactorA27 (C y) r=C (cutFactorA27 y r) := by
      cases r <;> simp [cutFactorA27]
    have he : X*(C z)^(d+(if r then 1 else 0))*cutFactorA27 (C y) r*(C p+C q)*
        degreeEval07a7 (X:R[X]) (C y) (C z) (C y) 1 1 rs =
        X*(C (z^(d+(if r then 1 else 0))*cutFactorA27 y r*(p+q))*
          degreeEval07a7 X (C y) (C z) (C y) (C 1) 1 rs) := by
      rw [hf]
      simp only [map_pow,map_mul,map_add,map_one]
      ring
    cases s with
    | zero => simp [degreeEval07a7,hc,he,ih,degreeCoeff07a7]
    | succ s =>
      simp only [degreeEval07a7,hc,he,Polynomial.coeff_add,Polynomial.coeff_X_mul,
        Polynomial.coeff_C_mul,ih,degreeCoeff07a7]

theorem degreeCoeff_layer07a7 {R : Type*} [CommRing R]
    (y : R) (w : List Bool) (s d : ℕ) :
    (degreeCoeff07a7 (C y) (X:R[X]) (C y) 1 1 w s).coeff d =
      degreeLayer07a7 y w s d := by
  rw [degreeCoeff_masks07a7,Polynomial.coeff_list_sum_map]
  have hm (m : List (Bool × Bool)) :
      maskWeight340 (C y) (C y) (1:R[X]) m=C (maskWeight340 y y 1 m) := by
    simpa using (maskWeight_mapFe01 (C:R →+* R[X]) y y 1 m).symm
  simp only [hm,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
  simp only [ite_mul,one_mul,zero_mul]
  unfold degreeLayer07a7
  generalize cutMasksFe01 w s = ms
  induction ms with
  | nil => simp
  | cons m ms ih =>
    by_cases h : maskDegree07a7 1 m=d
    · simp [h,eq_comm,ih]
    · simp [h,eq_comm,ih]

theorem source_degreeCoeff07a7 (path : List Bool) (i j s : ℕ)
    (hs : i+j=(frame path).mid.a+s) :
    coeff (frame path).mid.p i j =
      (degreeCoeff07a7 (X:ℤ[X]) 1 X 1 1 (central28 path++[true]) s).coeff j := by
  rw [degreeCoeff_forget07a7,source_cut_coeffA27 path i j s hs]

theorem maskSum_nonneg07a7 (ms : List (List (Bool × Bool))) (j : ℕ) :
    0≤((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff j := by
  induction ms with
  | nil => simp
  | cons m ms ih =>
    simpa only [List.map_cons,List.sum_cons,Polynomial.coeff_add] using
      add_nonneg (mask_coeff_nonnegFe01 m j) ih

theorem maskSum_no_gaps07a7 (ms : List (List (Bool × Bool))) (j k : ℕ)
    (hjk : j≤k) (hk : 0<((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff k) :
    0<((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff j := by
  induction ms with
  | nil => simp at hk
  | cons m ms ih =>
    simp only [List.map_cons,List.sum_cons,Polynomial.coeff_add] at hk ⊢
    by_cases hm : 0<(maskWeight340 (X:ℝ[X]) X 1 m).coeff k
    · exact add_pos_of_pos_of_nonneg (mask_no_gapsFe01 m j k hjk hm)
        (maskSum_nonneg07a7 ms j)
    · have ht : 0<((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff k := by
        linarith
      exact add_pos_of_nonneg_of_pos (mask_coeff_nonnegFe01 m j) (ih ht)

theorem degreeLayer_nonneg07a7 (w : List Bool) (s d j : ℕ) :
    0≤(degreeLayer07a7 (X:ℝ[X]) w s d).coeff j := maskSum_nonneg07a7 _ j

theorem degreeLayer_no_gaps07a7 (w : List Bool) (s d j k : ℕ)
    (hjk : j≤k) (hk : 0<(degreeLayer07a7 (X:ℝ[X]) w s d).coeff k) :
    0<(degreeLayer07a7 (X:ℝ[X]) w s d).coeff j :=
  maskSum_no_gaps07a7 _ j k hjk hk

#print axioms degreeEval_coeff07a7
#print axioms degreeCoeff_layer07a7
#print axioms source_degreeCoeff07a7
#print axioms degreeLayer_no_gaps07a7
end
end MathGKM.Markov
