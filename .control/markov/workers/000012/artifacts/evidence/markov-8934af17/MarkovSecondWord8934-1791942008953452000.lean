import MarkovSecondJet8934

/-! Machine-authored exact second-row formula for all nonempty A-core-B words. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def adj8934 (e : Bool) : List Bool → ℕ
  | [] => 0
  | r::rs => (if e && r then 1 else 0)+adj8934 r rs
def last8934 (e : Bool) : List Bool → Bool
  | [] => e
  | r::rs => last8934 r rs
def stat8934 (e : Bool) (w : List Bool) : ℕ :=
  (if e then 1 else 0)+(if last8934 e w then 1 else 0)+2*adj8934 e w

theorem stat_bound8934 (e : Bool) (w : List Bool) :
    stat8934 e w ≤ 2*(e::w).count true := by
  have aux (z : List Bool) (r : Bool) :
      (if last8934 r z then (1 : ℕ) else 0)+2*adj8934 r z ≤
        (if r then 1 else 0)+2*z.count true := by
    induction z generalizing r with
    | nil => simp only [last8934,adj8934,List.count_nil,mul_zero,add_zero]; exact le_rfl
    | cons t ts ih =>
      have h := ih t
      cases r <;> cases t <;> simp [last8934,adj8934,List.count_cons] at h ⊢ <;> split_ifs at h ⊢ <;> omega
  have h := aux w e
  cases e <;> simp [stat8934,List.count_cons] at * <;> omega

theorem hjet_fold8934 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (f : Bool) (k : ℕ) (r : Bool) (p : Polynomial R × Polynomial R)
    (h : HJet8934 x n m f k r p) (w : List Bool) :
    HJet8934 x (n+w.length) (m+w.count true) f (k+adj8934 r w)
      (last8934 r w) (w.foldl (hrowStep46 x) p) := by
  induction w generalizing n m k r p with
  | nil => simpa [last8934,adj8934] using h
  | cons e es ih =>
    have hh := ih (n+1) (m+if e then 1 else 0) (k+if r && e then 1 else 0)
      e _ (hjet_step8934 x n m f k r e p h)
    cases e <;> cases r <;>
      simpa [last8934,adj8934,List.count_cons,add_assoc,add_comm,add_left_comm] using hh

def secondExpr8934 {R : Type*} [CommRing R] (x n m s : R) : R :=
  4*s+(9*m^2+13*m+6)*x+(6*m^2+6*m*n+8*m+6*n+6)*x^2+
    (m+n+2)*(m+n+1)*x^3

theorem hjet_final8934 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (f : Bool) (k : ℕ) (r : Bool) (p : Polynomial R × Polynomial R)
    (h : HJet8934 x n m f k r p) :
    2*(x+1)^3*((C x+X)*p.1+C x*(C x+X+1)*p.2).coeff 2 =
      x^m*(x+1)^n*secondExpr8934 x n m
        ((if f then 1 else 0)+(if r then 1 else 0)+2*(k:R)) := by
  obtain ⟨⟨hp0,hq0,hs1⟩,hp1,hs2⟩ := h
  rw [← hq0]
  simp [coeff_mul_two8934,coeff_mul_one46,Polynomial.mul_coeff_zero,
    Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
    Polynomial.coeff_one,jetExpr8934,secondExpr8934] at hs2 ⊢
  cases f <;> cases r <;> simp at hp1 hs2 ⊢ <;>
    linear_combination hs2+2*x*(x+1)*hs1+2*(x+1)*hp1

theorem word_second_scaled8934 {R : Type*} [CommRing R] (x : R)
    (e : Bool) (w : List Bool) :
    2*(x+1)^3*(hword46 x (e::w)).coeff 2 =
      x^((e::w).count true)*(x+1)^(e::w).length*
        secondExpr8934 x (e::w).length ((e::w).count true) (stat8934 e w) := by
  have h := hjet_fold8934 x 1 (if e then 1 else 0) e 0 e _ (hjet_init8934 x e) w
  have hh := hjet_final8934 x _ _ _ _ _ _ h
  cases e <;> simpa [hword46,stat8934,List.count_cons,add_comm,add_left_comm,add_assoc] using hh

theorem word_second8934 (e : Bool) (w : List Bool) (hn : 3 ≤ (e::w).length) :
    2*(hword46 (X : Polynomial ℤ) (e::w)).coeff 2 =
      X^((e::w).count true)*(X+1)^((e::w).length-3)*
        secondExpr8934 X (e::w).length ((e::w).count true) (stat8934 e w) := by
  have hz : (X+1 : Polynomial ℤ)^3 ≠ 0 := by
    apply pow_ne_zero
    intro h
    have hh := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
    norm_num [Polynomial.coeff_one] at hh
  apply mul_left_cancel₀ hz
  have he : (X+1 : Polynomial ℤ)^(e::w).length=
      (X+1)^3*(X+1)^((e::w).length-3) := by
    rw [← pow_add]; congr 1; omega
  have h := word_second_scaled8934 (X : Polynomial ℤ) e w
  rw [he] at h
  linear_combination h

#print axioms word_second8934
#print axioms stat_bound8934
end
end MathGKM.Markov
