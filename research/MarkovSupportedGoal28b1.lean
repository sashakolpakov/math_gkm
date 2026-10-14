import MarkovWordRigidity28b1
import MarkovReduction18
/-! Machine-authored 28b112de. Exact root reformulation, neither side proved. -/
namespace MathGKM.Markov
noncomputable section

def SupportedWordGoal28 : Prop := ∀ (a b : ℕ) (w : List Bool),
 0<a → a<b → Nat.Coprime a b →
 (false::(w++[true])).count true=a → (false::(w++[true])).length=b →
 WordLower28 a b (false::(w++[true])) →
 GlobalLC18 (rawWord80 (false::(w++[true]))).b

theorem root_iff_supported_words28 : Conjecture63 ↔ SupportedWordGoal28 := by
 constructor
 · intro h a b w ha hab hc hwa hwb hs
   obtain ⟨path,hpa,hpb,hw,hp⟩ := supported_word_is_source28 a b w ha hab hc hwa hwb hs
   rw [← hp]
   exact (global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)
 · intro h
   apply root_iff_raw_matrix18.mpr
   intro path
   obtain ⟨ha,hab,hcop⟩ := frame_reduced path
   obtain ⟨hc,hl⟩ := source_word_counts28 path
   have hs := source_word_lower28 path
   simp only [sourceWord_central28] at hc hl hs
   have hh := h _ _ (central28 path) ha hab hcop hc hl hs
   have he : (frame path).mid.p=(rawWord80 (sourceWord28 path)).b := by
     rw [raw_matrix18]
     have hm := rawWord_pairs80 path ([false],[true])
     simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at hm
     rw [← hm]
     exact congrArg Mat16.b (rawWord_append80 _ _).symm
   rw [← raw_matrix18,he,sourceWord_central28]
   exact hh

#print axioms root_iff_supported_words28
end
end MathGKM.Markov
