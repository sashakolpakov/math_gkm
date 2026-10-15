import MarkovHorizontalGaugeM13D
/-! Machine-authored request 13d40bd7. All-order exact source trace bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def hprojWordM13D (x : ℝ) (w : List Bool) : Mat16 ℝ[X] :=
 projProduct6905 (w.map (hprojM13D x))

theorem hword_scaledM13D (x : ℝ) (hx : x≠0) (hh : x+1≠0) (w : List Bool) :
 hconjM13D x (hmapM13D (hrowEvalM13D x) (rawWord80 w))=
 hscaleM13D (C (x^(w.count true)*(x+1)^w.length)) (hprojWordM13D x w) := by
 induction w with
 | nil =>
   simpa [rawWord80,hmapM13D,hconjM13D,hscaleM13D,hprojWordM13D,
     projProduct6905,mm_one_right774,mm_one_left774] using (hinverseM13D x hh).2
 | cons r rs ih =>
   rw [rawWord80,hmap_mmM13D,hconj_mmM13D x hh,hproj_letterM13D x hx hh,ih,hscale_mmM13D]
   have he : C ((if r then x else 1)*(x+1))*C (x^(rs.count true)*(x+1)^rs.length)=
     C (x^((r::rs).count true)*(x+1)^(r::rs).length) := by
     rw [←map_mul]
     congr 1
     cases r <;> simp [List.count_cons,pow_succ] <;> ring
   rw [he]
   rfl

theorem hsource_traceM13D (x : ℝ) (hx : x≠0) (hh : x+1≠0) (path : List Bool) :
 C (x^(frame path).mid.a*(x+1)^(frame path).mid.b)*
   tr16 (hprojWordM13D x (sourceWord28 path)) =
 (C (x+1)+X)*hrowEvalM13D x (frame path).mid.p := by
 have h := congrArg tr16 (hword_scaledM13D x hx hh (sourceWord28 path))
 rw [hconj_traceM13D x hh] at h
 obtain ⟨hc,hl⟩ := source_word_counts28 path
 rw [hc,hl] at h
 have ht := sourceMatrix_trace025 path
 rw [sourceMatrix_exact_word487] at ht
 have hp := source_word_exact3eda path
 rw [←hp] at ht
 have ht' := congrArg (hrowEvalM13D x) ht
 have hS : hrowEvalM13D x S=C (x+1)+X := by
   simp [hrowEvalM13D,S,U,V,map_add]; ring
 rw [map_mul,hS] at ht'
 change hrowEvalM13D x ((rawWord80 (sourceWord28 path)).a+
   (rawWord80 (sourceWord28 path)).d)=_ at ht'
 rw [map_add] at ht'
 simp only [hmapM13D,tr16,hscaleM13D] at h
 rw [mul_add]
 exact h.symm.trans ht'

theorem hrowEval_coeffM13D (x : ℝ) (P : BiPoly) (j : ℕ) :
 (hrowEvalM13D x P).coeff j=
 Polynomial.eval₂ (Int.castRingHom ℝ) x ((Bivariate.swap P).coeff j) := by
 induction P using Polynomial.induction_on' with
 | add p q hp hq => simpa [map_add,Polynomial.coeff_add] using congrArg₂ (·+·) hp hq
 | monomial n p =>
   induction p using Polynomial.induction_on' with
   | add p q hp hq => simpa [map_add,Polynomial.coeff_add] using congrArg₂ (·+·) hp hq
   | monomial m z =>
     simp [hrowEvalM13D,Bivariate.swap_monomial_monomial,Polynomial.coeff_monomial,
       Polynomial.coeff_mul_C,Polynomial.coeff_map]
     split_ifs <;> simp_all

end
end MathGKM.Markov
