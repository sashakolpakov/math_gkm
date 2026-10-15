import MarkovFullSourceFA
import MarkovFullChamber5FA
/-! Machine-authored fa9eb434. Exact chamber/source identity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
open Polynomial
theorem fourthNumerator_chamber5FA {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hl : 3*c<4*r) (hu : 1*r<1*c) :
 fourthNumeratorBC N Z x c r=chamberNumerator5FA N Z c r x := by
 have hi0 : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have h0 : ((2*r-c:ℕ):A)=2*(r:A)-(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi0
 have hi1 : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have h1 : ((min (c-r) (3*r-c):ℕ):A)=(c:A)-(r:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi1
 have hi2 : ((3*r-2*c:ℕ):ℤ)=3*(r:ℤ)-2*(c:ℤ) := by omega
 have h2 : ((3*r-2*c:ℕ):A)=3*(r:A)-2*(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi2
 have hi3 : ((c-r:ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have h3 : ((c-r:ℕ):A)=(c:A)-(r:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi3
 have hi4 : ((4*r-3*c:ℕ):ℤ)=4*(r:ℤ)-3*(c:ℤ) := by omega
 have h4 : ((4*r-3*c:ℕ):A)=4*(r:A)-3*(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi4
 have hc : fourthCountCorrectionFA x c r=2*((c:A)-(r:A))*x^6+(4*(r:A)-3*(c:A))*x^7 := by
   unfold fourthCountCorrectionFA
   rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_neg (by omega : ¬4*r≤3*c),h3,h4]
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA chamberNumerator5FA
 dsimp only
 rw [h0,h1,h2,hc,chamberH52FA_eq,chamberH53FA_eq,chamberH54FA_eq]
 try rfl

theorem source_fourth_chamber5_clearedFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 chamberNumerator5FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X := by
 rw [source_fourth_clearedBC n rest hc,fourthNumerator_chamber5FA _ _ _ _ _ hl hu]

theorem source_fourth_chamber5_coeffFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (chamberNumerator5FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X).coeff k *
   ((7+(j-k)).choose 7 : ℤ) := by
 rw [source_fourth_binomialBC n rest hc i j hs,fourthNumerator_chamber5FA _ _ _ _ _ hl hu]
end
end MathGKM.Markov
