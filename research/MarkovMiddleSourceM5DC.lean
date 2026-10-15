import MarkovMiddleLCM5DC
import MarkovMiddleCanonicalM722
/-! Machine-authored 722898f8. Source middle inequality. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleRawValueM722
set_option maxHeartbeats 4000000
theorem source_fourth_middleM5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h := middleRawValue_lcM5DC (n:ℤ) ((frame rest).mid.b:ℤ)
   ((frame rest).mid.a:ℤ) (j:ℤ) (by omega) (by omega) (by omega) (by omega)
   (by omega) (by omega)
 have h0 := source_fourth_middle_canonicalM722 n rest hc (i+2) j hj (by omega) (by omega)
 have h1 := source_fourth_middle_canonicalM722 n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_middle_canonicalM722 n rest hc i (j+2) (by omega) (by omega) (by omega)
 norm_num only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
