import MarkovFourthRunMomentBE
/-! Machine-authored be5676f9. A parameter-only fourth slice for every mixed
source, including all short cycles. Small traces are evaluated exactly. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def shortSourceWordBE (c r : ℕ) : List Bool :=
 List.replicate (c-r) false++List.replicate r true

theorem source_short_wordBE (rest : List Bool) (hc : (frame rest).mid.b≤4) :
 sourceWord28 rest=shortSourceWordBE (frame rest).mid.b (frame rest).mid.a := by
 obtain ⟨hn,hl⟩ := source_word_counts28 rest
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 rw [sourceWord_central28] at hn hl ⊢
 have hlen : (central28 rest).length≤2 := by simp only [List.length_cons,List.length_append,List.length_singleton] at hl; omega
 cases he : central28 rest with
 | nil =>
   simp only [he,List.cons_append,List.nil_append,List.length_cons,List.length_nil] at hn hl ⊢
   have ha : (frame rest).mid.a=1 := by simpa using hn.symm
   have hb : (frame rest).mid.b=2 := by omega
   rw [ha,hb]; rfl
 | cons p ps =>
   cases hp : ps with
   | nil =>
     rw [hp] at he
     rw [he] at hn hl
     have hb : (frame rest).mid.b=3 := by simpa using hl.symm
     cases p <;> norm_num at hn <;> rw [hp,hb,←hn] <;> rfl
   | cons q qs =>
     have hqs : qs=[] := by rw [he,hp] at hlen; simpa using hlen
     rw [hp,hqs] at he
     rw [he] at hn hl
     have hb : (frame rest).mid.b=4 := by simpa using hl.symm
     cases p <;> cases q <;> norm_num at hn <;> rw [hb,←hn] at hcop ⊢
     all_goals first | norm_num at hcop | (rw [hp,hqs]; rfl)

def fourthParamTraceBE (n c r : ℕ) : ℤ[X] :=
 if c≤4 then logFour01F (tr16 (projProduct6905
   (runBooleanListADB2 n true (shortSourceWordBE c r))))
 else fourMomentBE (runLocalFourBE n) c r

theorem source_fourth_parameter_traceBE (n : ℕ) (rest : List Bool) :
 logFour01F (tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest))))=
 fourthParamTraceBE n (frame rest).mid.b (frame rest).mid.a := by
 unfold fourthParamTraceBE
 split_ifs with hc
 · rw [←runBoolean_source_traceADB2,source_short_wordBE rest hc]
 · exact source_fourth_run_momentBE n rest (by omega)

def fourthParamPolyBE (n c r : ℕ) : ℤ[X] :=
 let F := firstRunPolyADB2 n c r
 let S := secondCompressed446 n c r
 let T := correctedThirdRun8BBB n c r
 fourthParamTraceBE n c r+6*(1+X)^4+4*F*T+3*S^2-12*F^2*S+6*F^4

theorem source_fourth_parameter_polyBE (n : ℕ) (rest : List Bool) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 fourthParamPolyBE n (frame rest).mid.b (frame rest).mid.a := by
 rw [source_fourth_run_poly01F]
 unfold fourthRunPoly01F fourthParamPolyBE
 dsimp only
 rw [←source_fourth_trace01F,source_fourth_parameter_traceBE]

theorem source_fourth_parameter_rawBE (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 (fourthParamPolyBE n (frame rest).mid.b (frame rest).mid.a).coeff j := by
 rw [source_cut_coeffA27 _ i j 4 hs]
 have h := congrArg (fun p : ℤ[X] => p.coeff j) (source_fourth_parameter_polyBE n rest)
 simpa only [Polynomial.coeff_ofNat_mul] using h

end
end MathGKM.Markov
