import MarkovPellRatioMA24
import MarkovNextBinomial7955
/-! Machine-authored a24fe23d. An unbounded failure of the proposed midpoint
summand criterion. This is NOT a failure of the raw source inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem pell_choose_swapMA24 (s q : ℕ) : (s+q).choose q=(s+q).choose s := by
 rw [←Nat.choose_symm (show q ≤ s+q by omega)]
 congr 1
 omega

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
   h0,h1,h2,h3,show Nat.choose 2 2=1 by decide,show Nat.choose 5 4=5 by decide,
   show Nat.choose 4 3=4 by decide,show Nat.choose 3 3=1 by decide,
   show Nat.choose 4 4=1 by decide,show Nat.choose 8 7=8 by decide,
   show Nat.choose 6 6=1 by decide,show Nat.choose 6 5=6 by decide]

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
   72*((n+22).choose 2:ℝ)*hB-36*((n:ℝ)+21)*(n+20)*hC

theorem pell_uniform_midpoint_failureMA24 (n : ℕ) :
 pellTermMA24 (n+23) (n+25) 2 (n+19)*pellTermMA24 (n+23) (n+25) 2 (n+20) <
 pellTermMA24 (n+23) (n+25) 1 (n+21)*pellTermMA24 (n+23) (n+25) 3 (n+18) := by
 have h := pell_uniform_gapMA24 n
 have hp : 0 < 2*((n:ℝ)+22)*(n+21)*(n+20)*(n+1) := by positivity
 linarith


end
end MathGKM.Markov
