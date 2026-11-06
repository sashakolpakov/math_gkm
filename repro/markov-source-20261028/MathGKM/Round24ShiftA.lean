/- Machine-authored round-24 guarded raw-layer shift and assumption controls. -/
import MathGKM.Round24ProductA
open MathGKM.Markov ClearedLayersR20
noncomputable section
set_option maxHeartbeats 2000000
namespace RawDeficitR24

theorem mono_coeff (P : BiPoly) (a b i j : ℕ) :
    coeff (U^a*V^b*P) i j =
      if a ≤ i ∧ b ≤ j then coeff P (i-a) (j-b) else 0 := by
  dsimp only [coeff,U,V]
  rw [mul_assoc,← Polynomial.C_pow,Polynomial.coeff_X_pow_mul']
  by_cases ha : a ≤ i
  · rw [if_pos ha,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow_mul']
    by_cases hb : b ≤ j <;> simp [ha,hb]
  · rw [if_neg ha]
    simp [ha]

theorem raw_shift (P : BiPoly) (d a b s r : ℕ) (hp : Bounded P d) :
    rawLayer (U^a*V^b*P) (d+a+b+s) r =
      if s≤r then U^a*V^b*rawLayer P d (r-s) else 0 := by
  classical
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change coeff _ i j = coeff _ i j
  rw [select_coeff]
  by_cases hs : s≤r
  · rw [if_pos hs,mono_coeff,mono_coeff]
    by_cases hab : a ≤ i ∧ b ≤ j
    · rw [if_pos hab,if_pos hab,select_coeff]
      have he : i+j+r=d+a+b+s ↔ (i-a)+(j-b)+(r-s)=d := by omega
      simp only [he]
    · simp [hab]
  · rw [if_neg hs]
    have cz : coeff (0 : BiPoly) i j = 0 := by simp [coeff]
    rw [cz]
    rw [mono_coeff]
    by_cases hab : a ≤ i ∧ b ≤ j
    · rw [if_pos hab]
      by_cases hz : coeff P (i-a) (j-b)=0
      · simp [hz]
      · have hd : (i-a)+(j-b)≤d := by
          by_contra hn
          exact hz (hp _ _ (by omega))
        rw [if_neg (by omega)]
    · simp [hab]

theorem bounded_mul (P Q : BiPoly) (d e : ℕ)
    (hp : Bounded P d) (hq : Bounded Q e) : Bounded (P*Q) (d+e) := by
  intro i j h
  rw [coeff_product]
  apply Finset.sum_eq_zero
  intro uv huv
  apply Finset.sum_eq_zero
  intro st hst
  have hi := Finset.HasAntidiagonal.mem_antidiagonal.mp huv
  have hj := Finset.HasAntidiagonal.mem_antidiagonal.mp hst
  by_cases hd : d<uv.1+st.1
  · rw [hp _ _ hd,zero_mul]
  · rw [hq uv.2 st.2 (by omega),mul_zero]

theorem raw_S (P : BiPoly) (d r : ℕ) (hp : Bounded P d) :
    rawLayer (S*P) (d+1) r =
      (U+V)*rawLayer P d r + (if r=0 then 0 else rawLayer P d (r-1)) := by
  have hu := raw_shift P d 1 0 0 r hp
  have hv := raw_shift P d 0 1 0 r hp
  have hw := raw_shift P d 0 0 1 r hp
  simp only [add_zero,add_assoc,pow_one,pow_zero,mul_one,one_mul,
    Nat.zero_le,if_true,Nat.sub_zero] at hu hv hw
  have hr : (if 1≤r then rawLayer P d (r-1) else 0) =
      (if r=0 then 0 else rawLayer P d (r-1)) := by
    by_cases hz : r=0
    · simp [hz]
    · simp [hz,show 1≤r by omega]
  rw [show S*P=U*P+V*P+P by dsimp [S]; ring,raw_add,raw_add,hu,hv,hw,hr]
  ring

theorem controls :
    rawLayer (U*1) (0+1) 0 ≠
      (∑ hk ∈ Finset.HasAntidiagonal.antidiagonal (0 : ℕ),
        rawLayer U 0 hk.1*rawLayer 1 1 hk.2) ∧
    rawLayer (U^0*V^0*1) (0+0+0+1) 0 ≠
      U^0*V^0*rawLayer 1 0 (0-1) := by
  classical
  constructor
  · intro h
    have hc := congrArg (fun P : BiPoly => coeff P 1 0) h
    have a0 : Finset.HasAntidiagonal.antidiagonal (0 : ℕ) = {(0,0)} := by decide
    have a1 : Finset.HasAntidiagonal.antidiagonal (1 : ℕ) = {(0,1),(1,0)} := by decide
    simp only [a0,Finset.sum_singleton,mul_one] at hc
    rw [select_coeff,coeff_product] at hc
    simp only [a0,a1,Finset.sum_insert,Finset.sum_singleton] at hc
    simp_rw [select_coeff] at hc
    norm_num [coeff,U] at hc
  · intro h
    have hc := congrArg (fun P : BiPoly => coeff P 0 0) h
    simp only [pow_zero,one_mul,Nat.reduceAdd,Nat.reduceSub] at hc
    rw [select_coeff,select_coeff] at hc
    norm_num [coeff] at hc

end RawDeficitR24
