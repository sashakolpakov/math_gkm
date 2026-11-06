import MathGKM.Markov

/-! Machine-authored round28 renewal candidates. No admission is asserted here. -/
namespace RenewalR28
open MathGKM.Markov
noncomputable section

def state {R : Type*} [CommRing R] (H r q m g : R) (n : ℕ) : R × R :=
  (fun z : R × R => ((H+r)*z.1+q*z.2, H*z.1+q*z.2))^[n] (m,g)

theorem state_zero {R : Type*} [CommRing R] (H r q m g : R) :
    state H r q m g 0 = (m,g) := rfl

theorem state_step {R : Type*} [CommRing R] (H r q m g : R) (n : ℕ) :
    state H r q m g (n+1) =
      ((H+r)*(state H r q m g n).1+q*(state H r q m g n).2,
       H*(state H r q m g n).1+q*(state H r q m g n).2) :=
  Function.iterate_succ_apply' _ _ _

theorem state_recurrence {R : Type*} [CommRing R] (H r q m g : R) (n : ℕ) :
    (state H r q m g (n+2)).1 =
      (H+r+q)*(state H r q m g (n+1)).1-r*q*(state H r q m g n).1 := by
  rw [show n+2=(n+1)+1 by omega, state_step, state_step]
  ring

def series {R : Type*} [CommRing R] (H r q m g : R) : PowerSeries R :=
  PowerSeries.mk (fun n => (state H r q m g n).1)

theorem generic_series {R : Type*} [CommRing R] (H r q m g : R) :
    (1-PowerSeries.C (H+r+q)*PowerSeries.X+
      PowerSeries.C (r*q)*PowerSeries.X^2)*series H r q m g =
    (1-PowerSeries.C q*PowerSeries.X)*PowerSeries.C m+
      PowerSeries.C (q*g)*PowerSeries.X := by
  let c : R := H+r+q
  change (1-PowerSeries.C c*PowerSeries.X+PowerSeries.C (r*q)*PowerSeries.X^2)*_=_
  have he : (1-PowerSeries.C c*PowerSeries.X+PowerSeries.C (r*q)*PowerSeries.X^2)*series H r q m g =
      series H r q m g - PowerSeries.C c*(PowerSeries.X*series H r q m g)+
        PowerSeries.C (r*q)*(PowerSeries.X^2*series H r q m g) := by ring
  rw [he]
  apply PowerSeries.ext
  intro n
  cases n with
  | zero =>
    simp [series, PowerSeries.coeff_C_mul, state_zero]
  | succ n =>
    cases n with
    | zero =>
      simp only [map_add,map_sub,PowerSeries.coeff_C_mul,
        PowerSeries.coeff_succ_X_mul, PowerSeries.coeff_X_pow_mul',
        PowerSeries.coeff_mk, series, PowerSeries.coeff_C,
        PowerSeries.coeff_X, PowerSeries.coeff_mul_C]
      norm_num [state_step,state_zero]
      dsimp [c]
      ring
    | succ n =>
      have hr := state_recurrence H r q m g n
      simp only [map_add,map_sub,PowerSeries.coeff_C_mul,
        PowerSeries.coeff_succ_X_mul, PowerSeries.coeff_X_pow_mul',
        PowerSeries.coeff_mk, series, PowerSeries.coeff_C,
        PowerSeries.coeff_X, PowerSeries.coeff_mul_C]
      simp only [show n+1+1≠0 by omega, show n+1+1≠1 by omega,
        show 2≤n+1+1 by omega, PowerSeries.coeff_one, if_false, if_true,
        show n+1+1-2=n by omega, zero_mul,mul_zero,sub_zero,add_zero]
      change (state H r q m g (n+2)).1-c*(state H r q m g (n+1)).1+r*q*(state H r q m g n).1=0
      rw [hr]
      dsimp [c]
      ring

def P : ℕ → BiPoly
  | 0 => 1
  | 1 => U+V
  | n+2 => S*P (n+1)-V*P n

theorem P_zero : P 0=1 := rfl
theorem P_one : P 1=U+V := rfl
theorem P_step (n : ℕ) : P (n+2)=S*P (n+1)-V*P n := rfl

theorem endpoint_frame (k : ℕ) :
    let f := frame (List.replicate k false)
    f.lo=⟨0,1,1⟩ ∧ f.mid.a=1 ∧ f.mid.b=k+2 ∧
      f.mid.p=P (k+2) ∧ f.hi.p=P (k+1) := by
  induction k with
  | zero =>
    simp [frame, initial, P, S]
    ring
  | succ k ih =>
    have step : frame (List.replicate (k+1) false)=
        advance (frame (List.replicate k false)) false := by
      simp [frame,List.replicate_succ',List.foldl_append]
    dsimp only at ih ⊢
    rw [step]
    simp only [advance, Bool.false_eq_true, ↓reduceIte, ih.1]
    refine ⟨True.intro,?_,?_,?_,?_⟩
    · simpa using ih.2.1
    · simpa [ih.2.2.1, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    · simp only [pow_zero,pow_one,mul_one,one_mul,ih.2.2.2.1,ih.2.2.2.2]
      exact (P_step (k+1)).symm
    · simpa [Nat.succ_eq_add_one] using ih.2.2.2.1

theorem P_state (n : ℕ) : P n=(state U V (1 : BiPoly) 1 0 n).1 := by
  induction n using Nat.twoStepInduction with
  | zero => rfl
  | one => simp [P,state_step,state_zero]
  | more n ih0 ih1 =>
    rw [P_step,state_recurrence,← ih0,← ih1]
    simp only [mul_one,S]

theorem endpoint_series :
    ((1-PowerSeries.X)*(1-PowerSeries.C V*PowerSeries.X)-
       PowerSeries.C U*PowerSeries.X)*PowerSeries.mk P = 1-PowerSeries.X := by
  have h := generic_series U V (1 : BiPoly) 1 0
  have hs : series U V (1 : BiPoly) 1 0=PowerSeries.mk P := by
    apply PowerSeries.ext
    intro n
    simp [series,P_state]
  rw [hs] at h
  have hd : (1-PowerSeries.X)*(1-PowerSeries.C V*PowerSeries.X)-PowerSeries.C U*PowerSeries.X =
      1-PowerSeries.C (U+V+1)*PowerSeries.X+PowerSeries.C (V*1)*PowerSeries.X^2 := by
    simp only [map_add,map_one,mul_one]
    ring
  rw [hd]
  simpa using h

def Nonnegative (Q : BiPoly) : Prop := ∀ i j, 0≤coeff Q i j

theorem positivity_control :
    Nonnegative (1+U^2) ∧ Nonnegative (0 : BiPoly) ∧ Nonnegative (1 : BiPoly) ∧
    (state (1+U^2) (0 : BiPoly) 0 1 0 1).1=1+U^2 ∧
    coeff (1+U^2) 0 0=1 ∧ coeff (1+U^2) 1 0=0 ∧ coeff (1+U^2) 2 0=1 ∧
    coeff (1+U^2) 0 0*coeff (1+U^2) 2 0>coeff (1+U^2) 1 0^2 := by
  have hc (i j : ℕ) : coeff (1+U^2) i j=
      (if i=0 then if j=0 then 1 else 0 else 0)+
      (if i=2 then if j=0 then 1 else 0 else 0) := by
    simp only [coeff,U,Polynomial.coeff_add,Polynomial.coeff_one,Polynomial.coeff_X_pow]
    split_ifs <;> simp_all [Polynomial.coeff_one,Polynomial.coeff_zero]
  refine ⟨?_,?_,?_,?_,?_,?_,?_,?_⟩
  · intro i j
    rw [hc]
    split_ifs <;> norm_num
  · intro i j
    simp [coeff]
  · intro i j
    simp only [coeff,Polynomial.coeff_one]
    split_ifs <;> simp_all [Polynomial.coeff_zero,Polynomial.coeff_one]
    split_ifs <;> norm_num
  · simp [state_step,state_zero]
  all_goals norm_num [hc]

end
end RenewalR28
