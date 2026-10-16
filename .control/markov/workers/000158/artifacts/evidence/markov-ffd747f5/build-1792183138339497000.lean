import MarkovRowRecurrenceMFFD
import MarkovBinomialTableM295
/-! Machine-authored ffd747f5. Exact rational form for the residual recurrence. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def rowJQMFFD (n : ℚ) (j : ℕ) : Polynomial ℚ :=
 ∑ s ∈ range (j+1), C (((j+3).choose (j-s):ℚ)*choosePolyM0D3 (n-j-1) s)*
   X^s*(X+1)^(j-s)

def rowHQMFFD (n : ℚ) : ℕ → Polynomial ℚ
 | 0 => rowJQMFFD n 0
 | 1 => rowJQMFFD n 1+2*(X+1)*rowJQMFFD n 0+2*(1-X)*rowHQMFFD n 0
 | j+2 => rowJQMFFD n (j+2)+2*(X+1)*rowJQMFFD n (j+1)+(X+1)^2*rowJQMFFD n j+
   2*(1-X)*rowHQMFFD n (j+1)-(X+1)^2*rowHQMFFD n j

theorem rowJ_mapMFFD (n j : ℕ) (hn : j+1 ≤ n) :
 (rowJMFFD n j).map (Int.castRingHom ℚ)=rowJQMFFD n j := by
 unfold rowJMFFD rowJQMFFD
 simp only [Polynomial.map_sum,Polynomial.map_mul,Polynomial.map_pow,
   Polynomial.map_add,Polynomial.map_X,Polynomial.map_one,Polynomial.map_C,
   map_mul,map_natCast]
 apply Finset.sum_congr rfl
 intro s hs
 rw [choose_poly_natM0D3 (n-j-1) s]
 rw [Nat.cast_sub (by omega : 1 ≤ n-j),Nat.cast_sub (by omega : j ≤ n)]
 rfl

theorem rowH_mapMFFD (n j : ℕ) (hn : j+1 ≤ n) :
 (rowHMFFD n j).map (Int.castRingHom ℚ)=rowHQMFFD n j := by
 induction j using Nat.strong_induction_on with
 | h j ih =>
   rcases j with _|_|j
   · exact rowJ_mapMFFD n 0 hn
   · simp only [rowHMFFD,rowHQMFFD,Polynomial.map_add,Polynomial.map_mul,
       Polynomial.map_sub,Polynomial.map_pow,Polynomial.map_X,Polynomial.map_one,
       Polynomial.map_ofNat,rowJ_mapMFFD n 1 hn,rowJ_mapMFFD n 0 (by omega)]
   · rw [rowHMFFD,rowHQMFFD]
     simp only [Polynomial.map_add,Polynomial.map_mul,Polynomial.map_sub,
       Polynomial.map_pow,Polynomial.map_X,Polynomial.map_one,Polynomial.map_ofNat,
       rowJ_mapMFFD n (j+2) hn,rowJ_mapMFFD n (j+1) (by omega),rowJ_mapMFFD n j (by omega),
       ih (j+1) (by omega) (by omega),ih j (by omega) (by omega)]

end
end MathGKM.Markov
