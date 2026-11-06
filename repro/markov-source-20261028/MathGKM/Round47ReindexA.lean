import MathGKM.Round47BoundaryA

/-! Machine-authored round47: two-step reindexing with explicit boundary terms. -/
namespace HorizontalR47
open MathGKM.Markov HorizontalR46
open scoped BigOperators
noncomputable section

def C (a b : ℕ) (f g : ℕ → ℤ) (l m : ℕ) : ℤ :=
  ∑ q ∈ Finset.range (a+1), ∑ v ∈ Finset.range (b+1),
    if q+v+l=m then f q*g v else 0

def boundary (b : ℕ) (f g : ℕ → ℤ) (l m : ℕ) : ℤ :=
  (∑ v ∈ Finset.range (b+1), if v+l=m then f 0*g v else 0) +
  (∑ v ∈ Finset.range (b+1), if 1+v+l=m then f 1*g v else 0)

theorem C_shift_two (a b : ℕ) (f g : ℕ → ℤ) (l m : ℕ) :
    C (a+2) b f g l m = boundary b f g l m +
      C a b (fun q => f (q+2)) g (l+2) m := by
  unfold C boundary
  rw [show a+2+1=2+(a+1) by omega, Finset.sum_range_add]
  rw [Finset.sum_range_succ, Finset.sum_range_succ]
  simp only [Finset.range_zero, Finset.sum_empty,
    zero_add, Nat.zero_add]
  congr 1
  apply Finset.sum_congr rfl
  intro q hq
  apply Finset.sum_congr rfl
  intro v hv
  have he : q+2+v+l=q+v+(l+2) := by omega
  simp only [Nat.add_comm 2 q, he]

theorem complete_two_step (n h j l : ℕ) (hn : h+4 ≤ n) :
    complete n h j l + complete n h j (l+2) =
      boundary (n-(h+1)) (F n (h+1) j) (F n (h+1) j) l (2*(n-h)-2) -
      boundary (n-(h+2)) (F n h j) (F n (h+2) j) l (2*(n-h)-2) +
      C (n-(h+1)-2) (n-(h+1)) (fun q => F n (h+1) j (q+2))
        (F n (h+1) j) (l+2) (2*(n-h)-2) -
      C (n-h-2) (n-(h+2)) (fun q => F n h j (q+2))
        (F n (h+2) j) (l+2) (2*(n-h)-2) +
      complete n h j (l+2) := by
  have e1 : (n-(h+1)-2)+2=n-(h+1) := by omega
  have e0 : (n-h-2)+2=n-h := by omega
  have hb := C_shift_two (n-(h+1)-2) (n-(h+1))
    (F n (h+1) j) (F n (h+1) j) l (2*(n-h)-2)
  have hc := C_shift_two (n-h-2) (n-(h+2))
    (F n h j) (F n (h+2) j) l (2*(n-h)-2)
  rw [e1] at hb
  rw [e0] at hc
  change (C (n-(h+1)) (n-(h+1)) (F n (h+1) j) (F n (h+1) j) l _ -
    C (n-h) (n-(h+2)) (F n h j) (F n (h+2) j) l _) + _ = _
  rw [hb,hc]
  ring

end
end HorizontalR47
#print axioms HorizontalR47.complete_two_step
