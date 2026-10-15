import MarkovShapePartsBDEE
/-! Machine-authored bdee9a64. Exact binomial expression for the auxiliary
interior candidate. The source-to-numerator normalization remains separate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
set_option maxRecDepth 8192
def fallingFiveBDEE (x : ℤ) : ℤ := x*(x-1)*(x-2)*(x-3)*(x-4)
theorem fallingFive_natBDEE (z : ℕ) :
 fallingFiveBDEE z=120*(z.choose 5:ℤ) := by
 by_cases hz : 4 ≤ z
 · have h := congrArg (fun n : ℕ => (n:ℤ)) (Nat.descFactorial_eq_factorial_mul_choose z 5)
   norm_num [Nat.descFactorial_succ,Nat.descFactorial_zero,Nat.cast_sub (by omega : 4 ≤ z),
     Nat.cast_sub (by omega : 3 ≤ z),Nat.cast_sub (by omega : 2 ≤ z),
     Nat.cast_sub (by omega : 1 ≤ z)] at h
   unfold fallingFiveBDEE
   linear_combination h
 · interval_cases z <;> norm_num [fallingFiveBDEE]
theorem fallingFive_shiftBDEE (j l : ℕ) (h : l ≤ j+5) :
 fallingFiveBDEE ((j:ℤ)+5-l)=120*((j+5-l).choose 5:ℤ) := by
 have hh := fallingFive_natBDEE (j+5-l)
 simpa only [Nat.cast_sub h,Nat.cast_add,Nat.cast_ofNat] using hh
def lowNumerator0BDEE (n c r : ℤ) : ℤ :=
 -6 + 11*r + -6*r^2 + 1*r^3 + 11*c + -12*c*r + 3*c*r^2 + -6*c^2 + 3*c^2*r + 1*c^3 + 11*n*c + -12*n*c*r + 3*n*c*r^2 + -12*n*c^2 + 6*n*c^2*r + 3*n*c^3 + -6*n^2*c^2 + 3*n^2*c^2*r + 3*n^2*c^3 + 1*n^3*c^3
def lowNumerator1BDEE (n c r : ℤ) : ℤ :=
 18 + 21*r + -18*r^2 + 3*r^3 + -69*c + 21*c*r + 39*c^2 + -9*c^2*r + -6*c^3 + 21*n*c + -36*n*c*r + 9*n*c*r^2 + 21*n*c^2 + -9*n*c^3 + -18*n^2*c^2 + 9*n^2*c^2*r + 3*n^3*c^3
def lowNumerator2BDEE (n c r : ℤ) : ℤ :=
 36*r + -12*r^2 + -171*c + 129*c*r + -24*c*r^2 + 24*c^2 + -21*c^2*r + 3*c^3 + 36*n*c + -24*n*c*r + 129*n*c^2 + -48*n*c^2*r + -21*n*c^3 + -12*n^2*c^2 + -24*n^2*c^3
def lowNumerator3BDEE (n c r : ℤ) : ℤ :=
 -48 + 92*r + 12*r^2 + -8*r^3 + -325*c + 141*c*r + -24*c*r^2 + -147*c^2 + 39*c^2*r + 28*c^3 + 92*n*c + 24*n*c*r + -24*n*c*r^2 + 141*n*c^2 + -48*n*c^2*r + 39*n*c^3 + 12*n^2*c^2 + -24*n^2*c^2*r + -24*n^2*c^3 + -8*n^3*c^3
def lowNumerator4BDEE (n c r : ℤ) : ℤ :=
 36 + 66*r + 24*r^2 + -6*r^3 + -741*c + 57*c*r + 30*c*r^2 + -222*c^2 + 81*c^2*r + -9*c^3 + 66*n*c + 48*n*c*r + -18*n*c*r^2 + 57*n*c^2 + 60*n*c^2*r + 81*n*c^3 + 24*n^2*c^2 + -18*n^2*c^2*r + 30*n^2*c^3 + -6*n^3*c^3
def lowNumerator5BDEE (n c r : ℤ) : ℤ :=
 36 + -66*r + 24*r^2 + 6*r^3 + -807*c + -9*c*r + 48*c*r^2 + -255*c^2 + -3*c^2*r + -54*c^3 + -66*n*c + 48*n*c*r + 18*n*c*r^2 + -9*n*c^2 + 96*n*c^2*r + -3*n*c^3 + 24*n^2*c^2 + 18*n^2*c^2*r + 48*n^2*c^3 + 6*n^3*c^3
def lowNumerator6BDEE (n c r : ℤ) : ℤ :=
 -48 + -92*r + 12*r^2 + 8*r^3 + -417*c + -117*c*r + -276*c^2 + -63*c^2*r + -27*c^3 + -92*n*c + 24*n*c*r + 24*n*c*r^2 + -117*n*c^2 + -63*n*c^3 + 12*n^2*c^2 + 24*n^2*c^2*r + 8*n^3*c^3
def lowNumerator7BDEE (n c r : ℤ) : ℤ :=
 -36*r + -12*r^2 + -207*c + -153*c*r + -24*c*r^2 + -117*c^2 + -27*c^2*r + -36*n*c + -24*n*c*r + -153*n*c^2 + -48*n*c^2*r + -27*n*c^3 + -12*n^2*c^2 + -24*n^2*c^3
def lowNumerator8BDEE (n c r : ℤ) : ℤ :=
 18 + -21*r + -18*r^2 + -3*r^3 + -90*c + -57*c*r + -9*c*r^2 + -21*n*c + -36*n*c*r + -9*n*c*r^2 + -57*n*c^2 + -18*n*c^2*r + -18*n^2*c^2 + -9*n^2*c^2*r + -9*n^2*c^3 + -3*n^3*c^3
def lowNumerator9BDEE (n c r : ℤ) : ℤ :=
 -6 + -11*r + -6*r^2 + -1*r^3 + -11*n*c + -12*n*c*r + -3*n*c*r^2 + -6*n^2*c^2 + -3*n^2*c^2*r + -1*n^3*c^3
theorem thirdShape_fallingBDEE (n c r j : ℤ) :
 8*thirdShapeBDEE n c r j=(lowNumerator0BDEE n c r)*fallingFiveBDEE (j+5-0)+(lowNumerator1BDEE n c r)*fallingFiveBDEE (j+5-1)+(lowNumerator2BDEE n c r)*fallingFiveBDEE (j+5-2)+(lowNumerator3BDEE n c r)*fallingFiveBDEE (j+5-3)+(lowNumerator4BDEE n c r)*fallingFiveBDEE (j+5-4)+(lowNumerator5BDEE n c r)*fallingFiveBDEE (j+5-5)+(lowNumerator6BDEE n c r)*fallingFiveBDEE (j+5-6)+(lowNumerator7BDEE n c r)*fallingFiveBDEE (j+5-7)+(lowNumerator8BDEE n c r)*fallingFiveBDEE (j+5-8)+(lowNumerator9BDEE n c r)*fallingFiveBDEE (j+5-9) := by
 unfold thirdShapeBDEE fallingFiveBDEE lowNumerator0BDEE lowNumerator1BDEE lowNumerator2BDEE lowNumerator3BDEE lowNumerator4BDEE lowNumerator5BDEE lowNumerator6BDEE lowNumerator7BDEE lowNumerator8BDEE lowNumerator9BDEE
 ring
theorem thirdShape_chooseBDEE (n c r : ℤ) (j : ℕ) (hj : 4 ≤ j) :
 thirdShapeBDEE n c r j=15*((lowNumerator0BDEE n c r)*((j+5-0).choose 5:ℤ)+(lowNumerator1BDEE n c r)*((j+5-1).choose 5:ℤ)+(lowNumerator2BDEE n c r)*((j+5-2).choose 5:ℤ)+(lowNumerator3BDEE n c r)*((j+5-3).choose 5:ℤ)+(lowNumerator4BDEE n c r)*((j+5-4).choose 5:ℤ)+(lowNumerator5BDEE n c r)*((j+5-5).choose 5:ℤ)+(lowNumerator6BDEE n c r)*((j+5-6).choose 5:ℤ)+(lowNumerator7BDEE n c r)*((j+5-7).choose 5:ℤ)+(lowNumerator8BDEE n c r)*((j+5-8).choose 5:ℤ)+(lowNumerator9BDEE n c r)*((j+5-9).choose 5:ℤ)) := by
 have h := thirdShape_fallingBDEE n c r j
 norm_num at h
 have h0 := fallingFive_shiftBDEE j 0 (by omega)
 norm_num at h0
 rw [h0] at h
 have h1 := fallingFive_shiftBDEE j 1 (by omega)
 norm_num at h1
 rw [h1] at h
 have h2 := fallingFive_shiftBDEE j 2 (by omega)
 norm_num at h2
 rw [h2] at h
 have h3 := fallingFive_shiftBDEE j 3 (by omega)
 norm_num at h3
 rw [h3] at h
 have h4 := fallingFive_shiftBDEE j 4 (by omega)
 norm_num at h4
 rw [h4] at h
 have h5 := fallingFive_shiftBDEE j 5 (by omega)
 norm_num at h5
 rw [h5] at h
 have h6 := fallingFive_shiftBDEE j 6 (by omega)
 norm_num at h6
 rw [h6] at h
 have h7 := fallingFive_shiftBDEE j 7 (by omega)
 norm_num at h7
 rw [h7] at h
 have h8 := fallingFive_shiftBDEE j 8 (by omega)
 norm_num at h8
 rw [h8] at h
 have h9 := fallingFive_shiftBDEE j 9 (by omega)
 norm_num at h9
 rw [h9] at h
 nlinarith only [h]
#print axioms thirdShape_chooseBDEE
end
end MathGKM.Markov
