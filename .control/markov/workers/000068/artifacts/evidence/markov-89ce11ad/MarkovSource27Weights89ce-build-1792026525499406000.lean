import MarkovPairOrder89ce
import MarkovDegreeObstruction07a7
/-! Machine-authored 89ce11ad. An unconditional actual mixed-source
two-cut example with every increasing LC degree weight and every index. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def weightedCut89 (word : List Bool) (s : ℕ) (w : ℕ → ℝ) : ℝ[X] :=
 ((cutMasksFe01 word s).map (fun m => C (w (maskDegree07a7 1 m))*
   maskWeight340 (X:ℝ[X]) X 1 m)).sum

theorem source27_weighted_formula89 (w : ℕ → ℝ) :
 weightedCut89 (central28 sourcePath27_07a7++[true]) 2 w=
 C (w 0+3*w 1+11*w 2)+C (3*w 1+25*w 2)*X+C (14*w 2)*X^2 := by
 rw [source_word27_07a7]
 norm_num [weightedCut89,cutMasksFe01,maskDegree07a7,maskWeight340,
   cutChargeA27,cutFactorA27]
 simp only [map_add,map_mul,map_ofNat]
 ring

theorem source27_weighted_gap89 (w : ℕ → ℝ) :
 (3*w 1+25*w 2)^2-(w 0+3*w 1+11*w 2)*(14*w 2)=
 9*(w 1^2-w 0*w 2)+5*(w 1*w 2-w 0*w 2)+103*w 1*w 2+471*w 2^2 := by
 ring

theorem source27_weighted_cross89 (w : ℕ → ℝ) (hn : ∀ i,0≤w i)
 (hm : Monotone w) (ha : ∀ i,w i*w (i+2)≤w (i+1)^2) :
 CrossLC (CoeffSeq (weightedCut89 (central28 sourcePath27_07a7++[true]) 2 w)) := by
 rw [source27_weighted_formula89]
 change CrossLC (CoeffSeq (Quadratic (w 0+3*w 1+11*w 2)
   (3*w 1+25*w 2) (14*w 2)))
 have hw0 := hn 0
 have hw1 := hn 1
 have hw2 := hn 2
 rw [coeffSeq_quadratic]
 apply crossLC_quad
 · positivity
 · positivity
 · positivity
 · have h0 : 0≤w 1^2-w 0*w 2 := by simpa using sub_nonneg.mpr (ha 0)
   have h1 : 0≤w 1*w 2-w 0*w 2 :=
     sub_nonneg.mpr (mul_le_mul_of_nonneg_right (hm (by omega)) (hn 2))
   have hg := source27_weighted_gap89 w
   have h2 : 0≤103*w 1*w 2 := by positivity
   have h3 : 0≤471*w 2^2 := by positivity
   linarith

theorem source27_weighted_all_lc89 (w : ℕ → ℝ) (hn : ∀ i,0≤w i)
 (hm : Monotone w) (ha : ∀ i,w i*w (i+2)≤w (i+1)^2) (j : ℕ) :
 let p := weightedCut89 (central28 sourcePath27_07a7++[true]) 2 w
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 have h := crossLC_adjacent (source27_weighted_cross89 w hn hm ha) ((j:ℤ)+1)
 simpa [CoeffSeq,show ¬(j:ℤ)<0 by omega,
   show ¬(j:ℤ)+1<0 by omega,show ¬(j:ℤ)+1+1<0 by omega,
   show ((j:ℤ)+1+1).toNat=j+2 by omega] using h

theorem weightedCut_at_one89 (word : List Bool) (s : ℕ) :
 weightedCut89 word s (fun _ => 1)=cutCoeffA27 (X:ℝ[X]) X 1 word s := by
 simp only [weightedCut89,map_one,one_mul]
 exact cutMasks_sumFe01 _ _ _ _ _

#print axioms source27_weighted_formula89
#print axioms source27_weighted_all_lc89
#print axioms weightedCut_at_one89
end
end MathGKM.Markov
