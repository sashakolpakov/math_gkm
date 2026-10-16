import MarkovThreeForceM96A
/-! Machine-authored 96ada19b. Interior equation of the signed inverse kernel.
Boundary equations and convolution inversion are separate obligations. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem choose_four_relationM96A (n k : ℕ) :
 (Nat.choose (n+4) (k+4):ℤ)=
 2*(Nat.choose (n+2) (k+2):ℤ)+2*(Nat.choose (n+2) (k+4):ℤ)-
 (Nat.choose n k:ℤ)+2*(Nat.choose n (k+2):ℤ)-(Nat.choose n (k+4):ℤ) := by
 simp only [Nat.choose_succ_succ,Nat.cast_add]
 ring

def inverseKernelM96A (i j : ℕ) : ℤ :=
 (-1:ℤ)^i*(Nat.choose (2*i+2*j+2) (2*i+1):ℤ)

theorem inverse_kernel_interiorM96A (i j : ℕ) :
 inverseKernelM96A (i+2) (j+2)+2*inverseKernelM96A (i+1) (j+2)-
 2*inverseKernelM96A (i+2) (j+1)+inverseKernelM96A i (j+2)+
 2*inverseKernelM96A (i+1) (j+1)+inverseKernelM96A (i+2) j=0 := by
 have h := choose_four_relationM96A (2*i+2*j+6) (2*i+1)
 have hh : (Nat.choose (2*(i+2)+2*(j+2)+2) (2*(i+2)+1):ℤ)=
   2*(Nat.choose (2*(i+1)+2*(j+2)+2) (2*(i+1)+1):ℤ)+
   2*(Nat.choose (2*(i+2)+2*(j+1)+2) (2*(i+2)+1):ℤ)-
   (Nat.choose (2*i+2*(j+2)+2) (2*i+1):ℤ)+
   2*(Nat.choose (2*(i+1)+2*(j+1)+2) (2*(i+1)+1):ℤ)-
   (Nat.choose (2*(i+2)+2*j+2) (2*(i+2)+1):ℤ) := by
   rw [show 2*(i+2)+2*(j+2)+2=2*i+2*j+10 by omega,
     show 2*(i+1)+2*(j+2)+2=2*i+2*j+8 by omega,
     show 2*(i+2)+2*(j+1)+2=2*i+2*j+8 by omega,
     show 2*i+2*(j+2)+2=2*i+2*j+6 by omega,
     show 2*(i+1)+2*(j+1)+2=2*i+2*j+6 by omega,
     show 2*(i+2)+2*j+2=2*i+2*j+6 by omega,
     show 2*(i+2)+1=2*i+5 by omega,show 2*(i+1)+1=2*i+3 by omega]
   exact h
 unfold inverseKernelM96A
 simp only [pow_succ]
 linear_combination (-1:ℤ)^i*hh

end
end MathGKM.Markov
