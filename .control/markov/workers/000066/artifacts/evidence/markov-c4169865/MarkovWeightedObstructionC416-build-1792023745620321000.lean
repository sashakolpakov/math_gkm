import MarkovGradingObstruction7d90
/-! Machine-authored c4169865. Uniform PF2 weights on whole degree layers
do not preserve LC for every source. The raw source triple remains valid. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

def geometricWeightC416 : ℝ[X] := Quadratic 1 100 10000

theorem geometricWeight_crossC416 : CrossLC (CoeffSeq geometricWeightC416) := by
 rw [geometricWeightC416,coeffSeq_quadratic]
 exact crossLC_quad (by norm_num) (by norm_num) (by norm_num) (by norm_num)

theorem geometricWeight_nonnegC416 (k : ℕ) : 0≤geometricWeightC416.coeff k := by
 have h := quad_nonneg (A:=1) (B:=100) (C:=10000)
   (by norm_num) (by norm_num) (by norm_num) (k:ℤ)
 rw [←coeffSeq_quadratic] at h
 simpa [CoeffSeq,geometricWeightC416] using h

def weightedSource27C416 : ℝ[X] :=
 ∑ r ∈ range 3,C (geometricWeightC416.coeff r)*degreeLayer07a7 (X:ℝ[X])
   (central28 sourcePath27_07a7++[true]) 2 (2-r)

theorem weightedSource27_formulaC416 :
 weightedSource27C416=10311+325*X+14*X^2 := by
 obtain ⟨h0,h1,h2⟩ := degree_layers27_07a7 (X:ℝ[X])
 norm_num [weightedSource27C416,Finset.sum_range_succ,
   geometricWeightC416,Quadratic,h0,h1,h2]
 ring

theorem weightedSource27_gapC416 :
 weightedSource27C416.coeff 1^2-
 weightedSource27C416.coeff 0*weightedSource27C416.coeff 2=(-38729:ℝ) := by
 rw [weightedSource27_formulaC416]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X,Polynomial.coeff_X_pow]

/-- A failed general-source aggregation principle, not the pinned root. -/
theorem not_all_source_weighted_layersC416 :
 ¬∀ (path : List Bool) (cuts D j : ℕ) (q : ℝ[X]),
   CrossLC (CoeffSeq q) → (∀ k,0≤q.coeff k) →
   let p := ∑ r ∈ range (D+1),C (q.coeff r)*degreeLayer07a7 (X:ℝ[X])
     (central28 path++[true]) cuts (D-r)
   p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 intro h
 have hh := h sourcePath27_07a7 2 2 0 geometricWeightC416
   geometricWeight_crossC416 geometricWeight_nonnegC416
 change weightedSource27C416.coeff 0*weightedSource27C416.coeff 2≤
   weightedSource27C416.coeff 1^2 at hh
 have he := weightedSource27_gapC416
 linarith

theorem weightedSource27_raw_still_lcC416 :
 let m := (frame sourcePath27_07a7).mid
 m.a=2 ∧ m.b=7 ∧ InPolygon m.a m.b 4 0 ∧ InPolygon m.a m.b 3 1 ∧
 InPolygon m.a m.b 2 2 ∧ coeff m.p 3 1^2-coeff m.p 4 0*coeff m.p 2 2=574 := by
 have hh := full27_raw07a7
 exact ⟨rfl,rfl,hh.1,hh.2.1,hh.2.2.1,hh.2.2.2.2.2.2⟩

#print axioms geometricWeight_crossC416
#print axioms weightedSource27_gapC416
#print axioms not_all_source_weighted_layersC416
#print axioms weightedSource27_raw_still_lcC416
end
end MathGKM.Markov
