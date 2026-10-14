import MarkovPolarization340
import MarkovCutGapsA27
/-! Machine-authored fe01d46b. Exact enumeration of fixed-size cut masks.
No coefficient inequality is assumed or concluded from enumeration. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def cutMasksFe01 : List Bool → ℕ → List (List (Bool × Bool))
 | [], 0 => [[]]
 | [], _+1 => []
 | r::rs, 0 => (cutMasksFe01 rs 0).map ((r,false)::·)
 | r::rs, s+1 => (cutMasksFe01 rs (s+1)).map ((r,false)::·) ++
     (cutMasksFe01 rs s).map ((r,true)::·)

theorem cutMasks_lengthFe01 (w : List Bool) (s : ℕ) :
 (cutMasksFe01 w s).length=w.length.choose s := by
 induction w generalizing s with
 | nil => cases s <;> simp [cutMasksFe01]
 | cons r rs ih =>
   cases s <;> simp [cutMasksFe01,ih,Nat.choose_succ_succ, Nat.add_comm]

theorem cutMasks_sumFe01 {R : Type*} [CommRing R] (y p q : R)
 (w : List Bool) (s : ℕ) :
 ((cutMasksFe01 w s).map (maskWeight340 y p q)).sum=cutCoeffA27 y p q w s := by
 induction w generalizing p q s with
 | nil => cases s <;> simp [cutMasksFe01,maskWeight340,cutCoeffA27]
 | cons r rs ih =>
   cases s with
   | zero => simpa [cutMasksFe01,maskWeight340,cutCoeffA27,List.map_map,
       Function.comp_def] using ih (cutChargeA27 y p q r) q 0
   | succ s =>
     simp only [cutMasksFe01,List.map_append,List.map_map,List.sum_append,
       Function.comp_def,maskWeight340,if_false,if_true]
     rw [List.sum_map_mul_left,ih,ih]
     rfl

/-- Every actual raw coefficient with a nonnegative sheared index, as a
sum of explicit mask weights. The source word and coefficient scale are exact. -/
theorem source_masks_coeffFe01 (path : List Bool) (i j s : ℕ)
 (hs : i+j=(frame path).mid.a+s) :
 coeff (frame path).mid.p i j =
 (((cutMasksFe01 (central28 path++[true]) s).map
   (maskWeight340 (X:ℤ[X]) X 1)).sum).coeff j := by
 rw [cutMasks_sumFe01,source_cut_coeffA27 path i j s hs]

/-- The multiplicity of each selected mask is one: all first components
are the original word, and the second components record exactly s cuts. -/
theorem cutMasks_specFe01 (w : List Bool) (s : ℕ) (m : List (Bool × Bool))
 (hm : m ∈ cutMasksFe01 w s) :
 m.map Prod.fst=w ∧ (m.map Prod.snd).count true=s := by
 induction w generalizing s m with
 | nil =>
   cases s with
   | zero => simp only [cutMasksFe01,List.mem_singleton] at hm; subst m; simp
   | succ s => simp [cutMasksFe01] at hm
 | cons r rs ih =>
   cases s with
   | zero =>
     simp only [cutMasksFe01,List.mem_map] at hm
     obtain ⟨m,hm,rfl⟩ := hm
     obtain ⟨h1,h2⟩ := ih 0 m hm
     simp [h1,h2]
   | succ s =>
     simp only [cutMasksFe01,List.mem_append,List.mem_map] at hm
     rcases hm with ⟨m,hm,rfl⟩ | ⟨m,hm,rfl⟩
     · obtain ⟨h1,h2⟩ := ih (s+1) m hm
       simp [h1,h2]
     · obtain ⟨h1,h2⟩ := ih s m hm
       simp [h1,h2]

theorem cutMasks_nodupFe01 (w : List Bool) (s : ℕ) :
 (cutMasksFe01 w s).Nodup := by
 induction w generalizing s with
 | nil => cases s <;> simp [cutMasksFe01]
 | cons r rs ih =>
   cases s with
   | zero => exact (ih 0).map (by intro a b h; simpa using h)
   | succ s =>
     apply List.nodup_append.mpr
     refine ⟨(ih (s+1)).map (by intro a b h; simpa using h),
       (ih s).map (by intro a b h; simpa using h), ?_⟩
     simp only [List.disjoint_left,List.mem_map]
     rintro m ⟨a,ha,rfl⟩ ⟨b,hb,h⟩
     simp at h

#print axioms cutMasks_sumFe01
#print axioms cutMasks_lengthFe01
#print axioms source_masks_coeffFe01
#print axioms cutMasks_specFe01
#print axioms cutMasks_nodupFe01
end
end MathGKM.Markov
