import MarkovWordWitness28b1
import MarkovPolygon18
/-! Machine-authored 28b112de. Polygon support forces exact mechanical
prefix counts. Positive matrix words are not silently identified with sources. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

def WordLower28 (a b : ℕ) (w : List Bool) : Prop :=
 ∀ i j, 0<coeff (rawWord80 w).b i j → a*b≤b*i+a*j

theorem polygon_prefix_floor28 (a b : ℕ) (x y : List Bool) (r : Bool)
 (hab : a<b) (hcop : Nat.Coprime a b)
 (ha : (false::(x++r::(y++[true]))).count true=a)
 (hb : (false::(x++r::(y++[true]))).length=b)
 (hs : WordLower28 a b (false::(x++r::(y++[true])))) :
 x.count true = a*(x.length+1)/b := by
 have hp := hs _ _ (word_prefix_atom28 x y r)
 have hsu : 0<coeff (rawWord80 (false::(x++r::(y++[true])))).b
   ((y++[true]).count true) ((false::x).length+(if r then 1 else 0)) := by
   simpa using word_suffix_atom28 (false::x) (y++[true]) r
 have hu := hs _ _ hsu
 have hb0 : 0<b := by omega
 have hl : x.length+1<b := by simp only [List.length_cons,List.length_append,List.length_singleton] at hb; omega
 have hl0 : 0<x.length+1 := by omega
 have hlow : b*x.count true ≤ a*(x.length+1) := by
   cases r <;> simp [List.count_cons,List.count_append] at ha hu <;> nlinarith
 have hhigh : a*(x.length+1) ≤ b*(x.count true+1) := by
   simp only [List.length_cons,List.length_append,List.length_singleton] at hb
   nlinarith
 have hne : a*(x.length+1) ≠ b*(x.count true+1) := by
   intro he
   have hd : b ∣ a*(x.length+1) := ⟨x.count true+1,he⟩
   have hd' := hcop.symm.dvd_of_dvd_mul_left hd
   have hle := Nat.le_of_dvd hl0 hd'
   omega
 have hstrict : a*(x.length+1) < b*(x.count true+1) := lt_of_le_of_ne hhigh hne
 symm
 apply (Nat.div_eq_iff hb0).mpr
 constructor
 · nlinarith
 · have hh : a*(x.length+1)+1 ≤ x.count true*b+b := by nlinarith
   omega

theorem source_word_lower28 (path : List Bool) :
 WordLower28 (frame path).mid.a (frame path).mid.b (sourceWord28 path) := by
 have he : (frame path).mid.p=(rawWord80 (sourceWord28 path)).b := by
   rw [raw_matrix18]
   have hh := rawWord_pairs80 path ([false],[true])
   simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at hh
   rw [← hh]
   exact congrArg Mat16.b (rawWord_append80 _ _).symm
 intro i j hp
 rw [← he] at hp
 exact raw_lower_support18 path i j (ne_of_gt hp)

theorem source_word_counts28 (path : List Bool) :
 (sourceWord28 path).count true=(frame path).mid.a ∧
 (sourceWord28 path).length=(frame path).mid.b := by
 have hv := wordPair_fold_valid774 path initial ([false],[true]) indices_initial wordPair_initial774
 change WordPairValid774 (frame path) (path.foldl wordPairStep774 ([false],[true])) at hv
 obtain ⟨hl,hr,cl,cr,_⟩ := hv
 constructor
 · simpa [sourceWord28,List.count_append,cl,cr] using (indices_frame path).1.symm
 · simpa [sourceWord28,List.length_append,hl,hr] using (indices_frame path).2.1.symm

/-- Source prefix counts are exact floors, with source order retained.
The split runs through every nonempty prefix except the last one. -/
theorem source_prefix_floor28 (path : List Bool) (x y : List Bool) (r : Bool)
 (hw : sourceWord28 path=false::(x++r::(y++[true]))) :
 x.count true=(frame path).mid.a*(x.length+1)/(frame path).mid.b := by
 obtain ⟨ha,hab,hcop⟩ := frame_reduced path
 obtain ⟨hc,hl⟩ := source_word_counts28 path
 have hs := source_word_lower28 path
 rw [hw] at hc hl hs
 exact polygon_prefix_floor28 _ _ x y r hab hcop hc hl hs

#print axioms polygon_prefix_floor28
#print axioms source_prefix_floor28
end
end MathGKM.Markov
