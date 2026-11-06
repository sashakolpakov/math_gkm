import MathGKM.Acceptede724855dc630697365540fae

/-! Machine-authored round46. Reversed weights, separate from all sign claims. -/
namespace HorizontalR46
open MathGKM.Markov
open scoped BigOperators
noncomputable section

def F (n h j q : ℕ) : ℤ :=
  if q  ≤  n-h ∧ q  ≤  j ∧ j  ≤  q+2*h then
    ((n-q).choose h : ℤ) * ((h+q-1).choose q : ℤ) *
      ((2*h).choose (j-q) : ℤ)
  else 0

theorem reverse_weight (n h i j q : ℕ) (hh : 0 < h) (hn : h ≤ n)
    (hij : i+j=n+h) (hq : q ≤ n-h) :
    MidpointR36.W n i j (n-h-q) = F n h j q := by
  have hs : h+(n-h-q) ≤ n := by omega
  have hd : i+j-n=h := by omega
  have ha : h+(n-h-q)=n-q := by omega
  have hb : n-(n-h-q)-1=h+q-1 := by omega
  have hc : (h+q-1)-(h-1)=q := by omega
  have hg : n ≤ i+j ∧ i+j ≤ 2*n := by omega
  have hz : h≠0 := by omega
  by_cases hi : n-h-q ≤ i
  · have hj : j ≤ q+2*h := by omega
    simp only [MidpointR36.W, hg.1, hg.2, hi, and_self, if_true, hd,
      RenewalR28.mc, hz, if_false, hs, ha, hb, Nat.sub_le, if_true]
    have hsym : (h+q-1).choose (h-1)=(h+q-1).choose q := by
      symm
      simpa only [hc] using (Nat.choose_symm (show h-1 ≤ h+q-1 by omega))
    rw [hsym]
    by_cases hqj : q ≤ j
    · have he : 2*h-(i-(n-h-q))=j-q := by omega
      have he' : i-(n-h-q) ≤ 2*h := by omega
      rw [← Nat.choose_symm he', he]
      simp [F,hq,hqj,hj]
    · have he : 2*h < i-(n-h-q) := by omega
      rw [Nat.choose_eq_zero_of_lt he]
      simp [F,hqj]
  · have hj : ¬ j ≤ q+2*h := by omega
    simp [MidpointR36.W,hi,F,hj]

theorem weight_tail (n h i j s : ℕ) (hh : 0 < h) (hn : h ≤ n)
    (hij : i+j=n+h) (hs : n-h < s) : MidpointR36.W n i j s=0 := by
  have hz : h≠0 := by omega
  have hd : i+j-n=h := by omega
  have hb : ¬h+s ≤ n := by omega
  simp [MidpointR36.W,hd,RenewalR28.mc,hz,hb]

theorem guarded_reverse (n h i j s : ℕ) (hh : 0 < h) (hn : h ≤ n)
    (hij : i+j=n+h) :
    MidpointR36.W n i j s = if s ≤ n-h then F n h j (n-h-s) else 0 := by
  split_ifs with hs
  · have hq : n-h-s ≤ n-h := by omega
    have he : n-h-(n-h-s)=s := by omega
    simpa only [he] using reverse_weight n h i j (n-h-s) hh hn hij hq
  · exact weight_tail n h i j s hh hn hij (by omega)

theorem F_zero (n j q : ℕ) :
    F n 0 j q = if q=0 ∧ j=0 then 1 else 0 := by
  by_cases hq : q=0
  · subst q
    by_cases hj : j=0 <;> simp [F,hj]
  · have hc : (q-1).choose q=0 := Nat.choose_eq_zero_of_lt (by omega)
    simp [F,hq,hc]

theorem guarded_reverse_all (n h i j s : ℕ) (hn : 1 ≤ n) (hh : h ≤ n)
    (hij : i+j=n+h) :
    MidpointR36.W n i j s = if s ≤ n-h then F n h j (n-h-s) else 0 := by
  by_cases hz : h=0
  · subst h
    have he : i+j=n := by omega
    rw [Acceptede724855dc630697365540fae.obligation.1 n i j s hn he]
    by_cases hs : s ≤ n
    · simp only [Nat.sub_zero,hs,if_true,F_zero]
      have hi : (i=n ∧ j=0 ∧ s=n) ↔ (n-s=0 ∧ j=0) := by omega
      simp only [hi]
    · have hg : ¬(i=n ∧ j=0 ∧ s=n) := by omega
      simp [hs,hg]
  · exact guarded_reverse n h i j s (by omega) hh hij

theorem reverse_weight_all (n h i j q : ℕ) (hn : 1 ≤ n) (hh : h ≤ n)
    (hij : i+j=n+h) (hq : q ≤ n-h) :
    MidpointR36.W n i j (n-h-q)=F n h j q := by
  rw [guarded_reverse_all n h i j (n-h-q) hn hh hij]
  simp [show n-h-q ≤ n-h by omega, show n-h-(n-h-q)=q by omega]

theorem weight_tail_all (n h i j s : ℕ) (hn : 1 ≤ n) (hh : h ≤ n)
    (hij : i+j=n+h) (hs : n-h < s) : MidpointR36.W n i j s=0 := by
  rw [guarded_reverse_all n h i j s hn hh hij]
  simp [show ¬s ≤ n-h by omega]

end
end HorizontalR46
#print axioms HorizontalR46.guarded_reverse
#print axioms HorizontalR46.guarded_reverse_all
