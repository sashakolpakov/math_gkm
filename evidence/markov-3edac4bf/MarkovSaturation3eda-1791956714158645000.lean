import MarkovMechanical3eda
import MarkovIntervals725
import MarkovVertices18
/-! Machine-authored request 3edac4bf. Full lattice saturation of the pinned
polygon. This is a support theorem, not Conjecture 6.3. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem source_saturated3eda (path : List Bool) (i j : ℕ)
 (hp : InPolygon (frame path).mid.a (frame path).mid.b i j) :
 0<coeff (frame path).mid.p i j := by
 obtain ⟨ha,hab,hcop⟩ := frame_reduced path
 obtain ⟨hc,hl⟩ := source_word_counts28 path
 obtain ⟨hlo,hhi⟩ := hp
 by_cases hjb : (frame path).mid.b≤j
 · exact source_filled725 path 0 (frame path).mid.b
     (lower_vertices_positive18 path).2 i j (by omega) hjb hhi
 cases j with
 | zero =>
   have hai : (frame path).mid.a≤ i := by simp only [Nat.mul_zero,Nat.add_zero] at hlo; nlinarith
   exact source_filled725 path (frame path).mid.a 0
     (lower_vertices_positive18 path).1 i 0 hai le_rfl hhi
 | succ n =>
   cases hd : (sourceWord28 path).drop n with
   | nil =>
     have h := congrArg List.length hd
     simp [hl] at h
     omega
   | cons r y =>
     let x := (sourceWord28 path).take n
     have hw : sourceWord28 path=x++r::y := by
       have h := List.take_append_drop n (sourceWord28 path)
       rw [hd] at h
       exact h.symm
     have hx : x.length=n := by simp [x,List.length_take,hl,Nat.min_eq_left (by omega : n≤(frame path).mid.b)]
     have hfloor := source_take_floor3eda path (n+1) (by omega)
     have htake : ((sourceWord28 path).take (n+1)).count true=
       x.count true+(if r then 1 else 0) := by
       rw [hw,show n+1=x.length+1 by omega,List.take_append]
       simp [List.take_of_length_le,List.count_append,List.count_cons]
     rw [htake] at hfloor
     have hcount : (frame path).mid.a=x.count true+(if r then 1 else 0)+y.count true := by
       rw [hw] at hc
       cases r <;> simp [List.count_append,List.count_cons] at hc ⊢ <;> omega
     have hdiv := (Nat.div_eq_iff (by omega : 0<(frame path).mid.b)).mp hfloor.symm
     have hstrict : (frame path).mid.a*(n+1)<(x.count true+(if r then 1 else 0))*(frame path).mid.b+(frame path).mid.b := by omega
     have hyi : y.count true≤ i := by
       by_contra hh
       have hii : i+1≤y.count true := by omega
       have hm := Nat.mul_le_mul_left (frame path).mid.b hii
       have he := congrArg (fun z : ℕ => z*(frame path).mid.b) hcount
       simp only [Nat.add_mul] at he
       nlinarith
     have hatom := word_suffix_atom28 x y r
     rw [← hw,← source_word_exact3eda] at hatom
     exact source_filled725 path (y.count true) (x.length+(if r then 1 else 0))
       hatom i (n+1) hyi (by cases r <;> simp <;> omega) hhi

theorem source_positive_iff_polygon3eda (path : List Bool) (i j : ℕ) :
 0<coeff (frame path).mid.p i j ↔
 InPolygon (frame path).mid.a (frame path).mid.b i j :=
 ⟨positive_in_polygon725 path i j,source_saturated3eda path i j⟩

theorem source_zero_iff_outside3eda (path : List Bool) (i j : ℕ) :
 coeff (frame path).mid.p i j=0 ↔
 ¬ InPolygon (frame path).mid.a (frame path).mid.b i j := by
 constructor
 · intro hz hp
   have h := source_saturated3eda path i j hp
   omega
 · exact raw_outside_polygon18 path i j

#print axioms source_saturated3eda
#print axioms source_positive_iff_polygon3eda
#print axioms source_zero_iff_outside3eda
end
end MathGKM.Markov
