import MarkovMiddleChart1M722
import MarkovMiddleChart3M722
import MarkovMiddleRawDefM722
/-! Machine-authored 722898f8. Explicit extreme predecessor hypotheses. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] middleShape0M722 middleShape3M722
theorem middleRawValue_extreme_lcM722 (n c r j : ℤ) (hc : 5≤c)
 (hext : r=1 ∨ r+1=c) (hj : 2*n+6≤j) (hju : j≤3*n) :
 middleRawValueM722 n c r j*middleRawValueM722 n c r (j+2)≤
 middleRawValueM722 n c r (j+1)^2 := by
 let J := j-2*n-6
 let E := 3*n-j
 have hJ : 0≤J := by dsimp [J]; omega
 have hE : 0≤E := by dsimp [E]; omega
 have en : J+E+6=n := by dsimp [J,E]; ring
 have ej : 2*(J+E+6)+J+6=j := by dsimp [J,E]; ring
 have ej1 : 2*(J+E+6)+J+7=j+1 := by dsimp [J,E]; ring
 have ej2 : 2*(J+E+6)+J+8=j+2 := by dsimp [J,E]; ring
 unfold middleRawValueM722
 rcases hext with hext | hext
 · subst r
   rw [if_pos (by omega),if_pos (by omega),if_pos (by omega)]
   have h := middle_chart1M722 (c-5) 0 J E (by omega) (by omega) hJ hE
   have ec : c-5+5=c := by ring
   rw [ej,ej1,ej2,en,ec] at h
   exact h
 · rw [if_neg (by omega),if_neg (by omega),if_neg (by omega)]
   have h := middle_chart3M722 0 (c-5) J E (by omega) (by omega) hJ hE
   have ec : c-5+5=c := by ring
   have er : c-5+4=r := by omega
   rw [ej,ej1,ej2,en,ec,er] at h
   exact h
end
end MathGKM.Markov
