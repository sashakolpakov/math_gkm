import MarkovThirdSmallLC43M762
import MarkovThirdRight4_7M762
import MarkovThirdSmallLC54M762
import MarkovThirdRight5_9M762
import MarkovThirdSmallLC65M762
import MarkovThirdRight6_11M762
import MarkovThirdSmallLC53M762
import MarkovThirdRight5_8M762
import MarkovThirdSmallLC41M762
import MarkovThirdRight4_5M762
import MarkovThirdSmallLC52M762
import MarkovThirdRight5_7M762
import MarkovThirdSmallLC51M762
import MarkovThirdRight5_6M762
import MarkovThirdSmallLC61M762
import MarkovThirdRight6_7M762
import MarkovThirdLargeSourceM762
/-! Machine-authored 762ebbae. Third column for every path with numerator at least four. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000

theorem small_vertical_third_rightM762 (rest : List Bool)
 (hlo : 4≤(frame rest).mid.b) (hhi : (frame rest).mid.b≤6) (j : ℕ) :
 coeff (frame (true::rest)).mid.p 3 j*coeff (frame (true::rest)).mid.p 3 (j+2) ≤
 coeff (frame (true::rest)).mid.p 3 (j+1)^2 := by
 by_cases hj : j ≤ (frame (true::rest)).mid.a+(frame (true::rest)).mid.b-1
 · obtain ⟨ha0,hab,hc⟩ := frame_reduced rest
   have hi := source_vertical_indicesMDE6 0 rest
   simp only [List.replicate_zero,List.nil_append,Nat.zero_add,mul_one] at hi
   rw [hi.1,hi.2] at hj
   generalize hea : (frame rest).mid.a=a at *
   generalize heb : (frame rest).mid.b=b at *
   have ha5 : a≤5 := by omega
   interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
   · have hp : rest=[false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_4_7M762 j hj
   · have hp : rest=[false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_5_9M762 j hj
   · have hp : rest=[false,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_6_11M762 j hj
   · have hp : rest=[false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_5_8M762 j hj
   · have hp : rest=[true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_4_5M762 j hj
   · have hp : rest=[true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_5_7M762 j hj
   · have hp : rest=[true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_5_6M762 j hj
   · have hp : rest=[true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_6_7M762 j hj
 · have hz := raw_outside_polygon18 (true::rest) 3 j (by unfold InPolygon; omega)
   rw [hz,zero_mul]; exact sq_nonneg _

theorem vertical_third_four_to_sixM762 (path : List Bool)
 (ha : 4≤(frame path).mid.a) (hb : (frame path).mid.a≤6) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   by_cases hn : n=0
   · subst n
     simpa using small_vertical_third_rightM762 rest (by omega) (by omega) j
   obtain ⟨ha0,hab,hc⟩ := frame_reduced rest
   generalize hea : (frame rest).mid.a=a at *
   generalize heb : (frame rest).mid.b=b at *
   have ha5 : a≤5 := by omega
   have hb4 : 4≤b := by omega
   have hb6 : b≤6 := by omega
   interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
   · exact sThird43rawM762 n (by omega) rest hea heb j
   · exact sThird54rawM762 n (by omega) rest hea heb j
   · exact sThird65rawM762 n (by omega) rest hea heb j
   · exact sThird53rawM762 n (by omega) rest hea heb j
   · exact sThird41rawM762 n (by omega) rest hea heb j
   · exact sThird52rawM762 n (by omega) rest hea heb j
   · exact sThird51rawM762 n (by omega) rest hea heb j
   · exact sThird61rawM762 n (by omega) rest hea heb j

theorem vertical_third_ge_fourM762 (path : List Bool)
 (ha : 4≤(frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 by_cases hb : 7≤(frame path).mid.a
 · exact vertical_third_largeM762 path hb j
 · exact vertical_third_four_to_sixM762 path ha (by omega) j
end
end MathGKM.Markov
