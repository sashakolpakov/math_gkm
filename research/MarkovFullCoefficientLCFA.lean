import MarkovFullSourceFA
/-! Machine-authored fa9eb434. Exact raw inequality transport, retaining zeros.
The explicit binomial inequality is not asserted universally. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def fullFourthValueFA (n c r j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (j+1),
   (fullNumeratorFA (n:ℤ[X]) (X^n) X c r).coeff k *
   ((7+(j-k)).choose 7 : ℤ)

theorem fullFourthValue_sourceFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 fullFourthValueFA n (frame rest).mid.b (frame rest).mid.a j=
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j := by
 exact (source_fourth_full_coeffFA n rest hc i j hs).symm

attribute [local irreducible] fullFourthValueFA coeff frame

theorem source_fourth_full_lc_iffFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 (coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
  coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
  coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2) ↔
 (fullFourthValueFA n (frame rest).mid.b (frame rest).mid.a j*
  fullFourthValueFA n (frame rest).mid.b (frame rest).mid.a (j+2)≤
  fullFourthValueFA n (frame rest).mid.b (frame rest).mid.a (j+1)^2) := by
 rw [fullFourthValue_sourceFA n rest hc (i+2) j (by omega),
   fullFourthValue_sourceFA n rest hc i (j+2) (by omega),
   fullFourthValue_sourceFA n rest hc (i+1) (j+1) (by omega)]
 constructor <;> intro h <;> nlinarith only [h]
end
end MathGKM.Markov
