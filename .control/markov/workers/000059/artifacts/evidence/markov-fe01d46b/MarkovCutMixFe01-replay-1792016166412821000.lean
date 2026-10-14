import MarkovCutMasksFe01
/-! Machine-authored fe01d46b. Actual-source failure of pairwise summand
synchronization. The full raw source triple satisfies the pinned inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def cutLeftFe01 : List (Bool × Bool) := [(true,true),(true,false),(true,false)]
def cutRightFe01 : List (Bool × Bool) := [(true,false),(true,false),(true,true)]

theorem cut_pair_sourceFe01 :
 cutLeftFe01 ∈ cutMasksFe01 (central28 [true,true]++[true]) 1 ∧
 cutRightFe01 ∈ cutMasksFe01 (central28 [true,true]++[true]) 1 := by
 decide

theorem cut_pair_polynomialsFe01 {R : Type*} [CommRing R] (y : R) :
 maskWeight340 y y 1 cutLeftFe01=(1+y)^2 ∧
 maskWeight340 y y 1 cutRightFe01=(1+y)^2*(1+y+y^2) := by
 simp [cutLeftFe01,cutRightFe01,maskWeight340,cutChargeA27,cutFactorA27]
 constructor <;> ring

theorem source_pair_mixed_failureFe01 :
 let p := maskWeight340 (X:ℤ[X]) X 1 cutLeftFe01
 let q := maskWeight340 (X:ℤ[X]) X 1 cutRightFe01
 2*p.coeff 3*q.coeff 3-p.coeff 2*q.coeff 4-q.coeff 2*p.coeff 4 = -1 := by
 obtain ⟨hp,hq⟩ := cut_pair_polynomialsFe01 (X:ℤ[X])
 dsimp only
 rw [hp,hq]
 have hq' : (1+(X:ℤ[X]))^2*(1+X+X^2)=1+3*X+4*X^2+3*X^3+X^4 := by ring
 rw [hq']
 norm_num [Polynomial.coeff_one_add_X_pow,Polynomial.coeff_add,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_one,Polynomial.coeff_X]

theorem source_cut_sum_34Fe01 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (central28 [true,true]++[true]) 1=
 3+8*y+8*y^2+4*y^3+y^4 := by
 simp [central28,subst28,cutCoeffA27,cutChargeA27,cutFactorA27]
 ring

theorem source_raw_gap_34Fe01 :
 let m := (frame [true,true]).mid
 m.a=3 ∧ m.b=4 ∧ InPolygon m.a m.b 2 2 ∧
 InPolygon m.a m.b 1 3 ∧ InPolygon m.a m.b 0 4 ∧
 coeff m.p 2 2=8 ∧ coeff m.p 1 3=4 ∧ coeff m.p 0 4=1 ∧
 coeff m.p 1 3^2-coeff m.p 2 2*coeff m.p 0 4=8 := by
 have ha : (frame [true,true]).mid.a=3 := by rfl
 have hb : (frame [true,true]).mid.b=4 := by rfl
 have h (i j : ℕ) (hij : i+j=4) :
     coeff (frame [true,true]).mid.p i j=
       (3+8*(X:ℤ[X])+8*X^2+4*X^3+X^4).coeff j := by
   rw [source_cut_coeffA27 [true,true] i j 1 (by rw [ha]; omega),
     source_cut_sum_34Fe01]
 dsimp only
 rw [ha,hb,h 2 2 (by decide),h 1 3 (by decide),h 0 4 (by decide)]
 norm_num [InPolygon,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_one,Polynomial.coeff_X]

#print axioms cut_pair_sourceFe01
#print axioms source_pair_mixed_failureFe01
#print axioms source_raw_gap_34Fe01
end
end MathGKM.Markov
