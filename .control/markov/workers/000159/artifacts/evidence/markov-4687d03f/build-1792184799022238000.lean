import MarkovRowSeriesM468
/-! Machine-authored 4687d03f. Exact rational resolvent of the source residual.
Denominators are cleared in formal power series; no analytic assumption. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem rowH_series_equationM468 (N : ℕ) :
 rowHSeriesM468 N-2*C (1-Polynomial.X)*X*rowHSeriesM468 (N+1)+
   C (Polynomial.X+1)^2*X^2*rowHSeriesM468 (N+2)=
 rowJSeriesM468 N+2*C (Polynomial.X+1)*X*rowJSeriesM468 (N+1)+
   C (Polynomial.X+1)^2*X^2*rowJSeriesM468 (N+2) := by
 have twoC (a : Polynomial ℤ) : (2:PowerSeries (Polynomial ℤ))*C a=C (2*a) := by simp
 simp only [twoC,←map_pow C]
 apply PowerSeries.ext
 intro j
 simp only [map_add (PowerSeries.coeff j),map_sub (PowerSeries.coeff j),mul_assoc,coeff_C_mul]
 rcases j with _|_|j
 · simp [rowHSeriesM468,rowJSeriesM468,rowHMFFD,coeff_X_pow_mul']
 · simp only [coeff_succ_X_mul,coeff_X_pow_mul',show ¬2 ≤ 1 by omega,if_false,
     mul_zero,add_zero,rowHSeriesM468,rowJSeriesM468,coeff_mk,rowHMFFD]
   simp only [Nat.add_zero,Nat.reduceAdd]
   ring
 · simp only [coeff_succ_X_mul,coeff_X_pow_mul',show 2 ≤ j+1+1 by omega,if_true,
     show j+1+1-2=j by omega,rowHSeriesM468,rowJSeriesM468,coeff_mk]
   have e1 : N+(j+1+1)+1=N+j+3 := by omega
   have e2 : N+1+(j+1)+1=N+j+3 := by omega
   have e3 : N+2+j+1=N+j+3 := by omega
   rw [e1,e2,e3,rowHMFFD]
   ring

theorem rowH_clearedM468 (N : ℕ) :
 (1-2*X+C (Polynomial.X+1)*X^2)^2*rowHSeriesM468 N=
 (1-C (Polynomial.X+1)*X^2)^2*rowJSeriesM468 N := by
 have hf0 := rowH_series_shiftM468 N
 have hf1 := rowH_series_shiftM468 (N+1)
 have hj0 := rowJ_series_shiftM468 N
 have hj1 := rowJ_series_shiftM468 (N+1)
 have he := rowH_series_equationM468 N
 have hf2 : rowAM468^2*rowHSeriesM468 (N+2)=(1-X)^2*rowHSeriesM468 N := by
   calc
    _ = rowAM468*(rowAM468*rowHSeriesM468 (N+1+1)) := by ring
    _ = rowAM468*((1-X)*rowHSeriesM468 (N+1)) := by rw [hf1]
    _ = (1-X)*(rowAM468*rowHSeriesM468 (N+1)) := by ring
    _ = _ := by rw [hf0]; ring
 have hj2 : rowAM468^2*rowJSeriesM468 (N+2)=(1-X)^2*rowJSeriesM468 N := by
   calc
    _ = rowAM468*(rowAM468*rowJSeriesM468 (N+1+1)) := by ring
    _ = rowAM468*((1-X)*rowJSeriesM468 (N+1)) := by rw [hj1]
    _ = (1-X)*(rowAM468*rowJSeriesM468 (N+1)) := by ring
    _ = _ := by rw [hj0]; ring
 have hc : C (1-Polynomial.X)=(2:PowerSeries (Polynomial ℤ))-C (Polynomial.X+1) := by
   simp only [map_sub,map_add,map_one]
   ring
 rw [hc] at he
 unfold rowAM468 at *
 linear_combination (1-C (Polynomial.X+1)*X)^2*he+
   2*(2-C (Polynomial.X+1))*X*(1-C (Polynomial.X+1)*X)*hf0-
   C (Polynomial.X+1)^2*X^2*hf2+
   2*C (Polynomial.X+1)*X*(1-C (Polynomial.X+1)*X)*hj0+
   C (Polynomial.X+1)^2*X^2*hj2

theorem rowH_resolventM468 (N : ℕ) :
 rowAM468^(N+4)*(1-2*X+C (Polynomial.X+1)*X^2)^2*rowHSeriesM468 N=
 (1-X)^N*(1-C (Polynomial.X+1)*X^2)^2 := by
 calc
  _ = rowAM468^(N+4)*((1-2*X+C (Polynomial.X+1)*X^2)^2*rowHSeriesM468 N) := by ring
  _ = rowAM468^(N+4)*((1-C (Polynomial.X+1)*X^2)^2*rowJSeriesM468 N) := by
    rw [rowH_clearedM468]
  _ = (rowAM468^(N+4)*rowJSeriesM468 N)*(1-C (Polynomial.X+1)*X^2)^2 := by ring
  _ = _ := by rw [rowJ_resolventM468]

end
end MathGKM.Markov
