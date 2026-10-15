import MarkovMiddleRawDefM722
import MarkovMiddleShapeEq0M722
import MarkovMiddleShapeEq1M722
import MarkovMiddleShapeEq2M722
import MarkovMiddleShapeEq3M722
import MarkovMiddleShapeEq4M722
import MarkovMiddleShapeEq5M722
/-! Machine-authored request 722898f8. Exact middle source bridge; original coefficients retained. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleShape0M722 middleShape3M722
set_option maxHeartbeats 4000000

theorem source_fourth_middle_canonicalM722 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleRawValueM722 n (frame rest).mid.b (frame rest).mid.a j := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · have h := source_fourth_middle_value0M00 n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape0M722] at h
   unfold middleRawValueM722
   rw [if_pos (by omega)]
   exact h
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · have h := source_fourth_middle_value1M00 n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape1M722] at h
   unfold middleRawValueM722
   rw [if_pos (by omega)]
   exact h
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · have h := source_fourth_middle_value2M00 n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape2M722] at h
   unfold middleRawValueM722
   rw [if_pos (by omega)]
   exact h
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · have h := source_fourth_middle_value3M00 n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape3M722] at h
   unfold middleRawValueM722
   rw [if_neg (by omega)]
   exact h
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · have h := source_fourth_middle_value4M00 n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape4M722] at h
   unfold middleRawValueM722
   rw [if_neg (by omega)]
   exact h
 · have h := source_fourth_middle_value5M00 n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape5M722] at h
   unfold middleRawValueM722
   rw [if_neg (by omega)]
   exact h

end
end MathGKM.Markov
