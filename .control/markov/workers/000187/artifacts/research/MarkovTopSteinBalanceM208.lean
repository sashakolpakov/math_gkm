import MarkovTopSteinAlgebraM208
import MarkovTopBetaTransportMCA9
/-! Machine-authored 20825094. Detailed balance and exact finite summation
for the actual q-tilted beta weights. Endpoints are retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

def steinDensityM208 (d i k : ℕ) : ℝ :=
 ((i+k).choose i:ℝ)*betaQSeqMDCB d i k
def steinPairM208 (d i m k : ℕ) : ℝ :=
 steinDensityM208 d i k*steinDensityM208 d i (m-k)

theorem stein_density_positiveM208 (d i k : ℕ) : 0 < steinDensityM208 d i k := by
 unfold steinDensityM208
 apply mul_pos _ (beta_q_positiveMDCB d i k)
 exact_mod_cast Nat.choose_pos (show i ≤ i+k by omega)

theorem stein_pair_positiveM208 (d i m k : ℕ) : 0 < steinPairM208 d i m k :=
 mul_pos (stein_density_positiveM208 d i k) (stein_density_positiveM208 d i (m-k))

theorem stein_density_stepM208 (d i k : ℕ) :
 ((k:ℝ)+1)*((d:ℝ)+i+k+6)*steinDensityM208 d i (k+1)=
 ((i:ℝ)+k+1)*((d:ℝ)+2*i+k+9)*steinDensityM208 d i k := by
 have hC : ((k:ℝ)+1)*((i+k+1).choose i:ℝ)=
     ((i:ℝ)+k+1)*((i+k).choose i:ℝ) := by
   have h := Nat.choose_mul_succ_eq (i+k) i
   rw [show i+k+1-i=k+1 by omega] at h
   have hh : ((i+k).choose i:ℝ)*((i:ℝ)+k+1)=
       ((i+k+1).choose i:ℝ)*((k:ℝ)+1) := by exact_mod_cast h
   nlinarith only [hh]
 have hQ : (d:ℝ)+i+k+6 ≠ 0 := by positivity
 unfold steinDensityM208
 rw [betaQSeqMDCB,show i+(k+1)=i+k+1 by omega]
 calc
  _ = (((k:ℝ)+1)*((i+k+1).choose i:ℝ))*betaQSeqMDCB d i k*((d:ℝ)+2*i+k+9) := by
    field_simp
    <;> ring
  _ = _ := by rw [hC]; ring

theorem stein_pair_balanceM208 (d i m k : ℕ) (hk : k < m) :
 steinPairM208 d i m k*steinBM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k=
 steinPairM208 d i m (k+1)*steinDM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) (k+1) := by
 have h0 := stein_density_stepM208 d i k
 have h1 := stein_density_stepM208 d i (m-(k+1))
 rw [show m-(k+1)+1=m-k by omega] at h1
 rw [Nat.cast_sub (by omega : k+1 ≤ m)] at h1
 push_cast at h1
 unfold steinPairM208 steinBM208 steinDM208
 linear_combination
  -steinDensityM208 d i (m-k)*((m:ℝ)-k)*((d:ℝ)+i+m-k+5)*h0+
  steinDensityM208 d i (k+1)*((k:ℝ)+1)*((d:ℝ)+i+k+6)*h1

theorem stein_finite_balanceM208 (m : ℕ) (w B D : ℕ → ℝ)
 (hB : B m=0) (hD : D 0=0)
 (hstep : ∀ k, k < m → w k*B k=w (k+1)*D (k+1)) :
 (∑ k ∈ range (m+1), w k*(B k*((m:ℝ)-2*k-1)+D k*(2*k-m-1)))=0 := by
 have h0 : (∑ k ∈ range (m+1), w k*B k*((m:ℝ)-2*k-1))=
   ∑ k ∈ range m, w k*B k*((m:ℝ)-2*k-1) := by
   rw [sum_range_succ,hB]
   simp
 have h1 : (∑ k ∈ range (m+1), w k*D k*(2*(k:ℝ)-m-1))=
   -(∑ k ∈ range m, w k*B k*((m:ℝ)-2*k-1)) := by
   rw [sum_range_succ']
   simp only [hD,mul_zero,zero_mul,add_zero]
   rw [←sum_neg_distrib]
   apply sum_congr rfl
   intro k hk
   rw [←hstep k (mem_range.mp hk)]
   push_cast
   ring
 simp only [mul_add,←mul_assoc,sum_add_distrib]
 rw [h0,h1]
 ring

theorem stein_pair_stationaryM208 (d i m : ℕ) :
 (∑ k ∈ range (m+1), steinPairM208 d i m k*
   steinLM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k)=0 := by
 apply stein_finite_balanceM208
 · simp [steinBM208]
 · simp [steinDM208]
 · intro k hk
   simpa only [Nat.cast_add,Nat.cast_one] using stein_pair_balanceM208 d i m k hk

end
end MathGKM.Markov
