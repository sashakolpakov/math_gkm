import MarkovCutPositiveFe01
/-! Machine-authored request 07a7e5b7. Chronological one-cut sums can fail
inside an actual source. This is not a counterexample to the complete sum. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem cut_one_append07a7 {R : Type*} [CommRing R] (y p q : R)
    (u v : List Bool) :
    cutCoeffA27 y p q (u++v) 1 = cutCoeffA27 y p q u 1 +
      cutCoeffA27 y (gapChargeA27 y p q u) q v 1 := by
  induction u generalizing p q with
  | nil => simp [cutCoeffA27,gapChargeA27]
  | cons r rs ih =>
    simp only [List.cons_append,cutCoeffA27,gapChargeA27]
    rw [cutCoeff_zeroA27,cutCoeff_zeroA27,ih]
    ring

def sourcePath1113_07a7 : List Bool :=
  [true,true,true,true,true,false]

theorem source_word1113_07a7 :
    central28 sourcePath1113_07a7++[true] =
    [true,true,true,true,true,false,true,true,true,true,true,true] := by
  decide

def prefix1113_07a7 {R : Type*} [CommRing R] (y : R) : R :=
  cutCoeffA27 y y 1 ((central28 sourcePath1113_07a7++[true]).take 8) 1

theorem prefix1113_formula07a7 {R : Type*} [CommRing R] (y : R) :
    prefix1113_07a7 y = 8+20*y+20*y^2+14*y^3+10*y^4+6*y^5+2*y^6 := by
  rw [prefix1113_07a7,source_word1113_07a7]
  simp only [List.take,cutCoeffA27,cutChargeA27,cutFactorA27,
    Bool.false_eq_true,if_false,if_true]
  ring

theorem prefix1113_failure07a7 :
    let p := prefix1113_07a7 (X:ℤ[X])
    p.coeff 3^2-p.coeff 2*p.coeff 4 = -4 := by
  dsimp only
  rw [prefix1113_formula07a7]
  norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
    Polynomial.coeff_X_pow,Polynomial.coeff_X]

theorem full1113_formula07a7 {R : Type*} [CommRing R] (y : R) :
    cutCoeffA27 y y 1 (central28 sourcePath1113_07a7++[true]) 1 =
    12+32*y+36*y^2+28*y^3+20*y^4+12*y^5+4*y^6 := by
  rw [source_word1113_07a7]
  simp only [cutCoeffA27,cutChargeA27,cutFactorA27,
    Bool.false_eq_true,if_false,if_true]
  ring

theorem full1113_raw07a7 :
    let m := (frame sourcePath1113_07a7).mid
    m.a=11 ∧ m.b=13 ∧
    InPolygon m.a m.b 10 2 ∧ InPolygon m.a m.b 9 3 ∧ InPolygon m.a m.b 8 4 ∧
    coeff m.p 10 2=36 ∧ coeff m.p 9 3=28 ∧ coeff m.p 8 4=20 ∧
    coeff m.p 9 3^2-coeff m.p 10 2*coeff m.p 8 4=64 := by
  have ha : (frame sourcePath1113_07a7).mid.a=11 := by rfl
  have hb : (frame sourcePath1113_07a7).mid.b=13 := by rfl
  have h (i j : ℕ) (hij : i+j=12) :
      coeff (frame sourcePath1113_07a7).mid.p i j=
      (12+32*(X:ℤ[X])+36*X^2+28*X^3+20*X^4+12*X^5+4*X^6).coeff j := by
    rw [source_cut_coeffA27 sourcePath1113_07a7 i j 1 (by rw [ha]; omega),
      full1113_formula07a7]
  dsimp only
  rw [ha,hb,h 10 2 (by decide),h 9 3 (by decide),h 8 4 (by decide)]
  norm_num [InPolygon,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
    Polynomial.coeff_X_pow,Polynomial.coeff_X]

#print axioms cut_one_append07a7
#print axioms prefix1113_failure07a7
#print axioms full1113_raw07a7
end
end MathGKM.Markov
