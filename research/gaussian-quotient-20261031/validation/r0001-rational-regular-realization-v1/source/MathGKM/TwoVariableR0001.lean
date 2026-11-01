import MathGKM.TwoDenominatorR0001
import Mathlib.RingTheory.Polynomial.UniqueFactorization
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.Algebra.MvPolynomial.Division
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.RingTheory.Regular.RegularSequence

noncomputable section
namespace MathGKM.GaussianQuotient.TwoVariableR0001
open TwoDenominatorR0001
abbrev R := MvPolynomial Bool ℚ
def x : R := MvPolynomial.X false
def y : R := MvPolynomial.X true
def bin (A B : ℕ) : R := x^A+y^B
def mon (i j : ℕ) : R := x^i*y^j
def w (u v : ℕ) (s : Bool) : ℕ := if s then v else u

/-- The two non-zero-divisor conditions and properness, without a Hilbert-series premise. -/
def RegularPair (f g : R) : Prop :=
  IsRegular f ∧ IsRegular (Ideal.Quotient.mk (Ideal.span {f}) g) ∧
    Ideal.span ({f,g} : Set R) ≠ ⊤

open scoped Pointwise

theorem regularPair_sequence (f g : R) (h : RegularPair f g) :
    RingTheory.Sequence.IsRegular R [f,g] := by
  obtain ⟨hf,hg,hproper⟩ := h
  constructor
  · constructor
    intro i hi
    have hii : i = 0 ∨ i = 1 := by simp at hi; omega
    rcases hii with rfl | rfl
    · simp only [List.take_zero, List.getElem_cons_zero]
      apply (isSMulRegular_quotient_iff_mem_of_smul_mem _ _).mpr
      intro p hp
      simpa using (isLeftRegular_iff_right_eq_zero_of_mul.mp hf.left) p (by simpa using hp)
    · simp only [List.take_succ_cons, List.take_zero, List.getElem_cons_succ,
        List.getElem_cons_zero]
      apply (isSMulRegular_quotient_iff_mem_of_smul_mem _ _).mpr
      intro p hp
      have hm : g*p ∈ Ideal.span {f} := by
        simpa [Ideal.ofList, Ideal.smul_top_eq_map] using hp
      have hh : Ideal.Quotient.mk (Ideal.span {f}) g * Ideal.Quotient.mk (Ideal.span {f}) p = 0 := by
        rw [← map_mul]
        exact Ideal.Quotient.eq_zero_iff_mem.mpr hm
      have he := (isLeftRegular_iff_right_eq_zero_of_mul.mp hg.left) _ hh
      have : p ∈ Ideal.span {f} := Ideal.Quotient.eq_zero_iff_mem.mp he
      simpa [Ideal.ofList, Ideal.smul_top_eq_map] using this
  · intro he
    apply hproper
    have he' : (⊤ : Ideal R) = Ideal.span ({f,g}:Set R) := by
      simpa [Ideal.ofList, Ideal.smul_top_eq_map, Set.setOf_or,
        Set.setOf_eq_eq_singleton, Set.pair_comm] using he
    exact he'.symm

theorem bin_coprime_coordinates (A B : ℕ) (hA : 0 < A) (hB : 0 < B) :
    IsRelPrime (bin A B) x ∧ IsRelPrime (bin A B) y := by
  constructor
  · apply IsRelPrime.symm
    apply (MvPolynomial.X_prime (i := false) (R := ℚ)).irreducible.isRelPrime_iff_not_dvd.mpr
    rintro ⟨p, hp⟩
    have he := congrArg (MvPolynomial.eval (fun s : Bool => if s then (1:ℚ) else 0)) hp
    simpa [bin, x, y, hA.ne', map_add, map_pow, map_mul] using he
  · apply IsRelPrime.symm
    apply (MvPolynomial.X_prime (i := true) (R := ℚ)).irreducible.isRelPrime_iff_not_dvd.mpr
    rintro ⟨p, hp⟩
    have he := congrArg (MvPolynomial.eval (fun s : Bool => if s then (0:ℚ) else 1)) hp
    simpa [bin, x, y, hB.ne', map_add, map_pow, map_mul] using he

theorem quotient_regular_of_relprime (f g : R) (h : IsRelPrime f g) :
    IsRegular (Ideal.Quotient.mk (Ideal.span {f}) g) := by
  apply isLeftRegular_iff_isRegular.mp
  apply isLeftRegular_iff_right_eq_zero_of_mul.mpr
  intro z hz
  obtain ⟨p, rfl⟩ := Ideal.Quotient.mk_surjective z
  have hm : g*p ∈ Ideal.span {f} := by
    apply Ideal.Quotient.eq_zero_iff_mem.mp
    simpa only [map_mul] using hz
  have hd : f ∣ p := h.dvd_of_dvd_mul_left (Ideal.mem_span_singleton.mp hm)
  exact Ideal.Quotient.eq_zero_iff_mem.mpr (Ideal.mem_span_singleton.mpr hd)

theorem proper_pair_of_eval_zero (f g : R)
    (hf : MvPolynomial.eval (fun _ : Bool => (0:ℚ)) f = 0)
    (hg : MvPolynomial.eval (fun _ : Bool => (0:ℚ)) g = 0) :
    Ideal.span ({f,g} : Set R) ≠ ⊤ := by
  let ev := MvPolynomial.eval (fun _ : Bool => (0:ℚ))
  have hh : Ideal.span ({f,g} : Set R) ≤ RingHom.ker ev := by
    apply Ideal.span_le.mpr
    intro z hz
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hz
    rcases hz with rfl | rfl
    · exact hf
    · exact hg
  intro he
  have hm : (1:R) ∈ Ideal.span ({f,g} : Set R) := by rw [he]; trivial
  have hc := hh hm
  change ev 1 = 0 at hc
  simpa using hc

theorem bin_mon_regular (A B i j : ℕ) (hA : 0 < A) (hB : 0 < B)
    (hi : 0 < i) : RegularPair (bin A B) (mon i j) := by
  obtain ⟨hx, hy⟩ := bin_coprime_coordinates A B hA hB
  have hf : bin A B ≠ 0 := by
    intro hz
    have he := congrArg (MvPolynomial.eval (fun s : Bool => if s then (1:ℚ) else 0)) hz
    simpa [bin, x, y, hA.ne', map_add, map_pow] using he
  refine ⟨IsRegular.of_ne_zero hf, quotient_regular_of_relprime _ _ ?_, ?_⟩
  · exact hx.pow_right.mul_right hy.pow_right
  · apply proper_pair_of_eval_zero
    · simp [bin, x, y, hA.ne', hB.ne']
    · simp [mon, x, y, hi.ne']

theorem pure_regular (A B : ℕ) (hA : 0 < A) (hB : 0 < B) :
    RegularPair (x^A) (y^B) := by
  have hxy : IsRelPrime x y := by
    apply (MvPolynomial.X_prime (i := false) (R := ℚ)).irreducible.isRelPrime_iff_not_dvd.mpr
    rintro ⟨p, hp⟩
    have he := congrArg (MvPolynomial.eval (fun s : Bool => if s then (1:ℚ) else 0)) hp
    simpa [x, y, map_mul] using he
  refine ⟨IsRegular.of_ne_zero (pow_ne_zero _ (MvPolynomial.X_ne_zero false)),
    quotient_regular_of_relprime _ _ hxy.pow, ?_⟩
  apply proper_pair_of_eval_zero <;> simp [x, y, hA.ne', hB.ne']

theorem reverse_pure_regular (A B : ℕ) (hA : 0 < A) (hB : 0 < B) :
    RegularPair (y^B) (x^A) := by
  have hxy : IsRelPrime y x := by
    apply (MvPolynomial.X_prime (i := true) (R := ℚ)).irreducible.isRelPrime_iff_not_dvd.mpr
    rintro ⟨p,hp⟩
    have he := congrArg (MvPolynomial.eval (fun s : Bool => if s then (0:ℚ) else 1)) hp
    simpa [x, y, map_mul] using he
  refine ⟨IsRegular.of_ne_zero (pow_ne_zero _ (MvPolynomial.X_ne_zero true)),
    quotient_regular_of_relprime _ _ hxy.pow, ?_⟩
  apply proper_pair_of_eval_zero <;> simp [x, y, hA.ne', hB.ne']

theorem reverse_bin_mon_regular (A B i j : ℕ) (hA : 0 < A) (hB : 0 < B)
    (hi : 0 < i) : RegularPair (mon i j) (bin A B) := by
  obtain ⟨hx,hy⟩ := bin_coprime_coordinates A B hA hB
  have hg : mon i j ≠ 0 := by
    exact mul_ne_zero (pow_ne_zero _ (MvPolynomial.X_ne_zero false))
      (pow_ne_zero _ (MvPolynomial.X_ne_zero true))
  refine ⟨IsRegular.of_ne_zero hg, quotient_regular_of_relprime _ _ ?_, ?_⟩
  · exact (hx.pow_right.mul_right hy.pow_right).symm
  · simpa [Set.pair_comm] using (bin_mon_regular A B i j hA hB hi).2.2

theorem bin_homogeneous (u v A B : ℕ) (h : u*A = v*B) :
    MvPolynomial.IsWeightedHomogeneous (w u v) (bin A B) (u*A) := by
  have hx := (MvPolynomial.isWeightedHomogeneous_X (R := ℚ) (w u v) false).pow A
  have hy := (MvPolynomial.isWeightedHomogeneous_X (R := ℚ) (w u v) true).pow B
  apply MvPolynomial.IsWeightedHomogeneous.add
  · simpa [w, x, nsmul_eq_mul, Nat.mul_comm] using hx
  · simpa [w, y, nsmul_eq_mul, Nat.mul_comm, h] using hy

theorem mon_homogeneous (u v i j : ℕ) :
    MvPolynomial.IsWeightedHomogeneous (w u v) (mon i j) (u*i+v*j) := by
  have hx := (MvPolynomial.isWeightedHomogeneous_X (R := ℚ) (w u v) false).pow i
  have hy := (MvPolynomial.isWeightedHomogeneous_X (R := ℚ) (w u v) true).pow j
  simpa [mon, x, y, w, nsmul_eq_mul, Nat.mul_comm] using hx.mul hy

theorem finite_weighted_piece (u v n : ℕ) (hu : 0 < u) (hv : 0 < v) :
    Module.Finite ℚ (MvPolynomial.weightedHomogeneousSubmodule ℚ (w u v) n) := by
  apply Module.Finite.iff_fg.mpr
  apply MvPolynomial.weightedHomogeneousSubmodule_fg
  intro s
  cases s <;> simp [w, hu.ne', hv.ne']

def quotientPiece (u v n : ℕ) (I : Ideal R) : Submodule ℚ (R ⧸ I) :=
  (MvPolynomial.weightedHomogeneousSubmodule ℚ (w u v) n).map
    (Ideal.Quotient.mkₐ ℚ I).toLinearMap

theorem finite_quotient_piece (u v n : ℕ) (I : Ideal R) (hu : 0 < u) (hv : 0 < v) :
    Module.Finite ℚ (quotientPiece u v n I) := by
  letI := finite_weighted_piece u v n hu hv
  exact Module.Finite.map _ _

theorem pure_homogeneous (u v A B : ℕ) :
    MvPolynomial.IsWeightedHomogeneous (w u v) (x^A) (u*A) ∧
    MvPolynomial.IsWeightedHomogeneous (w u v) (y^B) (v*B) := by
  constructor
  · simpa [w, x, nsmul_eq_mul, Nat.mul_comm] using
      (MvPolynomial.isWeightedHomogeneous_X (R := ℚ) (w u v) false).pow A
  · simpa [w, y, nsmul_eq_mul, Nat.mul_comm] using
      (MvPolynomial.isWeightedHomogeneous_X (R := ℚ) (w u v) true).pow B

def Realization (u v c d : ℕ) : Prop :=
  ∃ f g : R, RingTheory.Sequence.IsRegular R [f,g] ∧
    MvPolynomial.IsWeightedHomogeneous (w u v) f c ∧
    MvPolynomial.IsWeightedHomogeneous (w u v) g d

theorem realization_of_data (u v c d : ℕ) (h : Matched u v c d ∨ Mixed u v c d) :
    Realization u v c d := by
  rcases h with ⟨A,B,hA,hB,he⟩ | ⟨A,B,i,j,hA,hB,hi,hj,hiA,hjB,hAB,he⟩
  · obtain ⟨hx,hy⟩ := pure_homogeneous u v A B
    rcases he with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
    · exact ⟨x^A,y^B,regularPair_sequence _ _ (pure_regular A B hA hB),hx,hy⟩
    · exact ⟨y^B,x^A,regularPair_sequence _ _ (reverse_pure_regular A B hA hB),hy,hx⟩
  · have hx := bin_homogeneous u v A B hAB
    have hy := mon_homogeneous u v i j
    rcases he with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
    · exact ⟨bin A B,mon i j,regularPair_sequence _ _ (bin_mon_regular A B i j hA hB hi),hx,hy⟩
    · exact ⟨mon i j,bin A B,regularPair_sequence _ _ (reverse_bin_mon_regular A B i j hA hB hi),hy,hx⟩

theorem universal_realization (a b : ℕ) (H : Polynomial ℚ)
    (h : IntervalBridgeR0000.F a b 2 = iota H) :
    Realization (a+1) (a+2) (b+1) (b+2) :=
  realization_of_data _ _ _ _ (universal_arithmetic a b H h)

theorem construction_and_finiteness :
    (∀ (a b : ℕ) (H : Polynomial ℚ), IntervalBridgeR0000.F a b 2 = iota H →
      Realization (a+1) (a+2) (b+1) (b+2)) ∧
    (∀ (u v n : ℕ) (I : Ideal R), 0 < u → 0 < v →
      Module.Finite ℚ (quotientPiece u v n I)) :=
  ⟨universal_realization, finite_quotient_piece⟩

end MathGKM.GaussianQuotient.TwoVariableR0001
