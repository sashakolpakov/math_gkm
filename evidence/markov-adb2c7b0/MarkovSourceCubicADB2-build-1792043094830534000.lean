import MarkovCyclicLocalBridgeADB2
import MarkovFirstTwoCyclicADB2
import MarkovSourceMoments6905
/-! Machine-authored request adb2c7b0. Closed source cubic moment for low
slope sources whose predecessor word has at least four letters. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem booleanGauges_append_twoADB2 (p s t : Bool) (w : List Bool) :
 booleanGaugesADB2 p (w++[s,t])=
 booleanGaugesADB2 p w++
 [booleanGauge6905 (endPairADB2 p p w).2 s,booleanGauge6905 s t] := by
 induction w generalizing p with
 | nil => rfl
 | cons r rs ih =>
   simp only [List.cons_append,booleanGaugesADB2,ih,endPairADB2]
   have he : (endPairADB2 r r rs).2=(endPairADB2 p r rs).2 := by
     cases rs <;> rfl
   rw [he]

theorem localLScan_appendADB2 {R : Type*} [CommRing R]
 (y : R) (p q : Bool) (w v : List Bool) :
 localLScanADB2 y p q (w++v)=localLScanADB2 y p q w+
 localLScanADB2 y (endPairADB2 p q w).1 (endPairADB2 p q w).2 v := by
 induction w generalizing p q with
 | nil => simp [localLScanADB2,endPairADB2]
 | cons r rs ih => simp [localLScanADB2,endPairADB2,ih,add_assoc]

theorem boolean_source_traceADB2 (rest : List Bool) :
 tr16 (projProduct6905 (booleanGaugesADB2 true (sourceWord28 rest)))=
 tr16 (ambientWord5c U V (sourceWord28 (false::rest))) := by
 rw [booleanGauges_runsADB2]
 have hw := source_run_substitutionBF 0 rest
 simp only [List.replicate_zero,List.nil_append] at hw
 rw [hw,sourceWord_central28]
 simp only [List.map_cons,List.map_append,List.map_nil,Bool.true_eq_false,ite_false,
   Bool.false_eq_true,ite_true,bit6905,mul_one]
 have hg := gaugedRuns_trace6905
   (0::((central28 rest).map fun q => if q then 1 else 0)) 1
 simpa [runSumA27,runMatrixBF,lowerSub487,List.flatMap_map,List.map_append,
   List.map_cons,List.map_nil] using hg

theorem boolean_source_shapeADB2 (rest : List Bool) :
 ∀ z∈booleanGaugesADB2 true (sourceWord28 rest),Projection6905 z := by
 rw [booleanGauges_runsADB2]
 exact gaugedRuns_shape6905 _ _

theorem source_cubic_momentADB2 (rest : List Bool) (hc : 4≤(frame rest).mid.b) :
 6*(tr16 (ambientWord5c U V (sourceWord28 (false::rest)))).coeff 3=
 (momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ)))^3+
 3*momentD6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))*
 momentK6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))
   (C (((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)))+
 momentL6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))
   (C (((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)))
   (C (((min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ):ℤ)))
   (C (((3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ):ℤ))) := by
 have hl := (source_word_counts28 rest).2
 rw [sourceWord_central28] at hl
 have hcs : 2≤(central28 rest).length := by simp only [List.length_cons,List.length_append,List.length_singleton,List.length_nil] at hl; omega
 obtain ⟨r,rs,hrs⟩ := List.exists_cons_of_length_pos (by omega : 0<(central28 rest).length)
 have hrslen : 0<rs.length := by rw [hrs] at hcs; simp only [List.length_cons] at hcs; omega
 obtain hnil|⟨ws,s,hws⟩ := List.eq_nil_or_concat rs
 · simp [hnil] at hrslen
 have hcentral : central28 rest=r::(ws++[s]) := by simpa [List.concat_eq_append,hws] using hrs
 let m := booleanGauge6905 true false
 let n := booleanGauge6905 false r
 let ps := booleanGaugesADB2 r ws
 let p := booleanGauge6905 (endPairADB2 r r ws).2 s
 let q := booleanGauge6905 s true
 have hw : booleanGaugesADB2 true (sourceWord28 rest)=m::n::(ps++[p,q]) := by
   rw [sourceWord_central28,hcentral]
   simp only [List.cons_append,List.append_assoc]
   change m::n::booleanGaugesADB2 r (ws++[s,true])=_
   rw [booleanGauges_append_twoADB2]
 have hshape := boolean_source_shapeADB2 rest
 have hb := booleanGauges_b1ADB2 true (sourceWord28 rest)
 have htrace := boolean_source_traceADB2 rest
 rw [hw] at hshape hb htrace
 have hD := projection_trace1ADB2 m n (ps++[p,q]) hshape
 rw [htrace,source_first_moment6905] at hD
 have hK := projection_trace2ADB2 m n p q ps hshape
 rw [htrace,source_second_moment6905 rest (by omega),←hD] at hK
 have hKeq : cyclicK6905 m n ps p q=
   momentK6905 X (C ((frame rest).mid.b:ℤ)) (C ((frame rest).mid.a:ℤ))
     (C (((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ))) := by
   linear_combination -hK
 have hL := cyclicL_scanADB2 m n p q ps hb
 have hm : matrixLScanADB2 (m::n::(ps++[p,q]))=
     localLScanADB2 X true false (central28 rest++[true])+singleLADB2 q := by
   rw [←hw,sourceWord_central28,hcentral]
   simpa only [List.cons_append,List.append_assoc,List.nil_append,q] using
     matrixL_booleanADB2 true false s true (r::ws)
 rw [hm] at hL
 have he : edgeLADB2 q m=localL6905 X s true false := edgeL_booleanADB2 s true false
 rw [he] at hL
 have hscan : localLScanADB2 X true false (central28 rest++[true,false])=
     localLScanADB2 X true false (central28 rest++[true])+localL6905 X s true false := by
   rw [show central28 rest++[true,false]=(central28 rest++[true])++[false] by simp,
     localLScan_appendADB2]
   have hend : endPairADB2 true false (central28 rest++[true])=(s,true) := by
     rw [hcentral]
     simpa only [List.cons_append,List.append_assoc,List.nil_append] using
       endPair_appendADB2 true false s true (r::ws)
   rw [hend]
   simp [localLScanADB2]
 have hLeq : cyclicL6905 m n ps p q=localLScanADB2 X true false (central28 rest++[true,false]) := by
   linear_combination hL-hscan
 have h3 := projection_trace3_moments6905 m n p q ps hshape
 rw [htrace,←hD,hKeq,hLeq,source_localLADB2] at h3
 simpa only [map_natCast,map_intCast,Int.cast_natCast] using h3

theorem source_third_formulaADB2 (rest : List Bool) (hc : 4≤(frame rest).mid.b) :
 ThirdFormula75 (false::rest) (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) := by
 exact source_third_of_cubic_moment6905 rest _ _ (by omega)
   (source_cubic_momentADB2 rest hc)

#print axioms source_cubic_momentADB2
#print axioms source_third_formulaADB2
end
end MathGKM.Markov
