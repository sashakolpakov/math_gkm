import MarkovThirdRunPolynomialADB2
import MarkovSmallMomentsADB2
/-! Machine-authored request adb2c7b0. Exact source correction for three
run blocks, valid for every run length n. No LC claim is made here. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem runBoolean_a1ADB2 (n : ℕ) (p q : Bool) :
 (runBooleanGaugeADB2 n p q).a.coeff 1=X^(n+(if q then 1 else 0)+1) := by
 have ha := (lowerMatrix_jets487 (n+if q then 1 else 0)).2.2.2.2.2.1
 have hb := (lowerMatrix_jets487 (n+if q then 1 else 0)).2.2.2.2.1
 simp [runBooleanGaugeADB2,gauge75,shear75,unshear75,mm16,
   Polynomial.coeff_add,Polynomial.coeff_neg,Polynomial.coeff_mul_C,ha,hb]

theorem source_third_run_poly_threeADB2 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) :
 let path := List.replicate n true++false::rest
 6*cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 3=
 thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a+
 6*X^((frame path).mid.b) := by
 dsimp only
 have hl := (source_word_counts28 rest).2
 rw [sourceWord_central28,hc] at hl
 have hlen : (central28 rest).length=1 := by simpa using hl
 obtain ⟨z,zs,hz⟩ := List.exists_cons_of_length_pos (by omega : 0<(central28 rest).length)
 have hzs : zs=[] := by
   rw [hz] at hlen
   simpa using hlen
 subst zs
 let m := runBooleanGaugeADB2 n true false
 let k := runBooleanGaugeADB2 n false z
 let p := runBooleanGaugeADB2 n z true
 have hproj (a b : Bool) : Projection6905 (runBooleanGaugeADB2 n a b) :=
   run_gauge_constant75 _ _
 have h3 := projection_three_momentADB2 m k p (hproj _ _) (hproj _ _) (hproj _ _)
   (runBoolean_b1ADB2 n _ _) (runBoolean_b1ADB2 n _ _) (runBoolean_b1ADB2 n _ _)
 have htrace := runBoolean_source_traceADB2 n rest
 rw [sourceWord_central28,hz] at htrace
 simp only [List.cons_append,List.nil_append,runBooleanListADB2,projProduct6905,
   mm_one_right774] at htrace
 change tr16 (mm16 m (mm16 k p))=_ at htrace
 dsimp only at h3
 rw [htrace] at h3
 have hL := source_tripleScanADB2 (runLocalLADB2 n) rest
 rw [hz] at hL
 change edgeLADB2 m k+(edgeLADB2 k p+(edgeLADB2 p m+0))=sourceRunLADB2 n rest at hL
 have ha := (source_word_counts28 rest).1
 rw [sourceWord_central28,hz] at ha
 have hb := (source_run_indicesBF n rest).2
 have hprod : m.a.coeff 1*k.a.coeff 1*p.a.coeff 1=
     (X:ℤ[X])^((frame (List.replicate n true++false::rest)).mid.b) := by
   simp only [m,k,p,runBoolean_a1ADB2]
   rw [hb,hc]
   cases z <;> simp at ha ⊢ <;> rw [←ha] <;>
     simp only [←pow_add] <;> congr 1 <;> omega
 have htrace3 :
   6*(tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest)))).coeff 3=
   6*(tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest)))).coeff 1*
     (tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest)))).coeff 2-
   2*((tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest)))).coeff 1)^3+
   sourceRunLADB2 n rest+6*X^((frame (List.replicate n true++false::rest)).mid.b) := by
   linear_combination h3+hL+6*hprod
 let path := List.replicate n true++false::rest
 have ht1 := source_first_cut_trace487 path
 have ht2 := source_cut_trace75 path 1
 have ht3 := source_cut_trace75 path 2
 rw [ht1,ht2,ht3] at htrace3
 have hs := source_second_sliceBF path (sourceRunsBF n rest)
   (source_runs_exactBF n rest) (source_runs_lengthBF n rest)
 have h2 := source_second_compressed446 n rest
 rw [←hs] at h2
 rw [source_first_run_polyADB2] at htrace3
 unfold thirdRunPolyADB2 sourceRunLADB2 at *
 linear_combination htrace3+3*firstRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a*h2

#print axioms source_third_run_poly_threeADB2
end
end MathGKM.Markov
