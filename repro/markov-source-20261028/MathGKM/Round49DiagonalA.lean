import MathGKM.Accepted59e4dda788038a4fc60ede37
import MathGKM.Accepted62a323ed605941fc5986d232
import MathGKM.Acceptede724855dc630697365540fae

/-! Machine-authored round49: concrete guarded diagonal summand proof. -/
namespace ActualDiagonalR49
open MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

def bin (m : ℕ) (z : ℤ) : ℤ := if 0 ≤ z then (m.choose z.toNat : ℤ) else 0

theorem bin_nat (m z : ℕ) : bin m z = (m.choose z : ℤ) := by simp [bin]

theorem bin_pos (m : ℕ) (z : ℤ) : 0 < bin m z ↔ 0 ≤ z ∧ z ≤ m := by
  by_cases hz : 0 ≤ z
  · simp only [bin, if_pos hz]
    constructor
    · intro hp
      have hn : z.toNat ≤ m := by
        by_contra hn
        rw [Nat.choose_eq_zero_of_lt (by omega)] at hp
        simp at hp
      exact ⟨hz, by omega⟩
    · intro hp
      exact_mod_cast Nat.choose_pos (show z.toNat ≤ m by omega)
  · simp [bin,hz]

theorem bin_cone (m : ℕ) : OrientedR48.Cone (bin m) := by
  refine ⟨?_,?_,?_⟩
  · intro z; unfold bin; split_ifs <;> positivity
  · intro z
    by_cases hz : 0 ≤ z
    · have e0 : (z.toNat : ℤ) = z := by omega
      have e1 : ((z.toNat+1 : ℕ) : ℤ) = z+1 := by omega
      have e2 : ((z.toNat+2 : ℕ) : ℤ) = z+2 := by omega
      have hc := EndpointR29.choose_lc m z.toNat
      rw [← bin_nat, ← bin_nat, ← bin_nat, e0,e1,e2] at hc
      exact hc
    · have he : bin m z=0 := by simp [bin,hz]
      rw [he,zero_mul]; exact sq_nonneg _
  · intro x y z hxy hyz hx hz
    have hx' := (bin_pos m x).mp hx
    have hz' := (bin_pos m z).mp hz
    exact (bin_pos m y).mpr ⟨by omega,by omega⟩

theorem residual_cone (n h : ℕ) (hh : 1 ≤ h) (hn : h ≤ n) :
    OrientedR48.Cone (SmoothingR32.az n h) := by
  have hc := Accepted59e4dda788038a4fc60ede37.obligation n h hh hn
  exact ⟨hc.2.2.2.1,hc.2.2.2.2.2.2,hc.2.2.2.2.2.1⟩

theorem weight_encoding (n h u v s : ℕ) (hh : 1 ≤ h) (hn : h ≤ n)
    (huv : u+v=n+h) :
    MidpointR36.W n u v s = SmoothingR32.az n h s * bin (2*h) ((u:ℤ)-s) := by
  have hd : u+v-n=h := by omega
  have hg : n ≤ u+v ∧ u+v ≤ 2*n := by omega
  have ha : SmoothingR32.az n h s = SmoothingR32.a n h s := by simp [SmoothingR32.az]
  rw [ha]
  by_cases hs : s ≤ u
  · have he : ((u:ℤ)-s).toNat=u-s := by omega
    have hz : 0 ≤ (u:ℤ)-s := by omega
    simp only [MidpointR36.W,hg.1,hg.2,hs,and_self,if_true,hd,bin,if_pos hz,he]
    have hg' : (h+s ≤ n) ↔ s ≤ n-h := by omega
    simp only [RenewalR28.mc,show h≠0 by omega,if_false,SmoothingR32.a,hg']
  · have hz : ¬0 ≤ (u:ℤ)-s := by omega
    simp [MidpointR36.W,hs,bin,hz]

theorem positive_diagonal (n h i j s t : ℕ) (hh : 1 ≤ h) (hn : h ≤ n)
    (hij : i+j+2=n+h) :
    MidpointR36.W n i (j+2) s * MidpointR36.W n (i+2) j t ≤
      MidpointR36.W n (i+1) (j+1) ((s+t)/2) *
      MidpointR36.W n (i+1) (j+1) ((s+t+1)/2) := by
  have hc := Accepted62a323ed605941fc5986d232.obligation
    (SmoothingR32.az n h) (bin (2*h)) (residual_cone n h hh hn) (bin_cone (2*h)) i s t
  rw [weight_encoding n h i (j+2) s hh hn (by omega),
    weight_encoding n h (i+2) j t hh hn (by omega),
    weight_encoding n h (i+1) (j+1) ((s+t)/2) hh hn (by omega),
    weight_encoding n h (i+1) (j+1) ((s+t+1)/2) hh hn (by omega)]
  have e0 : (((s+t)/2 : ℕ) : ℤ) = ((s:ℤ)+t)/2 := by omega
  have e1 : (((s+t+1)/2 : ℕ) : ℤ) = ((s:ℤ)+t+1)/2 := by omega
  push_cast
  exact hc

theorem diagonal_all (n i j s t : ℕ) (hn : 1 ≤ n) :
    MidpointR36.W n i (j+2) s * MidpointR36.W n (i+2) j t ≤
      MidpointR36.W n (i+1) (j+1) ((s+t)/2) *
      MidpointR36.W n (i+1) (j+1) ((s+t+1)/2) := by
  by_cases hout : i+j+2 < n ∨ 2*n < i+j+2
  · have hz := Acceptede724855dc630697365540fae.obligation.2.2.1 n i (j+2) s (by omega)
    rw [hz,zero_mul]
    exact mul_nonneg (MidpointR36.W_nonnegative ..) (MidpointR36.W_nonnegative ..)
  · by_cases hcorner : i+j+2=n
    · have hz := Acceptede724855dc630697365540fae.obligation.1 n i (j+2) s hn (by omega)
      have hnot : ¬(i=n ∧ j+2=0 ∧ s=n) := by omega
      rw [if_neg hnot] at hz
      rw [hz,zero_mul]
      exact mul_nonneg (MidpointR36.W_nonnegative ..) (MidpointR36.W_nonnegative ..)
    · exact positive_diagonal n (i+j+2-n) i j s t (by omega) (by omega) (by omega)

theorem original_diagonal (n : ℕ) (hn : 1 ≤ n) (i j : ℕ)
    (_hp0 : InPolygon n (n+1) i (j+2))
    (_hp1 : InPolygon n (n+1) (i+1) (j+1))
    (_hp2 : InPolygon n (n+1) (i+2) j)
    (s t : ℕ) (_hs : s ≤ n) (_ht : t ≤ n) :
    MidpointR36.W n i (j+2) s * MidpointR36.W n (i+2) j t ≤
      MidpointR36.W n (i+1) (j+1) ((s+t)/2) *
      MidpointR36.W n (i+1) (j+1) ((s+t+1)/2) :=
  diagonal_all n i j s t hn
end
end ActualDiagonalR49

#print axioms ActualDiagonalR49.diagonal_all
