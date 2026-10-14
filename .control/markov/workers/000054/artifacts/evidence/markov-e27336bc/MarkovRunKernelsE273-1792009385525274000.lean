import MarkovSecondCompressed446
/-! Machine-authored e27336bc. Arbitrary-run cleared coefficient kernels. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1500000
set_option linter.unusedSimpArgs false

def hKernelE273 (N x z : ℤ[X]) := N*(1-x)*(1+x)^2+(1+x)*(1-3*x)+4*x*z
def cKernelE273 (N x z : ℤ[X]) :=
 2*N*x*(1-x)*(1+x)^2+x*(1-x)^3-8*x^2*(1+x)+
 z*(2*N*(1-x)*(1+x)^2+8*x*(1+x))
def dKernelE273 (N x z : ℤ[X]) := -4*z + 4*x + -24*x*z + 24*x^2 + -40*x^2*z + 40*x^3 + -24*x^3*z + 24*x^4 + -4*x^4*z + 4*x^5 + 1*N + -4*N*z + -10*N*x + -8*N*x*z + -17*N*x^2 + 4*N*x^3 + 8*N*x^3*z + 15*N*x^4 + 4*N*x^4*z + 6*N*x^5 + 1*N*x^6 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6

theorem hKernel_clearE273 (n : ℕ) :
 (1-X)^2*lowerH487 n=hKernelE273 n X (X^(n+1)) := by
 induction n with
 | zero => norm_num [lowerH487,hKernelE273]; ring
 | succ n ih =>
   rw [lowerH487]
   have hs := runSum_clear487 n
   simp only [Nat.cast_add,Nat.cast_one]
   have he : X^(n+1+1)=(X : ℤ[X])^(n+1)*X := pow_succ _ _
   rw [he]
   dsimp [hKernelE273] at *
   linear_combination ih + (4*X*(1-X))*hs

theorem cKernel_clearE273 (n : ℕ) :
 (1-X)^3*runCOneBF n=cKernelE273 n X (X^(n+1)) := by
 induction n with
 | zero => norm_num [runCOneBF,cKernelE273]; ring
 | succ n ih =>
   rw [runCOneBF]
   have hh := hKernel_clearE273 n
   simp only [Nat.cast_add,Nat.cast_one]
   have he : X^(n+1+1)=(X : ℤ[X])^(n+1)*X := pow_succ _ _
   have hf : X^(n+2)=(X : ℤ[X])^(n+1)*X := by rw [show n+2=n+1+1 by omega,pow_succ]
   rw [he]
   dsimp [hKernelE273,cKernelE273] at *
   linear_combination X*ih + (2*X*(1-X))*hh

theorem dKernel_clearE273 (n : ℕ) :
 2*(1-X)^4*runDTwoBF n=dKernelE273 n X (X^(n+1)) := by
 induction n with
 | zero => norm_num [runDTwoBF,dKernelE273]; ring
 | succ n ih =>
   rw [runDTwoBF]
   have hh := hKernel_clearE273 n
   have hc := cKernel_clearE273 n
   have hs := runSum_clear487 n
   simp only [Nat.cast_add,Nat.cast_one]
   rw [pow_succ X (n+1)]
   dsimp [hKernelE273,cKernelE273,dKernelE273] at *
   linear_combination ih + (2*(1+X)*(1-X))*hc +
     (2*(1+X)*(1-X)^2)*hh - (4*(1+X)*(1-X)^3)*hs

def kKernelE273 (N x z : ℤ[X]) := dKernelE273 N x z+2*(1-x)*cKernelE273 N x z
theorem kKernel_clearE273 (n : ℕ) :
 2*(1-X)^4*runKBF (lowerMatrix487 n)=kKernelE273 n X (X^(n+1)) := by
 rw [runK_scalarBF]
 dsimp [kKernelE273]
 linear_combination dKernel_clearE273 n + (2*(1-X))*cKernel_clearE273 n

#print axioms hKernel_clearE273
#print axioms cKernel_clearE273
#print axioms dKernel_clearE273
#print axioms kKernel_clearE273
end
end MathGKM.Markov
