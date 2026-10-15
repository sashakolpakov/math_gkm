import MarkovFourCycleM0A5
import MarkovFourthNormM0A5
import MarkovFullCoefficientLCM06
/-! Machine-authored 0a5fcabe. Corrected four-cycle binomial source adapter. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff fullNumeratorFA

theorem fourth_explicit_clearedM0A5 (n c r : ℕ) (hc : 4 ≤ c) :
 (1-X)^8*fourthExplicitRunBE n c r=
 fourthNumeratorBC (n:ℤ[X]) (X^n) X c r := by
 apply run_embed_injectiveBDEE
 rw [map_mul,map_pow,map_sub,map_one,map_fourthN6604]
 simpa only [fourthNumerator_mapBC,map_natCast,map_pow,runXBDEE] using
   fourth_normalizeM0A5 n c r hc

theorem source_fourth_four_clearedM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 fullNumeratorFA (n:ℤ[X]) (X^n) X 4 (frame rest).mid.a+
 (1-X)^8*(24*X^((frame (List.replicate n true++false::rest)).mid.b)) := by
 rw [source_fourth_correction_fourM0A5 n rest hc,mul_add,
   fourth_explicit_clearedM0A5 n 4 _ (by decide),fourthNumerator_fullFA]

theorem fourth_explicit_coeffM0A5 (n c r j : ℕ) (hc : 4 ≤ c) :
 (fourthExplicitRunBE n c r).coeff j=fullFourthValueM06 n c r j := by
 apply coeff_of_one_sub_mul_rangeBC (fourthExplicitRunBE n c r)
   (fullNumeratorFA (n:ℤ[X]) (X^n) X c r) 7 j
 rw [fourth_explicit_clearedM0A5 n c r hc,fourthNumerator_fullFA]

theorem source_fourth_four_valueM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 fullFourthValueM06 n 4 (frame rest).mid.a j+
 if (frame (List.replicate n true++false::rest)).mid.b=j then 24 else 0 := by
 rw [source_fourth_correction_four_rawM0A5 n rest hc i j hs,
   fourth_explicit_coeffM0A5 n 4 _ j (by decide)]

theorem source_fourth_four_value_belowM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j < (frame (List.replicate n true++false::rest)).mid.b) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 fullFourthValueM06 n 4 (frame rest).mid.a j := by
 rw [source_fourth_four_valueM0A5 n rest hc i j hs,if_neg (by omega),add_zero]
end
end MathGKM.Markov
