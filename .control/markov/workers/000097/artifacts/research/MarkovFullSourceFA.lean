import MarkovFullSplitFirstFA
import MarkovFullSplitSecondFA
import MarkovFullSplitThirdFA
import MarkovFullSplitMomentFA
import MarkovFullCoeff0FinalFA
import MarkovFullCoeff1FinalFA
import MarkovFullCoeff2FA
import MarkovFullCoeff3FA
import MarkovFullCoeff4FA
import MarkovFullFourQuad1001FA
import MarkovFullFourQuad1101FA
import MarkovFullFourQuad1011FA
import MarkovFullFourQuad1111FA
/-! Machine-authored fa9eb434. Complete shift expansion of the normalized
fourth source numerator. No log-concavity or root closure is asserted. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
open Polynomial

def fourthCountCorrectionFA {A : Type*} [CommRing A] (x : A) (c r : ℕ) : A :=
 if 2*r≤c then ((min (c-2*r) (4*r-c):ℕ):A)*x^5
 else if 3*r≤2*c then 2*((2*r-c:ℕ):A)*x^6
 else if 4*r≤3*c then 2*((c-r:ℕ):A)*x^6
 else 2*((c-r:ℕ):A)*x^6+((4*r-3*c:ℕ):A)*x^7

theorem fullMomentFA {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) :
 fourMomentBE (localFourNumBC N Z x) c r=
 fullFourBaseFA N Z c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) x+
 Z^4*96*(1-x)^8*fourthCountCorrectionFA x c r := by
 unfold fourMomentBE
 rw [fullFourBaseFA_eq]
 unfold fourSourceMoment897 fourthCountCorrectionFA
 split_ifs <;>
 simp only [fullFourQuad1001FA_eq,fullFourQuad1101FA_eq,fullFourQuad1011FA_eq,
   fullFourQuad1111FA_eq] <;>
 simp only [fullFourQuad1001FA,fullFourQuad1101FA,fullFourQuad1011FA,
   fullFourQuad1111FA] <;> ring

def fullNumeratorFA {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) : A :=
 let q : A := (2*r-c:ℕ)
 let t : A := (min (c-r) (3*r-c):ℕ)
 let u : A := (3*r-2*c:ℕ)
 fullH0FA N c r q t u x+Z*fullH1FA N c r q t u x+
 Z^2*fullH2FA N c r q t u x+Z^3*fullH3FA N c r q t u x+
 Z^4*(fullH4FA N c r q t u x+96*(1-x)^8*fourthCountCorrectionFA x c r)

theorem fourthNumerator_fullFA {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) :
 fourthNumeratorBC N Z x c r=fullNumeratorFA N Z x c r := by
 unfold fourthNumeratorBC fullNumeratorFA
 dsimp only
 rw [fullMomentFA,fullThirdMomentFA_eq]
 simp only [fullSplitFirstFA N Z (c:A) (r:A) ((2*r-c:ℕ):A)
   ((min (c-r) (3*r-c):ℕ):A) ((3*r-2*c:ℕ):A) x,
   fullSplitSecondFA N Z (c:A) (r:A) ((2*r-c:ℕ):A)
   ((min (c-r) (3*r-c):ℕ):A) ((3*r-2*c:ℕ):A) x,
   fullSplitThirdFA,fullSplitMomentFA]
 rw [←fullH0FA_eq,←fullH1FA_eq,←fullH2FA_eq,←fullH3FA_eq,←fullH4FA_eq]
 ring

theorem source_fourth_full_clearedFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 fullNumeratorFA (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a := by
 rw [source_fourth_clearedBC n rest hc,fourthNumerator_fullFA]

theorem source_fourth_full_coeffFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (fullNumeratorFA (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a).coeff k *
   ((7+(j-k)).choose 7 : ℤ) := by
 rw [source_fourth_binomialBC n rest hc i j hs,fourthNumerator_fullFA]
end
end MathGKM.Markov
