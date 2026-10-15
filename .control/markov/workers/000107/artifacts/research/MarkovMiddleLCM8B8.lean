import MarkovMiddleChart0M8B8
import MarkovMiddleLowDirectM722
import MarkovMiddleChart2M8B8
import MarkovFourthTopCompleteM8AE
import MarkovMiddleRawDefM722
/-! Machine-authored request 8b851864; adapted from 8ae35b59. Four parameter charts retain raw scale. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] middleShape0M722 middleShape3M722
theorem middleRawValue_lcM8B8 (n c r j : ℤ) (hc : 5≤c) (hr : 1≤r)
 (hrc : r<c) (hne : 2*r≠c) (hj : 2*n+6≤j) (hju : j≤3*n) :
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
 by_cases hl : 2*r<c
 · simp only [if_pos hl]
   by_cases hrr : 2≤r
   · have h := middle_chart0M8B8 (c-2*r-1) (r-2) J E (by omega) (by omega) hJ hE
     have ec : 2*(r-2)+(c-2*r-1)+5=c := by ring
     have er : r-2+2=r := by ring
     rw [ej,ej1,ej2,en,ec,er] at h
     exact h
   · have er : r=1 := by omega
     subst r
     have h := middle_low_directM722 (c-5) J E (by omega) hJ hE
     have ec : c-5+5=c := by ring
     rw [ej,ej1,ej2,en,ec] at h
     exact h
 · simp only [if_neg hl]
   by_cases hd : 2≤c-r
   · have h := middle_chart2M8B8 (c-r-2) (2*r-c-1) J E (by omega) (by omega) hJ hE
     have ec : 2*(c-r-2)+(2*r-c-1)+5=c := by ring
     have er : c-r-2+(2*r-c-1)+3=r := by ring
     rw [ej,ej1,ej2,en,ec,er] at h
     exact h
   · have er : c-r=1 := by omega
     have h := middle_high_directM8AE (c-5) J E (by omega) hJ hE
     have ec : c-5+5=c := by ring
     have err : c-5+4=r := by omega
     rw [ej,ej1,ej2,en,ec,err] at h
     exact h
end
end MathGKM.Markov
