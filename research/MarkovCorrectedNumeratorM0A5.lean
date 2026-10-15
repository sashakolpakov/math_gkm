import MarkovAllCycleValueM0A5
/-! Machine-authored 0a5fcabe. Universal denominator-cleared corrected numerator. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff firstNumBC secondNumBC fourthNumeratorBC
  firstRunPolyADB2 plainSecondM0A5 plainFourthM0A5

theorem first_poly_clearedM0A5 (n c r : ℕ) :
 (1-X)^2*firstRunPolyADB2 n c r=
 firstNumBC (n:ℤ[X]) (X^n) c r (2*r-c:ℕ) X := by
 apply run_embed_injectiveBDEE
 rw [map_mul,map_pow,map_sub,map_one,map_firstBDEE]
 have h := first_normalizeM0A5 n c r
 simpa only [firstNumBC,map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_one,
   map_neg,runXBDEE] using h

theorem second_poly_clearedM0A5 (n c r : ℕ) :
 (1-X)^4*plainSecondM0A5 n c r=
 secondNumBC (n:ℤ[X]) (X^n) c r (2*r-c:ℕ) X := by
 apply run_embed_injectiveBDEE
 rw [map_mul,map_pow,map_sub,map_one,map_plain_secondM0A5]
 have h := second_normalize_allM0A5 n c r
 simpa only [secondNumBC,map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_one,
   map_neg,runXBDEE] using h

def cycleNumeratorCorrectionM0A5 (n c r : ℕ) : ℤ[X] :=
 let F := firstNumBC (n:ℤ[X]) (X^n) c r (2*r-c:ℕ) X
 let S := secondNumBC (n:ℤ[X]) (X^n) c r (2*r-c:ℕ) X
 let E := X^(c*(n+1)+r)
 if c=2 then 12*E*(1-X)^4*
   (2*F^2+4*F*(1+X)*(1-X)^2+6*(1+X)^2*(1-X)^4-S)
 else if c=3 then -24*E*(1-X)^6*(F+2*(1+X)*(1-X)^2)
 else if c=4 then 24*E*(1-X)^8 else 0

theorem cycle_correction_clearedM0A5 (n c r : ℕ) :
 (1-X)^8*smallCycleCorrectionM0A5 n c r=cycleNumeratorCorrectionM0A5 n c r := by
 have hf := first_poly_clearedM0A5 n c r
 have hs := second_poly_clearedM0A5 n c r
 unfold smallCycleCorrectionM0A5 cycleNumeratorCorrectionM0A5
 dsimp only
 split_ifs
 · rw [←hf,←hs]
   ring
 · rw [←hf]
   ring
 · ring
 · ring

def correctedFourthNumeratorM0A5 (n c r : ℕ) : ℤ[X] :=
 fourthNumeratorBC (n:ℤ[X]) (X^n) X c r+cycleNumeratorCorrectionM0A5 n c r

theorem source_corrected_numeratorM0A5 (n : ℕ) (rest : List Bool) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 correctedFourthNumeratorM0A5 n (frame rest).mid.b (frame rest).mid.a := by
 rw [source_plain_allM0A5,mul_add,plain_fourth_clearedM0A5,cycle_correction_clearedM0A5]
 rfl

theorem source_corrected_binomialM0A5 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (correctedFourthNumeratorM0A5 n (frame rest).mid.b (frame rest).mid.a).coeff k*
   ((7+(j-k)).choose 7:ℤ) := by
 have h := coeff_of_one_sub_mul_rangeBC
   (24*cutCoeffA27 (X:ℤ[X]) X 1
     (central28 (List.replicate n true++false::rest)++[true]) 4)
   (correctedFourthNumeratorM0A5 n (frame rest).mid.b (frame rest).mid.a)
   7 j (source_corrected_numeratorM0A5 n rest)
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] using h
end
end MathGKM.Markov
