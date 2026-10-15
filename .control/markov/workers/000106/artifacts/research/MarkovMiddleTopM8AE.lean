import MarkovMiddleHighDirectM8AE
import MarkovMiddleCanonicalM722
/-! Machine-authored 8ae35b59. The predecessor numerator c-1 subfamily. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleShape0M722 middleShape3M722
theorem middleRawValue_top_lcM8AE (n c j : ℤ) (hc : 5≤c)
 (hj : 2*n+6≤j) (hju : j≤3*n) :
 middleRawValueM722 n c (c-1) j*middleRawValueM722 n c (c-1) (j+2)≤
 middleRawValueM722 n c (c-1) (j+1)^2 := by
 let J := j-2*n-6
 let E := 3*n-j
 have h := middle_high_directM8AE (c-5) J E (by omega)
   (by dsimp [J]; omega) (by dsimp [E]; omega)
 have en : J+E+6=n := by dsimp [J,E]; ring
 have ej : 2*(J+E+6)+J+6=j := by dsimp [J,E]; ring
 have ej1 : 2*(J+E+6)+J+7=j+1 := by dsimp [J,E]; ring
 have ej2 : 2*(J+E+6)+J+8=j+2 := by dsimp [J,E]; ring
 have ec : c-5+5=c := by ring
 have er : c-5+4=c-1 := by ring
 rw [ej,ej1,ej2,en,ec,er] at h
 simpa only [middleRawValueM722, if_neg (by omega : ¬2*(c-1)<c)] using h

theorem source_fourth_middle_topM8AE (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a+1=(frame rest).mid.b)
 (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := middleRawValue_top_lcM8AE (n:ℤ) ((frame rest).mid.b:ℤ)
   (j:ℤ) (by omega) (by omega) (by omega)
 have h0 := source_fourth_middle_canonicalM722 n rest hc (i+2) j hj (by omega) (by omega)
 have h1 := source_fourth_middle_canonicalM722 n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_middle_canonicalM722 n rest hc i (j+2) (by omega) (by omega) (by omega)
 have er : ((frame rest).mid.b:ℤ)-1=(frame rest).mid.a := by omega
 rw [er] at h
 norm_num only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
