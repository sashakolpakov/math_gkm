import MarkovTopBetaComparisonMCA9
/-! Machine-authored ca9709f2. Exact finite antidiagonal assembly of the
likelihood-weighted quadratic gap. Zero extensions are retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

def betaDensityMCA9 (d i r k : ℕ) : ℝ :=
 ((i+k).choose i:ℝ)*betaLikelihoodMDCB d i r k

def betaSumAMCA9 (d i r : ℕ) : ℝ :=
 ∑ k ∈ range (r+1), betaDensityMCA9 d i r k
def betaSumEMCA9 (d i r : ℕ) : ℝ :=
 ∑ k ∈ range (r+1), betaDensityMCA9 d i r k*(k:ℝ)*((d:ℝ)+2*i+9+k)
def betaSumCMCA9 (d i r : ℕ) : ℝ :=
 ∑ k ∈ range (r+1), betaDensityMCA9 d i r k*(k:ℝ)*(k-1)*
   ((d:ℝ)+2*i+9+k)*((d:ℝ)+2*i+10+k)
def betaDensityGapMCA9 (d i r : ℕ) : ℝ :=
 ((i:ℝ)+2)*(i+5)*betaSumEMCA9 d i r^2-
 ((i:ℝ)+1)*(i+4)*betaSumAMCA9 d i r*betaSumCMCA9 d i r

theorem beta_density_zeroMCA9 (d i r k : ℕ) (hk : r < k) :
 betaDensityMCA9 d i r k=0 := by
 simp [betaDensityMCA9,betaLikelihoodMDCB,betaWeightMDCB,
   show k≠r by omega,show ¬k<r by omega]

theorem antidiagonal_squareMCA9 (r : ℕ) (f : ℕ → ℕ → ℝ)
 (hz0 : ∀ k l, r < k → f k l=0) (hz1 : ∀ k l, r < l → f k l=0) :
 (∑ m ∈ range (2*r+1), ∑ k ∈ range (m+1), f k (m-k))=
 ∑ k ∈ range (r+1), ∑ l ∈ range (r+1), f k l := by
 rw [sum_range_diag_flip]
 calc
  _ = ∑ k ∈ range (r+1), ∑ l ∈ range (2*r+1-k), f k l := by
    symm
    apply sum_subset (range_mono (by omega))
    intro k hk hn
    apply sum_eq_zero
    intro l hl
    exact hz0 k l (by simp only [mem_range] at hn; omega)
  _ = _ := by
    apply sum_congr rfl
    intro k hk
    symm
    apply sum_subset (range_mono (by have := mem_range.mp hk; omega))
    intro l hl hn
    exact hz1 k l (by simp only [mem_range] at hn; omega)

theorem beta_group_densityMCA9 (d i r m : ℕ) :
 betaGroupMCA9 d i r m=
 ∑ k ∈ range (m+1), betaDensityMCA9 d i r k*betaDensityMCA9 d i r (m-k)*
   (betaScalarMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) k ((m-k:ℕ):ℤ):ℝ) := by
 unfold betaGroupMCA9 betaBaseWeightMCA9 betaPairLikelihoodMCA9 betaGroupScalarMCA9 betaDensityMCA9
 apply sum_congr rfl
 intro k hk
 ring

theorem beta_group_sum_identityMCA9 (d i r : ℕ) :
 (∑ m ∈ range (2*r+1), betaGroupMCA9 d i r m)=2*betaDensityGapMCA9 d i r := by
 simp_rw [beta_group_densityMCA9]
 rw [antidiagonal_squareMCA9 r (fun k l => betaDensityMCA9 d i r k*betaDensityMCA9 d i r l*
   (betaScalarMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) k l:ℝ))
   (fun k l hk => by rw [beta_density_zeroMCA9 d i r k hk]; ring)
   (fun k l hl => by rw [beta_density_zeroMCA9 d i r l hl]; ring)]
 unfold betaDensityGapMCA9 betaSumAMCA9 betaSumEMCA9 betaSumCMCA9
 calc
  _ = ∑ k ∈ range (r+1), ∑ l ∈ range (r+1),
    (2*((i:ℝ)+2)*(i+5)*
      ((betaDensityMCA9 d i r k*k*((d:ℝ)+2*i+9+k))*
       (betaDensityMCA9 d i r l*l*((d:ℝ)+2*i+9+l)))-
    ((i:ℝ)+1)*(i+4)*
      ((betaDensityMCA9 d i r k*k*(k-1)*((d:ℝ)+2*i+9+k)*((d:ℝ)+2*i+10+k))*
        betaDensityMCA9 d i r l+
       betaDensityMCA9 d i r k*
       (betaDensityMCA9 d i r l*l*(l-1)*((d:ℝ)+2*i+9+l)*((d:ℝ)+2*i+10+l)))) := by
    apply sum_congr rfl; intro k hk
    apply sum_congr rfl; intro l hl
    unfold betaScalarMCA9
    push_cast
    ring
  _ = _ := by
    simp only [mul_add,sum_sub_distrib,sum_add_distrib,←mul_sum,←sum_mul]
    ring

theorem beta_group_zeroMCA9 (d i r : ℕ) : betaGroupMCA9 d i r 0=0 := by
 simp [betaGroupMCA9,betaGroupScalarMCA9,betaScalarMCA9]

theorem beta_group_oneMCA9 (d i r : ℕ) : betaGroupMCA9 d i r 1=0 := by
 norm_num [betaGroupMCA9,betaGroupScalarMCA9,betaScalarMCA9,sum_range_succ]

theorem beta_density_gap_positiveMCA9 (d i r : ℕ)
 (hd : i+4*r ≤ d+1) (hr : 1 ≤ r) :
 0 < betaDensityGapMCA9 d i r := by
 have hsum : 0 < ∑ m ∈ range (2*r+1), betaGroupMCA9 d i r m := by
   apply sum_pos'
   · intro m hm
     by_cases hm2 : 2 ≤ m
     · exact (beta_group_positiveMCA9 d i r m hd hm2 (by have := mem_range.mp hm; omega)).le
     · interval_cases m
       · rw [beta_group_zeroMCA9]
       · rw [beta_group_oneMCA9]
   · exact ⟨2,mem_range.mpr (by omega),beta_group_positiveMCA9 d i r 2 hd le_rfl (by omega)⟩
 rw [beta_group_sum_identityMCA9] at hsum
 linarith

end
end MathGKM.Markov
