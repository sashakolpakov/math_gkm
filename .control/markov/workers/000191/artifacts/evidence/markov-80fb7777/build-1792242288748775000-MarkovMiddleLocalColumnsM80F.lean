import MarkovMiddleLowSourceM80F
/-! Machine-authored 80fb7777. Transport inherited fixed-column certificates
where the actual middle correction vanishes. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem middle_small_mass_strictM80F (d T i : ℕ) (hi : i ≤ 5) (hT : i+2 ≤ T) :
 topMassM55C d T i*topMassM55C d T (i+2)<topMassM55C d T (i+1)^2 := by
 interval_cases i
 · exact top_mass_first_strictMEB6 d T (by omega)
 · exact top_mass_fourth_strictM731 d T (by omega)
 · exact top_mass_small_2_strictM97B d T (by omega)
 · exact top_mass_small_3_strictM97B d T (by omega)
 · exact top_mass_small_4_strictM97B d T (by omega)
 · exact top_mass_small_5_strictM97B d T (by omega)

theorem middle_small_templateM80F (n t c : ℕ) (hn : 2*t ≤ n) (ht : 3 ≤ t)
 (hc : 3 ≤ c) (hc8 : c ≤ 8) :
 (topTemplateMB3E n t).coeff c*(topTemplateMB3E n t).coeff (c+2) ≤
 (topTemplateMB3E n t).coeff (c+1)^2 := by
 have h : topMassM55C (n-2*t) (t-3) (c-3)*topMassM55C (n-2*t) (t-3) (c-3+2) ≤
   topMassM55C (n-2*t) (t-3) (c-3+1)^2 := by
   by_cases hct : c+2 ≤ t
   · exact (middle_small_mass_strictM80F _ _ _ (by omega) (by omega)).le
   · rw [top_mass_zeroM55C _ _ _ (by omega),mul_zero]; exact sq_nonneg _
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-3+3)+(n-2*t)=n by omega,show t-3+3=t by omega,
   show c-3+3=c by omega,show c-3+2+3=c+2 by omega,show c-3+1+3=c+1 by omega] at h
 exact h

theorem source_middle_local_smallM80F (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r)
 (hc : 3 ≤ c) (hc8 : c ≤ 8) (hl : k+1<c) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 rw [source_middle_high_coeffM99A q k c r hq hk hl,
   source_middle_high_coeffM99A q k (c+2) r hq hk (by omega),
   source_middle_high_coeffM99A q k (c+1) r hq hk (by omega)]
 exact middle_small_templateM80F _ _ _ hn (by omega) hc hc8

end
end MathGKM.Markov
