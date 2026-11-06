import MathGKM.Round46SumsA
import MathGKM.Round29BinomialA

/-! Machine-authored round47: restricted signs and zero tails.
These declarations do not assert universal horizontal capacity. -/
namespace HorizontalR47
open MathGKM.Markov HorizontalR46
open scoped BigOperators
noncomputable section

theorem F_nonnegative (n h j q : ℕ) : 0 ≤ F n h j q := by
  unfold F
  split_ifs <;> positivity

theorem complete_tail (n h j l : ℕ) (hl : 2*(n-h)-2 < l) :
    complete n h j l = 0 := by
  unfold complete
  have hz (q v : ℕ) : ¬q+v+l=2*(n-h)-2 := by omega
  simp only [hz, if_false, Finset.sum_const_zero, sub_self]

theorem F_axis (n h q : ℕ) :
    F n h 0 q = if q=0 then (n.choose h : ℤ) else 0 := by
  by_cases hq : q=0
  · subst q
    simp [F]
  · have hz : ¬q ≤ 0 := by omega
    simp [F,hz,hq]

theorem complete_axis (n h l : ℕ) :
    complete n h 0 l = if l=2*(n-h)-2 then
      (n.choose (h+1) : ℤ)^2 - (n.choose h : ℤ)*(n.choose (h+2) : ℤ) else 0 := by
  classical
  have collapse (a b m : ℕ) (x y : ℤ) :
      (∑ q ∈ Finset.range (a+1), ∑ v ∈ Finset.range (b+1),
        if q+v+l=m then (if q=0 then x else 0)*(if v=0 then y else 0) else 0) =
      if l=m then x*y else 0 := by
    rw [Finset.sum_eq_single 0]
    · rw [Finset.sum_eq_single 0]
      · simp
      · intro v hv hv0
        simp [hv0]
      · simp
    · intro q hq hq0
      simp [hq0]
    · simp
  unfold complete
  simp_rw [F_axis]
  rw [collapse,collapse]
  split_ifs <;> ring

theorem complete_axis_nonnegative (n h l : ℕ) : 0 ≤ complete n h 0 l := by
  rw [complete_axis]
  split_ifs
  · have := EndpointR29.choose_lc n h
    omega
  · omega

theorem zero_layer_polygon (n i j : ℕ) (hn : 1 ≤ n)
    (hp : InPolygon n (n+1) i j) (hz : i+j-n=0) : j=0 := by
  have hh : i+j ≤ n := by omega
  have hg := hp.1
  nlinarith

theorem zero_layer_sign (n i j l : ℕ) (hn : 1 ≤ n)
    (hp : InPolygon n (n+1) i j) (hz : i+j-n=0) :
    0 ≤ complete n (i+j-n) j l := by
  have hj := zero_layer_polygon n i j hn hp hz
  subst j
  exact complete_axis_nonnegative n (i+0-n) l

theorem polygon_boundary_sign (n i j l : ℕ) (hn : 1 ≤ n)
    (hp0 : InPolygon n (n+1) i j)
    (_hp1 : InPolygon n (n+1) (i+1) j)
    (_hp2 : InPolygon n (n+1) (i+2) j)
    (hb : i+j-n=0 ∨ j=0 ∨ 2*(n-(i+j-n))-2<l) :
    0 ≤ complete n (i+j-n) j l := by
  rcases hb with hz | hj | ht
  · exact zero_layer_sign n i j l hn hp0 hz
  · subst j
    exact complete_axis_nonnegative n (i+0-n) l
  · rw [complete_tail n (i+j-n) j l ht]


end
end HorizontalR47
#print axioms HorizontalR47.complete_axis_nonnegative
#print axioms HorizontalR47.zero_layer_sign
