import MarkovMiddleSixthGroupsM99A
import MarkovTopSectorClosedM97B
/-! Machine-authored 99a0f3b8. High template coefficients on a larger domain. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem middle_mass_strictM99A (d T i : ℕ) (hiT : i+2 ≤ T)
 (hd : T ≤ d+5 ∨ (6 ≤ i ∧ 4*T+5 ≤ 4*d+3*i)) :
 topMassM55C d T i*topMassM55C d T (i+2)<topMassM55C d T (i+1)^2 := by
 by_cases hi : 6 ≤ i
 · have h := (tail_strict_iffMDCB d i (T-i)).mpr
     (middle_sixth_tail_gap_positiveM99A d i (T-i) hi (by omega) (by omega))
   simpa only [Nat.add_sub_of_le (show i ≤ T by omega)] using h
 · interval_cases i
   · exact top_mass_first_strictMEB6 d T (by omega)
   · exact top_mass_fourth_strictM731 d T (by omega)
   · exact top_mass_small_2_strictM97B d T (by omega)
   · exact top_mass_small_3_strictM97B d T (by omega)
   · exact top_mass_small_4_strictM97B d T (by omega)
   · exact top_mass_small_5_strictM97B d T (by omega)

theorem middle_mass_weakM99A (d T i : ℕ)
 (hd : T ≤ d+5 ∨ (6 ≤ i ∧ 4*T+5 ≤ 4*d+3*i)) :
 topMassM55C d T i*topMassM55C d T (i+2) ≤ topMassM55C d T (i+1)^2 := by
 by_cases hi : i+2 ≤ T
 · exact (middle_mass_strictM99A d T i hi hd).le
 · rw [top_mass_zeroM55C d T (i+2) (by omega),mul_zero]
   exact sq_nonneg _

theorem middle_template_highM99A (n t c : ℕ) (ht : 3 ≤ t) (hn : 2*t ≤ n)
 (hc : 3 ≤ c) (hd : 3*t ≤ n+8 ∨ (9 ≤ c ∧ 12*t+2 ≤ 4*n+3*c)) :
 (topTemplateMB3E n t).coeff c*(topTemplateMB3E n t).coeff (c+2) ≤
 (topTemplateMB3E n t).coeff (c+1)^2 := by
 have h := middle_mass_weakM99A (n-2*t) (t-3) (c-3) (by omega)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-3+3)+(n-2*t)=n by omega,show t-3+3=t by omega,
   show c-3+3=c by omega,show c-3+2+3=c+2 by omega,show c-3+1+3=c+1 by omega] at h
 exact h

theorem middle_template_high_strictM99A (n t c : ℕ) (ht : 3 ≤ t) (hn : 2*t ≤ n)
 (hc : 3 ≤ c) (hct : c+2 ≤ t)
 (hd : 3*t ≤ n+8 ∨ (9 ≤ c ∧ 12*t+2 ≤ 4*n+3*c)) :
 (topTemplateMB3E n t).coeff c*(topTemplateMB3E n t).coeff (c+2) <
 (topTemplateMB3E n t).coeff (c+1)^2 := by
 have h := middle_mass_strictM99A (n-2*t) (t-3) (c-3) (by omega) (by omega)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-3+3)+(n-2*t)=n by omega,show t-3+3=t by omega,
   show c-3+3=c by omega,show c-3+2+3=c+2 by omega,show c-3+1+3=c+1 by omega] at h
 exact h

end
end MathGKM.Markov
