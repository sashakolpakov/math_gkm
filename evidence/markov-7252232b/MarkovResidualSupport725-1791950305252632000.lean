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

def Wedge725 (p : BiPoly) : Prop := ∀ r i, r < i → coeff p r i=0

theorem wedge_add725 {p q : BiPoly} (hp : Wedge725 p) (hq : Wedge725 q) :
    Wedge725 (p+q) := by
  intro r i hri
  change coeff p r i+coeff q r i=0
  rw [hp r i hri,hq r i hri]; rfl

theorem wedge_U725 {p : BiPoly} (hp : Wedge725 p) : Wedge725 (U*p) := by
  intro r i hri
  cases r with
  | zero => simp
  | succ r => rw [coeff_U_succ725]; exact hp r i (by omega)

theorem wedge_UV725 {p : BiPoly} (hp : Wedge725 p) : Wedge725 (U*(V*p)) := by
  intro r i hri
  cases r with
  | zero => simp
  | succ r =>
    rw [coeff_U_succ725]
    cases i with
    | zero => omega
    | succ i => rw [coeff_V_succ725]; exact hp r i (by omega)

theorem wedge_step725 {p : BiPoly × BiPoly} (hp : Wedge725 p.1)
    (hq : Wedge725 p.2) (r : Bool) :
    let z := rowStep774 (X : Polynomial ℤ) p r
    Wedge725 z.1 ∧ Wedge725 z.2 := by
  have hh := wedge_add725 hp (wedge_UV725 hq)
  cases r
  · have he : rowStep774 (X : Polynomial ℤ) p false =
        (p.1+U*(V*p.2),(p.1+U*(V*p.2))+U*p.2) := by
      simp [rowStep774,U,V,map_add,map_one]; constructor <;> ring
    rw [he]
    exact ⟨hh,wedge_add725 hh (wedge_U725 hq)⟩
  · have he : rowStep774 (X : Polynomial ℤ) p true =
        ((p.1+U*(V*p.2))+U*p.1,p.1+U*(V*p.2)) := by
      simp [rowStep774,U,V]; constructor <;> ring
    rw [he]
    exact ⟨wedge_add725 hh (wedge_U725 hp),hh⟩

theorem wedge_fold725 (w : List Bool) (p : BiPoly × BiPoly)
    (hp : Wedge725 p.1) (hq : Wedge725 p.2) :
    let z := w.foldl (rowStep774 (X : Polynomial ℤ)) p
    Wedge725 z.1 ∧ Wedge725 z.2 := by
  induction w generalizing p with
  | nil => exact ⟨hp,hq⟩
  | cons r rs ih =>
    have hh := wedge_step725 hp hq r
    exact ih _ hh.1 hh.2

theorem wordQuotient_wedge725 (w : List Bool) :
    Wedge725 (wordQuotient774 (X : Polynomial ℤ) w) := by
  have ho : Wedge725 1 := by
    intro r i hri
    by_cases hr : r=0
    · subst r; simp [coeff,Polynomial.coeff_one,show i≠0 by omega]
    · simp [coeff,Polynomial.coeff_one,hr]
  have hh := wedge_fold725 w (1,1) ho ho
  have he := wedge_add725 hh.1 (wedge_UV725 hh.2)
  convert he using 1 <;> simp only [wordQuotient774,U,V] <;> ring

theorem quotient_slice_degree725 (path : List Bool) (r i : ℕ) (hri : r < i) :
    (quotientSlice774 path r).coeff i=0 := by
  obtain ⟨w,_,_,he⟩ := source_word774 (X : Polynomial ℤ) path
  unfold quotientSlice774
  rw [he]
  exact wordQuotient_wedge725 w r i hri

theorem quotient_slice_interval_nat725 (path : List Bool) (r i k l : ℕ)
    (hik : i≤k) (hkl : k≤l)
    (hi : 0<(quotientSlice774 path r).coeff i)
    (hl : 0<(quotientSlice774 path r).coeff l) :
    0<(quotientSlice774 path r).coeff k := by
  have hlr : l≤r := by
    by_contra hn
    rw [quotient_slice_degree725 path r l (by omega)] at hl
    omega
  exact quotient_slice_rightFilled725 path r i k hi hik (by omega)

theorem quotient_slice_interval725 (path : List Bool) (r : ℕ) :
    IntervalSupport774 (CoeffSeq ((quotientSlice774 path r).map (Int.castRingHom ℝ))) := by
  have he : CoeffSeq ((quotientSlice774 path r).map (Int.castRingHom ℝ)) =
      zeroSeq725 (quotientSlice774 path r).coeff := by
    funext k
    simp only [CoeffSeq,zeroSeq725,Polynomial.coeff_map]
    rfl
  rw [he]
  exact zeroSeq_interval725 _ (quotient_slice_interval_nat725 path r)

/-- The interval premise in the inherited transfer is now discharged.
The universal adjacent residual inequalities remain an explicit hypothesis. -/
theorem upper_raw_lc_of_adjacent725 (path : List Bool) (r i j : ℕ)
    (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1)
    (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1)
    (ha : ∀ k, let f := CoeffSeq ((quotientSlice774 path r).map (Int.castRingHom ℝ))
      f (k-1)*f (k+1) ≤ f k^2) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 :=
  upper_raw_lc_of_adjacent_interval774 path r i j hr hd ha (quotient_slice_interval725 path r)

#print axioms quotient_slice_rightFilled725
#print axioms quotient_slice_degree725
#print axioms quotient_slice_interval725
#print axioms upper_raw_lc_of_adjacent725
end
end MathGKM.Markov
