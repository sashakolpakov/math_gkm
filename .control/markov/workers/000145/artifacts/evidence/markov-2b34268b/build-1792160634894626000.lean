import MarkovCentralBinomialM6E1
/-! Machine-authored 2b34268b. Rising binomial convolutions, with exact indices. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem rising_vandermondeM2B3 (d r l : ℕ) (hd : 1 ≤ d) :
 ((r+d+l).choose l:ℤ)=∑ e∈range (l+1),
 ((d+e-1).choose e:ℤ)*((r+l-e).choose (l-e):ℤ) := by
 have h := shifted_binconvM6E1 l (d-1) r (d-1) r (by omega) (by omega)
 have he (e : ℕ) (he : e∈range (l+1)) :
   (e+(d-1)).choose (d-1)*(l-e+r).choose r=
   (d+e-1).choose e*(r+l-e).choose (l-e) := by
   have he' := mem_range.mp he
   rw [←Nat.choose_symm (by omega : d-1 ≤ e+(d-1)),
       ←Nat.choose_symm (by omega : r ≤ l-e+r)]
   congr 2 <;> omega
 rw [sum_congr rfl he,←Nat.choose_symm (by omega : d-1+r+1 ≤ l+(d-1)+r+1)] at h
 convert (congrArg (fun x : ℕ => (x:ℤ)) h).symm using 1 <;>
   push_cast <;> congr 2 <;> omega

theorem rising_doubleM2B3 (d h : ℕ) (hd : 1 ≤ d) :
 (∑ e∈range (h+1), ((d+e-1).choose e:ℤ)*
   ((d+(h-e)-1).choose (h-e):ℤ))=((2*d+h-1).choose h:ℤ) := by
 have hs := rising_vandermondeM2B3 d (d-1) h hd
 rw [show d-1+d+h=2*d+h-1 by omega] at hs
 rw [hs]
 apply sum_congr rfl
 intro e he
 have he' := mem_range.mp he
 congr 2
 omega

end
end MathGKM.Markov
