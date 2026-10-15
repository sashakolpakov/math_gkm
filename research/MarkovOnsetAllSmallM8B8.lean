import MarkovOnsetSmallSourceM8AE
import MarkovOnsetLowSmallChartM8B8
import MarkovOnsetHighSmallChartM8B8
import MarkovOnsetTopSmallChartM8B8
import MarkovOnsetOneSmallChartM8B8
/-! Machine-authored request 8b851864. Raw onset inequality, reduced run bound. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff onsetScalarLowM253 onsetScalarHighM253
theorem secondOnset_lcM8B8 (n c r k : ℕ) (hn : 3≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) (hne : 2*r≠c) (hk : 1≤k) (hku : k≤5) :
 secondOnsetValueM5DC n c r k*secondOnsetValueM5DC n c r (k+2) ≤
 secondOnsetValueM5DC n c r (k+1)^2 := by
 have en : ((n:ℤ)-7)+7=n := by ring
 by_cases hl : 2*r<c
 · by_cases hrr : 2≤r
   · rw [secondOnset_lowM253 n c r k hl,secondOnset_lowM253 n c r (k+2) hl,
       secondOnset_lowM253 n c r (k+1) hl]
     have h := onsetLow_chartM8B8 ((n:ℤ)-7) ((c:ℤ)-2*r-1) ((r:ℤ)-2)
       (by omega) (by omega) (by omega) k hk hku
     have ec : 2*((r:ℤ)-2)+((c:ℤ)-2*r-1)+5=c := by ring
     have er : ((r:ℤ)-2)+2=r := by ring
     rw [en,ec,er] at h
     exact h
   · have er : r=1 := by omega
     subst r
     exact secondOnset_one_lcM8B8 n c k (by omega) hc hk hku
 · have hh : c≤2*r := by omega
   rw [secondOnset_highM253 n c r k hh,secondOnset_highM253 n c r (k+2) hh,
     secondOnset_highM253 n c r (k+1) hh]
   by_cases hd : 2≤c-r
   · have h := onsetHigh_chartM8B8 ((n:ℤ)-7) ((c:ℤ)-r-2) (2*(r:ℤ)-c-1)
       (by omega) (by omega) (by omega) k hk hku
     have ec : 2*((c:ℤ)-r-2)+(2*(r:ℤ)-c-1)+5=c := by ring
     have er : ((c:ℤ)-r-2)+(2*(r:ℤ)-c-1)+3=r := by ring
     have eq : (2*(r:ℤ)-c-1)+1=2*(r:ℤ)-c := by ring
     rw [en,ec,er,eq] at h
     exact h
   · have h := onsetTop_chartM8B8 ((n:ℤ)-7) ((c:ℤ)-5)
       (by omega) (by omega) k hk hku
     have ec : ((c:ℤ)-5)+5=c := by ring
     have er : ((c:ℤ)-5)+4=r := by omega
     have eq : ((c:ℤ)-5)+3=2*(r:ℤ)-c := by omega
     rw [en,ec,er,eq] at h
     exact h

theorem source_fourth_onsetM8B8 (n : ℕ) (rest : List Bool)
 (hn : 4≤n) (hc : 5≤(frame rest).mid.b)
 (i j : ℕ) (hj : 2*n<j) (hju : j≤2*n+5)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have hne := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 let k := j-2*n
 have hk : 1≤k := by dsimp [k]; omega
 have hku : k≤5 := by dsimp [k]; omega
 have ej : 2*n+k=j := by dsimp [k]; omega
 have ej1 : 2*n+(k+1)=j+1 := by omega
 have ej2 : 2*n+(k+2)=j+2 := by omega
 have h0 := source_fourth_second_onset_valueM8AE n rest hn hc (i+2) k hk (by omega) (by omega)
 have h1 := source_fourth_second_onset_valueM8AE n rest hn hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_second_onset_valueM8AE n rest hn hc i (k+2) (by omega) (by omega) (by omega)
 rw [ej] at h0
 rw [ej1] at h1
 rw [ej2] at h2
 have h := secondOnset_lcM8B8 n (frame rest).mid.b (frame rest).mid.a k (by omega) hc
   (by omega) hrc (by omega) hk hku
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
