import MarkovFourScan897
import MarkovFourthBooleanBridge01F
/-! Machine-authored 897eabb3. Exact cyclic assembly of the fourth local
Boolean moment. No source count or log-concavity hypothesis is hidden. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def endFour897 (p q r s : Bool) : List Bool → Bool × Bool × Bool × Bool
 | [] => (p,q,r,s)
 | t::ts => endFour897 q r s t ts
def tailFour897 (p q r s : Bool) : ℤ[X] :=
 openFour01F [booleanGauge6905 p q,booleanGauge6905 q r,booleanGauge6905 r s]-
 fourthPotential01F X p q r s

theorem fourth_local_tail897 (p q r s t : Bool) (w : List Bool) :
 localFour01F (booleanGauge6905 p q)
   (headRatioOne01F (booleanGaugesADB2 q (r::s::t::w)))
   (headRatioTwo01F (booleanGaugesADB2 q (r::s::t::w)))
   (headRatioThree01F (booleanGaugesADB2 q (r::s::t::w)))=
 fourthLocalBoolean01F (X:ℤ[X]) p q r s t := by
 simpa only [booleanGaugesADB2,headRatioOne01F,headRatioTwo01F,headRatioThree01F]
   using fourth_boolean_local01F p q r s t

theorem openFour_boolean897 (p q r s : Bool) (w : List Bool) :
 openFour01F (booleanGaugesADB2 p (q::r::s::w))=
 fourScan897 (fourthCanonical01F X) q r s w+fourthPotential01F X p q r s+
 tailFour897 (endFour897 p q r s w).1 (endFour897 p q r s w).2.1
   (endFour897 p q r s w).2.2.1 (endFour897 p q r s w).2.2.2 := by
 induction w generalizing p q r s with
 | nil => simp [booleanGaugesADB2,fourScan897,endFour897,tailFour897]
 | cons t ts ih =>
   change localFour01F (booleanGauge6905 p q)
     (headRatioOne01F (booleanGaugesADB2 q (r::s::t::ts)))
     (headRatioTwo01F (booleanGaugesADB2 q (r::s::t::ts)))
     (headRatioThree01F (booleanGaugesADB2 q (r::s::t::ts)))+
     openFour01F (booleanGaugesADB2 q (r::s::t::ts))=_
   rw [fourth_local_tail897,ih,fourth_boolean_coboundary01F]
   simp only [fourScan897,endFour897]
   ring

theorem endFour_append897 (p q r s a b c d : Bool) (w : List Bool) :
 endFour897 p q r s (w++[a,b,c,d])=(a,b,c,d) := by
 induction w generalizing p q r s with
 | nil => rfl
 | cons t ts ih => exact ih q r s t

theorem gauges_close897 (p r s : Bool) (w : List Bool) :
 booleanGaugesADB2 p (w++[true,false,r,s])=
 booleanGaugesADB2 p (w++[true])++
 [booleanGauge6905 true false,booleanGauge6905 false r,booleanGauge6905 r s] := by
 induction w generalizing p with
 | nil => rfl
 | cons t ts ih => simpa only [List.cons_append,booleanGaugesADB2] using congrArg
     (List.cons (booleanGauge6905 p t)) (ih t)

theorem cyclicFour_boolean897 (r s t : Bool) (w : List Bool)
 (hshape : ∀ z∈booleanGaugesADB2 true (false::r::s::(w++[t,true])),Projection6905 z) :
 cyclicFour01F (booleanGaugesADB2 true (false::r::s::(w++[t,true])))=
 fourScan897 (fourthCanonical01F X) false r s (w++[t,true,false,r,s]) := by
 rw [show booleanGaugesADB2 true (false::r::s::(w++[t,true]))=
   booleanGauge6905 true false::booleanGaugesADB2 false (r::s::(w++[t,true])) by rfl]
 rw [cyclic_four_append01F _ _ hshape]
 have ht : (booleanGauge6905 true false::booleanGaugesADB2 false (r::s::(w++[t,true]))).take 3=
   [booleanGauge6905 true false,booleanGauge6905 false r,booleanGauge6905 r s] := by rfl
 rw [ht]
 have he := gauges_close897 true r s (false::r::s::(w++[t]))
 simp only [List.cons_append,List.append_assoc,List.singleton_append] at he
 rw [←he,openFour_boolean897]
 have hend : endFour897 true false r s (w++[t,true,false,r,s])=(true,false,r,s) := by
   simpa only [List.append_assoc,List.singleton_append] using
     endFour_append897 true false r s true false r s (w++[t])
 rw [hend]
 simp only [tailFour897]
 ring

def endTriple897 (p q r : Bool) : List Bool → Bool × Bool × Bool
 | [] => (p,q,r)
 | s::ss => endTriple897 q r s ss

theorem fourScan_append897 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) (p q r : Bool) (w v : List Bool) :
 fourScan897 f p q r (w++v)=fourScan897 f p q r w+
 fourScan897 f (endTriple897 p q r w).1 (endTriple897 p q r w).2.1
   (endTriple897 p q r w).2.2 v := by
 induction w generalizing p q r with
 | nil => simp [fourScan897,endTriple897]
 | cons s ss ih => simp [fourScan897,endTriple897,ih,add_assoc]

theorem endTriple_append897 (p q r a b c : Bool) (w : List Bool) :
 endTriple897 p q r (w++[a,b,c])=(a,b,c) := by
 induction w generalizing p q r with
 | nil => rfl
 | cons s ss ih => exact ih q r s

theorem four_rotate897 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) (C : R)
 (hf : ∀ p q r,f p q r false=C) (r s t : Bool) (w : List Bool) :
 fourScan897 f false r s (w++[t,true,false,r,s])=
 fourCyclic897 f (false::r::s::(w++[t,true])) := by
 have ep : endPairADB2 false false (false::r::s::(w++[t,true]))=(t,true) := by
   simpa only [List.cons_append] using endPair_appendADB2 false false t true (false::r::s::w)
 rw [fourCyclic897,ep]
 simp only [fourScan897,hf]
 have h (p q u : Bool) (v : List Bool) :
   fourScan897 f p q u (v++[t,true,false,r,s])=
   fourScan897 f p q u (v++[t,true])+C+f t true false r+f true false r s := by
   induction v generalizing p q u with
   | nil => simp [fourScan897,hf]; ring
   | cons a as ih => simp [fourScan897,ih]; ring
 rw [h]
 ring

theorem source_fourth_cyclic897 (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
 fourCyclic897 (fourthCanonical01F X) (sourceWord28 rest) := by
 have hl := (source_word_counts28 rest).2
 rw [sourceWord_central28] at hl
 have hcl : 3≤(central28 rest).length := by simp only [List.length_cons,List.length_append,List.length_singleton] at hl; omega
 obtain ⟨r,rs,hr⟩ := List.exists_cons_of_length_pos (by omega : 0<(central28 rest).length)
 have hrs : 2≤rs.length := by rw [hr] at hcl; simp only [List.length_cons] at hcl; omega
 obtain ⟨s,ss,hs⟩ := List.exists_cons_of_length_pos (by omega : 0<rs.length)
 have hss : 0<ss.length := by rw [hs] at hrs; simp only [List.length_cons] at hrs; omega
 obtain hnil|⟨w,t,ht⟩ := List.eq_nil_or_concat ss
 · simp [hnil] at hss
 have hcentral : central28 rest=r::s::(w++[t]) := by simpa [hs,ht,List.concat_eq_append] using hr
 have hw : sourceWord28 rest=false::r::s::(w++[t,true]) := by
   rw [sourceWord_central28,hcentral]; simp [List.append_assoc]
 have hshape := boolean_source_shapeADB2 rest
 rw [hw] at hshape
 have hm := cyclicFour_boolean897 r s t w hshape
 rw [four_rotate897 _ (-6+72*X-108*X^2+24*X^3) (by intros; simp [fourthCanonical01F,bit6905])] at hm
 have he : runBooleanListADB2 0 true (sourceWord28 rest)=booleanGaugesADB2 true (sourceWord28 rest) := by
   have hh (p : Bool) (v : List Bool) : runBooleanListADB2 0 p v=booleanGaugesADB2 p v := by
     induction v generalizing p with
     | nil => rfl
     | cons q qs ih =>
       cases p <;> cases q <;> simp [runBooleanListADB2,booleanGaugesADB2,
         runBooleanGaugeADB2,booleanGauge6905,runSumA27,bit6905,ih]
   exact hh _ _
 have htrace := source_fourth_trace01F 0 rest
 simp only [List.replicate_zero,List.nil_append] at htrace
 rw [source_fourth_trace_long01F 0 rest hc,he,hw,hm] at htrace
 exact htrace

end
end MathGKM.Markov
