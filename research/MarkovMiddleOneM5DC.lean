import MarkovMiddleLowDirectM722
import MarkovMiddleCanonicalM722
/-! Machine-authored 722898f8. The predecessor numerator-one subfamily. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleShape0M722 middleShape3M722
theorem middleRawValue_one_lcM5DC (n c j : ℤ) (hc : 5≤c)
 (hj : 2*n+6≤j) (hju : j≤3*n) :
 middleRawValueM722 n c 1 j*middleRawValueM722 n c 1 (j+2)≤
 middleRawValueM722 n c 1 (j+1)^2 := by
 let J := j-2*n-6
 let E := 3*n-j
 have h := middle_low_directM722 (c-5) J E (by omega)
   (by dsimp [J]; omega) (by dsimp [E]; omega)
 have en : J+E+6=n := by dsimp [J,E]; ring
 have ej : 2*(J+E+6)+J+6=j := by dsimp [J,E]; ring
 have ej1 : 2*(J+E+6)+J+7=j+1 := by dsimp [J,E]; ring
 have ej2 : 2*(J+E+6)+J+8=j+2 := by dsimp [J,E]; ring
 have ec : c-5+5=c := by ring
 rw [ej,ej1,ej2,en,ec] at h
 simpa only [middleRawValueM722, if_pos (by omega : 2*(1:ℤ)<c)] using h

theorem source_fourth_middle_oneM5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=1)
 (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := middleRawValue_one_lcM5DC (n:ℤ) ((frame rest).mid.b:ℤ)
   (j:ℤ) (by omega) (by omega) (by omega)
 have h0 := source_fourth_middle_canonicalM722 n rest hc (i+2) j hj (by omega) (by omega)
 have h1 := source_fourth_middle_canonicalM722 n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_middle_canonicalM722 n rest hc i (j+2) (by omega) (by omega) (by omega)
 rw [hr] at h0 h1 h2
 norm_num only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
