import MarkovIntervals725
import MarkovTransfer774

/-! Machine-authored request 7252232b. No internal gaps for the actual
quotient slices. This discharges support, not residual log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def RightFilled725 (p : BiPoly) : Prop :=
  ∀ r i, 0<coeff p r i → ∀ k, i≤k → k≤r → 0<coeff p r k
def OuterBound725 (n : ℕ) (p : BiPoly) : Prop :=
  ∀ r i, n<r → coeff p r i=0
def DiagTop725 (n : ℕ) (p : BiPoly) : Prop :=
  ∀ r, r≤n → 0<coeff p r r
def QGood725 (n : ℕ) (p : BiPoly) : Prop :=
  PolyNonneg16 p ∧ RightFilled725 p ∧ OuterBound725 n p ∧ DiagTop725 n p

theorem rightFilled_add725 {p q : BiPoly} (hp : RightFilled725 p)
    (hq : RightFilled725 q) (np : PolyNonneg16 p) (nq : PolyNonneg16 q) :
    RightFilled725 (p+q) := by
  intro r i h k hik hkr
  change 0<coeff p r i+coeff q r i at h
  change 0<coeff p r k+coeff q r k
  by_cases hh : 0<coeff p r i
  · exact add_pos_of_pos_of_nonneg (hp r i hh k hik hkr) (nq r k)
  · exact add_pos_of_nonneg_of_pos (np r k) (hq r i (by omega) k hik hkr)

theorem rightFilled_UV725 {p : BiPoly} (hp : RightFilled725 p) :
    RightFilled725 (U*(V*p)) := by
  intro r i h k hik hkr
  cases r with
  | zero => simp at h
  | succ r =>
    simp only [coeff_U_succ725] at h ⊢
    cases i with
    | zero => simp at h
    | succ i =>
      cases k with
      | zero => omega
      | succ k =>
        simp only [coeff_V_succ725] at h ⊢
        exact hp r i h k (by omega) (by omega)

theorem outer_add725 {n : ℕ} {p q : BiPoly} (hp : OuterBound725 n p)
    (hq : OuterBound725 n q) : OuterBound725 n (p+q) := by
  intro r i hr
  change coeff p r i+coeff q r i=0
  rw [hp r i hr,hq r i hr]; rfl

theorem outer_U725 {n : ℕ} {p : BiPoly} (hp : OuterBound725 n p) :
    OuterBound725 (n+1) (U*p) := by
  intro r i hr
  cases r with
  | zero => simp
  | succ r => rw [coeff_U_succ725]; exact hp r i (by omega)

theorem qmix_good725 {n : ℕ} {p q : BiPoly} (hp : QGood725 n p)
    (hq : QGood725 n q) : QGood725 (n+1) (p+U*(V*q)) := by
  obtain ⟨np,fp,bp,tp⟩ := hp
  obtain ⟨nq,fq,bq,tq⟩ := hq
  have nb := poly_mul_nonneg16 poly_U_nonneg16 (poly_mul_nonneg16 poly_V_nonneg16 nq)
  refine ⟨poly_add_nonneg16 np nb,rightFilled_add725 fp (rightFilled_UV725 fq) np nb,?_,?_⟩
  · apply outer_add725 (fun r i hr => bp r i (by omega))
    apply outer_U725
    intro r i hr
    cases i with
    | zero => simp
    | succ i => rw [coeff_V_succ725]; exact bq r i hr
  · intro r hr
    change 0<coeff p r r+coeff (U*(V*q)) r r
    by_cases hn : r≤n
    · exact add_pos_of_pos_of_nonneg (tp r hn) (nb r r)
    · cases r with
      | zero => omega
      | succ r =>
        rw [coeff_U_succ725,coeff_V_succ725]
        exact add_pos_of_nonneg_of_pos (np (r+1) (r+1)) (tq r (by omega))

theorem qadd_lower_good725 {n : ℕ} {h p : BiPoly} (hh : QGood725 (n+1) h)
    (hp : QGood725 n p) : QGood725 (n+1) (h+U*p) := by
  obtain ⟨nh,fh,bh,th⟩ := hh
  obtain ⟨np,fp,bp,tp⟩ := hp
  have nu := poly_mul_nonneg16 poly_U_nonneg16 np
  refine ⟨poly_add_nonneg16 nh nu,?_,outer_add725 bh (outer_U725 bp),?_⟩
  · intro r i he k hik hkr
    change 0<coeff h r i+coeff (U*p) r i at he
    change 0<coeff h r k+coeff (U*p) r k
    by_cases hh : 0<coeff h r i
    · exact add_pos_of_pos_of_nonneg (fh r i hh k hik hkr) (nu r k)
    · have hu : 0<coeff (U*p) r i := by omega
      cases r with
      | zero => simp at hu
      | succ r =>
        rw [coeff_U_succ725] at hu ⊢
        have hrn : r≤n := by
          by_contra hn
          rw [bp r i (by omega)] at hu
          omega
        by_cases hkr' : k≤r
        · exact add_pos_of_nonneg_of_pos (nh (r+1) k) (fp r i hu k hik hkr')
        · have hk : k=r+1 := by omega
          subst k
          exact add_pos_of_pos_of_nonneg (th (r+1) (by omega)) (np r (r+1))
  · intro r hr
    exact add_pos_of_pos_of_nonneg (th r hr) (nu r r)

theorem qgood_one725 : QGood725 0 1 := by
  refine ⟨poly_one_nonneg16,?_,?_,?_⟩
  · intro r i hi k hik hkr
    by_cases hr : r=0
    · have hk : k=0 := by omega
      subst r; subst k
      norm_num [coeff]
    · simp [coeff,Polynomial.coeff_one,hr] at hi
  · intro r i hr
    simp [coeff,Polynomial.coeff_one,show r≠0 by omega]
  · intro r hr
    have he : r=0 := by omega
    subst r
    norm_num [coeff]

theorem qgood_step725 {n : ℕ} {p : BiPoly × BiPoly}
    (hp : QGood725 n p.1) (hq : QGood725 n p.2) (r : Bool) :
    let z := rowStep774 (X : Polynomial ℤ) p r
    QGood725 (n+1) z.1 ∧ QGood725 (n+1) z.2 := by
  have hh := qmix_good725 hp hq
  cases r
  · have he : rowStep774 (X : Polynomial ℤ) p false =
        (p.1+U*(V*p.2),(p.1+U*(V*p.2))+U*p.2) := by
      simp [rowStep774,U,V,map_add,map_one]; constructor <;> ring
    rw [he]
    exact ⟨hh,qadd_lower_good725 hh hq⟩
  · have he : rowStep774 (X : Polynomial ℤ) p true =
        ((p.1+U*(V*p.2))+U*p.1,p.1+U*(V*p.2)) := by
      simp [rowStep774,U,V]; constructor <;> ring
    rw [he]
    exact ⟨qadd_lower_good725 hh hp,hh⟩

theorem qgood_fold725 (w : List Bool) (n : ℕ) (p : BiPoly × BiPoly)
    (hp : QGood725 n p.1) (hq : QGood725 n p.2) :
    let z := w.foldl (rowStep774 (X : Polynomial ℤ)) p
    QGood725 (n+w.length) z.1 ∧ QGood725 (n+w.length) z.2 := by
  induction w generalizing n p with
  | nil => simpa using And.intro hp hq
  | cons r rs ih =>
    have hh := qgood_step725 hp hq r
    have he := ih (n+1) _ hh.1 hh.2
    simpa [List.foldl_cons,List.length_cons,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using he

theorem wordQuotient_good725 (w : List Bool) :
    QGood725 (w.length+1) (wordQuotient774 (X : Polynomial ℤ) w) := by
  have hh := qgood_fold725 w 0 (1,1) qgood_one725 qgood_one725
  simp only [zero_add] at hh
  have he := qmix_good725 hh.1 hh.2
  convert he using 1 <;> simp only [wordQuotient774,U,V] <;> ring

theorem quotient_slice_rightFilled725 (path : List Bool) (r i k : ℕ)
    (hi : 0<(quotientSlice774 path r).coeff i) (hik : i≤k) (hkr : k≤r) :
    0<(quotientSlice774 path r).coeff k := by
  obtain ⟨w,_,_,he⟩ := source_word774 (X : Polynomial ℤ) path
  unfold quotientSlice774 at hi ⊢
  rw [he] at hi ⊢
  exact (wordQuotient_good725 w).2.1 r i hi k hik hkr

#print axioms quotient_slice_rightFilled725
end
end MathGKM.Markov
