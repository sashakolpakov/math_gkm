import MathGKM.Acceptedb6d2ec5febf447178088c884
import MathGKM.Acceptedcdf01d23db453e9412df6195
import MathGKM.Round29BinomialA

/-! Machine-authored round50, committed ordinary horizontal row-one construction. -/
namespace HorizontalRowR50
open MathGKM.Markov
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 1000000

theorem F_one (n h q : ℕ) (hh : 0<h) (hn : h≤n) :
    HorizontalR46.F n h 1 q =
      if q=0 then 2*(h:ℤ)*(n.choose h:ℤ) else
      if q=1 then (h:ℤ)*((n-1).choose h:ℤ) else 0 := by
  by_cases hq0 : q=0
  · subst q
    simp [HorizontalR46.F, show 1≤2*h by omega, Nat.choose_one_right]
    ring
  by_cases hq1 : q=1
  · subst q
    by_cases ht : h<n
    · simp [HorizontalR46.F, show 1≤n-h by omega,
        show h+1-1=h by omega, Nat.choose_one_right]
      ring
    · have hz : (n-1).choose h=0 := Nat.choose_eq_zero_of_lt (by omega)
      simp [HorizontalR46.F, show ¬1≤n-h by omega,hz]
  · simp [HorizontalR46.F, show ¬q≤1 by omega,hq0,hq1]

theorem weights_one (n h i s : ℕ) (hn : 1≤n) (hh : 0<h) (hhn : h≤n)
    (hi : i+1=n+h) :
    MidpointR36.W n i 1 s =
      (if s=n-h then 2*(h:ℤ)*(n.choose h:ℤ) else 0) +
      (if s+1=n-h then (h:ℤ)*((n-1).choose h:ℤ) else 0) := by
  rw [Acceptedcdf01d23db453e9412df6195.obligation n h i 1 s hn hhn hi]
  by_cases hs : s≤n-h
  · rw [if_pos hs, F_one n h (n-h-s) hh hhn]
    have h0 : n-h-s=0 ↔ s=n-h := by omega
    have h1 : n-h-s=1 ↔ s+1=n-h := by omega
    simp only [h0,h1]
    split_ifs <;> first | omega | ring
  · have h0 : s≠n-h := by omega
    have h1 : s+1≠n-h := by omega
    simp [hs,h0,h1]

theorem row_sum (n h i : ℕ) (hn : 1≤n) (hh : 0<h) (hhn : h≤n)
    (hi : i+1=n+h) :
    coeff (frame (List.replicate (n-1) true)).mid.p i 1 =
      2*(h:ℤ)*(n.choose h:ℤ)+(h:ℤ)*((n-1).choose h:ℤ) := by
  rw [Acceptedb6d2ec5febf447178088c884.obligation n hn i 1]
  simp_rw [fun s => weights_one n h i s hn hh hhn hi]
  rw [Finset.sum_add_distrib]
  have h0 : n-h<n+1 := by omega
  by_cases ht : h<n
  · have he (s : ℕ) : (s+1=n-h) ↔ (s=n-h-1) := by omega
    simp_rw [he]
    simp [h0,show n-h-1<n+1 by omega]
  · have hz : (n-1).choose h=0 := Nat.choose_eq_zero_of_lt (by omega)
    simp [hz,h0]

theorem coefficient_formula (n r : ℕ) (hn : 1≤n) :
    coeff (frame (List.replicate (n-1) true)).mid.p (n+r) 1 =
      (3*(n:ℤ)-(r:ℤ)-1)*((n-1).choose r:ℤ) := by
  by_cases hr : r<n
  · rw [row_sum n (r+1) (n+r) hn (by omega) (by omega) (by omega)]
    have h1 : (n:ℤ)*((n-1).choose r:ℤ) = (n.choose (r+1):ℤ)*((r:ℤ)+1) := by
      have ht := Nat.add_one_mul_choose_eq (n-1) r
      have en : n-1+1=n := by omega
      rw [en] at ht
      exact_mod_cast ht
    have h2 : ((n-1).choose (r+1):ℤ)*((r:ℤ)+1) =
        ((n-1).choose r:ℤ)*((n:ℤ)-r-1) := by
      have ht := Nat.choose_succ_right_eq (n-1) r
      have en : ((n-1-r:ℕ):ℤ)=(n:ℤ)-r-1 := by omega
      have hc : ((n-1).choose (r+1):ℤ)*((r:ℤ)+1) =
          ((n-1).choose r:ℤ)*((n-1-r:ℕ):ℤ) := by exact_mod_cast ht
      simpa only [en] using hc
    push_cast
    nlinarith [h1,h2]
  · have hz : (n-1).choose r=0 := Nat.choose_eq_zero_of_lt (by omega)
    rw [hz]; simp only [Nat.cast_zero,mul_zero]
    rw [Acceptedb6d2ec5febf447178088c884.obligation n hn (n+r) 1]
    apply Finset.sum_eq_zero
    intro s hs
    exact Acceptede724855dc630697365540fae.obligation.2.2.1 n (n+r) 1 s (Or.inr (by omega))

end
end HorizontalRowR50
#print axioms HorizontalRowR50.coefficient_formula
