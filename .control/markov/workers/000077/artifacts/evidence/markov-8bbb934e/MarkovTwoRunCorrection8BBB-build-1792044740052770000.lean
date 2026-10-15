import MarkovThreeRunCorrectionADB2
/-! Machine-authored request 8bbb934e. Universal two-block correction.
All coefficients remain raw; no log-concavity assertion is made here. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem gauge_det8BBB {R : Type*} [CommRing R] (a b : R) (m : Mat16 R) :
 det16 (gauge75 a b m)=det16 m := by
 simp [gauge75,det16,mm16,shear75,unshear75]; ring

theorem lowerMatrix_det8BBB (n : ℕ) :
 det16 (lowerMatrix487 n)=U*V^(n+1) := by
 induction n with
 | zero => simp [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,det16]; ring
 | succ n ih =>
   rw [lowerMatrix_step487,det_mul16,ih]
   have ht : det16 (ambientT5c U V true)=V := by simp [ambientT5c,det16]; ring
   rw [ht,pow_succ]; ring

theorem runBoolean_det8BBB (n : ℕ) (p q : Bool) :
 det16 (runBooleanGaugeADB2 n p q)=U*V^(n+(if q then 1 else 0)+1) := by
 rw [runBooleanGaugeADB2,gauge_det8BBB,lowerMatrix_det8BBB]

theorem projection_det_jet8BBB {R : Type*} [CommRing R] (m : Mat16 R[X])
 (hm : Projection6905 m) (hb : m.b.coeff 1=1) (hd : (det16 m).coeff 2=0) :
 m.a.coeff 2-m.c.coeff 1= -m.a.coeff 1*m.d.coeff 1 := by
 obtain ⟨ha,hb0,hc,hd0⟩ := hm
 simp only [det16,Polynomial.coeff_sub,coeff_mul_two8934,ha,hb0,hc,hd0,hb,
   zero_mul,mul_zero,one_mul,mul_one,zero_add,add_zero] at hd
 linear_combination hd

theorem runBoolean_det_jet8BBB (n : ℕ) (p q : Bool) :
 (runBooleanGaugeADB2 n p q).a.coeff 2-(runBooleanGaugeADB2 n p q).c.coeff 1=
 -(runBooleanGaugeADB2 n p q).a.coeff 1*(runBooleanGaugeADB2 n p q).d.coeff 1 := by
 apply projection_det_jet8BBB _ (run_gauge_constant75 _ _) (runBoolean_b1ADB2 _ _ _)
 rw [gauge_det8BBB,lowerMatrix_det8BBB]
 simp [U,V,←Polynomial.map_pow,Polynomial.coeff_X_mul]

theorem source_third_run_poly_two8BBB (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=2) :
 let path := List.replicate n true++false::rest
 6*cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 3=
 thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a-
 12*X^((frame path).mid.b)*(firstRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a+1+X) := by
 dsimp only
 have hl := (source_word_counts28 rest).2
 rw [sourceWord_central28,hc] at hl
 have hz : central28 rest=[] := by simpa using hl
 have ha := (source_word_counts28 rest).1
 rw [sourceWord_central28,hz] at ha
 have hr : (frame rest).mid.a=1 := by simpa using ha.symm
 let m := runBooleanGaugeADB2 n true false
 let k := runBooleanGaugeADB2 n false true
 have hm : Projection6905 m := run_gauge_constant75 _ _
 have hk : Projection6905 k := run_gauge_constant75 _ _
 have h3 := projection_two_momentADB2 m k hm hk
   (runBoolean_b1ADB2 n _ _) (runBoolean_b1ADB2 n _ _)
 have hj := projection_mul_jets6905 m k hm hk
 have hD : (tr16 (mm16 m k)).coeff 1=m.d.coeff 1+k.d.coeff 1 := by
   simp only [tr16,Polynomial.coeff_add,hj.a1,hj.d1,zero_add]
 have hd1 := runBoolean_det_jet8BBB n true false
 have hd2 := runBoolean_det_jet8BBB n false true
 change m.a.coeff 2-m.c.coeff 1= -m.a.coeff 1*m.d.coeff 1 at hd1
 change k.a.coeff 2-k.c.coeff 1= -k.a.coeff 1*k.d.coeff 1 at hd2
 have hb := (source_run_indicesBF n rest).2
 have hprod : m.a.coeff 1*k.a.coeff 1=
     (X:ℤ[X])^((frame (List.replicate n true++false::rest)).mid.b) := by
   simp only [m,k,runBoolean_a1ADB2,Bool.false_eq_true,if_true,if_false,Nat.add_zero]
   rw [hb,hc,hr,←pow_add]
   congr 1; omega
 have htrace := runBoolean_source_traceADB2 n rest
 rw [sourceWord_central28,hz] at htrace
 simp only [List.cons_append,List.nil_append,runBooleanListADB2,projProduct6905,
   mm_one_right774] at htrace
 change tr16 (mm16 m k)=_ at htrace
 have hL := source_tripleScanADB2 (runLocalLADB2 n) rest
 rw [hz] at hL
 change edgeLADB2 m k+(edgeLADB2 k m+0)=sourceRunLADB2 n rest at hL
 dsimp only at h3
 have he : 6*(tr16 (mm16 m k)).coeff 3=
     6*(tr16 (mm16 m k)).coeff 1*(tr16 (mm16 m k)).coeff 2-
     2*((tr16 (mm16 m k)).coeff 1)^3+sourceRunLADB2 n rest-
     12*X^((frame (List.replicate n true++false::rest)).mid.b)*(tr16 (mm16 m k)).coeff 1 := by
   rw [←hprod]
   linear_combination h3+hL+6*m.a.coeff 1*hd2+6*k.a.coeff 1*hd1+
     6*m.a.coeff 1*k.a.coeff 1*hD
 rw [htrace] at he
 let path := List.replicate n true++false::rest
 have ht1 := source_first_cut_trace487 path
 have ht2 := source_cut_trace75 path 1
 have ht3 := source_cut_trace75 path 2
 rw [ht1,ht2,ht3] at he
 have hs := source_second_sliceBF path (sourceRunsBF n rest)
   (source_runs_exactBF n rest) (source_runs_lengthBF n rest)
 have h2 := source_second_compressed446 n rest
 rw [←hs] at h2
 rw [source_first_run_polyADB2] at he
 unfold thirdRunPolyADB2 sourceRunLADB2 at *
 linear_combination he+3*firstRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a*h2

#print axioms source_third_run_poly_two8BBB
end
end MathGKM.Markov
