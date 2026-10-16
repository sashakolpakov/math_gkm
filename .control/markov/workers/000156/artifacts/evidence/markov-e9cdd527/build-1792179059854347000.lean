import MarkovThreeForceM96A
import MarkovBinomialTableM295
/-! Machine-authored e9cdd527. Exact low-column forcing differences.
No log-concavity assumption or external computational certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem fib_raw_extendedME9C (n i j : ℕ) (hj : j<n) :
 fibRawM9E2 n (i+1) j=((n-j-1).choose i:ℤ)*((i+1+j).choose (i+1):ℤ) := by
 unfold fibRawM9E2
 rw [if_neg (by omega : i+1≠0)]
 simp only [Nat.add_sub_cancel]
 rw [Nat.choose_symm_add]
 by_cases h : i+1+j≤n
 · rw [if_pos h]
 · rw [if_neg h,Nat.choose_eq_zero_of_lt (by omega : n-j-1<i)]
   simp

def fibDeltaME9C (n i j : ℕ) : ℤ :=
 fibRawM9E2 (n+2) i j-2*fibRawM9E2 (n+1) i j+fibRawM9E2 n i j

theorem fib_delta_axisME9C (n j : ℕ) (hj : j<n) : fibDeltaME9C n 0 j=0 := by
 simp [fibDeltaME9C,fibRawM9E2,show j≠n+2 by omega,
   show j≠n+1 by omega,show j≠n by omega]

theorem fib_delta_oneME9C (n j : ℕ) (hj : j<n) : fibDeltaME9C n 1 j=0 := by
 unfold fibDeltaME9C
 rw [fib_raw_extendedME9C (n+2) 0 j (by omega),
   fib_raw_extendedME9C (n+1) 0 j (by omega),fib_raw_extendedME9C n 0 j hj]
 simp
 ring

theorem fib_delta_twoME9C (n j : ℕ) (hj : j<n) : fibDeltaME9C n 2 j=0 := by
 unfold fibDeltaME9C
 rw [fib_raw_extendedME9C (n+2) 1 j (by omega),
   fib_raw_extendedME9C (n+1) 1 j (by omega),fib_raw_extendedME9C n 1 j hj]
 simp only [Nat.choose_one_right]
 rw [show n+2-j-1=(n-j-1)+2 by omega,show n+1-j-1=(n-j-1)+1 by omega]
 push_cast
 ring

theorem fib_delta_highME9C (n i j : ℕ) (hj : j<n) :
 fibDeltaME9C n (i+3) j=((n-j-1).choose i:ℤ)*((i+3+j).choose (i+3):ℤ) := by
 unfold fibDeltaME9C
 rw [show i+3=(i+2)+1 by omega,
   fib_raw_extendedME9C (n+2) (i+2) j (by omega),
   fib_raw_extendedME9C (n+1) (i+2) j (by omega),fib_raw_extendedME9C n (i+2) j hj]
 rw [show n+2-j-1=(n-j-1)+2 by omega,show n+1-j-1=(n-j-1)+1 by omega]
 simp only [Nat.choose_succ_succ,Nat.cast_add]
 ring

def deltaThreeME9C (x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)/6
def deltaFourME9C (n x : ℚ) : ℚ := (n-x-1)*(x+1)*(x+2)*(x+3)*(x+4)/24

theorem fib_delta_threeME9C (n j : ℕ) (hj : j<n) :
 (fibDeltaME9C n 3 j:ℚ)=deltaThreeME9C j := by
 rw [fib_delta_highME9C n 0 j hj]
 simp only [Nat.choose_zero_right,Nat.cast_one,one_mul,Int.cast_natCast]
 rw [←choose_poly_natM0D3,binomial_poly_3M295]
 unfold deltaThreeME9C
 push_cast
 ring

theorem fib_delta_fourME9C (n j : ℕ) (hj : j<n) :
 (fibDeltaME9C n 4 j:ℚ)=deltaFourME9C n j := by
 rw [fib_delta_highME9C n 1 j hj]
 simp only [Nat.choose_one_right,Int.cast_mul,Int.cast_natCast]
 rw [←choose_poly_natM0D3,binomial_poly_4M295]
 rw [Nat.cast_sub (by omega : 1≤n-j),Nat.cast_sub (by omega : j≤n)]
 unfold deltaFourME9C
 push_cast
 ring

end
end MathGKM.Markov
