import MathGKM.Round52RealProductA

namespace RealPolynomialR52
noncomputable section
open scoped BigOperators
open Polynomial RealConeR52 RealMarginalR52 RealProductR52

def lift (P : Polynomial ℝ) : AddMonoidAlgebra ℝ ℤ :=
  AddMonoidAlgebra.mapDomain (Nat.castAddMonoidHom ℤ) P.toFinsupp
def seq (P : Polynomial ℝ) : ℤ →₀ ℝ := (lift P).coeff

theorem lift_mul (P Q : Polynomial ℝ) : lift (P*Q)=lift P*lift Q := by
  simp only [lift,Polynomial.toFinsupp_mul,AddMonoidAlgebra.mapDomain_mul]

theorem seq_mul (P Q : Polynomial ℝ) (z : ℤ) :
    seq (P*Q) z=conv (seq P) (seq Q) z := by
  change (lift (P*Q)).coeff z = _
  rw [lift_mul,AddMonoidAlgebra.coeff_mul_apply_left]
  simp only [seq,conv,Finsupp.sum,neg_add_eq_sub]

theorem seq_nat (P : Polynomial ℝ) (n : ℕ) : seq P (n:ℤ)=P.coeff n := by
  change (Finsupp.mapDomain (Nat.castAddMonoidHom ℤ) P.toFinsupp.coeff) (n:ℤ)=_
  exact Finsupp.mapDomain_apply (f := (Nat.castAddMonoidHom ℤ))
    (by intro i j h; change (i:ℤ)=(j:ℤ) at h; exact_mod_cast h) P.toFinsupp.coeff n

theorem seq_negative (P : Polynomial ℝ) (z : ℤ) (hz : z<0) : seq P z=0 := by
  change (Finsupp.mapDomain (Nat.castAddMonoidHom ℤ) P.toFinsupp.coeff) z=0
  apply Finsupp.mapDomain_notin_range
  rintro ⟨n,hn⟩
  have : (0:ℤ)≤n := Nat.cast_nonneg n
  change (n:ℤ)=z at hn
  omega

theorem polynomial_mul_cone (P Q : Polynomial ℝ) (hp : Cone (seq P)) (hq : Cone (seq Q)) :
    Cone (seq (P*Q)) := by
  have he : (seq (P*Q) : ℤ → ℝ)=conv (seq P) (seq Q) := funext (seq_mul P Q)
  rw [he]
  exact convolution_cone _ _ hp hq

def elementaryPoly (a b c : ℝ) : Polynomial ℝ := C a+C b*X+C c*X^2

theorem seq_elementary (a b c : ℝ) :
    (seq (elementaryPoly a b c) : ℤ → ℝ)=elementary a b c := by
  funext z
  by_cases hz : z<0
  · rw [seq_negative _ _ hz]
    have h0 : z≠0 := by omega
    have h1 : z≠1 := by omega
    have h2 : z≠2 := by omega
    simp [elementary,h0,h1,h2]
  · obtain ⟨n,rfl⟩ := Int.eq_ofNat_of_zero_le (le_of_not_gt hz)
    rw [seq_nat]
    by_cases h0 : n=0
    · subst n; simp [elementaryPoly,elementary]
    by_cases h1 : n=1
    · subst n; simp [elementaryPoly,elementary]
    by_cases h2 : n=2
    · subst n; simp [elementaryPoly,elementary]
    have hz0 : (n:ℤ)≠0 := by exact_mod_cast h0
    have hz1 : (n:ℤ)≠1 := by exact_mod_cast h1
    have hz2 : (n:ℤ)≠2 := by exact_mod_cast h2
    simp [elementaryPoly,elementary,Polynomial.coeff_C,Polynomial.coeff_C_mul,
      Polynomial.coeff_X,Polynomial.coeff_X_pow,h0,h1,h2,hz0,hz1,hz2,Ne.symm h0,Ne.symm h1,Ne.symm h2]

theorem singleton_cone (c : ℝ) (hc : 0≤c) (a : ℤ) :
    Cone (fun z : ℤ => if z=a then c else 0) := by
  refine ⟨?_,?_,?_⟩
  · intro z; dsimp only; split_ifs <;> positivity
  · intro z
    by_cases h0 : z=a
    · have h2 : z+2≠a := by omega
      simp only [if_pos h0,if_neg h2,mul_zero]
      positivity
    · simp only [if_neg h0,zero_mul]; positivity
  · intro x y z hxy hyz hx hz
    have hx' : x=a := by by_contra hh; simp [hh] at hx
    have hz' : z=a := by by_contra hh; simp [hh] at hz
    omega

theorem monomial_cone (c : ℝ) (hc : 0≤c) (a : ℕ) : Cone (seq (C c*X^a)) := by
  have he : (seq (C c*X^a) : ℤ → ℝ)=(fun z : ℤ => if z=(a:ℤ) then c else 0) := by
    funext z
    by_cases hz : z<0
    · rw [seq_negative _ _ hz,if_neg (by omega)]
    · obtain ⟨n,rfl⟩ := Int.eq_ofNat_of_zero_le (le_of_not_gt hz)
      simp [seq_nat,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,eq_comm]
  rw [he]
  exact singleton_cone c hc a

theorem list_product_cone (L : List (Polynomial ℝ))
    (hL : ∀ P ∈ L, Cone (seq P)) : Cone (seq L.prod) := by
  induction L with
  | nil => simpa using monomial_cone 1 (by norm_num) 0
  | cons P L ih =>
    simp only [List.prod_cons]
    exact polynomial_mul_cone P L.prod (hL P (by simp)) (ih (by intro Q hQ; exact hL Q (by simp [hQ])))

theorem finite_factor_product (c : ℝ) (hc : 0<c) (a : ℕ)
    (ls : List ℝ) (qs : List (ℝ × ℝ))
    (hl : ∀ ρ ∈ ls, 0≤ρ)
    (hq : ∀ q ∈ qs, 0≤q.1 ∧ 0≤q.2 ∧ q.2≤q.1^2) :
    Cone (seq (C c*X^a*(ls.map (fun ρ => X+C ρ)).prod*
      (qs.map (fun q => X^2+C q.1*X+C q.2)).prod)) := by
  apply polynomial_mul_cone
  · apply polynomial_mul_cone
    · exact monomial_cone c hc.le a
    · apply list_product_cone
      intro P hP
      obtain ⟨ρ,hρ,rfl⟩ := List.mem_map.mp hP
      have he : X+C ρ=elementaryPoly ρ 1 0 := by simp [elementaryPoly,add_comm]
      rw [he,seq_elementary]
      exact linear_cone ρ (hl ρ hρ)
  · apply list_product_cone
    intro P hP
    obtain ⟨q,hq',rfl⟩ := List.mem_map.mp hP
    have he : X^2+C q.1*X+C q.2=elementaryPoly q.2 q.1 1 := by simp [elementaryPoly]; ring
    rw [he,seq_elementary]
    exact quadratic_cone q.1 q.2 (hq q hq').1 (hq q hq').2.1 (hq q hq').2.2

theorem raw_consequence (P : Polynomial ℝ) (h : Cone (seq P)) (n : ℕ) :
    P.coeff n*P.coeff (n+2)≤P.coeff (n+1)^2 := by
  have hh := h.2.1 (n:ℤ)
  simpa only [show (n:ℤ)+2=((n+2:ℕ):ℤ) by omega,
    show (n:ℤ)+1=((n+1:ℕ):ℤ) by omega,seq_nat] using hh

end
end RealPolynomialR52
