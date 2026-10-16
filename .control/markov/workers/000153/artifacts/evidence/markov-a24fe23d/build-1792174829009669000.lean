import MarkovPellRatioMA24
import MarkovNextBinomial7955
/-! Machine-authored a24fe23d. An unbounded failure of the proposed midpoint
summand criterion. This is NOT a failure of the raw source inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem pell_uniform_termsMA24 (n : ℕ) :
 pellTermMA24 (n+23) (n+25) 1 (n+21)=(n:ℝ)+22 ∧
 pellTermMA24 (n+23) (n+25) 3 (n+18)=40*((n+21).choose 3:ℝ) ∧
 pellTermMA24 (n+23) (n+25) 2 (n+19)=4*((n+21).choose 2:ℝ) ∧
 pellTermMA24 (n+23) (n+25) 2 (n+20)=6*((n+22).choose 2:ℝ) := by
 have h0 : (n+22).choose (n+21)=n+22 := by
   rw [←Nat.choose_symm (show n+21 ≤ n+22 by omega),show n+22-(n+21)=1 by omega,Nat.choose_one_right]
 have h1 : (n+21).choose (n+18)=(n+21).choose 3 := by
   rw [←Nat.choose_symm (show n+18 ≤ n+21 by omega)]; congr 1; omega
 have h2 : (n+21).choose (n+19)=(n+21).choose 2 := by
   rw [←Nat.choose_symm (show n+19 ≤ n+21 by omega)]; congr 1; omega
 have h3 : (n+22).choose (n+20)=(n+22).choose 2 := by
   rw [←Nat.choose_symm (show n+20 ≤ n+22 by omega)]; congr 1; omega
 norm_num [pellTermMA24,horizontalTerm9a72,show n+21 ≤ n+25 by omega,
   show n+18 ≤ n+25 by omega,show n+19 ≤ n+25 by omega,show n+20 ≤ n+25 by omega,
   show 1+(n+21)=n+22 by omega,show 3+(n+18)=n+21 by omega,
   show 2+(n+19)=n+21 by omega,show 2+(n+20)=n+22 by omega,
   h0,h1,h2,h3,Nat.choose]

theorem pell_uniform_gapMA24 (n : ℕ) :
 3*(pellTermMA24 (n+23) (n+25) 1 (n+21)*pellTermMA24 (n+23) (n+25) 3 (n+18)-
   pellTermMA24 (n+23) (n+25) 2 (n+19)*pellTermMA24 (n+23) (n+25) 2 (n+20))=
 2*((n:ℝ)+22)*(n+21)*(n+20)*(n+1) := by
 obtain ⟨h0,h1,h2,h3⟩ := pell_uniform_termsMA24 n
 rw [h0,h1,h2,h3]
 have hA := choose_three_real7955 (n+21)
 have hB := choose_two_real58 (n+21)
 have hC := choose_two_real58 (n+22)
 push_cast at hA hB hC
 linear_combination 20*((n:ℝ)+22)*hA-
   36*((n+22).choose 2:ℝ)*hB-18*((n:ℝ)+21)*(n+20)*hC

theorem pell_uniform_midpoint_failureMA24 (n : ℕ) :
 pellTermMA24 (n+23) (n+25) 2 (n+19)*pellTermMA24 (n+23) (n+25) 2 (n+20) <
 pellTermMA24 (n+23) (n+25) 1 (n+21)*pellTermMA24 (n+23) (n+25) 3 (n+18) := by
 have h := pell_uniform_gapMA24 n
 have hp : 0 < 2*((n:ℝ)+22)*(n+21)*(n+20)*(n+1) := by positivity
 linarith

theorem pell_first_midpoint_failureMA24 :
 pellTermMA24 22 25 3 17*pellTermMA24 22 25 3 18=60648000 ∧
 pellTermMA24 22 25 2 19*pellTermMA24 22 25 4 16=61047000 := by
 norm_num [pellTermMA24,horizontalTerm9a72,Nat.choose]

theorem pell_twenty_two_rawMA24 :
 coeff (frame (List.replicate 21 true)).mid.p 0 25=210 ∧
 coeff (frame (List.replicate 21 true)).mid.p 1 25=16340 ∧
 coeff (frame (List.replicate 21 true)).mid.p 2 25=641421 := by
 rw [right_horizontal_sum_fixed9a72 21 0 25 2 (by omega) (by omega),
   right_horizontal_sum_fixed9a72 21 1 25 3 (by omega) (by omega),
   right_horizontal_sum_fixed9a72 21 2 25 4 (by omega) (by omega)]
 norm_num [Finset.sum_range_succ,horizontalTerm9a72,Nat.choose]

theorem pell_twenty_two_validMA24 :
 (frame (List.replicate 21 true)).mid.a=22 ∧
 (frame (List.replicate 21 true)).mid.b=23 ∧
 InPolygon 22 23 0 25 ∧ InPolygon 22 23 1 25 ∧ InPolygon 22 23 2 25 ∧
 coeff (frame (List.replicate 21 true)).mid.p 0 25*
   coeff (frame (List.replicate 21 true)).mid.p 2 25 ≤
   coeff (frame (List.replicate 21 true)).mid.p 1 25^2 := by
 obtain ⟨h0,h1,h2⟩ := pell_twenty_two_rawMA24
 norm_num [(right_labels650 21).1,(right_labels650 21).2,InPolygon,h0,h1,h2]

end
end MathGKM.Markov
