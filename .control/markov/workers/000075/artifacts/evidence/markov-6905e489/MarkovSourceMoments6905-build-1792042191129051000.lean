import MarkovThirdMoments6905
import MarkovCubicBounds446
import MarkovLowerFormula487
/-! Machine-authored request 6905e489. First and second trace moments are
identified unconditionally for actual low-slope sources. The cubic moment is
the remaining explicit premise in the third-slice source formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem source_first_moment6905 (rest : List Bool) :
 (tr16 (ambientWord5c U V (sourceWord28 (false::rest)))).coeff 1=
 momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ)) := by
 have hw := source_run_substitutionBF 0 rest
 simp only [List.replicate_zero,List.nil_append] at hw
 have hz : 2≤(sourceWord28 rest).length := by
   rw [(source_word_counts28 rest).2]
   obtain ⟨ha,hb,_⟩ := frame_reduced rest
   omega
 rw [hw,lower_trace_two_lengths487 0 _ hz]
 simp [lowerH487,runSumA27,(source_word_counts28 rest).1,
   (source_word_counts28 rest).2,momentD6905]

theorem source_second_moment6905 (rest : List Bool) (hc : (frame rest).mid.b≠2) :
 2*(tr16 (ambientWord5c U V (sourceWord28 (false::rest)))).coeff 2=
 (momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ)))^2+
 momentK6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))
   (C (((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ))) := by
 have hfirst := source_first_moment6905 rest
 have ht1 := source_first_cut_trace487 (false::rest)
 have ht2 := source_cut_trace75 (false::rest) 1
 have hs := source_second_sliceBF (false::rest) (sourceRunsBF 0 rest)
   (by simpa using source_runs_exactBF 0 rest) (source_runs_lengthBF 0 rest)
 have hsecond := source_second_compressed446 0 rest
 rw [←hs,secondCompressed_zero446] at hsecond
 have he : cubicPoly446 (frame rest).mid.b (frame rest).mid.a+
   2*(1+X)*momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))-
   2*(1+X)^2=
   (momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ)))^2+
   momentK6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))
   (C (((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ))) := by
   simp [cubicPoly446,cubicA446,cubicB446,cubicC446,cubicD446,hc,
     momentD6905,momentK6905,map_ofNat]
   ring
 linear_combination hsecond+2*ht2-2*(1+X)*ht1+2*(1+X)*hfirst+he

theorem source_third_of_cubic_moment6905 (rest : List Bool) (t u : ℤ)
 (hc : (frame rest).mid.b≠2)
 (h3 : 6*(tr16 (ambientWord5c U V (sourceWord28 (false::rest)))).coeff 3=
   (momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ)))^3+
   3*momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))*
   momentK6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))
     (C (((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)))+
   momentL6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))
     (C (((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ))) (C t) (C u)) :
 ThirdFormula75 (false::rest) (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ) t u := by
 exact source_third_of_moments6905 _ _ _ _ _ _
   (source_first_moment6905 rest) (source_second_moment6905 rest hc) h3

#print axioms source_first_moment6905
#print axioms source_second_moment6905
#print axioms source_third_of_cubic_moment6905
end
end MathGKM.Markov
