import MarkovQuarticLCF650
import MarkovVerticalTwo3556

/-! Machine-authored request f6506bc6. Exact source scope for the new column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem source_near_one_path650 (path : List Bool)
    (h : (frame path).mid.b=(frame path).mid.a+1) :
    ∃ n, path=List.replicate n true := by
  induction path using List.reverseRecOn with
  | nil => exact ⟨0,rfl⟩
  | append_singleton path r ih =>
    rw [frame_append18] at h
    obtain ⟨_,_,_,_,_,_,hlo,hhi⟩ := indices_frame path
    have hm := (frame_reduced path).2.1
    cases r
    · simp only [advance,Bool.false_eq_true,if_false] at h; omega
    · simp only [advance,if_true] at h
      obtain ⟨n,rfl⟩ := ih (by omega)
      exact ⟨n+1,by rw [List.replicate_succ']⟩

theorem right_small_vertical_two650 (n j : ℕ) (hn : n≤3) :
    coeff (rightP650 n) 2 j*coeff (rightP650 n) 2 (j+2)≤
      coeff (rightP650 n) 2 (j+1)^2 := by
  let c : ℕ → Polynomial ℤ := fun n =>
    if n=0 then 1 else if n=1 then 1+5*X+6*X^2 else
    if n=2 then 8*X^2+24*X^3+15*X^4 else
      8*X^3+48*X^4+69*X^5+28*X^6
  have hc : (rightCalc650 n).2.2=c n := by
    interval_cases n <;> norm_num [c,rightCalc650] <;> ring
  by_cases hj : j≤6
  · unfold coeff
    rw [(right_calc650 n).2.2,hc]
    interval_cases n <;> interval_cases j <;>
      norm_num [c,Polynomial.coeff_add,Polynomial.coeff_sub,
        Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
        Polynomial.coeff_one,Polynomial.coeff_natCast_ite,Polynomial.coeff_ofNat_succ]
  · have hz := raw_outside_polygon18 (List.replicate n true) 2 (j+2) (by
      rw [(right_labels650 n).1,(right_labels650 n).2]
      unfold InPolygon; omega)
    change coeff (rightP650 n) 2 (j+2)=0 at hz
    rw [hz,mul_zero]; exact sq_nonneg _

theorem right_vertical_two650 (n j : ℕ) :
    coeff (rightP650 n) 2 j*coeff (rightP650 n) 2 (j+2)≤
      coeff (rightP650 n) 2 (j+1)^2 := by
  by_cases hn : n≤3
  · exact right_small_vertical_two650 n j hn
  · obtain ⟨k,rfl⟩ : ∃ k,n=k+4 := ⟨n-4,by omega⟩
    exact right_large_vertical_two650 k j

theorem source_near_one_vertical_two650 (path : List Bool)
    (h : (frame path).mid.b=(frame path).mid.a+1) (j : ℕ) :
    coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2)≤
      coeff (frame path).mid.p 2 (j+1)^2 := by
  obtain ⟨n,rfl⟩ := source_near_one_path650 path h
  exact right_vertical_two650 n j

#print axioms source_near_one_path650
#print axioms source_near_one_vertical_two650
end
end MathGKM.Markov
