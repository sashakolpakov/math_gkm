import MarkovGasF80
import MarkovPolygon18

/-! Machine-authored request 7252232b. Upward support of the exact positive
word model. No log-concavity assertion is assumed or concluded here. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def Filled725 (n : ℕ) (p : BiPoly) : Prop :=
  ∀ i j, 0 < coeff p i j → ∀ k l, i ≤ k → j ≤ l → k+l ≤ n → 0 < coeff p k l

def Top725 (n : ℕ) (p : BiPoly) : Prop :=
  ∀ i j, i+j=n → 0 < coeff p i j

@[simp] theorem coeff_U_zero725 (p : BiPoly) (j : ℕ) : coeff (U*p) 0 j=0 := by
  simp [coeff,U]
@[simp] theorem coeff_U_succ725 (p : BiPoly) (i j : ℕ) :
    coeff (U*p) (i+1) j=coeff p i j := by
  simp [coeff,U,Polynomial.coeff_X_mul]
@[simp] theorem coeff_V_zero725 (p : BiPoly) (i : ℕ) : coeff (V*p) i 0=0 := by
  simp [coeff,V,Polynomial.coeff_C_mul]
@[simp] theorem coeff_V_succ725 (p : BiPoly) (i j : ℕ) :
    coeff (V*p) i (j+1)=coeff p i j := by
  simp [coeff,V,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul]

theorem filled_one725 : Filled725 0 1 := by
  intro i j hp k l hik hjl hkl
  have hk : k=0 := by omega
  have hl : l=0 := by omega
  subst k; subst l
  norm_num [coeff]

theorem filled_U725 {n : ℕ} {p : BiPoly} (h : Filled725 n p) :
    Filled725 (n+1) (U*p) := by
  intro i j hp k l hik hjl hkl
  cases i with
  | zero => simp at hp
  | succ i =>
    cases k with
    | zero => omega
    | succ k =>
      simp only [Nat.succ_eq_add_one,coeff_U_succ725] at hp ⊢
      exact h i j hp k l (by omega) hjl (by omega)

theorem filled_V725 {n : ℕ} {p : BiPoly} (h : Filled725 n p) :
    Filled725 (n+1) (V*p) := by
  intro i j hp k l hik hjl hkl
  cases j with
  | zero => simp at hp
  | succ j =>
    cases l with
    | zero => omega
    | succ l =>
      simp only [Nat.succ_eq_add_one,coeff_V_succ725] at hp ⊢
      exact h i j hp k l hik (by omega) (by omega)

theorem filled_add725 {n : ℕ} {p q : BiPoly}
    (hp : Filled725 n p) (hq : Filled725 n q)
    (np : PolyNonneg16 p) (nq : PolyNonneg16 q) : Filled725 n (p+q) := by
  intro i j h k l hik hjl hkl
  change 0 < coeff p i j + coeff q i j at h
  change 0 < coeff p k l + coeff q k l
  by_cases hpi : 0 < coeff p i j
  · exact add_pos_of_pos_of_nonneg (hp i j hpi k l hik hjl hkl) (nq k l)
  · have hqi : 0 < coeff q i j := by omega
    exact add_pos_of_nonneg_of_pos (np k l) (hq i j hqi k l hik hjl hkl)

theorem filled_add_lower725 {n : ℕ} {p q : BiPoly}
    (hp : Filled725 (n+1) p) (tp : Top725 (n+1) p) (hq : Filled725 n q)
    (np : PolyNonneg16 p) (nq : PolyNonneg16 q) : Filled725 (n+1) (p+q) := by
  intro i j h k l hik hjl hkl
  change 0 < coeff p i j + coeff q i j at h
  change 0 < coeff p k l + coeff q k l
  by_cases hpi : 0 < coeff p i j
  · exact add_pos_of_pos_of_nonneg (hp i j hpi k l hik hjl hkl) (nq k l)
  · have hqi : 0 < coeff q i j := by omega
    by_cases hsmall : k+l≤n
    · exact add_pos_of_nonneg_of_pos (np k l) (hq i j hqi k l hik hjl hsmall)
    · exact add_pos_of_pos_of_nonneg (tp k l (by omega)) (nq k l)

theorem top_add725 {n : ℕ} {p q : BiPoly} (hp : Top725 n p)
    (nq : PolyNonneg16 q) : Top725 n (p+q) := by
  intro i j hij
  exact add_pos_of_pos_of_nonneg (hp i j hij) (nq i j)

theorem top_mix725 {n : ℕ} {p q : BiPoly} (hp : Top725 n p) (hq : Top725 n q)
    (np : PolyNonneg16 p) (nq : PolyNonneg16 q) : Top725 (n+1) (V*p+U*q) := by
  intro i j hij
  change 0 < coeff (V*p) i j+coeff (U*q) i j
  cases j with
  | zero =>
    cases i with
    | zero => omega
    | succ i =>
      simp only [Nat.succ_eq_add_one,coeff_V_zero725,coeff_U_succ725,zero_add]
      exact hq i 0 (by omega)
  | succ j =>
    rw [coeff_V_succ725]
    exact add_pos_of_pos_of_nonneg (hp i j (by omega))
      (poly_mul_nonneg16 poly_U_nonneg16 nq i (j+1))

def fgWord725 : List Bool → BiPoly × BiPoly
  | [] => (1,1)
  | r::rs =>
    let z := fgWord725 rs
    let h := V*z.1+U*z.2
    if r then (h+z.1,h) else (h,h+z.2)

theorem fg_good725 (w : List Bool) :
    let z := fgWord725 w
    (PolyNonneg16 z.1 ∧ Filled725 w.length z.1 ∧ Top725 w.length z.1) ∧
    (PolyNonneg16 z.2 ∧ Filled725 w.length z.2 ∧ Top725 w.length z.2) := by
  induction w with
  | nil =>
    have ht : Top725 0 1 := by
      intro i j hij
      have hi : i=0 := by omega
      have hj : j=0 := by omega
      subst i; subst j
      norm_num [coeff]
    exact ⟨⟨poly_one_nonneg16,filled_one725,ht⟩,⟨poly_one_nonneg16,filled_one725,ht⟩⟩
  | cons r rs ih =>
    obtain ⟨⟨np,fp,tp⟩,⟨nq,fq,tq⟩⟩ := ih
    have nv := poly_mul_nonneg16 poly_V_nonneg16 np
    have nu := poly_mul_nonneg16 poly_U_nonneg16 nq
    have nh := poly_add_nonneg16 nv nu
    have fh := filled_add725 (filled_V725 fp) (filled_U725 fq) nv nu
    have th := top_mix725 tp tq np nq
    cases r
    · exact ⟨⟨nh,fh,th⟩,⟨poly_add_nonneg16 nh nq,
        filled_add_lower725 fh th fq nh nq,top_add725 th nq⟩⟩
    · exact ⟨⟨poly_add_nonneg16 nh np,
        filled_add_lower725 fh th fp nh np,top_add725 th np⟩,⟨nh,fh,th⟩⟩

theorem fg_matrix725 (w : List Bool) :
    let m := gasWord80 U V (1 : BiPoly) w
    let z := fgWord725 w
    m.a+U*m.b=z.1 ∧ m.c+U*m.d=U*z.2 := by
  induction w with
  | nil => simp [gasWord80,fgWord725]
  | cons r rs ih =>
    obtain ⟨h1,h2⟩ := ih
    cases r <;> simp only [gasWord80,gasT80,fgWord725,Bool.false_eq_true,if_false,if_true,mm16]
    all_goals constructor
    all_goals first | linear_combination V*h1+h2 | linear_combination (V+1)*h1+h2 |
      linear_combination U*V*h1+(U+1)*h2 | linear_combination U*V*h1+U*h2

theorem gas_fg725 (w : List Bool) :
    gasScalar80 U V (1 : BiPoly) w=V*(fgWord725 w).1+U*(fgWord725 w).2 := by
  obtain ⟨h1,h2⟩ := fg_matrix725 w
  dsimp [gasScalar80]
  linear_combination V*h1+h2

theorem gas_filled725 (w : List Bool) :
    Filled725 (w.length+1) (gasScalar80 U V (1 : BiPoly) w) := by
  rw [gas_fg725]
  obtain ⟨⟨np,fp,_⟩,⟨nq,fq,_⟩⟩ := fg_good725 w
  exact filled_add725 (filled_V725 fp) (filled_U725 fq)
    (poly_mul_nonneg16 poly_V_nonneg16 np) (poly_mul_nonneg16 poly_U_nonneg16 nq)

/-- Every positive raw coefficient propagates northeast as far as the top
degree. Universal paths and all zero coefficients are retained. -/
theorem source_filled725 (path : List Bool) :
    Filled725 ((frame path).mid.a+(frame path).mid.b-1) (frame path).mid.p := by
  obtain ⟨w,hl,he⟩ := source_gas80 path
  rw [he,show (frame path).mid.a+(frame path).mid.b-1=w.length+1 by omega]
  exact gas_filled725 w

#print axioms source_filled725
#print axioms fg_matrix725
end
end MathGKM.Markov
