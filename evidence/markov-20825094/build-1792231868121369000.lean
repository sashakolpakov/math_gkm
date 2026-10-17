import MarkovTopSteinGroupsM208
/-! Machine-authored 20825094. Exact endpoint-weight correction identity.
The correction is nonnegative; its strength outside the proved wedge is open. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000

theorem stein_finite_partsM208 (m : ℕ) (w B D f : ℕ → ℝ)
 (hB : B m=0) (hD : D 0=0)
 (hstep : ∀ k, k < m → w k*B k=w (k+1)*D (k+1)) :
 (∑ k ∈ range (m+1), w k*f k*(B k*((m:ℝ)-2*k-1)+D k*(2*k-m-1)))=
 -(∑ k ∈ range m, w k*B k*(f (k+1)-f k)*((m:ℝ)-2*k-1)) := by
 have h0 : (∑ k ∈ range (m+1), w k*f k*B k*((m:ℝ)-2*k-1))=
   ∑ k ∈ range m, w k*f k*B k*((m:ℝ)-2*k-1) := by
   rw [sum_range_succ,hB]
   simp
 have h1 : (∑ k ∈ range (m+1), w k*f k*D k*(2*(k:ℝ)-m-1))=
   -(∑ k ∈ range m, w k*B k*f (k+1)*((m:ℝ)-2*k-1)) := by
   rw [sum_range_succ']
   simp only [hD,mul_zero,zero_mul,add_zero]
   rw [←sum_neg_distrib]
   apply sum_congr rfl
   intro k hk
   have hh := hstep k (mem_range.mp hk)
   push_cast
   linear_combination -f (k+1)*(2*(k:ℝ)-(m:ℝ)+1)*hh
 simp only [mul_add,←mul_assoc,sum_add_distrib]
 rw [h0,h1,←sub_eq_add_neg,←sum_sub_distrib,←sum_neg_distrib]
 apply sum_congr rfl
 intro k hk
 ring

def steinMassM208 (d i r m : ℕ) : ℝ :=
 ∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k
def steinSpreadM208 (d i r m : ℕ) : ℝ :=
 ∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   ((k:ℝ)*((m:ℝ)-k))*((m:ℝ)^2-4*((k:ℝ)*((m:ℝ)-k)))
def steinEnergyM208 (d i r m : ℕ) : ℝ :=
 ∑ k ∈ range m, steinPairM208 d i m k*
   steinBM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k*
   (steinCutM208 r m (k+1)-steinCutM208 r m k)*((m:ℝ)-2*k-1)

theorem stein_cut_partsM208 (d i r m : ℕ) :
 (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   steinLM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k)=-steinEnergyM208 d i r m := by
 apply stein_finite_partsM208
 · simp [steinBM208]
 · simp [steinDM208]
 · intro k hk
   simpa only [Nat.cast_add,Nat.cast_one] using stein_pair_balanceM208 d i m k hk

theorem stein_spread_nonnegM208 (d i r m : ℕ) : 0 ≤ steinSpreadM208 d i r m := by
 apply sum_nonneg
 intro k hk
 have hk' : k ≤ m := by have := mem_range.mp hk; omega
 have hkR : (k:ℝ) ≤ m := by exact_mod_cast hk'
 have hp : 0 ≤ (k:ℝ)*((m:ℝ)-k) := mul_nonneg (by positivity) (by linarith)
 have hs : 0 ≤ (m:ℝ)^2-4*((k:ℝ)*((m:ℝ)-k)) := by nlinarith [sq_nonneg ((m:ℝ)-2*k)]
 exact mul_nonneg (mul_nonneg (mul_nonneg (stein_pair_positiveM208 d i m k).le
   (mul_nonneg (beta_weight_nonnegMDCB r k) (beta_weight_nonnegMDCB r (m-k)))) hp) hs

theorem stein_cut_edge_nonnegM208 (r m k : ℕ) (hk : k < m) :
 0 ≤ (steinCutM208 r m (k+1)-steinCutM208 r m k)*((m:ℝ)-2*k-1) := by
 by_cases hmid : 2*k+1 ≤ m
 · have h := stein_cut_inwardM208 r m k hmid
   have hR : 2*(k:ℝ)+1 ≤ m := by exact_mod_cast hmid
   exact mul_nonneg (sub_nonneg.mpr h) (by linarith)
 · have hmid' : 2*(m-(k+1))+1 ≤ m := by omega
   have h := stein_cut_inwardM208 r m (m-(k+1)) hmid'
   rw [show m-(k+1)+1=m-k by omega,
     stein_cut_symmetricM208 r m k (by omega),
     stein_cut_symmetricM208 r m (k+1) (by omega)] at h
   have hR : (m:ℝ) ≤ 2*k+1 := by exact_mod_cast (show m ≤ 2*k+1 by omega)
   exact mul_nonneg_of_nonpos_of_nonpos (sub_nonpos.mpr h) (by linarith)

theorem stein_energy_nonnegM208 (d i r m : ℕ) : 0 ≤ steinEnergyM208 d i r m := by
 apply sum_nonneg
 intro k hk
 have hk' := mem_range.mp hk
 have hkR : (k:ℝ) < m := by exact_mod_cast hk'
 have hB : 0 ≤ steinBM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k := by
   unfold steinBM208
   have h1 : 0 ≤ (m:ℝ)-k := by linarith
   have h2 : 0 ≤ (d:ℝ)+2*i+9-((i:ℝ)+1)-3+m-k := by
     have : (0:ℝ) ≤ d := by positivity
     have : (0:ℝ) ≤ i := by positivity
     linarith
   positivity
 have hh := mul_nonneg (mul_nonneg (stein_pair_positiveM208 d i m k).le hB)
   (stein_cut_edge_nonnegM208 r m k hk')
 simpa only [mul_assoc] using hh

theorem stein_group_correctionM208 (d i r m : ℕ) :
 let a : ℝ := i+1
 let H : ℝ := d+2*i+9
 steindenM208 a m H*(4*a+7)*betaGroupMCA9 d i r m=
 a*m*(m-1)*steinreducedM208 a m H*steinMassM208 d i r m+
 steinCpM208 a m H*(8*a+14)*steinSpreadM208 d i r m+
 (2*(a+2)*steindenM208 a m H+4*steinCpM208 a m H)*steinEnergyM208 d i r m := by
 dsimp only
 let a : ℝ := i+1
 let H : ℝ := d+2*i+9
 let A := steindenM208 a m H*(4*a+7)
 let C := 2*(a+2)*steindenM208 a m H+4*steinCpM208 a m H
 let K := a*m*(m-1)*steinreducedM208 a m H
 let J := steinCpM208 a m H*(8*a+14)
 have hscalar : (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   steinScalarM208 a H k ((m:ℝ)-k))=betaGroupMCA9 d i r m := by
   unfold betaGroupMCA9
   apply sum_congr rfl
   intro k hk
   rw [stein_pair_cutM208,stein_scalar_castM208 d i m k (by have := mem_range.mp hk; omega)]
 change A*betaGroupMCA9 d i r m=K*steinMassM208 d i r m+
   J*steinSpreadM208 d i r m+C*steinEnergyM208 d i r m
 calc
  _ = ∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
      (A*steinScalarM208 a H k ((m:ℝ)-k)) := by
    rw [←hscalar,mul_sum];apply sum_congr rfl;intro k hk;ring
  _ = ∑ k ∈ range (m+1),
      (K*(steinPairM208 d i m k*steinCutM208 r m k)+
       J*(steinPairM208 d i m k*steinCutM208 r m k*
        ((k:ℝ)*((m:ℝ)-k))*((m:ℝ)^2-4*((k:ℝ)*((m:ℝ)-k))))-
       C*(steinPairM208 d i m k*steinCutM208 r m k*steinLM208 a m H k)) := by
    apply sum_congr rfl
    intro k hk
    have he := stein_point_certificateM208 a m H k
    dsimp [A,C,K,J]
    linear_combination steinPairM208 d i m k*steinCutM208 r m k*he
  _ = K*steinMassM208 d i r m+J*steinSpreadM208 d i r m-
      C*(∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*steinLM208 a m H k) := by
    simp only [sum_sub_distrib,sum_add_distrib,←mul_sum]
    rfl
  _ = _ := by
    rw [stein_cut_partsM208]
    ring

end
end MathGKM.Markov
