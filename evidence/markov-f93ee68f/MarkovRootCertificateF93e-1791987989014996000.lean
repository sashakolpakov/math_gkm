import Mathlib
/-! Machine-authored f93ee68f. Exact approximate-root certificate.
This is a general analytic tool, not a proof of Markov log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem exists_root_near_f93e (p : Polynomial ℂ) (c : ℂ) (r : ℝ)
    (hr : 0 ≤ r)
    (h : ‖p.eval c‖ < ‖p.leadingCoeff‖ * r^p.natDegree) :
    ∃ z : ℂ, p.eval z=0 ∧ ‖c-z‖<r := by
  have hs : p.Splits := IsAlgClosed.splits p
  by_contra! hn
  have hb : ∀ z ∈ p.roots, r ≤ ‖c-z‖ := by
    intro z hz
    exact hn z (Polynomial.isRoot_of_mem_roots hz)
  have hp := Multiset.prod_map_le_prod_map₀ (s:=p.roots)
    (fun _ : ℂ => r) (fun z => ‖c-z‖) (by intros; exact hr) hb
  simp only [Multiset.map_const', Multiset.prod_replicate,
    ← hs.natDegree_eq_card_roots] at hp
  have he : ‖p.eval c‖ = ‖p.leadingCoeff‖ *
      (p.roots.map (fun z => ‖c-z‖)).prod := by
    rw [hs.eval_eq_prod_roots, norm_mul]
    congr 1
    exact (p.roots.prod_hom' (NormedField.toMulRingNorm ℂ) (fun z => c-z)).symm
  rw [he] at h
  exact (not_lt_of_ge (mul_le_mul_of_nonneg_left hp (norm_nonneg _))) h

#print axioms exists_root_near_f93e

def hornerPolyF93e (K : Type*) [Ring K] : List ℤ → Polynomial K
 | [] => 0
 | a::as => C (a : K)+X*hornerPolyF93e K as

def ratHornerF93e (x y : ℚ) : List ℤ → ℚ × ℚ
 | [] => (0,0)
 | a::as => let z := ratHornerF93e x y as
            (a+x*z.1-y*z.2,x*z.2+y*z.1)

theorem horner_evalF93e (l : List ℤ) (x y : ℚ) :
 (hornerPolyF93e ℂ l).eval ((x:ℂ)+(y:ℂ)*Complex.I)=
 ((ratHornerF93e x y l).1:ℂ)+((ratHornerF93e x y l).2:ℂ)*Complex.I := by
 induction l with
 | nil => simp [hornerPolyF93e,ratHornerF93e]
 | cons a as ih =>
   simp only [hornerPolyF93e,eval_add,eval_C,eval_mul,eval_X,ih,ratHornerF93e]
   push_cast
   have hi := Complex.I_sq
   ring_nf
   simp [hi,sub_eq_add_neg]

theorem horner_norm_boundF93e (l : List ℤ) (x y : ℚ) (e : ℚ)
 (h : |(ratHornerF93e x y l).1|+|(ratHornerF93e x y l).2|<e) :
 ‖(hornerPolyF93e ℂ l).eval ((x:ℂ)+(y:ℂ)*Complex.I)‖<(e:ℝ) := by
 rw [horner_evalF93e]
 apply lt_of_le_of_lt (Complex.norm_le_abs_re_add_abs_im _) ?_
 simp only [Complex.add_re,Complex.add_im,Complex.mul_re,Complex.mul_im,
   Complex.ratCast_re,Complex.ratCast_im,Complex.I_re,Complex.I_im,
   mul_zero,mul_one,sub_zero,add_zero,zero_add]
 exact_mod_cast h

#print axioms horner_norm_boundF93e
end
end MathGKM.Markov
