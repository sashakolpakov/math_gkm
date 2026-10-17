import MarkovSuppressionBinomialM9C28
import MarkovMassBridgeM9C28
/-! Machine-authored request 9c28b628. An injective term comparison from
the whole correction to the base. No signed gap is discarded. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def rampNatM9C28 (t j k : ℕ) : ℕ :=
 ∑ s ∈ range (min j k+1), (if s=0 then 1 else 4*s)*
   (j-s+t+3).choose (t+3)*(k-s+t).choose t
def affineNatM9C28 (e t J K : ℕ) : ℕ :=
 ∑ s ∈ range (min J K+1), (3*s+e)*
   (J-s+t+2).choose (t+2)*(K-s+t+1).choose (t+1)

theorem suppression_sumM9C28 (e t J K : ℕ) (he : 1 ≤ e) :
 2*(t+4)*(4*affineNatM9C28 e t J K) ≤
 rampNatM9C28 t (2*J+K+t+e+2) (J+2*K+t+e+3) := by
 let j := 2*J+K+t+e+2
 let k := J+2*K+t+e+3
 let f : ℕ → ℕ := fun a => (if a=0 then 1 else 4*a)*
   (j-a+t+3).choose (t+3)*(k-a+t).choose t
 let I := range (min J K+1)
 have hinj : Set.InjOn (fun s : ℕ => 3*s+e) I := by intro a ha b hb hab; dsimp at hab; omega
 have hsubset : I.image (fun s => 3*s+e) ⊆ range (min j k+1) := by
   intro a ha
   obtain ⟨s,hs,rfl⟩ := mem_image.mp ha
   have hs' : s ≤ J ∧ s ≤ K := by simpa [I] using hs
   simp only [mem_range]
   dsimp [j,k]
   omega
 have hsum : 2*(t+4)*(4*affineNatM9C28 e t J K) ≤ ∑ s ∈ I, f (3*s+e) := by
   unfold affineNatM9C28
   rw [mul_sum,mul_sum]
   apply sum_le_sum
   intro s hs
   have hs' : s ≤ J ∧ s ≤ K := by simpa using hs
   have h := Nat.mul_le_mul_left (4*(3*s+e)) (suppression_binomialM9C28 (J-s) (K-s) t)
   have hja : j-(3*s+e)+t+3=2*(J-s)+(K-s)+2*t+5 := by dsimp [j]; omega
   have hka : k-(3*s+e)+t=(J-s)+2*(K-s)+2*t+3 := by dsimp [k]; omega
   dsimp [f]
   rw [if_neg (by omega : 3*s+e≠0),hja,hka]
   convert h using 1 <;> ring_nf
 calc
  _ ≤ ∑ s ∈ I, f (3*s+e) := hsum
  _ = ∑ a ∈ I.image (fun s => 3*s+e), f a := (sum_image hinj).symm
  _ ≤ ∑ a ∈ range (min j k+1), f a := sum_le_sum_of_subset_of_nonneg hsubset (by intros; omega)
  _ = _ := rfl

theorem ramp_nat_realM9C28 (t j k : ℕ) : (rampNatM9C28 t j k:ℝ)=lowerDiagMF88 t j k := by
 rw [lower_diag_kernelM9F23]
 unfold rampNatM9C28 kernelM9F23 diagSumMDB9
 push_cast
 apply sum_congr rfl
 intro s hs
 have hs' : s ≤ j ∧ s ≤ k := by simpa using hs
 rw [show (j:ℤ)-s=((j-s:ℕ):ℤ) by omega,
   show (k:ℤ)-s=((k-s:ℕ):ℤ) by omega,nbSeq_natMDB9,nbSeq_natMDB9]
 simp only [show j-s+(t+3)=j-s+t+3 by omega]
 by_cases hz : s=0
 · subst s; norm_num [rampWeightMF88]
 · have hn : ¬((s:ℤ)<0) := by omega
   simp [rampWeightMF88,hz,hn]

theorem affine_nat_realM9C28 (e t J K : ℕ) :
 (affineNatM9C28 e t J K:ℝ)=affineKernelM13E e (t+2) (t+1) J K := by
 unfold affineNatM9C28 affineKernelM13E diagSumMDB9
 push_cast
 apply sum_congr rfl
 intro s hs
 have hs' : s ≤ J ∧ s ≤ K := by simpa using hs
 rw [show (J:ℤ)-s=((J-s:ℕ):ℤ) by omega,
   show (K:ℤ)-s=((K-s:ℕ):ℤ) by omega,nbSeq_natMDB9,nbSeq_natMDB9]
 have hn : ¬((s:ℤ)<0) := by omega
 simp [affineWeightM13E,hn,Nat.add_assoc]

theorem suppression_kernelM9C28 (e t J K : ℕ) (he : 1 ≤ e) :
 2*(t+4:ℕ)*(4*affineKernelM13E e (t+2) (t+1) J K) ≤
 lowerDiagMF88 t (2*J+K+t+e+2) (J+2*K+t+e+3) := by
 rw [←ramp_nat_realM9C28,←affine_nat_realM9C28]
 exact_mod_cast suppression_sumM9C28 e t J K he

end
end MathGKM.Markov
