import MarkovBinomialInverseM96A
import MarkovThreeSolverM96A
/-! Machine-authored 96ada19b. Exact signed impulse response, including boundaries. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem inverse_zero_rowM96A (j : ℕ) : inverseKernelM96A 0 j=2*((j:ℤ)+1) := by
 simp [inverseKernelM96A,Nat.choose_one_right]; ring

theorem inverse_zero_columnM96A (i : ℕ) :
 inverseKernelM96A i 0=(-1:ℤ)^i*(2*((i:ℤ)+1)) := by
 have h : (2*i+2).choose (2*i+1)=2*i+2 := by
   have he : 2*i+2=(2*i+1)+1 := by omega
   rw [he,Nat.choose_succ_self_right]
 simp only [inverseKernelM96A,mul_zero,add_zero,h]
 push_cast
 ring

theorem inverse_swapM96A (i j : ℕ) :
 inverseKernelM96A i j=(-1:ℤ)^i*(-1:ℤ)^j*inverseKernelM96A j i := by
 have h : (2*i+2*j+2).choose (2*i+1)=(2*j+2*i+2).choose (2*j+1) := by
   rw [Nat.choose_symm (by omega : 2*i+1 ≤ 2*i+2*j+2)]
   congr 1 <;> omega
 have hs : ((-1:ℤ)^j)^2=1 := by
   rw [←pow_mul,mul_comm,pow_mul]
   simp
 simp only [inverseKernelM96A,h]
 linear_combination -((-1:ℤ)^i*((2*j+2*i+2).choose (2*j+1):ℤ))*hs

theorem choose_three_differenceM96A (j : ℕ) :
 ((2*j+8).choose 3:ℤ)-2*((2*j+6).choose 3:ℤ)+((2*j+4).choose 3:ℤ)=8*j+20 := by
 simp only [Nat.choose_succ_succ,Nat.choose_zero_right,Nat.choose_one_right,Nat.cast_add]
 push_cast
 ring

theorem inverse_near_rowM96A (j : ℕ) :
 inverseKernelM96A 1 (j+2)+2*inverseKernelM96A 0 (j+2)-
 2*inverseKernelM96A 1 (j+1)+2*inverseKernelM96A 0 (j+1)+inverseKernelM96A 1 j=0 := by
 rw [inverse_zero_rowM96A,inverse_zero_rowM96A]
 have h := choose_three_differenceM96A j
 simp only [inverseKernelM96A,pow_one,one_mul]
 norm_num only at ⊢
 have e0 : 2*1+2*(j+2)+2=2*j+8 := by omega
 have e1 : 2*1+2*(j+1)+2=2*j+6 := by omega
 have e2 : 2*1+2*j+2=2*j+4 := by omega
 rw [e0,e1,e2]
 push_cast
 linear_combination -h

theorem inverse_near_columnM96A (i : ℕ) :
 inverseKernelM96A (i+2) 1+2*inverseKernelM96A (i+1) 1-
 2*inverseKernelM96A (i+2) 0+inverseKernelM96A i 1+
 2*inverseKernelM96A (i+1) 0=0 := by
 have h := inverse_near_rowM96A i
 rw [inverse_swapM96A (i+2) 1,inverse_swapM96A (i+1) 1,inverse_swapM96A i 1,
   inverse_swapM96A (i+2) 0,inverse_swapM96A (i+1) 0]
 simp only [pow_succ,pow_zero,mul_one,pow_one]
 linear_combination -((-1:ℤ)^i)*h

theorem inverse_kernel_equationM96A (i j : ℕ) :
 discriminantActionM96A inverseKernelM96A i j=if i=0 ∧ j=0 then 2 else 0 := by
 rcases i with _|i
 · rcases j with _|j
   · decide
   rcases j with _|j
   · decide
   · simp [discriminantActionM96A,shiftRawM9E2,inverse_zero_rowM96A,
       show 2 ≤ j+1+1 by omega,show 1 ≤ j+1+1 by omega,
       show j+1+1-2=j by omega]
     ring
 rcases i with _|i
 · rcases j with _|j
   · decide
   rcases j with _|j
   · decide
   · simpa [discriminantActionM96A,shiftRawM9E2,
       show 2 ≤ j+1+1 by omega,show 1 ≤ j+1+1 by omega,
       show j+1+1-2=j by omega] using inverse_near_rowM96A j
 rcases j with _|j
 · simp [discriminantActionM96A,shiftRawM9E2,inverse_zero_columnM96A,
     show 2 ≤ i+1+1 by omega,show 1 ≤ i+1+1 by omega,
     show i+1+1-2=i by omega,pow_succ]
   ring
 rcases j with _|j
 · simpa [discriminantActionM96A,shiftRawM9E2,
     show 2 ≤ i+1+1 by omega,show 1 ≤ i+1+1 by omega,
     show i+1+1-2=i by omega] using inverse_near_columnM96A i
 · simpa [discriminantActionM96A,shiftRawM9E2,
     show 2 ≤ i+1+1 by omega,show 1 ≤ i+1+1 by omega,
     show 2 ≤ j+1+1 by omega,show 1 ≤ j+1+1 by omega,
     show i+1+1-2=i by omega,show j+1+1-2=j by omega] using inverse_kernel_interiorM96A i j

theorem inverse_impulseM96A (i j : ℕ) :
 solveDiscM96A (fun a b => if a=0 ∧ b=0 then 2 else 0) i j=inverseKernelM96A i j :=
 solve_disc_uniqueM96A _ _ inverse_kernel_equationM96A i j

end
end MathGKM.Markov
