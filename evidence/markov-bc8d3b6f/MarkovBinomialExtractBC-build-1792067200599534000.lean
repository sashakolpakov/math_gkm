import MarkovFourthClosedN6604
/-! Machine-authored bc8d3b6f. Coefficient extraction from a cleared polynomial
identity. No positivity or source-identification assumption is implicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
open scoped BigOperators

theorem coeff_of_one_sub_mulBC (P Q : ℤ[X]) (d j : ℕ)
 (h : (1-X)^(d+1)*P=Q) :
 P.coeff j = ∑ k ∈ Finset.antidiagonal j,
   Q.coeff k.1 * ((d+k.2).choose d : ℤ) := by
 have hs : (1-PowerSeries.X : PowerSeries ℤ)^(d+1)*(P : PowerSeries ℤ)=
     (Q : PowerSeries ℤ) := by
   simpa using congrArg (fun p : ℤ[X] => (p : PowerSeries ℤ)) h
 have hi := PowerSeries.mk_add_choose_mul_one_sub_pow_eq_one ℤ d
 have hp : (P : PowerSeries ℤ) =
     (Q : PowerSeries ℤ) * PowerSeries.mk (fun k => ((d+k).choose d : ℤ)) := by
   rw [←hs]
   calc
    _ = (P : PowerSeries ℤ) *
      (PowerSeries.mk (fun k => ((d+k).choose d : ℤ)) * (1-PowerSeries.X)^(d+1)) := by ring
    _ = _ := by rw [hi,mul_one]
 have hc := congrArg (PowerSeries.coeff j) hp
 simpa only [Polynomial.coeff_coe,PowerSeries.coeff_mul,PowerSeries.coeff_mk] using hc

theorem coeff_of_one_sub_mul_rangeBC (P Q : ℤ[X]) (d j : ℕ)
 (h : (1-X)^(d+1)*P=Q) :
 P.coeff j = ∑ k ∈ Finset.range (j+1),
   Q.coeff k * ((d+(j-k)).choose d : ℤ) := by
 rw [coeff_of_one_sub_mulBC P Q d j h,Finset.Nat.sum_antidiagonal_eq_sum_range_succ]

end
end MathGKM.Markov
