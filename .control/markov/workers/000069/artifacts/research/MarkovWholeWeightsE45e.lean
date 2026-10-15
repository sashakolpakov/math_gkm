import MarkovWeightedSourceE45e
import MarkovSource27Weights89ce
/-! Machine-authored e45ef6ac. Whole-mask interpretation of the weighted
source theorem. No masks or internal coefficient zeros are discarded. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

theorem weightedCut_degree_sumE45 (word : List Bool) (s D : ℕ) (w : ℕ → ℝ)
 (hD : ∀ m∈cutMasksFe01 word s,maskDegree07a7 1 m<D) :
 weightedCut89 word s w=
   ∑ d ∈ range D,C (w d)*degreeLayer07a7 (X:ℝ[X]) word s d := by
 classical
 simp only [weightedCut89,degreeLayer_sum6d34]
 generalize he : cutMasksFe01 word s=ms at *
 clear he
 induction ms with
 | nil => simp
 | cons m ms ih =>
   have hm := hD m (by simp)
   have ht : ∀ m∈ms,maskDegree07a7 1 m<D := by
     intro m hm;exact hD m (by simp [hm])
   simp only [List.map_cons,List.sum_cons,mul_add,sum_add_distrib,ih ht]
   congr 1
   have e : (∑ d ∈ range D,C (w d)*
       (if maskDegree07a7 1 m=d then maskWeight340 (X:ℝ[X]) X 1 m else 0))=
       C (w (maskDegree07a7 1 m))*maskWeight340 (X:ℝ[X]) X 1 m := by
     simp [mul_ite,hm]
   exact e.symm

theorem weightedCut_run_fullE45 (n s : ℕ) (hs : s≤n) (w : ℕ → ℝ) :
 weightedCut89 (central28 (List.replicate n true)++[true]) (s+1) w=
 ∑ r ∈ range (n-s+1), C (w (2*s+2+r))*degreeLayer07a7 (X:ℝ[X])
   (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+r) := by
 let word := central28 (List.replicate n true)++[true]
 have hlen : word.length=n+1 := by simp [word,central_right0618]
 have hbound : ∀ m∈cutMasksFe01 word (s+1),maskDegree07a7 1 m<2*n+4 := by
   intro m hm
   have hl := congrArg List.length (cutMasks_specFe01 word (s+1) m hm).1
   have hb := maskDegree_bound07a7 m 1
   simp only [List.length_map,hlen] at hl
   omega
 rw [weightedCut_degree_sumE45 word (s+1) (2*n+4) w hbound]
 have he : (∑ d ∈ range (2*n+4),C (w d)*degreeLayer07a7 (X:ℝ[X]) word (s+1) d)=
     ∑ d ∈ Ico (2*s+2) (n+s+3),C (w d)*degreeLayer07a7 (X:ℝ[X]) word (s+1) d := by
   apply (sum_subset (by intro d hd; simp only [mem_Ico,mem_range] at *; omega) ?_).symm
   intro d hd hnot
   have hout : d<2*s+2 ∨ n+s+2<d := by
     simp only [mem_Ico] at hnot
     omega
   rw [source_layer_outsideE45 n s d hout,mul_zero]
 rw [he,sum_Ico_eq_sum_range,show n+s+3-(2*s+2)=n-s+1 by omega]

theorem weightedCut_run_lcE45 (n s j : ℕ) (hs : s≤n) (W : ℝ[X])
 (hn : ∀ k,0≤W.coeff k) (hc : CrossLC (CoeffSeq W)) :
 let p := weightedCut89 (central28 (List.replicate n true)++[true]) (s+1)
   (fun d => W.coeff (n+s+2-d))
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 have he : weightedCut89 (central28 (List.replicate n true)++[true]) (s+1)
     (fun d => W.coeff (n+s+2-d))=weightedSourceRunE45 n s (n-s) W := by
   rw [weightedCut_run_fullE45 n s hs]
   unfold weightedSourceRunE45
   apply sum_congr rfl
   intro r hr
   rw [show n+s+2-(2*s+2+r)=n-s-r by omega]
 dsimp only
 rw [he]
 exact weightedSourceRun_lcE45 n s (n-s) j (by omega) W hn hc

#print axioms weightedCut_degree_sumE45
#print axioms weightedCut_run_fullE45
#print axioms weightedCut_run_lcE45
end
end MathGKM.Markov
