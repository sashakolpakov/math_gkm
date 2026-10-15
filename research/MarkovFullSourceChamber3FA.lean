import MarkovFullSourceFA
import MarkovFullChamber3FA
/-! Machine-authored fa9eb434. Exact chamber/source identity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
open Polynomial
theorem fourthNumerator_chamber3FA {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hl : 1*c<2*r) (hu : 3*r<2*c) :
 fourthNumeratorBC N Z x c r=chamberNumerator3FA N Z c r x := by
 have hi0 : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have h0 : ((2*r-c:ℕ):A)=2*(r:A)-(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi0
 have hi1 : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have h1 : ((min (c-r) (3*r-c):ℕ):A)=(c:A)-(r:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi1
 have hi2 : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 have h2 : ((3*r-2*c:ℕ):A)=0 := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi2
 have hi3 : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have h3 : ((2*r-c:ℕ):A)=2*(r:A)-(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi3
 have hc : fourthCountCorrectionFA x c r=2*(2*(r:A)-(c:A))*x^6 := by
   unfold fourthCountCorrectionFA
   rw [if_neg (by omega : ¬2*r≤c),if_pos (by omega : 3*r≤2*c),h3]
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA chamberNumerator3FA
 dsimp only
 rw [h0,h1,h2,hc,chamberH32FA_eq,chamberH33FA_eq,chamberH34FA_eq]
 try rfl

theorem source_fourth_chamber3_clearedFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 chamberNumerator3FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X := by
 rw [source_fourth_clearedBC n rest hc,fourthNumerator_chamber3FA _ _ _ _ _ hl hu]

theorem source_fourth_chamber3_coeffFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (chamberNumerator3FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X).coeff k *
   ((7+(j-k)).choose 7 : ℤ) := by
 rw [source_fourth_binomialBC n rest hc i j hs,fourthNumerator_chamber3FA _ _ _ _ _ hl hu]
end
end MathGKM.Markov
