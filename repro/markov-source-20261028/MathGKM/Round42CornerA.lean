import MathGKM.Acceptedb6d2ec5febf447178088c884
import MathGKM.Acceptede724855dc630697365540fae
import MathGKM.Accepted3c265afc977f227a9f6535e7

/-! Machine-authored round42 ordinary corner trial. -/
namespace CornerR42
open MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem W_zero (n i j s h : ℕ) (hh : 0 < h) (hhn : h ≤ n)
    (hij : i+j=n+h) (hs : ¬(s ≤ i ∧ h+s ≤ n ∧ i ≤ s+2*h)) :
    MidpointR36.W n i j s = 0 := by
  have hp := (Acceptede724855dc630697365540fae.obligation.2.1 n i j s h hh hhn hij)
  have hn := MidpointR36.W_nonnegative n i j s
  have : ¬0 < MidpointR36.W n i j s := by simpa only [hp] using hs
  omega

theorem weights (n s : ℕ) (hn : 4 ≤ n) :
    MidpointR36.W n n 0 s = (if s=n then 1 else 0) ∧
    MidpointR36.W n n 1 s = (if s=n-2 then ((n-1 : ℕ):ℤ) else if s=n-1 then 2*(n:ℤ) else 0) ∧
    MidpointR36.W n n 2 s = (if s=n-4 then 3*((n-2).choose 2 : ℤ) else
      if s=n-3 then 8*((n-1).choose 2 : ℤ) else if s=n-2 then 6*(n.choose 2 : ℤ) else 0) := by
  constructor
  · simpa using Acceptede724855dc630697365540fae.obligation.1 n n 0 s (by omega) (by omega)
  constructor
  · by_cases h2 : s=n-2
    · subst s
      have e1 : n+1-n=1 := by omega
      have e2 : 1+(n-2)=n-1 := by omega
      have e3 : n-(n-2)=2 := by omega
      simp [MidpointR36.W, RenewalR28.mc, e1,e2,e3, show n-2 ≤ n by omega,
        show n+1 ≤ 2*n by omega, show 1+(n-2) ≤ n by omega, Nat.choose_one_right, show Nat.choose 4 2=6 by decide]
    · by_cases h1 : s=n-1
      · subst s
        have e1 : n+1-n=1 := by omega
        have e2 : 1+(n-1)=n := by omega
        have e3 : n-(n-1)=1 := by omega
        simp [MidpointR36.W, RenewalR28.mc, e1,e2,e3,h2, show n-1 ≤ n by omega,
          show n+1 ≤ 2*n by omega, show 1+(n-1) ≤ n by omega, Nat.choose_one_right, show Nat.choose 4 2=6 by decide]
        ring
      · rw [W_zero n n 1 s 1 (by omega) (by omega) (by omega) (by omega)]
        simp [h2,h1]
  · by_cases h4 : s=n-4
    · subst s
      have e1 : n+2-n=2 := by omega
      have e2 : 2+(n-4)=n-2 := by omega
      have e3 : n-(n-4)=4 := by omega
      simp [MidpointR36.W, RenewalR28.mc, e1,e2,e3, show n-4 ≤ n by omega,
        show n+2 ≤ 2*n by omega, show 2+(n-4) ≤ n by omega, Nat.choose_one_right, show Nat.choose 4 2=6 by decide]
      ring
    · by_cases h3 : s=n-3
      · subst s
        have e1 : n+2-n=2 := by omega
        have e2 : 2+(n-3)=n-1 := by omega
        have e3 : n-(n-3)=3 := by omega
        simp [MidpointR36.W, RenewalR28.mc, e1,e2,e3,h4, show n-3 ≤ n by omega,
          show n+2 ≤ 2*n by omega, show 2+(n-3) ≤ n by omega, Nat.choose_one_right, show Nat.choose 4 2=6 by decide]
        ring
      · by_cases h2 : s=n-2
        · subst s
          have e1 : n+2-n=2 := by omega
          have e2 : 2+(n-2)=n := by omega
          have e3 : n-(n-2)=2 := by omega
          simp [MidpointR36.W, RenewalR28.mc, e1,e2,e3,h4,h3, show n-2 ≤ n by omega,
            show n+2 ≤ 2*n by omega, show 2+(n-2) ≤ n by omega, Nat.choose_one_right, show Nat.choose 4 2=6 by decide]
          ring
        · rw [W_zero n n 2 s 2 (by omega) (by omega) (by omega) (by omega)]
          simp [h4,h3,h2]

theorem choose2 (n : ℕ) (hn : 1 ≤ n) :
    2*(n.choose 2 : ℤ) = (n:ℤ)*((n:ℤ)-1) := by
  obtain ⟨m,rfl⟩ : ∃ m, n=m+1 := ⟨n-1, by omega⟩
  have h := Nat.succ_mul_choose_eq m 1
  simp only [Nat.choose_one_right, show Nat.choose 4 2=6 by decide] at h
  have hz : ((m+1:ℕ):ℤ)*(m:ℤ)=((m+1).choose 2:ℤ)*2 := by exact_mod_cast h
  push_cast at hz ⊢
  nlinarith

theorem coefficients (n : ℕ) (hn : 2 ≤ n) :
    let P := (frame (List.replicate (n-1) true)).mid.p
    coeff P n 0=1 ∧ coeff P n 1=3*(n:ℤ)-1 ∧
    2*coeff P n 2=17*(n:ℤ)^2-45*(n:ℤ)+34 := by
  dsimp only
  have recov (j : ℕ) := Acceptedb6d2ec5febf447178088c884.obligation n (by omega) n j
  by_cases h4 : 4 ≤ n
  · have sums (j : ℕ) : coeff (frame (List.replicate (n-1) true)).mid.p n j =
        ∑ s ∈ Finset.range (n+1), MidpointR36.W n n j s := recov j
    have h0 : coeff (frame (List.replicate (n-1) true)).mid.p n 0=1 := by
      rw [sums]
      simp_rw [fun s => (weights n s h4).1]
      simp
    have h1 : coeff (frame (List.replicate (n-1) true)).mid.p n 1=3*(n:ℤ)-1 := by
      rw [sums]
      simp_rw [fun s => (weights n s h4).2.1]
      simp [Finset.sum_ite, show n-2 < n+1 by omega, show n-1 < n+1 by omega,
        show n-1 ≠ n-2 by omega, Nat.cast_sub (show 1 ≤ n by omega)]
      ring
    refine ⟨h0,h1,?_⟩
    rw [sums]
    have hw (s : ℕ) : MidpointR36.W n n 2 s =
        (if s=n-4 then 3*((n-2).choose 2 : ℤ) else 0) +
        (if s=n-3 then 8*((n-1).choose 2 : ℤ) else 0) +
        (if s=n-2 then 6*(n.choose 2 : ℤ) else 0) := by
      rw [(weights n s h4).2.2]
      split_ifs <;> first | omega | ring
    simp_rw [hw]
    simp [Finset.sum_add_distrib, show n-4 < n+1 by omega,
      show n-3 < n+1 by omega, show n-2 < n+1 by omega]
    have c0 := choose2 n (by omega)
    have c1 := choose2 (n-1) (by omega)
    have c2 := choose2 (n-2) (by omega)
    push_cast [Nat.cast_sub (show 1 ≤ n by omega), Nat.cast_sub (show 2 ≤ n by omega)] at c0 c1 c2
    nlinarith
  · have casesn : n=2 ∨ n=3 := by omega
    rcases casesn with rfl | rfl <;>
      simp only [recov] <;>
      norm_num [MidpointR36.W, RenewalR28.mc, Finset.sum_range_succ, Nat.choose]

theorem recovered_margin (n : ℕ) (hn : 2 ≤ n) :
    let P := (frame (List.replicate (n-1) true)).mid.p
    coeff P n 0=1 ∧ coeff P n 1=3*(n:ℤ)-1 ∧
    2*coeff P n 2=17*(n:ℤ)^2-45*(n:ℤ)+34 ∧
    2*(coeff P n 1^2-coeff P n 0*coeff P n 2)=(n:ℤ)^2+33*(n:ℤ)-32 ∧
    0 < coeff P n 1^2-coeff P n 0*coeff P n 2 := by
  dsimp only
  rcases coefficients n hn with ⟨h0,h1,h2⟩
  refine ⟨h0,h1,h2,?_,?_⟩
  · rw [h0,h1]
    nlinarith
  · have hz : (2:ℤ) ≤ n := by exact_mod_cast hn
    rw [h0,h1]
    nlinarith [sq_nonneg (n:ℤ)]

theorem original_corner (n : ℕ) (hn : 2 ≤ n) :
    let E := (frame (List.replicate (n-1) true)).mid
    E.a=n ∧ E.b=n+1 ∧
    InPolygon E.a E.b n 0 ∧ InPolygon E.a E.b n 1 ∧ InPolygon E.a E.b n 2 ∧
    coeff E.p n 0*coeff E.p n 2 < coeff E.p n 1^2 := by
  dsimp only
  have labs := Accepted3c265afc977f227a9f6535e7.obligation.1.1 (n-1)
  have ha : (frame (List.replicate (n-1) true)).mid.a=n := by
    simpa [Nat.sub_add_cancel (show 1 ≤ n by omega)] using labs.2.1
  have hb : (frame (List.replicate (n-1) true)).mid.b=n+1 := by
    convert labs.2.2 using 1 <;> omega
  refine ⟨ha,hb,?_,?_,?_,?_⟩
  · rw [ha,hb]; constructor <;> first | omega | nlinarith
  · rw [ha,hb]; constructor <;> first | omega | nlinarith
  · rw [ha,hb]; constructor <;> first | omega | nlinarith
  · have hm := (recovered_margin n hn).2.2.2.2
    linarith

end
end CornerR42

#print axioms CornerR42.recovered_margin
#print axioms CornerR42.original_corner
