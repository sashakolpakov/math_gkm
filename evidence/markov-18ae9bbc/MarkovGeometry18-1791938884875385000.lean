import MarkovVertices18

/-! Machine-authored worker 18ae9bbc. Explicit convex geometry for the
four-vertex source polygon. -/
namespace MathGKM.Markov
noncomputable section
open Set

theorem convex_radial18 {s : Set (ℝ × ℝ)} (hs : Convex ℝ s)
    (p : ℝ × ℝ) (l u : ℝ) (hl : l≤1) (hu : 1≤u)
    (hL : l • p ∈ s) (hU : u • p ∈ s) : p ∈ s := by
  by_cases he : l=u
  · have hl1 : l=1 := by linarith
    simpa [hl1] using hL
  have hpos : 0<u-l := by linarith
  have ht0 : 0≤(1-l)/(u-l) := div_nonneg (by linarith) hpos.le
  have ht1 : (1-l)/(u-l)≤1 := (div_le_one hpos).mpr (by linarith)
  have h := hs hL hU (sub_nonneg.mpr ht1) ht0 (sub_add_cancel _ _)
  have heq : (1-(1-l)/(u-l)) • (l • p) + ((1-l)/(u-l)) • (u • p)=p := by
    rw [smul_smul,smul_smul,← add_smul]
    have hc : (1-(1-l)/(u-l))*l+((1-l)/(u-l))*u=1 := by
      field_simp
      <;> ring
    rw [hc,one_smul]
  rwa [heq] at h

theorem quadrilateral_mem18 {s : Set (ℝ × ℝ)} (hs : Convex ℝ s)
    (a b d x y : ℝ) (ha : 0<a) (hb : 0<b)
    (hx : 0≤x) (hy : 0≤y) (hlo : a*b≤b*x+a*y) (hhi : x+y≤d)
    (hA : (a,0) ∈ s) (hB : (0,b) ∈ s)
    (hD : (d,0) ∈ s) (hE : (0,d) ∈ s) : (x,y) ∈ s := by
  have hc : 0<b*x+a*y := lt_of_lt_of_le (mul_pos ha hb) hlo
  have hz : 0<x+y := by
    by_contra hn
    have hxy : x=0 ∧ y=0 := by constructor <;> linarith
    simp [hxy.1,hxy.2] at hc
  have hL : (a*b/(b*x+a*y)) • (x,y) ∈ s := by
    have h1 := div_nonneg (mul_nonneg hb.le hx) hc.le
    have h2 := div_nonneg (mul_nonneg ha.le hy) hc.le
    have hsum : b*x/(b*x+a*y)+a*y/(b*x+a*y)=1 := by
      rw [← add_div,div_self (ne_of_gt hc)]
    have h := hs hA hB h1 h2 hsum
    convert h using 1 <;> ext <;> simp <;> field_simp <;> ring
  have hU : (d/(x+y)) • (x,y) ∈ s := by
    have hsum : x/(x+y)+y/(x+y)=1 := by rw [← add_div,div_self (ne_of_gt hz)]
    have h := hs hD hE (div_nonneg hx hz.le) (div_nonneg hy hz.le) hsum
    convert h using 1 <;> ext <;> simp <;> field_simp <;> ring
  exact convex_radial18 hs (x,y) _ _ ((div_le_one hc).mpr hlo)
    ((one_le_div hz).mpr hhi) hL hU

#print axioms convex_radial18
#print axioms quadrilateral_mem18
end
end MathGKM.Markov
