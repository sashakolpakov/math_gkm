import MarkovUpperGlobalMEC6
/-! Machine-authored ec6f4b83. No fixed min/max shift can extend this particular
upper summand certificate to the other directions. Both raw source triples pass. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem upper_vertical_shift_failsMEC6 (s : ℕ) :
 upperTermM2B3 2 2 2 (min s 1)*upperTermM2B3 2 2 2 (max s 1-s) <
 upperTermM2B3 3 1 2 0*upperTermM2B3 1 3 2 1 := by
 by_cases hs : s=0
 · subst s
   norm_num [upperTermM2B3,Nat.choose]
 · rw [min_eq_right (by omega : 1 ≤ s),max_eq_left (by omega : 1 ≤ s),Nat.sub_self]
   norm_num [upperTermM2B3,Nat.choose]

theorem upper_diagonal_shift_failsMEC6 (s : ℕ) :
 upperTermM2B3 2 2 2 (min (1+s) 0)*upperTermM2B3 2 2 2 (max (1+s) 0-s) <
 upperTermM2B3 1 3 1 1*upperTermM2B3 3 1 3 0 := by
 rw [min_eq_right (by omega : 0 ≤ 1+s),max_eq_left (by omega : 0 ≤ 1+s),
   show 1+s-s=1 by omega]
 norm_num [upperTermM2B3,Nat.choose]

theorem direction_obstruction_sourceMEC6 :
 let m := (frame (lowerPathM58E 3 1)).mid
 m.a=2 ∧ m.b=9 ∧
 InPolygon m.a m.b 2 5 ∧ InPolygon m.a m.b 2 6 ∧ InPolygon m.a m.b 2 7 ∧
 InPolygon m.a m.b 1 7 ∧ InPolygon m.a m.b 3 5 ∧
 coeff m.p 2 5=83 ∧ coeff m.p 2 6=100 ∧ coeff m.p 2 7=92 ∧
 coeff m.p 1 7=12 ∧ coeff m.p 3 5=348 ∧
 coeff m.p 2 5*coeff m.p 2 7 ≤ coeff m.p 2 6^2 ∧
 coeff m.p 1 7*coeff m.p 3 5 ≤ coeff m.p 2 6^2 := by
 dsimp only
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E 3 1 (by omega)
 have h25 := source_two_upper_formulaM2B3 (lowerPathM58E 3 1) 3 1 2 (by omega) (by omega) ha hb
 have h26 := source_two_upper_formulaM2B3 (lowerPathM58E 3 1) 2 2 2 (by omega) (by omega) ha (by omega)
 have h27 := source_two_upper_formulaM2B3 (lowerPathM58E 3 1) 1 3 2 (by omega) (by omega) ha (by omega)
 have h17 := source_two_upper_formulaM2B3 (lowerPathM58E 3 1) 1 3 1 (by omega) (by omega) ha (by omega)
 have h35 := source_two_upper_formulaM2B3 (lowerPathM58E 3 1) 3 1 3 (by omega) (by omega) ha hb
 norm_num [upperValM2B3,Finset.sum_range_succ,Nat.choose] at h25 h26 h27 h17 h35
 rw [ha,hb,h25,h26,h27,h17,h35]
 norm_num [InPolygon]

end
end MathGKM.Markov
