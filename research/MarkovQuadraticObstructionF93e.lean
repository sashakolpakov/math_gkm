import MarkovSectorSourceF93e
/-! Machine-authored f93ee68f. No factorization into raw-LC real quadratics
can supply this particular source row. No converse to coefficient LC is used. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem quadratic_nonzero_outsideF93e (a b c : ℝ) (z : ℂ)
 (hnot : a≠0 ∨ b≠0 ∨ c≠0) (hlc : a*c≤b^2)
 (hz : 3*z.re^2<z.im^2) :
 (a:ℂ)+(b:ℂ)*z+(c:ℂ)*z^2≠0 := by
 intro h
 have hy : z.im≠0 := by intro he; rw [he] at hz; nlinarith [sq_nonneg z.re]
 have hre := congrArg Complex.re h
 have him := congrArg Complex.im h
 simp only [Complex.add_re,Complex.add_im,Complex.mul_re,Complex.mul_im,
   Complex.ofReal_re,Complex.ofReal_im,Complex.zero_re,Complex.zero_im,
   pow_two,Complex.mul_re,Complex.mul_im] at hre him
 have hb : b = -2*c*z.re := by
   have he : (b+2*c*z.re)*z.im=0 := by nlinarith [him]
   have := (mul_eq_zero.mp he).resolve_right hy
   linarith
 have ha : a=c*(z.re^2+z.im^2) := by rw [hb] at hre; nlinarith [hre]
 have hc : c≠0 := by
   intro he
   have ha0 : a=0 := by simp [he] at ha; exact ha
   have hb0 : b=0 := by simp [he] at hb; exact hb
   rcases hnot with hnot|hnot|hnot <;> contradiction
 have hid : b^2-a*c = c^2*(3*z.re^2-z.im^2) := by rw [ha,hb]; ring
 have hn := mul_neg_of_pos_of_neg (sq_pos_of_ne_zero hc) (sub_neg.mpr hz)
 linarith

def QuadraticLCFactorF93e (p : Polynomial ℂ) : Prop :=
 ∃ a b c : ℝ, (a≠0 ∨ b≠0 ∨ c≠0) ∧ a*c≤b^2 ∧
 p=C (a:ℂ)+C (b:ℂ)*X+C (c:ℂ)*X^2

theorem quadratic_factor_eval_neF93e (p : Polynomial ℂ) (h : QuadraticLCFactorF93e p)
 (z : ℂ) (hz : 3*z.re^2<z.im^2) : p.eval z≠0 := by
 obtain ⟨a,b,c,hn,hl,rfl⟩ := h
 simpa using quadratic_nonzero_outsideF93e a b c z hn hl hz

theorem source_no_lc_quadratic_factorizationF93e :
 ¬∃ ps : List (Polynomial ℂ),
   (∀ p∈ps, QuadraticLCFactorF93e p) ∧
   ps.prod=sectorRowF93e.map (Int.castRingHom ℂ) := by
 rintro ⟨ps,hps,he⟩
 obtain ⟨z,hz,_,hs⟩ := source_horizontal_sector_failureF93e
 have hn : (ps.prod).eval z≠0 := by
   rw [Polynomial.eval_list_prod]
   apply List.prod_ne_zero
   intro ha
   obtain ⟨p,hp,hzero⟩ := List.mem_map.mp ha
   exact quadratic_factor_eval_neF93e p (hps p hp) z hs hzero
 exact hn (he ▸ hz)

#print axioms source_no_lc_quadratic_factorizationF93e
end
end MathGKM.Markov
