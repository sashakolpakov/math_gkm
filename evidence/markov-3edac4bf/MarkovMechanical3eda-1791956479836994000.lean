import MarkovWordRigidity28b1
/-! Machine-authored request 3edac4bf. Exact mechanical prefix counts,
including both endpoints of the word. No LC assertion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem source_word_exact3eda (path : List Bool) :
 (frame path).mid.p=(rawWord80 (sourceWord28 path)).b := by
 rw [raw_matrix18]
 have h := rawWord_pairs80 path ([false],[true])
 simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at h
 rw [← h]
 exact congrArg Mat16.b (rawWord_append80 _ _).symm

theorem source_take_floor3eda (path : List Bool) (j : ℕ)
 (hj : j≤(frame path).mid.b) :
 ((sourceWord28 path).take j).count true=(frame path).mid.a*j/(frame path).mid.b := by
 obtain ⟨ha,hab,hcop⟩ := frame_reduced path
 obtain ⟨hc,hl⟩ := source_word_counts28 path
 have hs := source_word_lower28 path
 rw [sourceWord_central28] at hc hl hs ⊢
 have hcl : (central28 path).length+2=(frame path).mid.b := by simpa using hl
 have hcc : (central28 path).count true+1=(frame path).mid.a := by
   simpa [List.count_cons,List.count_append] using hc
 cases j with
 | zero => simp
 | succ n =>
   simp only [List.take_succ_cons,List.count_cons,Bool.false_eq_true,↓reduceIte,Nat.add_zero]
   by_cases hn : n<(central28 path).length
   · rw [List.take_append_of_le_length (by omega)]
     exact supported_take_floor28 _ _ _ hab hcop hc hl hs n hn
   · by_cases he : n=(central28 path).length
     · subst n
       rw [List.take_left]
       symm
       apply (Nat.div_eq_iff (by omega : 0<(frame path).mid.b)).mpr
       constructor <;> nlinarith
     · have he : n=(central28 path).length+1 := by omega
       rw [List.take_of_length_le (by simp; omega)]
       simp only [List.count_append,List.count_singleton,beq_self_eq_true,↓reduceIte]
       rw [hcc,show n+1=(frame path).mid.b by omega]
       exact (Nat.mul_div_cancel _ (by omega)).symm

#print axioms source_take_floor3eda
end
end MathGKM.Markov
