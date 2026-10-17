import MarkovSharpScalarsClosedM09F
/-! Machine-authored 09fffb56. An alternative unshifted ratio criterion for
the remaining sharp margin. Its premise is not asserted as a theorem. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem ordered_weighted_sumM09F (N : ℕ) (a b w : ℕ → ℝ)
 (h : ∀ i j, i ≤ j → a i*b j ≤ a j*b i) (hw : Monotone w) :
 (∑ i ∈ range N, a i)*(∑ i ∈ range N, b i*w i) ≤
 (∑ i ∈ range N, b i)*(∑ i ∈ range N, a i*w i) := by
 have hp (i j : ℕ) : 0 ≤ (a j*b i-a i*b j)*(w j-w i) := by
   rcases le_total i j with hij|hji
   · exact mul_nonneg (sub_nonneg.mpr (h i j hij)) (sub_nonneg.mpr (hw hij))
   · have hh := mul_nonneg (sub_nonneg.mpr (h j i hji)) (sub_nonneg.mpr (hw hji))
     nlinarith only [hh]
 have H : 0 ≤ ∑ i ∈ range N, ∑ j ∈ range N,
     (a j*b i-a i*b j)*(w j-w i) := by
   exact sum_nonneg (fun i _ => sum_nonneg (fun j _ => hp i j))
 have he : (∑ i ∈ range N, ∑ j ∈ range N, (a j*b i-a i*b j)*(w j-w i))=
     2*((∑ i ∈ range N, b i)*(∑ i ∈ range N, a i*w i)-
       (∑ i ∈ range N, a i)*(∑ i ∈ range N, b i*w i)) := by
   calc
    _ = ∑ i ∈ range N, ∑ j ∈ range N,
      (b i*(a j*w j)-(b i*w i)*a j-a i*(b j*w j)+(a i*w i)*b j) := by
       apply sum_congr rfl
       intro i hi
       apply sum_congr rfl
       intro j hj
       ring
    _ = _ := by
      simp only [sum_sub_distrib,sum_add_distrib,←mul_sum,←sum_mul]
      ring
 rw [he] at H
 linarith

theorem translated_coeff_sumM09F (P : ℝ[X]) (N m : ℕ) (hN : P.natDegree < N) :
 (P.comp (X+1)).coeff m=∑ i ∈ range N, P.coeff i*(i.choose m:ℝ) := by
 conv_lhs => rw [P.as_sum_range' N hN]
 simp only [Polynomial.sum_comp,Polynomial.monomial_comp,Polynomial.finsetSum_coeff,
   Polynomial.coeff_C_mul,Polynomial.coeff_X_add_one_pow]

theorem translated_zero_ratioM09F (P Q : ℝ[X])
 (H : ∀ i j, i ≤ j → P.coeff i*Q.coeff j ≤ P.coeff j*Q.coeff i) (n : ℕ) :
 (P.comp (X+1)).coeff 0*(Q.comp (X+1)).coeff n ≤
 (Q.comp (X+1)).coeff 0*(P.comp (X+1)).coeff n := by
 let N := max P.natDegree Q.natDegree+1
 have hp : P.natDegree < N := by dsimp [N]; omega
 have hq : Q.natDegree < N := by dsimp [N]; omega
 rw [translated_coeff_sumM09F P N 0 hp,translated_coeff_sumM09F Q N n hq,
   translated_coeff_sumM09F Q N 0 hq,translated_coeff_sumM09F P N n hp]
 simp only [Nat.choose_zero_right,Nat.cast_one,mul_one]
 apply ordered_weighted_sumM09F N P.coeff Q.coeff (fun i => (i.choose n:ℝ)) H
 intro i j hij
 change (i.choose n:ℝ) ≤ (j.choose n:ℝ)
 exact_mod_cast Nat.choose_le_choose n hij

def UnshiftedRatioM09F : Prop := ∀ j s i n : ℕ, i ≤ n →
 (qPolyM7E2 j (s+1)^2).coeff i*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff n ≤
 (qPolyM7E2 j (s+1)^2).coeff n*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff i

theorem sharp_margin_of_unshiftedM09F (H : UnshiftedRatioM09F) : SharpCompleteMarginMBE3 := by
 intro j s n
 have h := translated_zero_ratioM09F (qPolyM7E2 j (s+1)^2)
   (qPolyM7E2 j s*qPolyM7E2 j (s+2)) (H j s) n
 rw [Polynomial.pow_comp,Polynomial.mul_comp] at h
 change (completeLiftMA64 j (s+1)^2).coeff 0*
     (completeLiftMA64 j s*completeLiftMA64 j (s+2)).coeff n ≤
   (completeLiftMA64 j s*completeLiftMA64 j (s+2)).coeff 0*
     (completeLiftMA64 j (s+1)^2).coeff n at h
 simpa only [pow_two,Polynomial.mul_coeff_zero,complete_coeffMA64] using h

theorem source_band_of_unshiftedM09F (H : UnshiftedRatioM09F)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_all_of_marginM09F (sharp_margin_of_unshiftedM09F H) q k i r hq hn

theorem ordinary_concavity_obstructionM09F :
 2*normalizedCoeffM09F 6 1 6-normalizedCoeffM09F 6 0 6-normalizedCoeffM09F 6 2 6 = -4/35035 := by
 norm_num [normalizedCoeffM09F,liftTermMAE9,Nat.choose]

theorem ordinary_concavity_falseM09F : ¬ (∀ j s m : ℕ,
 normalizedCoeffM09F j s m+normalizedCoeffM09F j (s+2) m ≤ 2*normalizedCoeffM09F j (s+1) m) := by
 intro H
 have h := H 6 0 6
 have he := ordinary_concavity_obstructionM09F
 norm_num at h
 linarith

end
end MathGKM.Markov
