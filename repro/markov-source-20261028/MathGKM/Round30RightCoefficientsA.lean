import MathGKM.Round30RightA

/-! Machine-authored guarded positive coefficient extraction, round30.
This representation supplies identities and signs, not coefficient minors. -/
namespace RightR30
open MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

def shift (c : ℕ → ℕ → ℤ) (a b i j : ℕ) : ℤ :=
  if a ≤ i ∧ b ≤ j then c (i-a) (j-b) else 0

def delta (i j : ℕ) : ℤ := if i=0 ∧ j=0 then 1 else 0

def quad (c : ℕ → ℕ → ℤ) (i j : ℕ) : ℤ :=
  shift c 2 0 i j+shift c 1 1 i j+shift c 1 1 i j+shift c 0 2 i j

def array : ℕ → (ℕ → ℕ → ℤ) × (ℕ → ℕ → ℤ)
  | 0 => (fun i j => quad delta i j+shift delta 1 0 i j,quad delta)
  | k+1 =>
      (fun i j => quad (array k).1 i j+shift (array k).1 1 0 i j+
        shift (array k).2 0 1 i j,
       fun i j => quad (array k).1 i j+shift (array k).2 0 1 i j)

theorem coeff_one_delta : (fun i j => coeff (1 : BiPoly) i j)=delta := by
  funext i j
  simp only [coeff,Polynomial.coeff_one,delta]
  split_ifs <;> simp_all [Polynomial.coeff_zero,Polynomial.coeff_one]

theorem coeff_shift (P : BiPoly) (a b i j : ℕ) :
    coeff (U^a*V^b*P) i j=shift (coeff P) a b i j := by
  rw [mul_assoc]
  simp only [coeff,U,V,← Polynomial.C_pow,Polynomial.coeff_X_pow_mul',
    Polynomial.coeff_C_mul]
  by_cases ha : a ≤ i
  · simp only [ha,ite_true]
    rw [Polynomial.coeff_X_pow_mul']
    by_cases hb : b ≤ j <;> simp [shift,ha,hb,coeff]
  · simp [ha,shift]

theorem coeff_quad (P : BiPoly) :
    (fun i j => coeff (T^2*P) i j)=quad (coeff P) := by
  funext i j
  have h : T^2*P=U^2*V^0*P+U^1*V^1*P+U^1*V^1*P+U^0*V^2*P := by
    dsimp [T]
    ring
  rw [h]
  simp only [coeff,Polynomial.coeff_add]
  change coeff (U^2*V^0*P) i j+coeff (U^1*V^1*P) i j+
    coeff (U^1*V^1*P) i j+coeff (U^0*V^2*P) i j=_
  simp only [coeff_shift,quad]

theorem coeff_U (P : BiPoly) (i j : ℕ) : coeff (U*P) i j=shift (coeff P) 1 0 i j := by
  simpa using coeff_shift P 1 0 i j

theorem coeff_V (P : BiPoly) (i j : ℕ) : coeff (V*P) i j=shift (coeff P) 0 1 i j := by
  simpa using coeff_shift P 0 1 i j

theorem coefficient_recovery (k : ℕ) :
    (∀ i j, coeff (M k) i j=(array k).1 i j) ∧
    (∀ i j, coeff (G k) i j=(array k).2 i j) := by
  have h (n : ℕ) :
      (fun i j => coeff (RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1 i j,
       fun i j => coeff (RenewalR28.state (T^2) U V (T^2+U) (T^2) n).2 i j)=array n := by
    induction n with
    | zero =>
      apply Prod.ext
      · funext i j
        change coeff (T^2+U) i j=quad delta i j+shift delta 1 0 i j
        have hh := congrFun (congrFun (coeff_quad (1 : BiPoly)) i) j
        simp only [mul_one,coeff_one_delta] at hh
        have hu := coeff_U (1 : BiPoly) i j
        simp only [mul_one,coeff_one_delta] at hu
        simpa only [coeff,Polynomial.coeff_add] using congrArg₂ (·+·) hh hu
      · funext i j
        have hh := congrFun (congrFun (coeff_quad (1 : BiPoly)) i) j
        simpa only [RenewalR28.state_zero,array,mul_one,coeff_one_delta] using hh
    | succ n ih =>
      have hm := congrArg Prod.fst ih
      have hg := congrArg Prod.snd ih
      dsimp only at hm hg
      simp only [RenewalR28.state_step]
      apply Prod.ext
      · funext i j
        have he : (T^2+U)*(RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1+
            V*(RenewalR28.state (T^2) U V (T^2+U) (T^2) n).2 =
            T^2*(RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1+
            U*(RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1+
            V*(RenewalR28.state (T^2) U V (T^2+U) (T^2) n).2 := by ring
        rw [he]
        simp only [coeff,Polynomial.coeff_add]
        change coeff (T^2*_) i j+coeff (U*_) i j+coeff (V*_) i j=_
        rw [show coeff (T^2*(RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1) i j=
          quad (fun i j => coeff (RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1 i j) i j
          from congrFun (congrFun (coeff_quad _) i) j,coeff_U,coeff_V]
        simp only [hm,hg,array]
      · funext i j
        simp only [coeff,Polynomial.coeff_add]
        change coeff (T^2*_) i j+coeff (V*_) i j=_
        rw [show coeff (T^2*(RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1) i j=
          quad (fun i j => coeff (RenewalR28.state (T^2) U V (T^2+U) (T^2) n).1 i j) i j
          from congrFun (congrFun (coeff_quad _) i) j,coeff_V]
        simp only [hm,hg,array]
  have hh := h k
  rw [← right_state k] at hh
  exact ⟨fun i j => congrFun (congrFun (congrArg Prod.fst hh) i) j,
    fun i j => congrFun (congrFun (congrArg Prod.snd hh) i) j⟩

theorem shift_nonnegative (c : ℕ → ℕ → ℤ) (hc : ∀ i j, 0 ≤ c i j)
    (a b i j : ℕ) : 0 ≤ shift c a b i j := by
  unfold shift
  split_ifs
  · exact hc _ _
  · exact le_rfl

theorem quad_nonnegative (c : ℕ → ℕ → ℤ) (hc : ∀ i j,0 ≤ c i j) (i j : ℕ) :
    0 ≤ quad c i j := by
  unfold quad
  exact add_nonneg (add_nonneg (add_nonneg (shift_nonnegative c hc _ _ _ _)
    (shift_nonnegative c hc _ _ _ _)) (shift_nonnegative c hc _ _ _ _))
    (shift_nonnegative c hc _ _ _ _)

theorem array_nonnegative (k : ℕ) :
    (∀ i j,0 ≤ (array k).1 i j) ∧ (∀ i j,0 ≤ (array k).2 i j) := by
  have hd : ∀ i j,0 ≤ delta i j := by intros; unfold delta; split_ifs <;> norm_num
  induction k with
  | zero =>
    exact ⟨fun i j => add_nonneg (quad_nonnegative delta hd i j)
      (shift_nonnegative delta hd _ _ _ _),quad_nonnegative delta hd⟩
  | succ k ih =>
    exact ⟨fun i j => add_nonneg (add_nonneg (quad_nonnegative _ ih.1 i j)
      (shift_nonnegative _ ih.1 _ _ _ _)) (shift_nonnegative _ ih.2 _ _ _ _),
      fun i j => add_nonneg (quad_nonnegative _ ih.1 i j) (shift_nonnegative _ ih.2 _ _ _ _)⟩

theorem right_nonnegative (k i j : ℕ) : 0 ≤ coeff (M k) i j ∧ 0 ≤ coeff (G k) i j := by
  rw [(coefficient_recovery k).1,(coefficient_recovery k).2]
  exact ⟨(array_nonnegative k).1 i j,(array_nonnegative k).2 i j⟩

end
end RightR30
