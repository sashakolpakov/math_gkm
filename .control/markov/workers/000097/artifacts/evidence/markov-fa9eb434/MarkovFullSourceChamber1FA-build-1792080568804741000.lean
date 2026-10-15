import MarkovFullSourceFA
import MarkovFullChamber1FA
/-! Machine-authored fa9eb434. Exact chamber/source identity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
open Polynomial
theorem fourthNumerator_chamber1FA {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hl : 1*c<4*r) (hu : 3*r<1*c) :
 fourthNumeratorBC N Z x c r=chamberNumerator1FA N Z c r x := by
 have hi0 : ((2*r-c:ℕ):ℤ)=0 := by omega
 have h0 : ((2*r-c:ℕ):A)=0 := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (Int.castRingHom A) hi0
 have hi1 : ((min (c-r) (3*r-c):ℕ):ℤ)=0 := by omega
 have h1 : ((min (c-r) (3*r-c):ℕ):A)=0 := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (Int.castRingHom A) hi1
 have hi2 : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 have h2 : ((3*r-2*c:ℕ):A)=0 := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (Int.castRingHom A) hi2
 have hi3 : ((min (c-2*r) (4*r-c):ℕ):ℤ)=4*(r:ℤ)-(c:ℤ) := by omega
 have h3 : ((min (c-2*r) (4*r-c):ℕ):A)=4*(r:A)-(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (Int.castRingHom A) hi3
 have hc : fourthCountCorrectionFA x c r=(4*(r:A)-(c:A))*x^5 := by
   unfold fourthCountCorrectionFA
   rw [if_pos (by omega : 2*r≤c),h3]
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA chamberNumerator1FA
 dsimp only
 rw [h0,h1,h2,hc,chamberH12FA_eq,chamberH13FA_eq,chamberH14FA_eq]
 rfl

theorem source_fourth_chamber1_clearedFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 chamberNumerator1FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X := by
 rw [source_fourth_clearedBC n rest hc,fourthNumerator_chamber1FA _ _ _ _ _ hl hu]

theorem source_fourth_chamber1_coeffFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (chamberNumerator1FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X).coeff k *
   ((7+(j-k)).choose 7 : ℤ) := by
 rw [source_fourth_binomialBC n rest hc i j hs,fourthNumerator_chamber1FA _ _ _ _ _ hl hu]
end
end MathGKM.Markov
