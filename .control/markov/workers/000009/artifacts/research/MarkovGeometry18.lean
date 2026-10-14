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
  have hpos : 0<u-l := sub_pos.mpr (lt_of_le_of_ne (hl.trans hu) he)
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

def RawSupport18 (P : BiPoly) : Set (ℝ × ℝ) :=
  {p | ∃ i j : ℕ, coeff P i j≠0 ∧ p=((i : ℝ),(j : ℝ))}

def NewtonRegion18 (a b : ℕ) : Set (ℝ × ℝ) :=
  {p | 0≤p.1 ∧ 0≤p.2 ∧ (a : ℝ)*b ≤ (b : ℝ)*p.1+(a : ℝ)*p.2 ∧
    p.1+p.2≤((a+b-1 : ℕ) : ℝ)}

theorem inPolygon_iff_region18 (a b i j : ℕ) :
    InPolygon a b i j ↔ ((i : ℝ),(j : ℝ)) ∈ NewtonRegion18 a b := by
  change (a*b≤b*i+a*j ∧ i+j≤a+b-1) ↔
    (0≤(i : ℝ) ∧ 0≤(j : ℝ) ∧
      (a : ℝ)*b≤(b : ℝ)*i+(a : ℝ)*j ∧ (i : ℝ)+j≤((a+b-1 : ℕ) : ℝ))
  simp only [Nat.cast_nonneg,true_and]
  norm_cast

theorem newton_region_convex18 (a b : ℕ) : Convex ℝ (NewtonRegion18 a b) := by
  intro x hx y hy t u ht hu htu
  rcases hx with ⟨hx0,hx1,hx2,hx3⟩
  rcases hy with ⟨hy0,hy1,hy2,hy3⟩
  change 0≤t*x.1+u*y.1 ∧ 0≤t*x.2+u*y.2 ∧
    (a : ℝ)*b ≤ (b : ℝ)*(t*x.1+u*y.1)+(a : ℝ)*(t*x.2+u*y.2) ∧
      (t*x.1+u*y.1)+(t*x.2+u*y.2)≤((a+b-1 : ℕ) : ℝ)
  refine ⟨add_nonneg (mul_nonneg ht hx0) (mul_nonneg hu hy0),
    add_nonneg (mul_nonneg ht hx1) (mul_nonneg hu hy1),?_,?_⟩
  · have heq := congrArg (fun z : ℝ => z*((a : ℝ)*b)) htu
    nlinarith [mul_nonneg ht (sub_nonneg.mpr hx2),mul_nonneg hu (sub_nonneg.mpr hy2)]
  · nlinarith [mul_nonneg ht (sub_nonneg.mpr hx3),mul_nonneg hu (sub_nonneg.mpr hy3)]

/-- Exact real Newton-polygon equality, not support saturation. -/
theorem newton_polygon18 (path : List Bool) :
    convexHull ℝ (RawSupport18 (frame path).mid.p) =
      NewtonRegion18 (frame path).mid.a (frame path).mid.b := by
  let l := (frame path).mid
  have hp := polygon_certificate18 path
  have ha : 0<(l.a : ℝ) := by exact_mod_cast (frame_reduced path).1
  have hb : 0<(l.b : ℝ) := by
    exact_mod_cast (lt_trans (frame_reduced path).1 (frame_reduced path).2.1)
  apply Set.Subset.antisymm
  · apply convexHull_min _ (newton_region_convex18 _ _)
    rintro p ⟨i,j,hc,rfl⟩
    have hpol := hp.2.1 i j hc
    refine ⟨by positivity,by positivity,?_,?_⟩
    · dsimp only
      exact_mod_cast hpol.1
    · dsimp only
      exact_mod_cast hpol.2
  · intro p h
    rcases h with ⟨hx,hy,hlo,hhi⟩
    have hA : ((l.a : ℝ),0) ∈ convexHull ℝ (RawSupport18 l.p) :=
      subset_convexHull ℝ _ ⟨l.a,0,ne_of_gt hp.2.2.1,by simp⟩
    have hB : (0,(l.b : ℝ)) ∈ convexHull ℝ (RawSupport18 l.p) :=
      subset_convexHull ℝ _ ⟨0,l.b,ne_of_gt hp.2.2.2.1,by simp⟩
    have hD : (((l.a+l.b-1 : ℕ) : ℝ),0) ∈ convexHull ℝ (RawSupport18 l.p) := by
      apply subset_convexHull
      refine ⟨l.a+l.b-1,0,?_,by simp⟩
      rw [hp.2.2.2.2.1]
      norm_num
    have hE : (0,((l.a+l.b-1 : ℕ) : ℝ)) ∈ convexHull ℝ (RawSupport18 l.p) := by
      apply subset_convexHull
      refine ⟨0,l.a+l.b-1,?_,by simp⟩
      rw [hp.2.2.2.2.2]
      norm_num
    exact quadrilateral_mem18 (convex_convexHull ℝ _) _ _ _ p.1 p.2
      ha hb hx hy hlo hhi hA hB hD hE

#print axioms convex_radial18
#print axioms quadrilateral_mem18
#print axioms newton_polygon18
#print axioms inPolygon_iff_region18
end
end MathGKM.Markov
