import MarkovCentralSquareM3A1
/-! Machine-authored 6e1369de. Global coefficient identity below the axis,
including the total-degree zero range. -/
namespace MathGKM.Markov
noncomputable section

theorem fib_globalM6E1 (n l t : ℕ) (hl : 1≤l) (ht : t<n) :
 coeff (fib6 n) l t=((n-t-1).choose (l-1):ℤ)*((t+l).choose l:ℤ) := by
 by_cases hs : l+t≤n
 · have he : l-1+1+t+(n-l-t)=n := by omega
   have h := fib_formula_aux6 n (l-1) t (n-l-t) he
   rw [show l-1+1=l by omega,
     show l-1+(n-l-t)=n-t-1 by omega,
     show l-1+1+t=t+l by omega] at h
   rw [h,←Nat.choose_symm (by omega : l≤t+l)]
   simp
 · rw [(fib_degree6 n) l t (by omega),Nat.choose_eq_zero_of_lt (by omega : n-t-1<l-1)]
   simp

end
end MathGKM.Markov
