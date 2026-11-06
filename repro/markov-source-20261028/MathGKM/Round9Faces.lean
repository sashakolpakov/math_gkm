/- Machine-authored round-9 prospective trial; ordinary proof candidates. -/
import MathGKM.Markov
import MathGKM.Accepted0d2b83c94b4594d717e36331
import MathGKM.Accepted1ed69be5c8a0eb46d7e92d9f
import MathGKM.Accepted25cc13a3ad331403dbe48d54
import MathGKM.Accepted10f5df6c49aadbaab7c023ce
open MathGKM.Markov
set_option maxHeartbeats 2000000
namespace FacesR9
theorem choose_lc (n k : ℕ) :
    (n.choose k : ℤ)*(n.choose (k+2) : ℤ) ≤ (n.choose (k+1) : ℤ)^2 := by
  by_cases h : k+2 ≤ n
  · have h1 : (n.choose (k+1) : ℤ)*(k+1)= (n.choose k : ℤ)*((n-k : ℕ) : ℤ) := by
      exact_mod_cast Nat.choose_succ_right_eq n k
    have h2 : (n.choose (k+2) : ℤ)*(k+2)= (n.choose (k+1) : ℤ)*((n-(k+1) : ℕ) : ℤ) := by
      exact_mod_cast Nat.choose_succ_right_eq n (k+1)
    have ek : (n-k : ℕ)=(n:ℤ)-k := by omega
    have ek1 : (n-(k+1) : ℕ)=(n:ℤ)-k-1 := by omega
    push_cast at h1 h2
    rw [ek] at h1
    rw [ek1] at h2
    have ident : ((k:ℤ)+1)*((n:ℤ)-k-1)*
        ((n.choose (k+1) : ℤ)^2-(n.choose k : ℤ)*(n.choose (k+2) : ℤ)) =
        (n.choose k : ℤ)*(n.choose (k+2) : ℤ)*((n:ℤ)+1) := by
      linear_combination (n.choose (k+1) : ℤ)*((n:ℤ)-k-1)*h1 -
        (n.choose k : ℤ)*((n:ℤ)-k)*h2
    have factor : 0<((k:ℤ)+1)*((n:ℤ)-k-1) := by
      apply mul_pos <;> omega
    have rhs : 0 ≤ (n.choose k : ℤ)*(n.choose (k+2) : ℤ)*((n:ℤ)+1) := by positivity
    nlinarith
  · rw [Nat.choose_eq_zero_of_lt (by omega : n<k+2)]
    simp only [Nat.cast_zero,mul_zero]
    positivity
theorem shifted_lc (m n k : ℕ) (hm : m ≤ k) :
    ((Polynomial.X^m*(1+Polynomial.X)^n : Polynomial ℤ).coeff k)*
      ((Polynomial.X^m*(1+Polynomial.X)^n : Polynomial ℤ).coeff (k+2)) ≤ 
      ((Polynomial.X^m*(1+Polynomial.X)^n : Polynomial ℤ).coeff (k+1))^2 := by
  have e1 : k+1-m=(k-m)+1 := by omega
  have e2 : k+2-m=(k-m)+2 := by omega
  simp only [Polynomial.coeff_X_pow_mul',if_pos hm,
    if_pos (by omega : m ≤ k+1),if_pos (by omega : m ≤ k+2),
    Polynomial.coeff_one_add_X_pow,e1,e2]
  exact choose_lc n (k-m)
theorem faces : WeakLC 0 1 1 ∧ WeakLC 1 1 (U+V) ∧
    ∀ path : List Bool, let f := frame path;
    ∀ E ∈ [f.lo,f.mid,f.hi],
      (∀ i, InPolygon E.a E.b i 0 → InPolygon E.a E.b (i+1) 0 →
        InPolygon E.a E.b (i+2) 0 →
        coeff E.p i 0*coeff E.p (i+2) 0 ≤ coeff E.p (i+1) 0^2) ∧
      (∀ j, InPolygon E.a E.b 0 j → InPolygon E.a E.b 0 (j+1) →
        InPolygon E.a E.b 0 (j+2) →
        coeff E.p 0 j*coeff E.p 0 (j+2) ≤ coeff E.p 0 (j+1)^2) ∧
      (∀ i j, i+j+2=E.a+E.b-1 →
        InPolygon E.a E.b i (j+2) → InPolygon E.a E.b (i+1) (j+1) →
        InPolygon E.a E.b (i+2) j →
        coeff E.p i (j+2)*coeff E.p (i+2) j ≤ coeff E.p (i+1) (j+1)^2) := by
  have end0 : WeakLC 0 1 1 := by
    refine ⟨?_,?_,?_⟩ <;> intro i j p0 p1 p2 <;>
      simp only [InPolygon] at * <;> omega
  have end1 : WeakLC 1 1 (U+V) := by
    refine ⟨?_,?_,?_⟩ <;> intro i j p0 p1 p2 <;>
      simp only [InPolygon] at * <;> omega
  refine ⟨end0,end1,?_⟩
  intro path
  dsimp only
  intro E hE
  have ar := Accepted0d2b83c94b4594d717e36331.obligation path
  have hv := Accepted1ed69be5c8a0eb46d7e92d9f.obligation path
  have hu := Accepted25cc13a3ad331403dbe48d54.obligation path E hE
  have ht := Accepted10f5df6c49aadbaab7c023ce.obligation path E hE
  have hb : 0<E.b := by
    simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
    rcases hE with rfl|rfl|rfl <;> dsimp only at ar ⊢ <;> omega
  have hvE : E.p.map (Polynomial.evalRingHom (0 : ℤ))=
      Polynomial.X^E.a*(1+Polynomial.X)^(E.b-1) := by
    simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
    rcases hE with rfl|rfl|rfl
    · exact hv.1
    · exact hv.2.1
    · exact hv.2.2
  have vx (k : ℕ) : coeff E.p k 0=
      (Polynomial.X^E.a*(1+Polynomial.X)^(E.b-1) : Polynomial ℤ).coeff k := by
    have h := congrArg (fun P : Polynomial ℤ => P.coeff k) hvE
    simpa [Polynomial.coeff_map,← Polynomial.coeff_zero_eq_eval_zero,coeff] using h
  have vy (k : ℕ) : coeff E.p 0 k=
      (if E.a=0 then (1 : Polynomial ℤ) else
        Polynomial.X^E.b*(1+Polynomial.X)^(E.a-1)).coeff k := by
    have h := congrArg (fun P : Polynomial ℤ => P.coeff k) hu
    simpa [← Polynomial.coeff_zero_eq_eval_zero,coeff] using h
  refine ⟨?_,?_,?_⟩
  · intro i p0 p1 p2
    have hi : E.a ≤ i := by
      have h := p0.1
      simp only [mul_zero,add_zero] at h
      nlinarith
    simp only [vx]
    exact shifted_lc E.a (E.b-1) i hi
  · intro j p0 p1 p2
    by_cases ha : E.a=0
    · simp only [vy,if_pos ha,Polynomial.coeff_one]
      simp only [show j+2≠0 by omega,ite_false,mul_zero]
      positivity
    · have ha0 : 0<E.a := by omega
      have hj : E.b ≤ j := by
        have h := p0.1
        simp only [mul_zero,zero_add] at h
        nlinarith
      simp only [vy,if_neg ha]
      exact shifted_lc E.b (E.a-1) j hj
  · intro i j hd p0 p1 p2
    rw [ht i (j+2) (by omega),ht (i+2) j (by omega),
      ht (i+1) (j+1) (by omega)]
    exact choose_lc _ _
end FacesR9
