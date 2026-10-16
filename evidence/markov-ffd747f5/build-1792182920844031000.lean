import MarkovRowBinomialMFFD
import MarkovRowOperatorsMFFD
/-! Machine-authored ffd747f5. Uniform polynomial lower-row representation.
The signed recurrence does not assert positivity or log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def rowHMFFD (n : ℕ) : ℕ → Polynomial ℤ
 | 0 => rowJMFFD n 0
 | 1 => rowJMFFD n 1+2*(X+1)*rowJMFFD n 0+2*(1-X)*rowHMFFD n 0
 | j+2 => rowJMFFD n (j+2)+2*(X+1)*rowJMFFD n (j+1)+(X+1)^2*rowJMFFD n j+
   2*(1-X)*rowHMFFD n (j+1)-(X+1)^2*rowHMFFD n j

def deltaRowMFFD (n j : ℕ) : Polynomial ℤ := X^3*((X+1)^(n-2*j-1)*rowJMFFD n j)
def lowerRowMFFD (n j : ℕ) : Polynomial ℤ := X^3*((X+1)^(n-2*j-1)*rowHMFFD n j)

theorem lower_row_equationMFFD (n j : ℕ) (hn : 2*j+1 ≤ n) :
 rowDiscMFFD (lowerRowMFFD n) j=rowSMFFD (rowSMFFD (deltaRowMFFD n)) j := by
 rcases j with _|_|j
 · rw [row_disc_zeroMFFD,row_S_twice_zeroMFFD]
   rfl
 · rw [row_disc_oneMFFD,row_S_twice_oneMFFD]
   simp only [lowerRowMFFD,deltaRowMFFD,rowHMFFD]
   have he : n-2*0-1=(n-2*1-1)+2 := by omega
   rw [he,pow_add]
   ring
 · rw [row_disc_succMFFD,row_S_twice_succMFFD]
   simp only [lowerRowMFFD,deltaRowMFFD]
   have he : n-2*(j+1)-1=(n-2*(j+2)-1)+2 := by omega
   have hf : n-2*j-1=(n-2*(j+2)-1)+4 := by omega
   rw [he,hf,rowHMFFD]
   simp only [pow_add]
   ring

theorem lower_row_raw_equationMFFD (n q : ℕ) (hn : 2*q+1 ≤ n) :
 ∀ i j, j ≤ q → discriminantActionM96A (rowCoeffsMFFD (lowerRowMFFD n)) i j=
 lowerForceME9C n i j := by
 intro i j hj
 have hd : ∀ a b, b ≤ q → rowCoeffsMFFD (deltaRowMFFD n) a b=fibDeltaME9C n a b := by
   intro a b hb
   exact delta_row_coeffMFFD n b a (by omega)
 have hS := raw_S_localMFFD q _ _ (raw_S_localMFFD q _ _ hd) i j hj
 rw [←row_disc_coeffMFFD,lower_row_equationMFFD n j (by omega),row_S_twice_coeffMFFD]
 exact hS

theorem lower_row_formulaMFFD (n q : ℕ) (hn : 2*q+1 ≤ n) :
 ∀ i j, j ≤ q → (lowerRowMFFD n j).coeff i=lowerRawME9C n i j := by
 apply disc_lower_uniqueME9C q
 intro i j hj
 change discriminantActionM96A (rowCoeffsMFFD (lowerRowMFFD n)) i j=_
 rw [lower_row_raw_equationMFFD n q hn i j hj,lower_raw_equationME9C]

theorem source_lower_rowMFFD (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j=(lowerRowMFFD (sourceNME9C q r) j).coeff i := by
 rw [lower_row_formulaMFFD (sourceNME9C q r) q ?_ i j hj,
   lower_region_formulaME9C q r i j hj]
 unfold sourceNME9C
 split_ifs <;> omega

theorem source_lower_row_pathMFFD (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ i j, j ≤ q → coeff (frame path).mid.p i j=
   (X^3*((X+1)^(sourceNME9C q r-2*j-1)*rowHMFFD (sourceNME9C q r) j)).coeff i := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 exact ⟨q,r,hq,hb,fun i j hj => (hp i j).trans (source_lower_rowMFFD q i j r hj)⟩

end
end MathGKM.Markov
