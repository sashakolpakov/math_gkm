import MarkovTwoColumnM679
/-! Machine-authored 6799c386. A concrete obstruction to termwise LC after
pairing A_r with B_(r-1). The actual source triple satisfies raw LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

def columnGroupM679 (q i r : ℕ) : Polynomial ℤ :=
 2*X*columnTermM679 r 1 i*shiftKernelM679 X r 1 (r+2) (q-r)+
 if r=0 then 0 else columnTermM679 (r-1) 2 i*
   shiftKernelM679 X r 0 (r+1) (q-(r-1))

theorem column_group_exampleM679 :
 columnGroupM679 3 3 1=2*X+4*X^2+10*X^3+12*X^4+12*X^5 := by
 norm_num [columnGroupM679,columnTermM679,shiftKernelM679,posKernelM679,risingM679,
   Finset.Nat.antidiagonal_succ,Finset.Nat.antidiagonal_zero,Nat.choose]
 ring

theorem column_group_not_lcM679 :
 (columnGroupM679 3 3 1).coeff 2^2 <
   (columnGroupM679 3 3 1).coeff 1*(columnGroupM679 3 3 1).coeff 3 := by
 rw [column_group_exampleM679]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_X]

theorem column_obstruction_sourceM679 :
 let m := (frame (lowerPathM58E 2 1)).mid
 m.a=2 ∧ m.b=7 ∧
 InPolygon m.a m.b 3 1 ∧ InPolygon m.a m.b 3 2 ∧ InPolygon m.a m.b 3 3 ∧
 coeff m.p 3 1=28 ∧ coeff m.p 3 2=68 ∧ coeff m.p 3 3=108 ∧
 coeff m.p 3 1*coeff m.p 3 3 ≤ coeff m.p 3 2^2 := by
 dsimp only
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E 2 1 (by omega)
 have h1 := source_two_lower_formulaM58E (lowerPathM58E 2 1) 1 2 3 ha (by omega)
 have h2 := source_two_lower_formulaM58E (lowerPathM58E 2 1) 2 1 3 ha (by omega)
 have h3 := source_two_lower_formulaM58E (lowerPathM58E 2 1) 3 0 3 ha (by omega)
 norm_num [lowerValM58E,Finset.sum_range_succ,Nat.choose] at h1 h2 h3
 rw [ha,hb,h1,h2,h3]
 norm_num [InPolygon]

end
end MathGKM.Markov
