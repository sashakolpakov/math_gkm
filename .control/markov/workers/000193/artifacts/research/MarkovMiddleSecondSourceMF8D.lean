import MarkovMiddleSecondC9MF8D
import MarkovMiddleSecondC10MF8D
import MarkovMiddleSecondC11MF8D
import MarkovMiddleSecondC12MF8D
import MarkovMiddleSecondC13MF8D
import MarkovMiddleSecondC14MF8D
import MarkovMiddleSecondC15MF8D
import MarkovMiddleJetResidualM80F
/-! Machine-authored f8d0715b. Every horizontal column on the full second
middle row. All raw coefficients and exterior zeros are retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem top_second_band_strictMF8D (d T i : ℕ) (hiT : i+2 ≤ T)
 (hd : d+7=T ∨ d+8=T) :
 topMassM55C d T i*topMassM55C d T (i+2) < topMassM55C d T (i+1)^2 := by
 by_cases hi13 : 13 ≤ i
 · apply middle_mass_strictM99A d T i hiT
   right
   rcases hd with hd|hd <;> constructor <;> omega
 by_cases hi6 : 6 ≤ i
 · have hi12 : i ≤ 12 := by omega
   interval_cases i
   all_goals rcases hd with hd|hd
   · exact top_second_6_7_strictMF8D d T hiT hd
   · exact top_second_6_8_strictMF8D d T hiT hd
   · exact top_second_7_7_strictMF8D d T hiT hd
   · exact top_second_7_8_strictMF8D d T hiT hd
   · exact top_second_8_7_strictMF8D d T hiT hd
   · exact top_second_8_8_strictMF8D d T hiT hd
   · exact top_second_9_7_strictMF8D d T hiT hd
   · exact top_second_9_8_strictMF8D d T hiT hd
   · exact top_second_10_7_strictMF8D d T hiT hd
   · exact top_second_10_8_strictMF8D d T hiT hd
   · exact top_second_11_7_strictMF8D d T hiT hd
   · exact top_second_11_8_strictMF8D d T hiT hd
   · exact top_second_12_7_strictMF8D d T hiT hd
   · exact top_second_12_8_strictMF8D d T hiT hd
 · interval_cases i
   · exact top_mass_first_strictMEB6 d T (by omega)
   · exact top_mass_fourth_strictM731 d T (by omega)
   · exact top_mass_small_2_strictM97B d T (by omega)
   · exact top_mass_small_3_strictM97B d T (by omega)
   · exact top_mass_small_4_strictM97B d T (by omega)
   · exact top_mass_small_5_strictM97B d T (by omega)

theorem top_second_band_weakMF8D (d T i : ℕ) (hd : d+7=T ∨ d+8=T) :
 topMassM55C d T i*topMassM55C d T (i+2) ≤ topMassM55C d T (i+1)^2 := by
 by_cases hi : i+2 ≤ T
 · exact (top_second_band_strictMF8D d T i hi hd).le
 · rw [top_mass_zeroM55C d T (i+2) (by omega),mul_zero]
   exact sq_nonneg _

theorem second_template_highMF8D (n t c : ℕ) (ht : 3 ≤ t) (hn : 2*t ≤ n)
 (hc : 3 ≤ c) (hd : n+10=3*t ∨ n+11=3*t) :
 (topTemplateMB3E n t).coeff c*(topTemplateMB3E n t).coeff (c+2) ≤
 (topTemplateMB3E n t).coeff (c+1)^2 := by
 have h := top_second_band_weakMF8D (n-2*t) (t-3) (c-3) (by omega)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-3+3)+(n-2*t)=n by omega,show t-3+3=t by omega,
   show c-3+3=c by omega,show c-3+2+3=c+2 by omega,show c-3+1+3=c+1 by omega] at h
 exact h

theorem source_middle_second_stripMF8D (q c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hn : 2*(q+4) ≤ sourceNME9C q r) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+4))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+4)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+4))^2 := by
 by_cases hc : c ≤ 4
 · apply source_middle_jet_closedM80F q c _ r hq
   exact ⟨1,hq,by simpa only [show q+3+1=q+4 by omega] using hn,rfl,Or.inl hc⟩
 · have he (i : ℕ) (hi : 2 < i) := source_middle_high_coeffM99A q 1 i r hq hq hi
   simp only [show q+3+1=q+4 by omega] at he
   rw [he c (by omega),he (c+2) (by omega),he (c+1) (by omega)]
   apply second_template_highMF8D _ _ c (by omega) hn (by omega)
   cases r <;> simp [sourceNME9C] <;> omega

end
end MathGKM.Markov
