import MathGKM.TwoDenominatorR0001

noncomputable section
namespace MathGKM.GaussianQuotient.TwoDenominatorPositiveR0001
open TwoDenominatorR0001 IntervalBridgeR0000

def evalNat : Polynomial ℕ →+* RatFunc ℚ :=
  iota.comp (Polynomial.mapRingHom (Nat.castRingHom ℚ))

@[simp] theorem evalNat_X : evalNat Polynomial.X = q := by simp [evalNat, q]

def geom (w n : ℕ) : Polynomial ℕ :=
  ∑ k ∈ Finset.range n, Polynomial.X ^ (w*k)

theorem geom_identity (w n : ℕ) :
    (1-q^w)*evalNat (geom w n) = 1-q^(w*n) := by
  induction n with
  | zero => simp [geom]
  | succ n ih =>
    have he : geom w (n+1) = geom w n + Polynomial.X^(w*n) := by
      simp only [geom, Finset.sum_range_succ]
    rw [he, map_add, map_pow, evalNat_X, mul_add, ih]
    rw [Nat.mul_add, Nat.mul_one, pow_add]
    ring

def rectangle (u v A B i j : ℕ) : Polynomial ℕ :=
  geom u i * geom v (B+j) + Polynomial.X^(u*i) * geom u (A-i) * geom v j

theorem rectangle_identity (u v A B i j : ℕ) (hiA : i ≤ A) (hAB : u*A=v*B) :
    (1-q^u)*(1-q^v)*evalNat (rectangle u v A B i j) =
      (1-q^(u*A))*(1-q^(u*i+v*j)) := by
  have he : u*i+u*(A-i) = u*A := by rw [← Nat.mul_add, Nat.add_sub_of_le hiA]
  have hpow : q^(u*i)*q^(u*(A-i)) = q^(u*A) := by rw [← pow_add, he]
  have hpow' : q^(v*B) = q^(u*A) := by rw [hAB]
  have h1 := geom_identity u i
  have h2 := geom_identity v (B+j)
  have h3 := geom_identity u (A-i)
  have h4 := geom_identity v j
  simp only [rectangle, map_add, map_mul, map_pow, evalNat_X]
  calc
    _ = ((1-q^u)*evalNat (geom u i))*((1-q^v)*evalNat (geom v (B+j))) +
        q^(u*i)*((1-q^u)*evalNat (geom u (A-i)))*((1-q^v)*evalNat (geom v j)) := by ring
    _ = (1-q^(u*i))*(1-q^(v*(B+j))) + q^(u*i)*(1-q^(u*(A-i)))*(1-q^(v*j)) := by rw [h1,h2,h3,h4]
    _ = _ := by
      rw [Nat.mul_add, pow_add, hpow', pow_add]
      linear_combination (q^(v*j)-1)*hpow

theorem natCoeffs_map (p : Polynomial ℕ) : NatCoeffs (p.map (Nat.castRingHom ℚ)) := by
  intro d
  exact ⟨p.coeff d, by simp⟩

theorem positive_witness_of_data (u v c d : ℕ)
    (h : Matched u v c d ∨ Mixed u v c d) :
    ∃ p : Polynomial ℕ,
      (1-q^u)*(1-q^v)*evalNat p = (1-q^c)*(1-q^d) := by
  rcases h with ⟨A,B,hA,hB,he⟩ | ⟨A,B,i,j,hA,hB,hi,hj,hiA,hjB,hAB,he⟩
  · refine ⟨geom u A * geom v B, ?_⟩
    have hid : (1-q^u)*(1-q^v)*evalNat (geom u A * geom v B) =
        (1-q^(u*A))*(1-q^(v*B)) := by
      rw [map_mul]
      calc
        _ = ((1-q^u)*evalNat (geom u A))*((1-q^v)*evalNat (geom v B)) := by ring
        _ = _ := by rw [geom_identity,geom_identity]
    rcases he with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
    · exact hid
    · simpa [mul_comm] using hid
  · refine ⟨rectangle u v A B i j, ?_⟩
    have hid := rectangle_identity u v A B i j hiA.le hAB
    rcases he with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
    · exact hid
    · simpa [mul_comm] using hid

theorem universal_positive_witness (a b : ℕ) (H : Polynomial ℚ)
    (h : F a b 2 = iota H) : ∃ p : Polynomial ℕ, H = p.map (Nat.castRingHom ℚ) := by
  obtain ⟨p,hp⟩ := positive_witness_of_data _ _ _ _ (universal_arithmetic a b H h)
  have hw : W a 2 ≠ 0 := by simp [W, Finset.prod_range_succ, factor_ne_zero]
  have he : W b 2 = W a 2 * iota H := by
    simpa [F, mul_comm] using (div_eq_iff hw).mp h
  have hp' : W a 2 * evalNat p = W b 2 := by
    simpa [W, Finset.prod_range_succ] using hp
  refine ⟨p, iota_injective ?_⟩
  apply mul_left_cancel₀ hw
  exact he.symm.trans hp'.symm

theorem polynomiality_classification (a b : ℕ) :
    (∃ H : Polynomial ℚ, F a b 2 = iota H) ↔
    (((a+1) ∣ (b+1) ∨ (a+1) ∣ (b+2)) ∧
     ((a+2) ∣ (b+1) ∨ (a+2) ∣ (b+2))) := by
  constructor
  · rintro ⟨H,h⟩
    exact polynomiality_divisibility a b H h
  · rintro ⟨hu,hv⟩
    obtain ⟨p,hp⟩ := positive_witness_of_data _ _ _ _ (data_of_singletons a b hu hv)
    have hw : W a 2 ≠ 0 := by simp [W, Finset.prod_range_succ, factor_ne_zero]
    refine ⟨p.map (Nat.castRingHom ℚ), ?_⟩
    change W b 2 / W a 2 = evalNat p
    apply (div_eq_iff hw).mpr
    simpa [W, Finset.prod_range_succ, mul_comm] using hp.symm

theorem universal_positivity (a b : ℕ) (H : Polynomial ℚ)
    (h : F a b 2 = iota H) : NatCoeffs H := by
  obtain ⟨p,rfl⟩ := universal_positive_witness a b H h
  exact natCoeffs_map p

theorem original_gap_two (n k l : ℕ) (H : Polynomial ℚ)
    (hlk : l ≤ k) (hkn : k ≤ n) (hgap : k-l=2)
    (hden : B n l ≠ 0) (heq : B n k = B n l * iota H) : NatCoeffs H := by
  have h : B n k / B n l = iota H := by rw [heq]; field_simp
  rw [interval_identity n k l hlk hkn, hgap] at h
  exact universal_positivity l (n-k) H h

theorem positivity_and_transport :
    (∀ (a b : ℕ) (H : Polynomial ℚ), F a b 2 = iota H →
      ∃ p : Polynomial ℕ, H = p.map (Nat.castRingHom ℚ)) ∧
    (∀ (n k l : ℕ) (H : Polynomial ℚ), l ≤ k → k ≤ n → k-l=2 →
      B n l ≠ 0 → B n k = B n l * iota H → NatCoeffs H) :=
  ⟨universal_positive_witness, original_gap_two⟩

end MathGKM.GaussianQuotient.TwoDenominatorPositiveR0001
