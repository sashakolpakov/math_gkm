/- Machine-authored round-24 direct raw deficit product candidate.
No homogeneous lift, variable reordering or normalization theorem is imported. -/
import MathGKM.Accepteda8144c132dd8dbe04a863ee2
open MathGKM.Markov
open ClearedLayersR20
noncomputable section
set_option maxHeartbeats 2000000
namespace RawDeficitR24

def Bounded (P : BiPoly) (d : ℕ) : Prop :=
  ∀ i j, d < i+j → coeff P i j = 0

theorem select_coeff (P : BiPoly) (d r i j : ℕ) :
    coeff (rawLayer P d r) i j = if i+j+r=d then coeff P i j else 0 :=
  Accepteda8144c132dd8dbe04a863ee2.obligation.1 P d r i j

theorem bi_add (P Q : BiPoly) (i j : ℕ) :
    coeff (P+Q) i j = coeff P i j + coeff Q i j := by
  simp only [coeff,Polynomial.coeff_add]

theorem bi_sub (P Q : BiPoly) (i j : ℕ) :
    coeff (P-Q) i j = coeff P i j - coeff Q i j := by
  simp only [coeff,Polynomial.coeff_sub]

theorem raw_add (P Q : BiPoly) (d r : ℕ) :
    rawLayer (P+Q) d r = rawLayer P d r + rawLayer Q d r := by
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change coeff _ i j = coeff _ i j
  rw [bi_add,select_coeff,select_coeff,select_coeff,bi_add]
  split_ifs <;> simp

theorem raw_sub (P Q : BiPoly) (d r : ℕ) :
    rawLayer (P-Q) d r = rawLayer P d r - rawLayer Q d r := by
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change coeff _ i j = coeff _ i j
  rw [bi_sub,select_coeff,select_coeff,select_coeff,bi_sub]
  split_ifs <;> simp

theorem coeff_product (P Q : BiPoly) (i j : ℕ) :
    coeff (P*Q) i j = ∑ uv ∈ Finset.HasAntidiagonal.antidiagonal i,
      ∑ st ∈ Finset.HasAntidiagonal.antidiagonal j, coeff P uv.1 st.1 * coeff Q uv.2 st.2 := by
  simp only [coeff, Polynomial.coeff_mul, Polynomial.finsetSum_coeff]

theorem deficit_split (d e r x y : ℕ) (A B : ℤ)
    (hx : x≤d) (hy : y≤e) :
    (if x+y+r=d+e then A*B else 0) =
      ∑ hk ∈ Finset.HasAntidiagonal.antidiagonal r,
        (if x+hk.1=d then A else 0)*(if y+hk.2=e then B else 0) := by
  classical
  by_cases ht : x+y+r=d+e
  · rw [if_pos ht, Finset.sum_eq_single (d-x,e-y)]
    · simp [show x+(d-x)=d by omega,show y+(e-y)=e by omega]
    · intro hk hhk hne
      have hsum := Finset.HasAntidiagonal.mem_antidiagonal.mp hhk
      by_cases h1 : x+hk.1=d
      · have h2 : y+hk.2≠e := by
          intro h2
          apply hne
          apply Prod.ext <;> dsimp only <;> omega
        simp [h2]
      · simp [h1]
    · intro hn
      exact False.elim (hn (Finset.HasAntidiagonal.mem_antidiagonal.mpr (by omega)))
  · rw [if_neg ht]
    symm
    apply Finset.sum_eq_zero
    intro hk hhk
    have hsum := Finset.HasAntidiagonal.mem_antidiagonal.mp hhk
    by_cases h1 : x+hk.1=d
    · have h2 : y+hk.2≠e := by omega
      simp [h2]
    · simp [h1]

theorem raw_mul (P Q : BiPoly) (d e r : ℕ)
    (hp : Bounded P d) (hq : Bounded Q e) :
    rawLayer (P*Q) (d+e) r =
      ∑ hk ∈ Finset.HasAntidiagonal.antidiagonal r, rawLayer P d hk.1 * rawLayer Q e hk.2 := by
  classical
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change coeff _ i j = coeff _ i j
  rw [select_coeff]
  have right : coeff (∑ hk ∈ Finset.HasAntidiagonal.antidiagonal r,
      rawLayer P d hk.1 * rawLayer Q e hk.2) i j =
      ∑ uv ∈ Finset.HasAntidiagonal.antidiagonal i, ∑ st ∈ Finset.HasAntidiagonal.antidiagonal j,
        ∑ hk ∈ Finset.HasAntidiagonal.antidiagonal r,
          (if uv.1+st.1+hk.1=d then coeff P uv.1 st.1 else 0)*
          (if uv.2+st.2+hk.2=e then coeff Q uv.2 st.2 else 0) := by
    simp only [coeff, Polynomial.finsetSum_coeff]
    change (∑ hk ∈ Finset.HasAntidiagonal.antidiagonal r,
      coeff (rawLayer P d hk.1 * rawLayer Q e hk.2) i j) = _
    simp_rw [coeff_product, select_coeff]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro uv huv
    rw [Finset.sum_comm]
    rfl
  rw [right,coeff_product]
  by_cases ht : i+j+r=d+e
  · rw [if_pos ht]
    apply Finset.sum_congr rfl
    intro uv huv
    apply Finset.sum_congr rfl
    intro st hst
    have hi := Finset.HasAntidiagonal.mem_antidiagonal.mp huv
    have hj := Finset.HasAntidiagonal.mem_antidiagonal.mp hst
    by_cases hP : coeff P uv.1 st.1=0
    · simp [hP]
    by_cases hQ : coeff Q uv.2 st.2=0
    · simp [hQ]
    have hx : uv.1+st.1≤d := by
      by_contra hn
      exact hP (hp _ _ (by omega))
    have hy : uv.2+st.2≤e := by
      by_contra hn
      exact hQ (hq _ _ (by omega))
    have h := deficit_split d e r (uv.1+st.1) (uv.2+st.2)
      (coeff P uv.1 st.1) (coeff Q uv.2 st.2) hx hy
    simpa [show uv.1+st.1+(uv.2+st.2)+r=d+e by omega] using h
  · rw [if_neg ht]
    symm
    apply Finset.sum_eq_zero
    intro uv huv
    apply Finset.sum_eq_zero
    intro st hst
    apply Finset.sum_eq_zero
    intro hk hhk
    have hi := Finset.HasAntidiagonal.mem_antidiagonal.mp huv
    have hj := Finset.HasAntidiagonal.mem_antidiagonal.mp hst
    have hr := Finset.HasAntidiagonal.mem_antidiagonal.mp hhk
    by_cases h1 : uv.1+st.1+hk.1=d
    · have h2 : uv.2+st.2+hk.2≠e := by omega
      simp [h2]
    · simp [h1]

end RawDeficitR24
