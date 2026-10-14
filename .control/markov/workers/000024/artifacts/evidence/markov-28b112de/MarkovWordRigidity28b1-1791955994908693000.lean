import MarkovPolygonWord28b1
import MarkovCoverage098
/-! Machine-authored 28b112de. Exact source-family characterization by the
lower polygon support constraint, for reduced A--core--B matrix words. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem prefix_counts_injective28 (w z : List Bool) (hl : w.length=z.length)
 (hc : ∀ n, (w.take n).count true=(z.take n).count true) : w=z := by
 induction w generalizing z with
 | nil => have hz : z=[] := List.length_eq_zero_iff.mp hl.symm; exact hz.symm
 | cons d w ih =>
   cases z with
   | nil => simp at hl
   | cons e z =>
     have hh := hc 1
     have he : d=e := by cases d <;> cases e <;> simp_all
     subst e
     apply congrArg (List.cons d)
     apply ih z (by simpa using hl)
     intro n
     have h := hc (n+1)
     cases d <;> simpa [List.count_cons] using h

theorem supported_take_floor28 (a b : ℕ) (w : List Bool)
 (hab : a<b) (hcop : Nat.Coprime a b)
 (ha : (false::(w++[true])).count true=a)
 (hb : (false::(w++[true])).length=b)
 (hs : WordLower28 a b (false::(w++[true])))
 (n : ℕ) (hn : n<w.length) : (w.take n).count true=a*(n+1)/b := by
 cases hd : w.drop n with
 | nil => have h := congrArg List.length hd; simp at h; omega
 | cons r y =>
   have he : w=w.take n++r::y := by
     have h := List.take_append_drop n w
     rw [hd] at h
     exact h.symm
   have he' : false::(w++[true])=false::(w.take n++r::(y++[true])) := by
     conv_lhs => rw [he]
     simp only [List.append_assoc,List.cons_append]
   rw [he'] at ha hb hs
   have h := polygon_prefix_floor28 a b (w.take n) y r hab hcop ha hb hs
   simpa [List.length_take,Nat.min_eq_left (Nat.le_of_lt hn)] using h

theorem supported_core_unique28 (a b : ℕ) (w z : List Bool)
 (hab : a<b) (hcop : Nat.Coprime a b)
 (hwa : (false::(w++[true])).count true=a)
 (hwb : (false::(w++[true])).length=b)
 (hza : (false::(z++[true])).count true=a)
 (hzb : (false::(z++[true])).length=b)
 (hws : WordLower28 a b (false::(w++[true])))
 (hzs : WordLower28 a b (false::(z++[true]))) : w=z := by
 have hl : w.length=z.length := by simp at hwb hzb; omega
 apply prefix_counts_injective28 w z hl
 intro n
 by_cases hn : n<w.length
 · rw [supported_take_floor28 a b w hab hcop hwa hwb hws n hn,
       supported_take_floor28 a b z hab hcop hza hzb hzs n (by omega)]
 · rw [List.take_of_length_le (by omega),List.take_of_length_le (by omega)]
   simp [List.count_append,List.count_cons] at hwa hza
   omega

/-- For reduced counts, the lower support inequality alone forces an actual
source word. It does not prove the source log-concavity conjecture. -/
theorem supported_word_is_source28 (a b : ℕ) (w : List Bool)
 (ha : 0<a) (hab : a<b) (hcop : Nat.Coprime a b)
 (hwa : (false::(w++[true])).count true=a)
 (hwb : (false::(w++[true])).length=b)
 (hws : WordLower28 a b (false::(w++[true]))) :
 ∃ path : List Bool, (frame path).mid.a=a ∧ (frame path).mid.b=b ∧
   sourceWord28 path=false::(w++[true]) ∧
   (frame path).mid.p=(rawWord80 (false::(w++[true]))).b := by
 obtain ⟨path,hpa,hpb⟩ := rational_coverage_098 ha hab hcop
 obtain ⟨hc,hl⟩ := source_word_counts28 path
 have hs := source_word_lower28 path
 rw [hpa,hpb,sourceWord_central28] at hc hl hs
 have he := supported_core_unique28 a b w (central28 path) hab hcop hwa hwb hc hl hws hs
 have hw : sourceWord28 path=false::(w++[true]) := by rw [sourceWord_central28,he]
 refine ⟨path,hpa,hpb,hw,?_⟩
 rw [raw_matrix18]
 have hh := rawWord_pairs80 path ([false],[true])
 simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at hh
 rw [← hh,← rawWord_append80]
 change (rawWord80 (sourceWord28 path)).b=_
 rw [hw]

#print axioms supported_core_unique28
#print axioms supported_word_is_source28
end
end MathGKM.Markov
