import MathGKM.Accepted622fa1ce4c6e5c6585deaf83

/-! Machine-authored 2026-10-19. Denominator transport at z=1 for the
publisher Laurent family. All source-family premises remain explicit.
In particular, this file does not assume polynomiality as a new axiom.
-/
namespace MathGKM.Markov
noncomputable section

def affineDen {K : Type*} [Field K] (x y : K) (a b : ℕ) : K :=
  x ^ ((a : ℤ) - 1) * y ^ ((b : ℤ) - 1)

theorem affineDen_product {K : Type*} [Field K] (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) (a b c d : ℕ) :
    affineDen x y (a+2*c) (b+2*d) =
      (x*y) * affineDen x y c d * affineDen x y (a+c) (b+d) := by
  have hp (t : K) (ht : t ≠ 0) (i j : ℕ) :
      t ^ (((i+2*j : ℕ) : ℤ)-1) =
        t * t ^ ((j : ℤ)-1) * t ^ (((i+j : ℕ) : ℤ)-1) := by
    conv_rhs => lhs; lhs; rw [← zpow_one t]
    rw [← zpow_add₀ ht, ← zpow_add₀ ht]
    congr 1
    push_cast
    ring
  unfold affineDen
  rw [hp x hx a c, hp y hy b d]
  ring

theorem affineDen_old {K : Type*} [Field K] (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) (a b c d : ℕ) :
    affineDen x y (a+2*c) (b+2*d) =
      (x^2)^c * (y^2)^d * affineDen x y a b := by
  have hp (t : K) (ht : t ≠ 0) (i j : ℕ) :
      t ^ (((i+2*j : ℕ) : ℤ)-1) = (t^2)^j * t ^ ((i : ℤ)-1) := by
    rw [← pow_mul, ← zpow_natCast, ← zpow_add₀ ht]
    congr 1
    push_cast
    ring
  unfold affineDen
  rw [hp x hx a c, hp y hy b d]
  ring

theorem affineDen_mutation {K : Type*} [Field K] (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) (a b c d : ℕ) (A B C : K) :
    affineDen x y (a+2*c) (b+2*d) *
      (((x^2+y^2+1)/(x*y))*B*C-A) =
    (x^2+y^2+1) * (affineDen x y c d * B) *
      (affineDen x y (a+c) (b+d) * C) -
      (x^2)^c * (y^2)^d * (affineDen x y a b * A) := by
  rw [mul_sub, ← mul_assoc, ← mul_assoc]
  conv_lhs => lhs; lhs; lhs; rw [affineDen_product x y hx hy]
  conv_lhs => rhs; rw [affineDen_old x y hx hy]
  field_simp

/-- An explicit affine source specification. The mutation premise must be
proved for an independently specified source family, not assumed as an axiom. -/
structure AffineLaurentFamily {K : Type*} [Field K] (x y : K)
    (M : ℕ → ℕ → K) : Prop where
  zero : M 0 1 = x
  one : M 1 1 = x^2+y^2
  half : M 1 2 = ((x^2+y^2)^2+x^2)/y
  mutation : ∀ a b c d : ℕ, 0 < b → 0 < d → a ≤ b → c ≤ d →
    ((b : ℤ)*c-(a : ℤ)*d=1 ∨ (b : ℤ)*c-(a : ℤ)*d = -1) →
    M (a+2*c) (b+2*d) =
      ((x^2+y^2+1)/(x*y))*M c d*M (a+c) (b+d)-M a b

theorem affine_source_initial_recurrence {K : Type*} [Field K]
    (φ : BiPoly →+* K) (hinj : Function.Injective φ) (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) (hu : φ U = x^2) (hv : φ V = y^2)
    (M : ℕ → ℕ → K) (Q : ℕ → ℕ → BiPoly)
    (hs : AffineLaurentFamily x y M)
    (hn : ∀ a b, φ (Q a b) = affineDen x y a b * M a b) :
    Q 0 1 = 1 ∧ Q 1 1 = U+V ∧ Q 1 2 = (U+V)^2+U ∧
      FareyNumeratorRecurrence Q := by
  have hS : φ S = x^2+y^2+1 := by simp [S, hu, hv]
  refine ⟨?_, ?_, ?_, ?_⟩
  · apply hinj
    rw [hn, hs.zero, map_one]
    simp [affineDen, hx]
  · apply hinj
    rw [hn, hs.one]
    simp [affineDen, hu, hv]
  · apply hinj
    rw [hn, hs.half]
    simp [affineDen, hu, hv]
    field_simp
  · intro a b c d hb hd hab hcd hdet
    apply hinj
    simp only [map_sub, map_mul, map_pow, hS, hu, hv, hn]
    rw [hs.mutation a b c d hb hd hab hcd hdet]
    exact affineDen_mutation x y hx hy a b c d (M a b) (M c d)
      (M (a+c) (b+d))

/-- Reuse of the freshly rebuilt accepted coverage interface. This is a
conditional bridge; no assertion instantiates its source premises. -/
theorem affine_source_covers_rationals {K : Type*} [Field K]
    (φ : BiPoly →+* K) (hinj : Function.Injective φ) (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) (hu : φ U = x^2) (hv : φ V = y^2)
    (M : ℕ → ℕ → K) (Q : ℕ → ℕ → BiPoly)
    (hs : AffineLaurentFamily x y M)
    (hn : ∀ a b, φ (Q a b) = affineDen x y a b * M a b)
    (a b : ℕ) (ha : 0<a) (hab : a≤b) (hc : Nat.Coprime a b) :
    ((a=1 ∧ b=1) ∧ Q a b = U+V) ∨
      ∃ path : List Bool, (frame path).mid.a=a ∧ (frame path).mid.b=b ∧
        Q a b = (frame path).mid.p := by
  obtain ⟨h0,h1,h2,hr⟩ :=
    affine_source_initial_recurrence φ hinj x y hx hy hu hv M Q hs hn
  exact Accepted622fa1ce4c6e5c6585deaf83.obligation Q h0 h1 h2 hr a b ha hab hc

end
end MathGKM.Markov
