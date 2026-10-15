import MarkovWeightedOne320f
/-! Machine-authored 320fe46f. Actual mask multiplicities, arbitrary weights. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem mask_noDegree320 (m : List (Bool × Bool)) (d : ℕ)
 (h : (m.map Prod.snd).count true=0) : maskDegree07a7 d m=0 := by
 induction m generalizing d with
 | nil => rfl
 | cons rb ms ih =>
   obtain ⟨r,b⟩ := rb
   cases b with
   | false => exact ih _ (by simpa using h)
   | true => simp at h

theorem cutMasks_zero_length320 (v : List Bool) : (cutMasksFe01 v 0).length=1 := by
 induction v with
 | nil => rfl
 | cons r rs ih => simpa [cutMasksFe01] using ih

theorem weightedOne_masks320 {R : Type*} [CommRing R] (w : ℕ → R)
 (y p : R) (d : ℕ) (v : List Bool) :
 weightedOne320 w y p d v=
 ((cutMasksFe01 v 1).map (fun m => w (maskDegree07a7 d m)*maskWeight340 y p 1 m)).sum := by
 induction v generalizing p d with
 | nil => simp [weightedOne320,cutMasksFe01]
 | cons r rs ih =>
   simp only [weightedOne320,cutMasksFe01,List.map_append,List.sum_append,
     List.map_map,Function.comp_def,maskDegree07a7,maskWeight340,if_true,if_false]
   rw [ih]
   have he : ((cutMasksFe01 rs 0).map (fun m =>
       w (d+(if r then 1 else 0)+maskDegree07a7 1 m)*
         (cutFactorA27 y r*(p+1)*maskWeight340 y y 1 m))).sum=
       w (d+if r then 1 else 0)*cutFactorA27 y r*(p+1) := by
     have hmap : ((cutMasksFe01 rs 0).map (fun m =>
       w (d+(if r then 1 else 0)+maskDegree07a7 1 m)*
         (cutFactorA27 y r*(p+1)*maskWeight340 y y 1 m)))=
       (cutMasksFe01 rs 0).map (fun _ => w (d+if r then 1 else 0)*cutFactorA27 y r*(p+1)) := by
       apply List.map_congr_left
       intro m hm
       have hc := (cutMasks_specFe01 rs 0 m hm).2
       rw [mask_noDegree320 m 1 hc,mask_noCuts9c20 m y y 1 hc]
       simp [mul_assoc]
     rw [hmap,List.map_const',List.sum_replicate,cutMasks_zero_length320]
     simp
   rw [he]
   ring

theorem weightedOne_nonneg320 (w : ℕ → ℝ) (hw : ∀ k,0≤w k)
 (v : List Bool) (j : ℕ) :
 0≤(weightedOne320 (fun k => C (w k)) X X 1 v).coeff j := by
 rw [weightedOne_masks320,Polynomial.coeff_list_sum_map]
 apply List.sum_nonneg
 intro x hx
 obtain ⟨m,hm,rfl⟩ := List.mem_map.mp hx
 rw [Polynomial.coeff_C_mul]
 exact mul_nonneg (hw _) (mask_coeff_nonnegFe01 m j)

#print axioms weightedOne_masks320
#print axioms weightedOne_nonneg320
end
end MathGKM.Markov
