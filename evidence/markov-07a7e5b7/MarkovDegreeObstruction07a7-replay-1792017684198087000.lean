import MarkovCutDegree07a7
/-! Machine-authored 07a7e5b7. The degree-refined array of an actual source
fails log-concavity in the degree coordinate. This is not a root direction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 10000
set_option maxHeartbeats 4000000

def sourcePath27_07a7 : List Bool := [false,false,true]

theorem source_word27_07a7 :
    central28 sourcePath27_07a7++[true]=[false,false,true,false,false,true] := by
  decide

theorem degree_layers27_07a7 {R : Type*} [CommRing R] (y : R) :
    degreeLayer07a7 y (central28 sourcePath27_07a7++[true]) 2 0=1 ∧
    degreeLayer07a7 y (central28 sourcePath27_07a7++[true]) 2 1=3+3*y ∧
    degreeLayer07a7 y (central28 sourcePath27_07a7++[true]) 2 2=11+25*y+14*y^2 := by
  rw [source_word27_07a7]
  norm_num [degreeLayer07a7,cutMasksFe01,maskDegree07a7,maskWeight340,
    cutChargeA27,cutFactorA27]
  constructor <;> ring

theorem degree_count_failure27_07a7 :
    (frame sourcePath27_07a7).mid.a=2 ∧ (frame sourcePath27_07a7).mid.b=7 ∧
    let w := central28 sourcePath27_07a7++[true]
    (degreeLayer07a7 (X:ℤ[X]) w 2 1).coeff 0^2 <
      (degreeLayer07a7 (X:ℤ[X]) w 2 0).coeff 0 *
      (degreeLayer07a7 (X:ℤ[X]) w 2 2).coeff 0 := by
  obtain ⟨h0,h1,h2⟩ := degree_layers27_07a7 (X:ℤ[X])
  refine ⟨rfl,rfl,?_⟩
  dsimp only
  rw [h0,h1,h2]
  norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
    Polynomial.coeff_X,Polynomial.coeff_X_pow]

theorem full27_formula07a7 {R : Type*} [CommRing R] (y : R) :
    cutCoeffA27 y y 1 (central28 sourcePath27_07a7++[true]) 2 =
    15+28*y+14*y^2 := by
  rw [source_word27_07a7]
  simp only [cutCoeffA27,cutChargeA27,cutFactorA27,
    Bool.false_eq_true,if_false,if_true]
  ring

theorem full27_raw07a7 :
    let m := (frame sourcePath27_07a7).mid
    InPolygon m.a m.b 4 0 ∧ InPolygon m.a m.b 3 1 ∧ InPolygon m.a m.b 2 2 ∧
    coeff m.p 4 0=15 ∧ coeff m.p 3 1=28 ∧ coeff m.p 2 2=14 ∧
    coeff m.p 3 1^2-coeff m.p 4 0*coeff m.p 2 2=574 := by
  have ha : (frame sourcePath27_07a7).mid.a=2 := by rfl
  have hb : (frame sourcePath27_07a7).mid.b=7 := by rfl
  have h (i j : ℕ) (hij : i+j=4) :
      coeff (frame sourcePath27_07a7).mid.p i j=
      (15+28*(X:ℤ[X])+14*X^2).coeff j := by
    rw [source_cut_coeffA27 sourcePath27_07a7 i j 2 (by rw [ha]; omega),
      full27_formula07a7]
  dsimp only
  rw [ha,hb,h 4 0 (by decide),h 3 1 (by decide),h 2 2 (by decide)]
  norm_num [InPolygon,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
    Polynomial.coeff_X_pow,Polynomial.coeff_X]

#print axioms degree_layers27_07a7
#print axioms degree_count_failure27_07a7
#print axioms full27_raw07a7
end
end MathGKM.Markov
