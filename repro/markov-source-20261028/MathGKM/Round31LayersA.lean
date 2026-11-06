import MathGKM.Round31ExpansionA

/-! Machine-authored total-degree extraction attempt, round31. -/
namespace RightLayersR31
open MathGKM.Markov RightR30 RightExpansionR31
noncomputable section
open scoped BigOperators
set_option maxHeartbeats 2000000

def grade : BiPoly →+* Polynomial BiPoly := Polynomial.eval₂RingHom
  (Polynomial.eval₂RingHom (Int.castRingHom (Polynomial BiPoly))
    (Polynomial.C V*Polynomial.X)) (Polynomial.C U*Polynomial.X)

theorem grade_monomial (i j : ℕ) (c : ℤ) :
    grade (Polynomial.monomial i (Polynomial.monomial j c)) =
      Polynomial.monomial (i+j) (Polynomial.monomial i (Polynomial.monomial j c)) := by
  simp only [grade,Polynomial.coe_eval₂RingHom,Polynomial.eval₂_monomial]
  change (c : Polynomial BiPoly)*(Polynomial.C V*Polynomial.X)^j*
    (Polynomial.C U*Polynomial.X)^i = _
  simp only [← Polynomial.C_mul_X_pow_eq_monomial,Polynomial.C_mul,Polynomial.C_pow,map_intCast]
  have hc : (Polynomial.C (Polynomial.C (Polynomial.C c)) : Polynomial BiPoly) = (c : Polynomial BiPoly) :=
    map_intCast ((Polynomial.C : BiPoly →+* Polynomial BiPoly).comp
      ((Polynomial.C : Polynomial ℤ →+* BiPoly).comp (Polynomial.C : ℤ →+* Polynomial ℤ))) c
  rw [hc]
  dsimp [U,V]
  ring

theorem grade_coeff (P : BiPoly) (m i j : ℕ) :
    coeff ((grade P).coeff m) i j = if i+j=m then coeff P i j else 0 := by
  induction P using Polynomial.induction_on' with
  | add P Q hP hQ =>
    simp only [map_add,Polynomial.coeff_add,coeff] at *
    rw [hP,hQ]
    split_ifs <;> simp
  | monomial a p =>
    induction p using Polynomial.induction_on' with
    | add p q hp hq =>
      simp only [map_add,Polynomial.coeff_add,coeff] at *
      rw [hp,hq]
      split_ifs <;> simp
    | monomial b c =>
      rw [grade_monomial]
      by_cases ha : a=i
      · subst a
        by_cases hb : b=j
        · subst b; by_cases hm : i+j=m <;> simp [coeff,Polynomial.coeff_monomial,hm]
        · by_cases hm : i+b=m <;> simp [coeff,Polynomial.coeff_monomial,hb,hm]
      · by_cases hm : a+b=m <;> simp [coeff,Polynomial.coeff_monomial,ha,hm]

theorem grade_U : grade U=Polynomial.C U*Polynomial.X := by simp [grade,U]
theorem grade_V : grade V=Polynomial.C V*Polynomial.X := by simp [grade,V]
theorem grade_T : grade T=Polynomial.C T*Polynomial.X := by
  change grade (U+V)=Polynomial.C (U+V)*Polynomial.X
  rw [map_add,grade_U,grade_V,map_add,add_mul]

theorem grade_residual (n h : ℕ) (hh : h≤n) :
    grade (residual n h)=Polynomial.C (residual n h)*Polynomial.X^(n-h) := by
  classical
  have mon (c : ℤ) (a b : ℕ) : (c : BiPoly)*U^a*V^b =
      Polynomial.monomial a (Polynomial.monomial b c) := by
    simp only [← Polynomial.C_mul_X_pow_eq_monomial,Polynomial.C_mul,Polynomial.C_pow]
    have hc : (Polynomial.C (Polynomial.C c) : BiPoly) = (c : BiPoly) :=
      map_intCast ((Polynomial.C : Polynomial ℤ →+* BiPoly).comp
        (Polynomial.C : ℤ →+* Polynomial ℤ)) c
    rw [hc]
    dsimp [U,V]
    ring
  unfold RightExpansionR31.residual
  rw [map_sum,map_sum,Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro s hs
  have he : s+(n-h-s)=n-h := by have := Finset.mem_range.mp hs; omega
  have hc (z : ℤ) : (Polynomial.C (Polynomial.C z) : BiPoly) = (z : BiPoly) :=
    map_intCast ((Polynomial.C : Polynomial ℤ →+* BiPoly).comp
      (Polynomial.C : ℤ →+* Polynomial ℤ)) z
  rw [← Int.cast_mul,mon,grade_monomial,← mon,← Polynomial.C_mul_X_pow_eq_monomial,he]

theorem grade_block (n h : ℕ) (hh : h≤n) :
    grade (T^(2*h)*residual n h)=
      Polynomial.monomial (n+h) (T^(2*h)*residual n h) := by
  rw [map_mul,map_pow,grade_T,grade_residual n h hh]
  rw [← Polynomial.C_mul_X_pow_eq_monomial]
  simp only [map_mul,map_pow]
  have he : 2*h+(n-h)=n+h := by omega
  calc
    _ = ((Polynomial.C T)^(2*h)*Polynomial.C (residual n h))*
      (Polynomial.X^(2*h)*Polynomial.X^(n-h)) := by ring
    _ = _ := by rw [← pow_add,he]

theorem grade_expansion (k : ℕ) :
    grade (M k)=Polynomial.monomial (k+1) (U^(k+1))+
      ∑ t ∈ Finset.range (k+1),
        Polynomial.monomial (k+1+(t+1)) (T^(2*(t+1))*residual (k+1) (t+1)) := by
  rw [right_finite_expansion,map_add,map_sum]
  congr 1
  · rw [map_pow,grade_U,← Polynomial.C_mul_X_pow_eq_monomial,Polynomial.C_pow]
    ring
  · apply Finset.sum_congr rfl
    intro t ht
    exact grade_block _ _ (by have := Finset.mem_range.mp ht; omega)

theorem positive_layer (k h : ℕ) (hh : 1≤h) (hn : h≤k+1) :
    (grade (M k)).coeff (k+1+h)=T^(2*h)*residual (k+1) h := by
  classical
  rw [grade_expansion,Polynomial.coeff_add,Polynomial.finsetSum_coeff]
  rw [Finset.sum_eq_single (h-1)]
  · simp only [Polynomial.coeff_monomial,show h-1+1=h by omega,ite_true,if_neg (show k+1≠k+1+h by omega),zero_add]
  · intro t ht htn
    have he : k+1+(t+1)≠k+1+h := by omega
    simp only [Polynomial.coeff_monomial,if_neg he]
  · intro ht
    exact False.elim (ht (Finset.mem_range.mpr (by omega)))

theorem corner_layer (k : ℕ) : (grade (M k)).coeff (k+1)=U^(k+1) := by
  rw [grade_expansion,Polynomial.coeff_add,Polynomial.finsetSum_coeff]
  have hz : (∑ t ∈ Finset.range (k+1),
      (Polynomial.monomial (k+1+(t+1))
        (T^(2*(t+1))*residual (k+1) (t+1))).coeff (k+1))=0 := by
    apply Finset.sum_eq_zero
    intro t ht
    simp only [Polynomial.coeff_monomial,if_neg (show k+1+(t+1)≠k+1 by omega)]
  rw [hz]; simp only [Polynomial.coeff_monomial,ite_true,add_zero]

theorem outside_layer (k m : ℕ) (hm : m < k+1 ∨ 2*(k+1) < m) :
    (grade (M k)).coeff m=0 := by
  classical
  rw [grade_expansion,Polynomial.coeff_add,Polynomial.finsetSum_coeff]
  have hc : k+1≠m := by omega
  rw [Polynomial.coeff_monomial,if_neg hc,zero_add]
  apply Finset.sum_eq_zero
  intro t ht
  have he : k+1+(t+1)≠m := by have := Finset.mem_range.mp ht; omega
  simp only [Polynomial.coeff_monomial,if_neg he]

theorem positive_raw (k h i j : ℕ) (hh : 1≤h) (hn : h≤k+1)
    (hij : i+j=k+1+h) :
    coeff (M k) i j=coeff (T^(2*h)*residual (k+1) h) i j := by
  have hc := grade_coeff (M k) (k+1+h) i j
  rw [positive_layer k h hh hn,if_pos hij] at hc
  exact hc.symm

theorem corner_raw (k i j : ℕ) (hij : i+j=k+1) :
    coeff (M k) i j=coeff (U^(k+1)) i j := by
  have hc := grade_coeff (M k) (k+1) i j
  rw [corner_layer,if_pos hij] at hc
  exact hc.symm

theorem outside_raw (k i j : ℕ) (hij : i+j < k+1 ∨ 2*(k+1) < i+j) :
    coeff (M k) i j=0 := by
  have hc := grade_coeff (M k) (i+j) i j
  rw [outside_layer k (i+j) hij,if_pos rfl] at hc
  exact hc.symm.trans (by simp [coeff])

end
end RightLayersR31
