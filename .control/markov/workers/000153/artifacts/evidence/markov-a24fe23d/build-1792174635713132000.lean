import MarkovPellRatioMA24
/-! Machine-authored a24fe23d. No adaptive constant shift at one source
parameter; the corresponding actual raw source triple satisfies LC. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem pell_no_shiftMA24 (c : ℕ) :
 ∃ q r : ℕ, pellTermMA24 5 6 1 (min q (r+c))*
   pellTermMA24 5 6 1 (max q (r+c)-c) <
   pellTermMA24 5 6 0 q*pellTermMA24 5 6 2 r := by
 by_cases hc : c ≤ 1
 · interval_cases c
   · refine ⟨4,0,?_⟩; norm_num [pellTermMA24,horizontalTerm9a72,Nat.choose]
   · refine ⟨4,0,?_⟩; norm_num [pellTermMA24,horizontalTerm9a72,Nat.choose]
 · refine ⟨4,2,?_⟩
   rw [min_eq_left (by omega : 4 ≤ 2+c)]
   norm_num [pellTermMA24,horizontalTerm9a72,Nat.choose]

theorem pell_five_six_rawMA24 :
 coeff (frame (List.replicate 4 true)).mid.p 0 6=1 ∧
 coeff (frame (List.replicate 4 true)).mid.p 1 6=25 ∧
 coeff (frame (List.replicate 4 true)).mid.p 2 6=172 := by
 rw [right_horizontal_sum_fixed9a72 4 0 6 0 (by omega) (by omega),
   right_horizontal_sum_fixed9a72 4 1 6 1 (by omega) (by omega),
   right_horizontal_sum_fixed9a72 4 2 6 2 (by omega) (by omega)]
 norm_num [Finset.sum_range_succ,horizontalTerm9a72,Nat.choose]

theorem pell_five_six_validMA24 :
 (frame (List.replicate 4 true)).mid.a=5 ∧
 (frame (List.replicate 4 true)).mid.b=6 ∧
 InPolygon 5 6 0 6 ∧ InPolygon 5 6 1 6 ∧ InPolygon 5 6 2 6 ∧
 coeff (frame (List.replicate 4 true)).mid.p 0 6*
   coeff (frame (List.replicate 4 true)).mid.p 2 6 ≤
   coeff (frame (List.replicate 4 true)).mid.p 1 6^2 := by
 obtain ⟨h0,h1,h2⟩ := pell_five_six_rawMA24
 norm_num [(right_labels650 4).1,(right_labels650 4).2,InPolygon,h0,h1,h2]

end
end MathGKM.Markov
