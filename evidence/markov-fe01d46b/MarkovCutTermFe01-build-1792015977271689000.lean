import MarkovConvolutionFe01
import MarkovCutMasksFe01
/-! Machine-authored fe01d46b. Every individual cut weight is PF2 and hence
raw coefficient log-concave. This does not assert closure under summation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def resetPolyFe01 (n : ℕ) : ℝ[X] := 1+2*runSumA27 X n
def purePolyFe01 (n : ℕ) : ℝ[X] := resetPolyFe01 n+X^(n+1)

theorem runSum_coeffFe01 (n k : ℕ) :
 (runSumA27 (X:ℝ[X]) n).coeff k=if 1≤k ∧ k≤n then 1 else 0 := by
 induction n with
 | zero => simp [runSumA27]; omega
 | succ n ih =>
   have he : runSumA27 (X:ℝ[X]) (n+1)=runSumA27 X n+X^(n+1) := by
     simp [runSumA27,sum_range_succ]
   rw [he,Polynomial.coeff_add,ih,Polynomial.coeff_X_pow]
   split_ifs <;> norm_num at * <;> omega

theorem toe_resetFe01 (n a b : ℕ) :
 toeFe01 (resetPolyFe01 n) a b=
 if a=b then 1 else if a<b ∧ b≤a+n then 2 else 0 := by
 simp only [toeFe01,resetPolyFe01,Polynomial.coeff_add,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_one,runSum_coeffFe01]
 split_ifs <;> norm_num at * <;> omega

theorem toe_pureFe01 (n a b : ℕ) :
 toeFe01 (purePolyFe01 n) a b=
 if a=b ∨ b=a+n+1 then 1 else if a<b ∧ b≤a+n then 2 else 0 := by
 have he : toeFe01 (purePolyFe01 n) a b=
   toeFe01 (resetPolyFe01 n) a b+toeFe01 (X^(n+1)) a b := by
   simp [toeFe01,purePolyFe01]; split_ifs <;> simp
 rw [he,toe_resetFe01]
 simp only [toeFe01,Polynomial.coeff_X_pow]
 split_ifs <;> norm_num at * <;> omega

theorem reset_pf2Fe01 (n : ℕ) : PolyPF2Fe01 (resetPolyFe01 n) := by
 intro a b c d hab hcd
 simp only [toe_resetFe01]
 split_ifs <;> norm_num at * <;> omega

theorem pure_pf2Fe01 (n : ℕ) : PolyPF2Fe01 (purePolyFe01 n) := by
 intro a b c d hab hcd
 simp only [toe_pureFe01]
 split_ifs <;> norm_num at * <;> omega

theorem one_pf2Fe01 : PolyPF2Fe01 (1:ℝ[X]) := by
 simpa [resetPolyFe01,runSumA27] using reset_pf2Fe01 0
theorem cutFactor_pf2Fe01 (r : Bool) : PolyPF2Fe01 (cutFactorA27 (X:ℝ[X]) r) := by
 cases r
 · simpa [cutFactorA27] using one_pf2Fe01
 · simpa [cutFactorA27,purePolyFe01,resetPolyFe01,runSumA27] using pure_pf2Fe01 0

theorem gap_classFe01 (w : List Bool) : ∃ n,
 gapWeightA27 (X:ℝ[X]) w=resetPolyFe01 n ∨
 gapWeightA27 (X:ℝ[X]) w=purePolyFe01 n := by
 induction w using List.reverseRecOn with
 | nil => exact ⟨0,Or.inr (by simp [gapWeightA27,gapChargeA27,purePolyFe01,
       resetPolyFe01,runSumA27]; ring)⟩
 | append_singleton w r ih =>
   cases r with
   | false =>
     refine ⟨0,Or.inl ?_⟩
     simp [gapWeightA27,gapCharge_appendA27,gapChargeA27,cutChargeA27,
       resetPolyFe01,runSumA27]
   | true =>
     obtain ⟨n,hn|hn⟩ := ih
     · refine ⟨n+1,Or.inl ?_⟩
       simp only [gapWeightA27] at hn ⊢
       simp only [gapCharge_appendA27,gapChargeA27,cutChargeA27,if_true]
       simp only [resetPolyFe01] at hn ⊢
       rw [runSum_succA27]
       linear_combination X*hn
     · refine ⟨n+1,Or.inr ?_⟩
       simp only [gapWeightA27] at hn ⊢
       simp only [gapCharge_appendA27,gapChargeA27,cutChargeA27,if_true]
       simp only [purePolyFe01,resetPolyFe01] at hn ⊢
       rw [runSum_succA27,pow_succ X (n+1)]
       linear_combination X*hn

theorem gap_pf2Fe01 (w : List Bool) : PolyPF2Fe01 (gapWeightA27 (X:ℝ[X]) w) := by
 obtain ⟨n,h|h⟩ := gap_classFe01 w
 · rw [h]; exact reset_pf2Fe01 n
 · rw [h]; exact pure_pf2Fe01 n

theorem mask_gap_pf2Fe01 (m : List (Bool × Bool)) (g : List Bool) :
 PolyPF2Fe01 (maskWeight340 (X:ℝ[X]) (gapChargeA27 X X 1 g) 1 m) := by
 induction m generalizing g with
 | nil => exact one_pf2Fe01
 | cons rb rs ih =>
   obtain ⟨r,b⟩ := rb
   cases b with
   | false =>
     have h := ih (g++[r])
     simpa [maskWeight340,gapCharge_appendA27,gapChargeA27] using h
   | true =>
     have h := polyPF2_mulFe01 (polyPF2_mulFe01 (cutFactor_pf2Fe01 r)
       (gap_pf2Fe01 g)) (ih [])
     simpa [maskWeight340,gapWeightA27,gapChargeA27] using h

theorem mask_pf2Fe01 (m : List (Bool × Bool)) :
 PolyPF2Fe01 (maskWeight340 (X:ℝ[X]) X 1 m) := mask_gap_pf2Fe01 m []

theorem mask_logConcaveFe01 (m : List (Bool × Bool)) (k : ℕ) :
 (maskWeight340 (X:ℝ[X]) X 1 m).coeff k*
 (maskWeight340 (X:ℝ[X]) X 1 m).coeff (k+2)≤
 ((maskWeight340 (X:ℝ[X]) X 1 m).coeff (k+1))^2 :=
 polyPF2_adjacentFe01 (mask_pf2Fe01 m) k

#print axioms gap_pf2Fe01
#print axioms mask_pf2Fe01
#print axioms mask_logConcaveFe01
end
end MathGKM.Markov
