import MarkovFiniteQuintic05ef
import MarkovUnique098
namespace MathGKM.Markov
set_option maxHeartbeats 0
set_option maxRecDepth 10000
def sourceCore05ef (path : List Bool) : List Bool :=
 let xy := path.foldl wordPairStep774 ([false],[true])
 xy.1.tail ++ xy.2.dropLast

theorem source_core_good05ef (path : List Bool)
 (ha : 2 ≤ (frame path).mid.a) (ha9 : (frame path).mid.a ≤ 9)
 (hb : (frame path).mid.b ≤ 19) : quinticWordGood05ef (sourceCore05ef path) := by
 obtain ⟨ha0,hab,hc⟩ := frame_reduced path
 generalize hea : (frame path).mid.a = a at *
 generalize heb : (frame path).mid.b = b at *
 have hb0 : 3 ≤ b := by omega
 interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
 · have hp : path = [true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,false,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,false,false,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,false,false,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,false,true,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,false,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,false,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,false,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false,false,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,true,true,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,true,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false,false,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [true,false,false,false,false,false,false,false] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
 · have hp : path = [false,true,true,true,true,true,true,true,true] := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel

#print axioms source_core_good05ef
end MathGKM.Markov
