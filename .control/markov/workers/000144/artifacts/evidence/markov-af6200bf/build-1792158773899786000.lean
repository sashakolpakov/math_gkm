import Mathlib.Combinatorics.SetFamily.FourFunctions
import Mathlib
/-! Machine-authored af6200bf. A shifted min/max summation criterion.
This is a finite four-functions argument, not an assumed midpoint theorem. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 1000000

def padShiftMAF6 (a : ℕ → ℤ) (k : ℕ) : ℤ := if k=0 then 0 else a (k-1)

theorem sum_padShiftMAF6 (a : ℕ → ℤ) (n : ℕ) :
 (∑ k ∈ range (n+1), padShiftMAF6 a k)=∑ k ∈ range n, a k := by
 rw [sum_range_succ']
 simp [padShiftMAF6]

theorem shifted_sumMAF6 (a b c : ℕ → ℤ) (n : ℕ)
 (ha : ∀ k, 0 ≤ a k) (hb : ∀ k, 0 ≤ b k) (hc : ∀ k, 0 ≤ c k)
 (hbz : b (n+1)=0) (hcz : c (n+1)=0)
 (h : ∀ x y, a x*c y ≤ b (min (x+1) y)*b (max (x+1) y-1)) :
 (∑ k ∈ range (n+1), a k)*(∑ k ∈ range (n+1), c k) ≤
 (∑ k ∈ range (n+1), b k)^2 := by
 let f₁ : Fin (n+2) → ℤ := fun k => padShiftMAF6 a k
 let f₂ : Fin (n+2) → ℤ := fun k => c k
 let f₃ : Fin (n+2) → ℤ := fun k => b k
 let f₄ : Fin (n+2) → ℤ := fun k => padShiftMAF6 b k
 have hp (v : ℕ → ℤ) (hv : ∀ k, 0 ≤ v k) (k : ℕ) : 0 ≤ padShiftMAF6 v k := by
   unfold padShiftMAF6
   split_ifs <;> simp_all
 have hh : ∀ x y, f₁ x*f₂ y ≤ f₃ (x ⊓ y)*f₄ (x ⊔ y) := by
   intro x y
   by_cases hx : x.val=0
   · simp only [f₁,padShiftMAF6,hx,if_pos,zero_mul]
     exact mul_nonneg (hb _) (hp b hb _)
   · have hm : max x.val y.val ≠ 0 := by omega
     have he : x.val-1+1=x.val := by omega
     simpa [f₁,f₂,f₃,f₄,padShiftMAF6,hx,hm,he] using h (x.val-1) y.val
 have ht := four_functions_theorem_univ f₁ f₂ f₃ f₄
   (fun k => hp a ha k) (fun k => hc k) (fun k => hb k) (fun k => hp b hb k) hh
 simp only [f₁,f₂,f₃,f₄,Fin.sum_univ_eq_sum_range] at ht
 rw [show n+2=(n+1)+1 by omega,sum_padShiftMAF6,sum_padShiftMAF6,
   sum_range_succ,sum_range_succ,hbz,hcz,add_zero,add_zero] at ht
 simpa [pow_two] using ht

end
end MathGKM.Markov
