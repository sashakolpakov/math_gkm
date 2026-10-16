import MarkovVerticalSecondSourceMDE6
import MarkovSmallVertical2_3MDE6
import MarkovSmallVertical3_4MDE6
import MarkovSmallVertical3_5MDE6
import MarkovSmallVertical4_5MDE6
import MarkovSmallVertical4_7MDE6
import MarkovUnique098
/-! Machine-authored de6168c6. All sources in a<b<2a, second vertical column,
including every small numerator and all natural starting indices. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem small_vertical_rightMDE6 (rest : List Bool) (hb : (frame rest).mid.b ≤ 4)
 (j : ℕ) :
 coeff (frame (true::rest)).mid.p 2 j*coeff (frame (true::rest)).mid.p 2 (j+2) ≤
 coeff (frame (true::rest)).mid.p 2 (j+1)^2 := by
 by_cases hj : j ≤ (frame (true::rest)).mid.a+(frame (true::rest)).mid.b-1
 · obtain ⟨ha0,hab,hc⟩ := frame_reduced rest
   have hi := source_vertical_indicesMDE6 0 rest
   simp only [List.replicate_zero,List.nil_append,Nat.zero_add,mul_one] at hi
   rw [hi.1,hi.2] at hj
   generalize hea : (frame rest).mid.a=a at *
   generalize heb : (frame rest).mid.b=b at *
   have ha3 : a ≤ 3 := by omega
   have hb2 : 2 ≤ b := by omega
   interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
   · have hp : rest=[] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_vlc_2_3MDE6 j hj
   · have hp : rest=[false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_vlc_3_5MDE6 j hj
   · have hp : rest=[false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_vlc_4_7MDE6 j hj
   · have hp : rest=[true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_vlc_3_4MDE6 j hj
   · have hp : rest=[true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_vlc_4_5MDE6 j hj
 · have hz := raw_outside_polygon18 (true::rest) 2 j (by unfold InPolygon; omega)
   rw [hz,zero_mul]; exact sq_nonneg _

theorem vertical_second_right_allMDE6 (rest : List Bool) (j : ℕ) :
 coeff (frame (true::rest)).mid.p 2 j*coeff (frame (true::rest)).mid.p 2 (j+2) ≤
 coeff (frame (true::rest)).mid.p 2 (j+1)^2 := by
 by_cases h : 5 ≤ (frame rest).mid.b
 · exact vertical_second_right_rawMDE6 rest h j
 · exact small_vertical_rightMDE6 rest (by omega) j

theorem source_left_spine_indicesMDE6 (n : ℕ) :
 (frame (List.replicate n false)).mid.a=1 ∧
 (frame (List.replicate n false)).mid.b=n+2 := by
 have hw : sourceWord28 (List.replicate n false)=runBlock025 (n+1) := by
   unfold sourceWord28
   have h := false_fold025 n 0
   change (List.replicate n false).foldl wordPairStep774 ([false],[true])=_ at h
   rw [h]
   simp [runBlock025,List.replicate_succ]
 obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n false)
 rw [hw] at ha hb
 simp [runBlock025,List.count_replicate] at ha hb
 exact ⟨ha.symm,by omega⟩

theorem source_right_of_ratioMDE6 (path : List Bool)
 (h : (frame path).mid.b < 2*(frame path).mid.a) :
 ∃ rest, path=true::rest := by
 rcases split_first_true025 path with ⟨n,rfl⟩ | ⟨n,rest,rfl⟩
 · obtain ⟨ha,hb⟩ := source_left_spine_indicesMDE6 n
   omega
 · obtain ⟨ha,hb⟩ := source_vertical_indicesMDE6 n rest
   have hn : n=0 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 2 ≤ n+1 by omega)
     omega
   subst n
   exact ⟨rest,rfl⟩

theorem vertical_second_near_oneMDE6 (path : List Bool)
 (h : (frame path).mid.b < 2*(frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 obtain ⟨rest,rfl⟩ := source_right_of_ratioMDE6 path h
 exact vertical_second_right_allMDE6 rest j

end
end MathGKM.Markov
