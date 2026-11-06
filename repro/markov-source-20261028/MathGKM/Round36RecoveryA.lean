import MathGKM.Round36KernelA
import MathGKM.Acceptedb8df3e2c5c06edf954fe0b4e

/-! Machine-authored round36: raw recovery independent of the failed midpoint inequality. -/
namespace MidpointR36
open MathGKM.Markov RightR30 RightLayersR31 RightExpansionR31
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000

def spec : BiPoly →+* Polynomial ℤ := Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ))

theorem layer_spec (P : BiPoly) (i j : ℕ) :
    (spec ((grade P).coeff (i+j))).coeff i=coeff P i j := by
  classical
  let Q := (grade P).coeff (i+j)
  have recover (t : ℕ) : coeff Q i t = if i+t=i+j then coeff P i t else 0 :=
    Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.1 P (i+j) i t
  simp only [spec,Polynomial.coe_mapRingHom,Polynomial.coeff_map,
    Polynomial.coe_evalRingHom]
  change (Q.coeff i).eval 1=coeff P i j
  rw [Polynomial.eval_eq_sum]
  simp only [Polynomial.sum,one_pow,mul_one]
  rw [Finset.sum_eq_single j]
  · change coeff Q i j=coeff P i j
    rw [recover,if_pos rfl]
  · intro t ht htj
    change coeff Q i t=0
    rw [recover,if_neg (by omega)]
  · intro hj
    simpa only [Polynomial.mem_support_iff,not_not] using hj

theorem row_spec (n h i : ℕ) :
    (spec (∑ s ∈ Finset.range (n+1),
      (RenewalR28.mc n h s : BiPoly)*T^(2*h)*U^s*V^(n-h-s))).coeff i =
    ∑ s ∈ Finset.range (n+1),
      if s ≤ i then RenewalR28.mc n h s*((2*h).choose (i-s) : ℤ) else 0 := by
  classical
  rw [map_sum,Polynomial.finsetSum_coeff]
  apply Finset.sum_congr rfl
  intro s hs
  have he : spec ((RenewalR28.mc n h s : BiPoly)*T^(2*h)*U^s*V^(n-h-s)) =
      (Polynomial.C (RenewalR28.mc n h s)*(1+Polynomial.X)^(2*h))*Polynomial.X^s := by
    simp [spec,T,U,V,add_comm]
  rw [he,Polynomial.coeff_mul_X_pow']
  by_cases hsi : s ≤ i
  · simp [hsi,Polynomial.coeff_C_mul,Polynomial.coeff_one_add_X_pow]
  · simp [hsi]

theorem recovery_k (k i j : ℕ) :
    coeff (frame (List.replicate k true)).mid.p i j =
      ∑ s ∈ Finset.range (k+2), W (k+1) i j s := by
  classical
  change coeff (M k) i j = _
  by_cases hout : (i+j < k+1 ∨ 2*(k+1) < i+j)
  · have hc := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.2.2.2 k (i+j) hout
    have hz := layer_spec (M k) i j
    rw [hc] at hz
    have hzero : coeff (M k) i j=0 := hz.symm.trans (by simp [spec])
    rw [hzero]
    apply Eq.symm
    apply Finset.sum_eq_zero
    intro s hs
    simp only [W]
    rw [if_neg (by omega)]
  · let h := i+j-(k+1)
    have hn : h≤k+1 := by dsimp [h]; omega
    have he : k+1+h=i+j := by dsimp [h]; omega
    have hf : (grade (M k)).coeff (i+j) =
        ∑ s ∈ Finset.range (k+2),
          (RenewalR28.mc (k+1) h s : BiPoly)*T^(2*h)*U^s*V^(k+1-h-s) := by
      by_cases hh : h=0
      · have hc := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.2.1 k
        have hm : i+j=k+1 := by omega
        rw [hm,hc,hh,row_zero]
      · have hc := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.2.2.1 k h (by omega) hn
        rw [he] at hc
        rw [hc,row_positive (k+1) h (by omega) hn]
    rw [← layer_spec (M k) i j,hf,row_spec]
    apply Finset.sum_congr rfl
    intro s hs
    unfold W
    by_cases hsi : s ≤ i
    · rw [if_pos hsi,if_pos (by omega)]
    · rw [if_neg hsi,if_neg (by omega)]

theorem recovery (n : ℕ) (hn : 1≤n) (i j : ℕ) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j =
      ∑ s ∈ Finset.range (n+1), W n i j s := by
  have h := recovery_k (n-1) i j
  simpa only [show n-1+1=n by omega,show n-1+2=n+1 by omega] using h

end
end MidpointR36

#print axioms MidpointR36.recovery
