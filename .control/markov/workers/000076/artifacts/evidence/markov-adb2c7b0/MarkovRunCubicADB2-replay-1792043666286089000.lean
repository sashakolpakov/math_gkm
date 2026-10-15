import MarkovBooleanCyclicADB2
import MarkovSourceCubicADB2
/-! Machine-authored request adb2c7b0. Universal cubic source identity for
all adjacent run lengths n,n+1 and predecessor denominator at least four.
The identity does not assert log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def runBooleanGaugeADB2 (n : ℕ) (p q : Bool) : Mat16 BiPoly :=
 gauge75 (C (2*runSumA27 X (n+if p then 1 else 0)))
   (C (2*runSumA27 X (n+if q then 1 else 0)))
   (lowerMatrix487 (n+if q then 1 else 0))
def runBooleanListADB2 (n : ℕ) (p : Bool) : List Bool → List (Mat16 BiPoly)
 | [] => []
 | q::qs => runBooleanGaugeADB2 n p q::runBooleanListADB2 n q qs
def runLocalLADB2 (n : ℕ) (p q r : Bool) : ℤ[X] :=
 edgeLADB2 (runBooleanGaugeADB2 n p q) (runBooleanGaugeADB2 n q r)
def sourceRunLADB2 (n : ℕ) (rest : List Bool) : ℤ[X] :=
 boolMomentADB2 (runLocalLADB2 n) (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ)

theorem runBooleanList_runsADB2 (n : ℕ) (p : Bool) (w : List Bool) :
 runBooleanListADB2 n p w=gaugedRuns6905 (2*runSumA27 X (n+if p then 1 else 0))
   (w.map fun q => n+if q then 1 else 0) := by
 induction w generalizing p with
 | nil => rfl
 | cons q qs ih => simp only [runBooleanListADB2,List.map_cons,gaugedRuns6905,runBooleanGaugeADB2,ih]

theorem runBoolean_b1ADB2 (n : ℕ) (p q : Bool) :
 (runBooleanGaugeADB2 n p q).b.coeff 1=1 := by
 simpa [runBooleanGaugeADB2,gauge75,mm16,shear75,unshear75] using
   (lowerMatrix_jets487 (n+if q then 1 else 0)).2.2.2.2.1

theorem runBooleanList_b1ADB2 (n : ℕ) (p : Bool) (w : List Bool) :
 ∀ z∈runBooleanListADB2 n p w,z.b.coeff 1=1 := by
 induction w generalizing p with
 | nil => simp [runBooleanListADB2]
 | cons q qs ih =>
   intro z hz
   simp only [runBooleanListADB2,List.mem_cons] at hz
   rcases hz with rfl|hz
   · exact runBoolean_b1ADB2 n p q
   · exact ih q z hz

theorem runBoolean_append_twoADB2 (n : ℕ) (p s t : Bool) (w : List Bool) :
 runBooleanListADB2 n p (w++[s,t])=runBooleanListADB2 n p w++
 [runBooleanGaugeADB2 n (endPairADB2 p p w).2 s,runBooleanGaugeADB2 n s t] := by
 induction w generalizing p with
 | nil => rfl
 | cons r rs ih =>
   simp only [List.cons_append,runBooleanListADB2,ih,endPairADB2]
   have he : (endPairADB2 r r rs).2=(endPairADB2 p r rs).2 := by cases rs <;> rfl
   rw [he]

theorem matrixL_runBooleanADB2 (n : ℕ) (p q s t : Bool) (w : List Bool) :
 matrixLScanADB2 (runBooleanListADB2 n p (q::(w++[s,t])))=
 tripleScanADB2 (runLocalLADB2 n) p q (w++[s,t])+
 singleLADB2 (runBooleanGaugeADB2 n s t) := by
 induction w generalizing p q with
 | nil => simp [runBooleanListADB2,matrixLScanADB2,runLocalLADB2,tripleScanADB2,add_assoc]
 | cons r rs ih =>
   simpa only [List.cons_append,runBooleanListADB2,matrixLScanADB2,
     runLocalLADB2,tripleScanADB2,add_assoc] using
     congrArg (fun x => runLocalLADB2 n p q r+x) (ih q r)

theorem tripleScan_appendADB2 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → R) (p q : Bool) (w v : List Bool) :
 tripleScanADB2 f p q (w++v)=tripleScanADB2 f p q w+
 tripleScanADB2 f (endPairADB2 p q w).1 (endPairADB2 p q w).2 v := by
 induction w generalizing p q with
 | nil => simp [tripleScanADB2,endPairADB2]
 | cons r rs ih => simp [tripleScanADB2,endPairADB2,ih,add_assoc]

theorem runBoolean_source_traceADB2 (n : ℕ) (rest : List Bool) :
 tr16 (projProduct6905 (runBooleanListADB2 n true (sourceWord28 rest)))=
 tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest))) := by
 rw [runBooleanList_runsADB2,source_run_substitutionBF,sourceWord_central28]
 have hg := gaugedRuns_trace6905
   (n::((central28 rest).map fun q => n+if q then 1 else 0)) (n+1)
 simpa [runMatrixBF,lowerSub487,List.flatMap_map,List.map_append,
   List.map_cons,List.map_nil] using hg

theorem runBoolean_source_shapeADB2 (n : ℕ) (rest : List Bool) :
 ∀ z∈runBooleanListADB2 n true (sourceWord28 rest),Projection6905 z := by
 rw [runBooleanList_runsADB2]
 exact gaugedRuns_shape6905 _ _

theorem source_run_trace3ADB2 (n : ℕ) (rest : List Bool) (hc : 4≤(frame rest).mid.b) :
 let T := tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest)))
 6*T.coeff 3=6*T.coeff 1*T.coeff 2-2*(T.coeff 1)^3+sourceRunLADB2 n rest := by
 dsimp only
 have hl := (source_word_counts28 rest).2
 rw [sourceWord_central28] at hl
 have hcs : 2≤(central28 rest).length := by
   simp only [List.length_cons,List.length_append,List.length_singleton,List.length_nil] at hl; omega
 obtain ⟨r,rs,hrs⟩ := List.exists_cons_of_length_pos (by omega : 0<(central28 rest).length)
 have hrslen : 0<rs.length := by rw [hrs] at hcs; simp only [List.length_cons] at hcs; omega
 obtain hnil|⟨ws,s,hws⟩ := List.eq_nil_or_concat rs
 · simp [hnil] at hrslen
 have hcentral : central28 rest=r::(ws++[s]) := by simpa [List.concat_eq_append,hws] using hrs
 let m := runBooleanGaugeADB2 n true false
 let k := runBooleanGaugeADB2 n false r
 let ps := runBooleanListADB2 n r ws
 let p := runBooleanGaugeADB2 n (endPairADB2 r r ws).2 s
 let q := runBooleanGaugeADB2 n s true
 have hw : runBooleanListADB2 n true (sourceWord28 rest)=m::k::(ps++[p,q]) := by
   rw [sourceWord_central28,hcentral]
   simp only [List.cons_append,List.append_assoc]
   change m::k::runBooleanListADB2 n r (ws++[s,true])=_
   rw [runBoolean_append_twoADB2]
 have hshape := runBoolean_source_shapeADB2 n rest
 have hb := runBooleanList_b1ADB2 n true (sourceWord28 rest)
 have htrace := runBoolean_source_traceADB2 n rest
 rw [hw] at hshape hb htrace
 have hD := projection_trace1ADB2 m k (ps++[p,q]) hshape
 have hK := projection_trace2ADB2 m k p q ps hshape
 have h3 := projection_trace3_moments6905 m k p q ps hshape
 rw [htrace] at hD hK h3
 rw [←hD] at hK h3
 have hL := cyclicL_scanADB2 m k p q ps hb
 have hm : matrixLScanADB2 (m::k::(ps++[p,q]))=
     tripleScanADB2 (runLocalLADB2 n) true false (central28 rest++[true])+singleLADB2 q := by
   rw [←hw,sourceWord_central28,hcentral]
   simpa only [List.cons_append,List.append_assoc,List.nil_append,q] using
     matrixL_runBooleanADB2 n true false s true (r::ws)
 rw [hm] at hL
 have he : edgeLADB2 q m=runLocalLADB2 n s true false := rfl
 rw [he] at hL
 have hscan : tripleScanADB2 (runLocalLADB2 n) true false (central28 rest++[true,false])=
     tripleScanADB2 (runLocalLADB2 n) true false (central28 rest++[true])+
     runLocalLADB2 n s true false := by
   rw [show central28 rest++[true,false]=(central28 rest++[true])++[false] by simp,
     tripleScan_appendADB2]
   have hend : endPairADB2 true false (central28 rest++[true])=(s,true) := by
     rw [hcentral]
     simpa only [List.cons_append,List.append_assoc,List.nil_append] using
       endPair_appendADB2 true false s true (r::ws)
   rw [hend]
   simp [tripleScanADB2]
 have hLeq : cyclicL6905 m k ps p q=sourceRunLADB2 n rest := by
   have hs := source_tripleScanADB2 (runLocalLADB2 n) rest
   change _=sourceRunLADB2 n rest at hs
   linear_combination hL-hscan+hs
 rw [hLeq] at h3
 linear_combination h3-3*(tr16 (ambientWord5c U V
   (sourceWord28 (List.replicate n true++false::rest)))).coeff 1*hK

theorem source_run_cut3ADB2 (n : ℕ) (rest : List Bool) (hc : 4≤(frame rest).mid.b) :
 let w := central28 (List.replicate n true++false::rest)++[true]
 6*cutCoeffA27 (X:ℤ[X]) X 1 w 3=
 6*cutCoeffA27 (X:ℤ[X]) X 1 w 1*cutCoeffA27 (X:ℤ[X]) X 1 w 2-
 2*(cutCoeffA27 (X:ℤ[X]) X 1 w 1)^3-2*(1+X)^3+sourceRunLADB2 n rest := by
 dsimp only
 let path := List.replicate n true++false::rest
 have h := source_run_trace3ADB2 n rest hc
 have ht1 := source_first_cut_trace487 path
 have ht2 := source_cut_trace75 path 1
 have ht3 := source_cut_trace75 path 2
 dsimp only at h
 rw [ht1,ht2,ht3] at h
 linear_combination h

#print axioms source_run_trace3ADB2
#print axioms source_run_cut3ADB2
end
end MathGKM.Markov
