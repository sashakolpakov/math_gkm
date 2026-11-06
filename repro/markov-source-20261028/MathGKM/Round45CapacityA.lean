import MathGKM.Acceptede724855dc630697365540fae
import MathGKM.Round40ConsumerA

/-! Machine-authored round45, protected distance-two episode.
The donor-range conclusion is unconditional; the capacity comparison remains open. -/
namespace DistanceTwoR45
open MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem weight_upper (n i j s r dx dy : ℕ)
    (hd : (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1))
    (hij : n ≤ i+j) (hr : 0 < r)
    (hw : MidpointR36.W n (i+r*dx) (j+r*dy) s ≠ 0) : s+r ≤ n := by
  have hpos : 0 < MidpointR36.W n (i+r*dx) (j+r*dy) s :=
    lt_of_le_of_ne (MidpointR36.W_nonnegative _ _ _ _) (Ne.symm hw)
  have hsum : (i+r*dx)+(j+r*dy)=i+j+r := by
    rcases hd with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ <;> simp <;> omega
  have hbound : (i+r*dx)+(j+r*dy) ≤ 2*n := by
    by_contra hh
    have hz := Acceptede724855dc630697365540fae.obligation.2.2.1 n
      (i+r*dx) (j+r*dy) s (Or.inr (by omega))
    exact hw hz
  have hh : 0 < i+j+r-n := by omega
  have hhn : i+j+r-n ≤ n := by omega
  have he : (i+r*dx)+(j+r*dy)=n+(i+j+r-n) := by omega
  have hs := (Acceptede724855dc630697365540fae.obligation.2.1 n
    (i+r*dx) (j+r*dy) s (i+j+r-n) hh hhn he).mp hpos
  omega

theorem weight_above_n (n i j s : ℕ) (hs : n < s) :
    MidpointR36.W n i j s = 0 := by
  unfold MidpointR36.W RenewalR28.mc
  split_ifs <;> simp_all <;> omega

theorem group_tail_zero (n i j dx dy l : ℕ)
    (hd : (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1))
    (hij : n ≤ i+j) (hl : 2*n < l+2) :
    GroupedR40.group n i j dx dy l = 0 := by
  classical
  unfold GroupedR40.group
  apply Finset.sum_eq_zero
  intro s hs
  apply Finset.sum_eq_zero
  intro t ht
  by_cases he : s+t=l
  · rw [if_pos he]
    have hb : MidpointR36.W n (i+dx) (j+dy) s *
        MidpointR36.W n (i+dx) (j+dy) t = 0 := by
      by_cases hw : MidpointR36.W n (i+dx) (j+dy) s = 0
      · simp [hw]
      by_cases hv : MidpointR36.W n (i+dx) (j+dy) t = 0
      · simp [hv]
      have hws := weight_upper n i j s 1 dx dy hd hij (by omega) (by simpa using hw)
      have hwt := weight_upper n i j t 1 dx dy hd hij (by omega) (by simpa using hv)
      omega
    have hc : MidpointR36.W n i j s *
        MidpointR36.W n (i+2*dx) (j+2*dy) t = 0 := by
      by_cases hv : MidpointR36.W n (i+2*dx) (j+2*dy) t = 0
      · simp [hv]
      have hwt := weight_upper n i j t 2 dx dy hd hij (by omega) hv
      have hsn : s ≤ n := by have := Finset.mem_range.mp hs; omega
      omega
    rw [hb,hc,sub_self]
  · simp [he]

theorem polygon_lower_degree (n i j : ℕ) (hn : 1 ≤ n)
    (hp : InPolygon n (n+1) i j) : n ≤ i+j := by
  by_contra h
  have hi : i ≤ n-1 := by omega
  have hsum : i+j ≤ n-1 := by omega
  have := hp.1
  nlinarith

theorem negative_has_donor_index (n i j dx dy l : ℕ) (hn : 1 ≤ n)
    (hd : (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1))
    (hp : InPolygon n (n+1) i j)
    (he : GroupedR40.group n i j dx dy l < 0) : l+2 ≤ 2*n := by
  by_contra hh
  have hz := group_tail_zero n i j dx dy l hd (polygon_lower_degree n i j hn hp)
    (by omega)
  omega

end
end DistanceTwoR45

#print axioms DistanceTwoR45.negative_has_donor_index
