import MarkovThreeCycleM0A5
/-! Machine-authored 0a5fcabe. Two-cycle fourth cumulant correction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
attribute [local irreducible] runBooleanGaugeADB2 frame coeff

theorem four_moment_21M0A5 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) :
 fourMomentBE f 2 1=f true false true false+f false true false true := by
 norm_num [fourMomentBE,boolMomentADB2,boolJetADB2,fourSourceMoment897,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 <;> ring

theorem cyclic_four_run_twoM0A5 (n : ℕ)
 (hs : ∀ z∈runBooleanListADB2 n true [false,true],Projection6905 z) :
 cyclicFour01F (runBooleanListADB2 n true [false,true])=
 fourMomentBE (runLocalFourBE n) 2 1-
 24*(runBooleanGaugeADB2 n false true).c.coeff 1*(X:ℤ[X])^(2*n+3) := by
 rw [show runBooleanListADB2 n true [false,true]=
   runBooleanGaugeADB2 n true false::runBooleanListADB2 n false [true] by rfl]
 rw [cyclic_four_local01F _ _ hs,four_moment_21M0A5]
 simp only [runBooleanListADB2,List.take,localFourScan01F,List.cons_append,List.nil_append,
   headRatioOne01F,headRatioTwo01F,headRatioThree01F,runBoolean_b1ADB2,runLocalFourBE,
   localFour01F]
 have hp : (runBooleanGaugeADB2 n true false).a.coeff 1*
   (runBooleanGaugeADB2 n false true).a.coeff 1=(X:ℤ[X])^(2*n+3) := by
   rw [runBoolean_a1ADB2,runBoolean_a1ADB2,←pow_add]
   congr 1
   simp only [Bool.false_eq_true,if_false,if_true]
   omega
 linear_combination -24*(runBooleanGaugeADB2 n false true).c.coeff 1*hp

theorem source_two_indicesM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=2) :
 (frame rest).mid.a=1 ∧ sourceWord28 rest=[false,true] ∧
 (frame (List.replicate n true++false::rest)).mid.b=2*n+3 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have ha : (frame rest).mid.a=1 := by omega
 have hw := source_short_wordBE rest (by omega)
 rw [hc,ha] at hw
 refine ⟨ha,hw,?_⟩
 rw [(source_run_indicesBF n rest).2,hc,ha]
 omega

theorem source_two_product_d2M0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=2) :
 2*(projProduct6905 (runBooleanListADB2 n true (sourceWord28 rest))).d.coeff 2+
 2*(runBooleanGaugeADB2 n false true).c.coeff 1=
 secondCompressed446 n 2 1+2*(1+X)*firstRunPolyADB2 n 2 1-
 2*(X:ℤ[X])^(2*n+3) := by
 obtain ⟨hr,hw,hb⟩ := source_two_indicesM0A5 n rest hc
 let m := runBooleanGaugeADB2 n true false
 let k := runBooleanGaugeADB2 n false true
 have hm : Projection6905 m := by unfold m runBooleanGaugeADB2; exact run_gauge_constant75 _ _
 have hk : Projection6905 k := by unfold k runBooleanGaugeADB2; exact run_gauge_constant75 _ _
 have hj := (projection_mul_jets6905 m k hm hk).a2
 have hp : m.a.coeff 1*k.a.coeff 1=(X:ℤ[X])^(2*n+3) := by
   simp only [m,k,runBoolean_a1ADB2,←pow_add]
   congr 1
   simp only [Bool.false_eq_true,if_false,if_true]
   omega
 have ht := source_cut_trace75 (List.replicate n true++false::rest) 1
 have hf := source_first_run_polyADB2 n rest
 have hS := source_second_compressed446 n rest
 have hcut := source_second_sliceBF (List.replicate n true++false::rest) (sourceRunsBF n rest)
   (source_runs_exactBF n rest) (source_runs_lengthBF n rest)
 rw [←hcut] at hS
 rw [hf,←runBoolean_source_traceADB2] at ht
 rw [hw] at ht ⊢
 simp only [runBooleanListADB2,projProduct6905,mm_one_right774] at ht ⊢
 change _=secondCompressed446 n 2 1+2*(1+X)*firstRunPolyADB2 n 2 1-2*X^(2*n+3)
 change (tr16 (mm16 m k)).coeff 2=_ at ht
 rw [hc,hr] at ht hS
 simp only [tr16,Polynomial.coeff_add] at ht
 have hm1 : m.b.coeff 1=1 := runBoolean_b1ADB2 n true false
 simp only [hm1,one_mul,hp] at hj
 linear_combination 2*ht+hS-2*hj

theorem source_fourth_correction_twoM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=2) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 fourthExplicitRunBE n 2 1+
 24*(3*(firstRunPolyADB2 n 2 1)^2+4*firstRunPolyADB2 n 2 1*(1+X)+
     3*(1+X)^2-secondCompressed446 n 2 1)*(X:ℤ[X])^(2*n+3)+
 36*((X:ℤ[X])^(2*n+3))^2 := by
 obtain ⟨hr,hw,hb⟩ := source_two_indicesM0A5 n rest hc
 have hs := runBoolean_source_shapeADB2 n rest
 rw [hw] at hs
 have h2 := source_two_product_d2M0A5 n rest hc
 rw [hw] at h2
 rw [source_fourth_run_poly01F]
 unfold fourthRunPoly01F fourthExplicitRunBE sourceFourthTrace01F
 dsimp only
 rw [source_run_product_d1M0A5,hc,hr,hb,hw,cyclic_four_run_twoM0A5 n hs]
 simp only [show ¬(2:ℕ)=3 by decide,show ¬(2:ℕ)=4 by decide,if_true,if_false,
   determinantFour01F,runBooleanListADB2,List.reverse_cons,List.reverse_nil,
   List.map_append,List.map_cons,List.map_nil,List.nil_append,List.cons_append,
   headRatioOne01F,transpose01F,runBoolean_b1ADB2]
 simp only [runBooleanListADB2] at h2
 linear_combination -24*(X:ℤ[X])^(2*n+3)*h2
end
end MathGKM.Markov
