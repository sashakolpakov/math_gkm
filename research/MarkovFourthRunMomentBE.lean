import MarkovFourMomentBE
/-! Machine-authored be5676f9. Universal fourth trace moment for all run
lengths, with predecessor denominator at least five. No log-concavity premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def runLocalFourBE (n : ℕ) (p q r s : Bool) : ℤ[X] :=
 let m := runBooleanGaugeADB2 n p q
 let k := runBooleanGaugeADB2 n q r
 let l := runBooleanGaugeADB2 n r s
 localFour01F m 1
   (k.b.coeff 2+k.a.coeff 1-k.d.coeff 1)
   (k.b.coeff 3+k.a.coeff 1*(l.b.coeff 2+l.a.coeff 1-l.d.coeff 1)+k.a.coeff 2-
     (k.b.coeff 2+k.a.coeff 1)*k.d.coeff 1+
     (k.d.coeff 1)^2-k.d.coeff 2-k.c.coeff 1)

theorem run_four_localBE (n : ℕ) (p q r s t : Bool) (w : List Bool) :
 localFour01F (runBooleanGaugeADB2 n p q)
   (headRatioOne01F (runBooleanListADB2 n q (r::s::t::w)))
   (headRatioTwo01F (runBooleanListADB2 n q (r::s::t::w)))
   (headRatioThree01F (runBooleanListADB2 n q (r::s::t::w)))=
 runLocalFourBE n p q r s := by
 simp only [runBooleanListADB2,headRatioOne01F,headRatioTwo01F,headRatioThree01F,
   runBoolean_b1ADB2,runLocalFourBE]
 congr 1 <;> ring

def runFourTailBE (n : ℕ) (p q r s : Bool) : ℤ[X] :=
 openFour01F [runBooleanGaugeADB2 n p q,runBooleanGaugeADB2 n q r,
   runBooleanGaugeADB2 n r s]-runLocalFourBE n p q r s

theorem openFour_runBE (n : ℕ) (p q r s : Bool) (w : List Bool) :
 openFour01F (runBooleanListADB2 n p (q::r::s::w))=
 fourScan897 (runLocalFourBE n) p q r (s::w)+
 runFourTailBE n (endFour897 p q r s w).1 (endFour897 p q r s w).2.1
   (endFour897 p q r s w).2.2.1 (endFour897 p q r s w).2.2.2 := by
 induction w generalizing p q r s with
 | nil => simp [runBooleanListADB2,fourScan897,endFour897,runFourTailBE]
 | cons t ts ih =>
   change localFour01F (runBooleanGaugeADB2 n p q)
     (headRatioOne01F (runBooleanListADB2 n q (r::s::t::ts)))
     (headRatioTwo01F (runBooleanListADB2 n q (r::s::t::ts)))
     (headRatioThree01F (runBooleanListADB2 n q (r::s::t::ts)))+
     openFour01F (runBooleanListADB2 n q (r::s::t::ts))=_
   rw [run_four_localBE,ih]
   simp only [fourScan897,endFour897]
   ring

theorem run_gauges_closeBE (n : ℕ) (p r s : Bool) (w : List Bool) :
 runBooleanListADB2 n p (w++[true,false,r,s])=
 runBooleanListADB2 n p (w++[true])++
 [runBooleanGaugeADB2 n true false,runBooleanGaugeADB2 n false r,
   runBooleanGaugeADB2 n r s] := by
 induction w generalizing p with
 | nil => rfl
 | cons t ts ih => simpa only [List.cons_append,runBooleanListADB2] using
     (congrArg (List.cons (runBooleanGaugeADB2 n p t)) (ih t))

theorem cyclicFour_runBE (n : ℕ) (r s t : Bool) (w : List Bool)
 (hshape : ∀ z∈runBooleanListADB2 n true (false::r::s::(w++[t,true])),Projection6905 z) :
 cyclicFour01F (runBooleanListADB2 n true (false::r::s::(w++[t,true])))=
 fourScan897 (runLocalFourBE n) false r s (w++[t,true,false,r,s]) := by
 rw [show runBooleanListADB2 n true (false::r::s::(w++[t,true]))=
   runBooleanGaugeADB2 n true false::runBooleanListADB2 n false (r::s::(w++[t,true])) by rfl]
 rw [cyclic_four_append01F _ _ hshape]
 have ht : (runBooleanGaugeADB2 n true false::runBooleanListADB2 n false (r::s::(w++[t,true]))).take 3=
   [runBooleanGaugeADB2 n true false,runBooleanGaugeADB2 n false r,
     runBooleanGaugeADB2 n r s] := by rfl
 rw [ht]
 have he := run_gauges_closeBE n true r s (false::r::s::(w++[t]))
 simp only [List.cons_append,List.append_assoc,List.singleton_append,List.nil_append] at he
 change openFour01F (runBooleanListADB2 n true (false::r::s::(w++[t,true]))++
   [runBooleanGaugeADB2 n true false,runBooleanGaugeADB2 n false r,
     runBooleanGaugeADB2 n r s])-
   openFour01F [runBooleanGaugeADB2 n true false,runBooleanGaugeADB2 n false r,
     runBooleanGaugeADB2 n r s]=_
 rw [←he,openFour_runBE]
 have hend : endFour897 true false r s (w++[t,true,false,r,s])=(true,false,r,s) := by
   simpa only [List.append_assoc,List.singleton_append,List.nil_append] using
     endFour_append897 true false r s true false r s (w++[t])
 rw [hend]
 simp only [runFourTailBE,fourScan897]
 ring

theorem source_fourth_run_momentBE (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 logFour01F (tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest))))=
 fourMomentBE (runLocalFourBE n) (frame rest).mid.b (frame rest).mid.a := by
 have hl := (source_word_counts28 rest).2
 rw [sourceWord_central28] at hl
 have hcl : 3≤(central28 rest).length := by
   simp only [List.length_cons,List.length_append,List.length_singleton,List.length_nil] at hl
   omega
 obtain ⟨r,rs,hr⟩ := List.exists_cons_of_length_pos (by omega : 0<(central28 rest).length)
 have hrs : 2≤rs.length := by rw [hr] at hcl; simp only [List.length_cons] at hcl; omega
 obtain ⟨s,ss,hs⟩ := List.exists_cons_of_length_pos (by omega : 0<rs.length)
 have hss : 0<ss.length := by rw [hs] at hrs; simp only [List.length_cons] at hrs; omega
 obtain hnil|⟨w,t,ht⟩ := List.eq_nil_or_concat ss
 · simp [hnil] at hss
 have hcentral : central28 rest=r::s::(w++[t]) := by simpa [hs,ht,List.concat_eq_append] using hr
 have hw : sourceWord28 rest=false::r::s::(w++[t,true]) := by
   rw [sourceWord_central28,hcentral]; simp [List.append_assoc]
 rw [source_fourth_trace01F,source_fourth_trace_long01F n rest hc]
 have hshape := runBoolean_source_shapeADB2 n rest
 rw [hw] at hshape ⊢
 rw [cyclicFour_runBE n r s t w hshape]
 exact source_four_rotatedBE _ r s t w rest hw

def fourthExplicitRunBE (n c r : ℕ) : ℤ[X] :=
 let F := firstRunPolyADB2 n c r
 let S := secondCompressed446 n c r
 let T := correctedThirdRun8BBB n c r
 fourMomentBE (runLocalFourBE n) c r+6*(1+X)^4+4*F*T+3*S^2-12*F^2*S+6*F^4

theorem source_fourth_explicitBE (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 fourthExplicitRunBE n (frame rest).mid.b (frame rest).mid.a := by
 rw [source_fourth_run_poly01F]
 unfold fourthRunPoly01F fourthExplicitRunBE
 dsimp only
 rw [←source_fourth_trace01F,source_fourth_run_momentBE n rest hc]

theorem source_fourth_explicit_rawBE (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 (fourthExplicitRunBE n (frame rest).mid.b (frame rest).mid.a).coeff j := by
 rw [source_cut_coeffA27 _ i j 4 hs]
 have h := congrArg (fun p : ℤ[X] => p.coeff j) (source_fourth_explicitBE n rest hc)
 simpa only [Polynomial.coeff_ofNat_mul] using h

end
end MathGKM.Markov
