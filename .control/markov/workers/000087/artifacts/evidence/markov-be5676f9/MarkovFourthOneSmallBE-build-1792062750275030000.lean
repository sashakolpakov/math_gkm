import MarkovFourthRunMomentBE
/-! Machine-authored be5676f9. The exceptional predecessor 3/4, with its
literal source word; no determinant term is discarded. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

theorem source_word_34BE (rest : List Bool)
 (ha : (frame rest).mid.a=3) (hb : (frame rest).mid.b=4) :
 sourceWord28 rest=[false,true,true,true] := by
 obtain ⟨hc,hl⟩ := source_word_counts28 rest
 rw [sourceWord_central28,ha] at hc
 rw [sourceWord_central28,hb] at hl
 have hlen : (central28 rest).length=2 := by simpa using hl
 have hcount : (central28 rest).count true=2 := by simpa using hc
 have he := List.replicate_count_eq_of_count_eq_length (hcount.trans hlen.symm)
 rw [hcount] at he
 rw [sourceWord_central28,←he]
 rfl

theorem source_one_34_tailBE (rest : List Bool)
 (ha : (frame rest).mid.a=3) (hb : (frame rest).mid.b=4) :
 central28 (true::false::rest)++[true]=
 [true,false,true,true,false,true,true,false,true,true] := by
 have h := source_run_substitutionBF 1 rest
 simp only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] at h
 rw [source_word_34BE rest ha hb,sourceWord_central28] at h
 norm_num [lowerSub487,lowerRun487,List.replicate_succ] at h
 exact h

end
end MathGKM.Markov
