import MarkovAdjacent67c3
/-! Machine-authored daba8bcf. Rational ratio and gap certificates for the
minimal-denominator residual. The coefficient bridge is in a separate module. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def minBaseMDAB (j k : ℕ) : ℚ :=
 ((j+3).choose (k+3):ℚ)*((j+k+3).choose k:ℚ)
def minDenMDAB (k : ℚ) : ℚ := (2*k+4)*(2*k+5)
def minWeightMDAB (j k : ℚ) : ℚ := 4*j^2+16*j+2*k+20
def minNumerMDAB (j k : ℚ) : ℚ :=
 (j+k+4)*(j-k)*minWeightMDAB j (k+1)*minDenMDAB k
def minRatioDenMDAB (j k : ℚ) : ℚ :=
 (k+1)*(k+4)*minWeightMDAB j k*minDenMDAB (k+1)

theorem minBase_stepMDAB (j k : ℕ) (hk : k ≤ j) :
 minBaseMDAB j (k+1)*(k+1)*(k+4)=
 minBaseMDAB j k*(j+k+4)*(j-k) := by
 have h1 := choose_lower_step67 (j+3) (k+3) (by omega)
 have h2 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.add_one_mul_choose_eq (j+k+3) k)
 push_cast at h2
 have e1 : k+1+3=k+3+1 := by omega
 have e2 : j+(k+1)+3=j+k+3+1 := by omega
 unfold minBaseMDAB
 rw [e1,e2]
 push_cast at h1 ⊢
 linear_combination ((j+k+3+1).choose (k+1):ℚ)*(k+1)*h1-
   ((j+3).choose (k+3):ℚ)*(j-k)*h2

theorem min_ratio_decreasingMDAB (k s : ℚ) (hk : 0 ≤ k) (hs : 0 ≤ s) :
 minNumerMDAB (k+s+2) (k+1)*minRatioDenMDAB (k+s+2) k ≤
 minNumerMDAB (k+s+2) k*minRatioDenMDAB (k+s+2) (k+1) := by
 apply sub_nonneg.mp
 unfold minNumerMDAB minRatioDenMDAB minWeightMDAB minDenMDAB
 ring_nf
 positivity

theorem min_ratio_den_posMDAB (j k : ℚ) (hj : 0 ≤ j) (hk : 0 ≤ k) :
 0 < minRatioDenMDAB j k := by
 unfold minRatioDenMDAB minWeightMDAB minDenMDAB
 positivity

end
end MathGKM.Markov
