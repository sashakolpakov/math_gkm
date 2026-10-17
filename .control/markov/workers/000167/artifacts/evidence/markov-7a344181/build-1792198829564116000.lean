import MarkovFourEncodingM7A3
/-! Machine-authored 7a344181. Executable positive expression certificates.
The expression interpreter and degree bound are proved; actual packed integer
equalities remain separate kernel obligations. -/
namespace MathGKM.Markov

inductive NExprM7A3 where
 | c : ℕ → NExprM7A3
 | x : Fin 4 → NExprM7A3
 | add : NExprM7A3 → NExprM7A3 → NExprM7A3
 | mul : NExprM7A3 → NExprM7A3 → NExprM7A3
 | pow : NExprM7A3 → ℕ → NExprM7A3
 deriving Inhabited

def evalExprM7A3 {R : Type*} [Semiring R] (v : Fin 4 → R) : NExprM7A3 → R
 | .c n => n
 | .x i => v i
 | .add a b => evalExprM7A3 v a + evalExprM7A3 v b
 | .mul a b => evalExprM7A3 v a * evalExprM7A3 v b
 | .pow a n => evalExprM7A3 v a ^ n

noncomputable def polyExprM7A3 (e : NExprM7A3) : MvPolynomial (Fin 4) ℕ :=
 evalExprM7A3 MvPolynomial.X e

def degreeExprM7A3 (i : Fin 4) : NExprM7A3 → ℕ
 | .c _ => 0
 | .x j => if i=j then 1 else 0
 | .add a b => max (degreeExprM7A3 i a) (degreeExprM7A3 i b)
 | .mul a b => degreeExprM7A3 i a + degreeExprM7A3 i b
 | .pow a n => degreeExprM7A3 i a * n

theorem eval_poly_exprM7A3 {R : Type*} [CommSemiring R]
 (v : Fin 4 → R) (e : NExprM7A3) :
 MvPolynomial.eval₂ (Nat.castRingHom R) v (polyExprM7A3 e) = evalExprM7A3 v e := by
 induction e with
 | c n => simp [polyExprM7A3, evalExprM7A3]
 | x i => simp [polyExprM7A3, evalExprM7A3]
 | add a b ha hb => simpa [polyExprM7A3, evalExprM7A3] using congrArg₂ (·+·) ha hb
 | mul a b ha hb => simpa [polyExprM7A3, evalExprM7A3] using congrArg₂ (·*·) ha hb
 | pow a n ha => simpa [polyExprM7A3, evalExprM7A3] using congrArg (·^n) ha

theorem degree_poly_exprM7A3 (i : Fin 4) (e : NExprM7A3) :
 (polyExprM7A3 e).degreeOf i ≤ degreeExprM7A3 i e := by
 induction e with
 | c n =>
   change (n : MvPolynomial (Fin 4) ℕ).degreeOf i ≤ 0
   simpa only [map_natCast, Nat.cast_id] using
     (MvPolynomial.degreeOf_C (σ := Fin 4) (R := ℕ) n i).le
 | x j => simp [polyExprM7A3, evalExprM7A3, degreeExprM7A3, MvPolynomial.degreeOf_X]
 | add a b ha hb =>
   exact (MvPolynomial.degreeOf_add_le i _ _).trans (max_le_max ha hb)
 | mul a b ha hb =>
   exact (MvPolynomial.degreeOf_mul_le i _ _).trans (Nat.add_le_add ha hb)
 | pow a n ha =>
   simpa only [degreeExprM7A3, polyExprM7A3, evalExprM7A3, mul_comm] using
     (MvPolynomial.degreeOf_pow_le i (polyExprM7A3 a) n).trans (Nat.mul_le_mul_left n ha)

theorem expr_boxM7A3 (e : NExprM7A3)
 (h0 : degreeExprM7A3 0 e < 23) (h1 : degreeExprM7A3 1 e < 20)
 (h2 : degreeExprM7A3 2 e < 13) :
 ((polyExprM7A3 e).support : Set (Fin 4 →₀ ℕ)) ⊆ boxFourM7A3 := by
 intro m hm
 exact ⟨((MvPolynomial.le_degreeOf_of_mem_support 0 hm).trans
   (degree_poly_exprM7A3 0 e)).trans_lt h0,
   ((MvPolynomial.le_degreeOf_of_mem_support 1 hm).trans
   (degree_poly_exprM7A3 1 e)).trans_lt h1,
   ((MvPolynomial.le_degreeOf_of_mem_support 2 hm).trans
   (degree_poly_exprM7A3 2 e)).trans_lt h2⟩

theorem eval_expr_nonnegM7A3 (v : Fin 4 → ℚ) (hv : ∀ i, 0 ≤ v i)
 (e : NExprM7A3) : 0 ≤ evalExprM7A3 v e := by
 induction e with
 | c n => exact Nat.cast_nonneg n
 | x i => exact hv i
 | add a b ha hb => exact add_nonneg ha hb
 | mul a b ha hb => exact mul_nonneg ha hb
 | pow a n ha => exact pow_nonneg ha n

theorem expr_certificateM7A3 (B : ℕ) (hB : 1<B) (a b : NExprM7A3)
 (ha0 : degreeExprM7A3 0 a < 23) (ha1 : degreeExprM7A3 1 a < 20)
 (ha2 : degreeExprM7A3 2 a < 13)
 (hb0 : degreeExprM7A3 0 b < 23) (hb1 : degreeExprM7A3 1 b < 20)
 (hb2 : degreeExprM7A3 2 b < 13)
 (hma : evalExprM7A3 (fun _ => (1:ℕ)) a < B)
 (hmb : evalExprM7A3 (fun _ => (1:ℕ)) b < B)
 (hpack : evalExprM7A3 (fun i => B^weightFourM7A3 i) a =
          evalExprM7A3 (fun i => B^weightFourM7A3 i) b)
 (v : Fin 4 → ℚ) : evalExprM7A3 v a = evalExprM7A3 v b := by
 have hh : polyExprM7A3 a = polyExprM7A3 b := by
   apply packed_four_soundM7A3 B hB _ _ (expr_boxM7A3 a ha0 ha1 ha2)
     (expr_boxM7A3 b hb0 hb1 hb2)
   · change MvPolynomial.eval₂ (Nat.castRingHom ℕ) _ _ < B
     rwa [eval_poly_exprM7A3]
   · change MvPolynomial.eval₂ (Nat.castRingHom ℕ) _ _ < B
     rwa [eval_poly_exprM7A3]
   · change MvPolynomial.eval₂ (Nat.castRingHom ℕ) _ _ =
       MvPolynomial.eval₂ (Nat.castRingHom ℕ) _ _
     simpa only [eval_poly_exprM7A3] using hpack
 have h := congrArg (MvPolynomial.eval₂ (Nat.castRingHom ℚ) v) hh
 simpa only [eval_poly_exprM7A3] using h

end MathGKM.Markov
