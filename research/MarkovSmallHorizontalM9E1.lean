import MarkovSmallHorizontal2_3M9E1
import MarkovSmallHorizontal2_5M9E1
import MarkovSmallHorizontal2_7M9E1
import MarkovSmallHorizontal3_4M9E1
import MarkovSmallHorizontal3_5M9E1
import MarkovSmallHorizontal3_7M9E1
import MarkovSmallHorizontal3_8M9E1
import MarkovSmallHorizontal4_5M9E1
import MarkovSmallHorizontal4_7M9E1
import MarkovSmallHorizontal5_6M9E1
import MarkovSmallHorizontal5_7M9E1
import MarkovSmallHorizontal5_8M9E1
import MarkovSmallHorizontal6_7M9E1
import MarkovSmallHorizontal7_8M9E1
import MarkovUnique098
/-! Machine-authored request 9e104e0c. Finite-denominator classification via actual path uniqueness. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
theorem small_horizontalM9E1 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : (frame path).mid.b ≤ 8) (i j : ℕ) (hj : j=3 ∨ j=4)
 (hi : i ≤ (frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨ha0,hab,hc⟩ := frame_reduced path
 generalize hea : (frame path).mid.a=a at *
 generalize heb : (frame path).mid.b=b at *
 have ha8 : a ≤ 7 := by omega
 have hb0 : 3 ≤ b := by omega
 interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
 · have hp : path=[true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_2_3_3M9E1 i hi
   · exact small_lc_2_3_4M9E1 i hi
 · have hp : path=[false,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_2_5_3M9E1 i hi
   · exact small_lc_2_5_4M9E1 i hi
 · have hp : path=[false,false,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_2_7_3M9E1 i hi
   · exact small_lc_2_7_4M9E1 i hi
 · have hp : path=[true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_3_4_3M9E1 i hi
   · exact small_lc_3_4_4M9E1 i hi
 · have hp : path=[true,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_3_5_3M9E1 i hi
   · exact small_lc_3_5_4M9E1 i hi
 · have hp : path=[false,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_3_7_3M9E1 i hi
   · exact small_lc_3_7_4M9E1 i hi
 · have hp : path=[false,true,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_3_8_3M9E1 i hi
   · exact small_lc_3_8_4M9E1 i hi
 · have hp : path=[true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_4_5_3M9E1 i hi
   · exact small_lc_4_5_4M9E1 i hi
 · have hp : path=[true,false,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_4_7_3M9E1 i hi
   · exact small_lc_4_7_4M9E1 i hi
 · have hp : path=[true,true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_5_6_3M9E1 i hi
   · exact small_lc_5_6_4M9E1 i hi
 · have hp : path=[true,true,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_5_7_3M9E1 i hi
   · exact small_lc_5_7_4M9E1 i hi
 · have hp : path=[true,false,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_5_8_3M9E1 i hi
   · exact small_lc_5_8_4M9E1 i hi
 · have hp : path=[true,true,true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_6_7_3M9E1 i hi
   · exact small_lc_6_7_4M9E1 i hi
 · have hp : path=[true,true,true,true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   rcases hj with rfl|rfl
   · exact small_lc_7_8_3M9E1 i hi
   · exact small_lc_7_8_4M9E1 i hi

end
end MathGKM.Markov
