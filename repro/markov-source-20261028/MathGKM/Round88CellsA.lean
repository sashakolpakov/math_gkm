import MathGKM.Round64ProjectionA
import MathGKM.Acceptedd5eee9c4567a9bc2d46f3ad0

/- Machine-authored round88. Move alpha to the outer polynomial variable.
This retains the exact F, with u,v,beta in their original relative order. -/
namespace SparseColorR88
open Polynomial MatchingProjectionR64
noncomputable section
abbrev Three := Polynomial (Polynomial (Polynomial ℤ))
def u : Three := X
def v : Three := C X
def z : Three := C (C X)
def T : Three := u+v
def Ccell : Three := T^2+z*v
def reorder : Four →+* Polynomial Three :=
  Polynomial.Bivariate.swap.toRingHom.comp
    (Polynomial.mapRingHom Polynomial.Bivariate.swap.toRingHom)
def A (c N sigma : ℕ) : Three := (reorder (F N sigma)).coeff c

theorem swap_coeff {R : Type*} [CommSemiring R]
    (P : Polynomial (Polynomial R)) (i j : ℕ) :
    ((Polynomial.Bivariate.swap P).coeff i).coeff j=(P.coeff j).coeff i := by
  induction P using Polynomial.induction_on' with
  | add P Q hp hq => simp [map_add,coeff_add,hp,hq]
  | monomial n f =>
    induction f using Polynomial.induction_on' with
    | add f g hf hg => simp [map_add,coeff_add,hf,hg]
    | monomial m r =>
      by_cases hn : n=j <;> by_cases hm : m=i <;>
        simp [Polynomial.Bivariate.swap_monomial_monomial,coeff_monomial,hn,hm]

theorem reorder_coeff (P : Four) (a i j : ℕ) :
    (((reorder P).coeff a).coeff i).coeff j=((P.coeff i).coeff j).coeff a := by
  unfold reorder
  rw [RingHom.comp_apply]
  change (((Polynomial.Bivariate.swap
    (P.map Polynomial.Bivariate.swap.toRingHom)).coeff a).coeff i).coeff j = _
  rw [swap_coeff]
  simp only [Polynomial.coeff_map]
  change ((Polynomial.Bivariate.swap (P.coeff i)).coeff a).coeff j = _
  exact swap_coeff (P.coeff i) a j

attribute [local simp] Polynomial.Bivariate.swap_X Polynomial.Bivariate.swap_Y
  Polynomial.Bivariate.swap_C_C

theorem reordered_monomer : reorder (fu+fv)=C T := by
  simp [reorder,fu,fv,T,u,v]
theorem reordered_fu : reorder fu=C u := by simp [reorder,fu,u]
theorem reordered_fv : reorder fv=C v := by simp [reorder,fv,v]
theorem reordered_edge (sigma e : ℕ) :
    reorder (coloredEdge sigma e)=
      if (e+sigma)%2=0 then C u*X else C (z*v) := by
  by_cases h : (e+sigma)%2=0
  · simp [coloredEdge,h,reorder,alpha,fu,u]
  · simp [coloredEdge,h,reorder,beta,fv,z,v]

theorem A_boundaries (sigma : ℕ) :
    A 0 0 sigma=1 ∧ A 0 1 sigma=T ∧ A 1 0 sigma=0 ∧ A 1 1 sigma=0 := by
  simp [A,F,FiniteMatchingR61.boundaries,reordered_monomer,coeff_one]

theorem zero_step (N sigma : ℕ) :
    A 0 (N+2) sigma=T*A 0 (N+1) sigma+
      (if (N+sigma)%2=0 then 0 else z*v)*A 0 N sigma := by
  unfold A F
  rw [Acceptedd5eee9c4567a9bc2d46f3ad0.obligation]
  rw [map_add,map_mul,reordered_monomer,map_mul,reordered_edge]
  by_cases h : (N+sigma)%2=0
  · simp only [h,if_true,mul_assoc,coeff_add,coeff_C_mul,coeff_X_mul_zero,zero_mul,mul_zero,add_zero]
  · simp only [h,if_false,coeff_add,coeff_C_mul]

theorem one_step (N sigma : ℕ) :
    A 1 (N+2) sigma=T*A 1 (N+1) sigma+
      (if (N+sigma)%2=0 then u*A 0 N sigma else z*v*A 1 N sigma) := by
  unfold A F
  rw [Acceptedd5eee9c4567a9bc2d46f3ad0.obligation]
  rw [map_add,map_mul,reordered_monomer,map_mul,reordered_edge]
  by_cases h : (N+sigma)%2=0
  · simp only [h,if_true,mul_assoc,coeff_add,coeff_C_mul,coeff_X_mul]
  · simp only [h,if_false,coeff_add,coeff_C_mul]

theorem zero_orientation_one (n : ℕ) :
    A 0 (2*n) 1=Ccell^n ∧ A 0 (2*n+1) 1=T*Ccell^n := by
  induction n with
  | zero => simpa using And.intro (A_boundaries 1).1 (A_boundaries 1).2.1
  | succ n ih =>
    have he := zero_step (2*n) 1
    have ho := zero_step (2*n+1) 1
    have h0 : (2*n+1)%2=1 := by omega
    have h1 : (2*n+1+1)%2=0 := by omega
    simp only [h0,show ¬(1:ℕ)=0 by omega,if_false,ih.1,ih.2] at he
    simp only [h1,if_true,zero_mul,add_zero] at ho
    constructor
    · rw [show 2*(n+1)=2*n+2 by omega,he,pow_succ]
      simp only [Ccell]
      ring
    · rw [show 2*(n+1)+1=(2*n+1)+2 by omega,ho]
      rw [show 2*n+1+1=2*n+2 by omega,he,pow_succ]
      simp only [Ccell]
      ring

theorem zero_orientation_zero (n : ℕ) :
    A 0 (2*n+1) 0=T*Ccell^n ∧ A 0 (2*n+2) 0=T^2*Ccell^n := by
  induction n with
  | zero =>
    have h := zero_step 0 0
    simp [A_boundaries] at h
    exact ⟨by simpa using (A_boundaries 0).2.1, by simpa [pow_two] using h⟩
  | succ n ih =>
    have he := zero_step (2*n+1) 0
    have ho := zero_step (2*n+2) 0
    have h0 : (2*n+1+0)%2=1 := by omega
    have h1 : (2*n+2+0)%2=0 := by omega
    simp only [h0,show ¬(1:ℕ)=0 by omega,if_false,ih.1,ih.2] at he
    simp only [h1,if_true,zero_mul,add_zero] at ho
    constructor
    · rw [show 2*(n+1)+1=(2*n+1)+2 by omega,he,pow_succ]
      simp only [Ccell]
      ring
    · rw [show 2*(n+1)+2=(2*n+2)+2 by omega,ho]
      rw [show 2*n+2+1=(2*n+1)+2 by omega,he,pow_succ]
      simp only [Ccell]
      ring
end
end SparseColorR88
#print axioms SparseColorR88.zero_orientation_zero
#print axioms SparseColorR88.one_step
