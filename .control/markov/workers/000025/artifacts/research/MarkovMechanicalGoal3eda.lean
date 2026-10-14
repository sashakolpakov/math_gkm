import MarkovMechanical3eda
import MarkovReduction18
/-! Machine-authored request 3edac4bf. An explicit rational-indexed raw word
target, with no support or source-identification premise. Neither side proved. -/
namespace MathGKM.Markov
noncomputable section

def mechanicalWord3eda (a b : ℕ) : List Bool :=
 List.ofFn (fun k : Fin b => decide (a*k.val/b<a*(k.val+1)/b))

theorem source_word_mechanical3eda (path : List Bool) :
 sourceWord28 path=mechanicalWord3eda (frame path).mid.a (frame path).mid.b := by
 have hl := (source_word_counts28 path).2
 apply List.ext_getElem
 · simp [mechanicalWord3eda,hl]
 · intro i hi hj
   have hib : i<(frame path).mid.b := by omega
   have h0 := source_take_floor3eda path i (by omega)
   have h1 := source_take_floor3eda path (i+1) (by omega)
   rw [List.take_succ_eq_append_getElem hi,List.count_append,h0] at h1
   simp only [mechanicalWord3eda,List.getElem_ofFn]
   cases he : (sourceWord28 path)[i] with
   | false =>
     have hn : ¬(frame path).mid.a*i/(frame path).mid.b<
       (frame path).mid.a*(i+1)/(frame path).mid.b := by simp [he] at h1; omega
     simp [hn]
   | true =>
     have ht : (frame path).mid.a*i/(frame path).mid.b<
       (frame path).mid.a*(i+1)/(frame path).mid.b := by simp [he] at h1; omega
     simp [ht]

theorem rational_mechanical_source3eda (a b : ℕ) (ha : 0<a) (hab : a<b)
 (hc : Nat.Coprime a b) :
 ∃ path : List Bool, (frame path).mid.a=a ∧ (frame path).mid.b=b ∧
 (frame path).mid.p=(rawWord80 (mechanicalWord3eda a b)).b := by
 obtain ⟨path,hpa,hpb⟩ := rational_coverage_098 ha hab hc
 refine ⟨path,hpa,hpb,?_⟩
 rw [source_word_exact3eda,source_word_mechanical3eda,hpa,hpb]

def MechanicalGoal3eda : Prop := ∀ a b : ℕ, 0<a → a<b → Nat.Coprime a b →
 GlobalLC18 (rawWord80 (mechanicalWord3eda a b)).b

theorem root_iff_mechanical3eda : Conjecture63 ↔ MechanicalGoal3eda := by
 constructor
 · intro h a b ha hab hc
   obtain ⟨path,hpa,hpb,hp⟩ := rational_mechanical_source3eda a b ha hab hc
   rw [← hp]
   exact (global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)
 · intro h
   apply root_iff_raw_matrix18.mpr
   intro path
   rw [← raw_matrix18,source_word_exact3eda,source_word_mechanical3eda]
   obtain ⟨ha,hab,hc⟩ := frame_reduced path
   exact h _ _ ha hab hc

#print axioms source_word_mechanical3eda
#print axioms root_iff_mechanical3eda
end
end MathGKM.Markov
