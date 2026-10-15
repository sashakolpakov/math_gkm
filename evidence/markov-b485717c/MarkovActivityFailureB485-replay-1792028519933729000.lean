import MarkovActivityFormulaB485
/-! Machine-authored b485717c. Positive palindromic cut activities can fail
horizontal LC. At uniform activities the literal source triple has positive gap.
This is an auxiliary obstruction, not a refutation of Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def activityGapB485 (t : ℤ) : ℤ :=
 (1+14*t+15*t^2)^2-(1+2*t)*(12*t+59*t^2+28*t^3+t^4)

theorem activity_gap_shiftB485 (n : ℤ) :
 activityGapB485 (n+86) =
 -(43464915+113474404*n+5195117*n^2+89854*n^3+692*n^4+2*n^5) := by
 unfold activityGapB485
 ring

theorem activity_gap_negativeB485 (t : ℤ) (ht : 86≤t) : activityGapB485 t<0 := by
 have hn : 0≤t-86 := by omega
 have h := activity_gap_shiftB485 (t-86)
 have hp : 0 < 43464915+113474404*(t-86)+5195117*(t-86)^2+
   89854*(t-86)^3+692*(t-86)^4+2*(t-86)^5 := by positivity
 have he : t-86+86=t := by ring
 rw [he] at h
 omega

theorem activity_horizontal_failureB485 (t : ℤ) (ht : 86≤t) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 3).coeff 2^2 <
 (activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 2).coeff 2*
 (activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 4).coeff 2 := by
 rw [activity_coeff2B485,activity_coeff3B485,activity_coeff4B485]
 have h := activity_gap_negativeB485 t ht
 unfold activityGapB485 at h
 omega

theorem activity_positive_palindromeB485 (t : ℤ) (ht : 0<t) :
 (activityWordB485 t).map Prod.snd = ((activityWordB485 t).map Prod.snd).reverse ∧
 ∀ rt∈activityWordB485 t, 0<rt.2 := by
 constructor
 · rfl
 · intro rt hr
   simp only [activityWordB485,List.mem_cons,List.not_mem_nil,or_false] at hr
   rcases hr with h|h|h|h|h|h|h <;> subst rt <;> norm_num [ht]

theorem source18_rawB485 :
 let m := (frame (List.replicate 6 false)).mid
 m.a=1 ∧ m.b=8 ∧ Nat.Coprime m.a m.b ∧
 InPolygon m.a m.b 1 2 ∧ InPolygon m.a m.b 2 2 ∧ InPolygon m.a m.b 3 2 ∧
 coeff m.p 1 2=3 ∧ coeff m.p 2 2=30 ∧ coeff m.p 3 2=100 ∧
 coeff m.p 2 2^2-coeff m.p 1 2*coeff m.p 3 2=600 := by
 have ha : (frame (List.replicate 6 false)).mid.a=1 := rfl
 have hb : (frame (List.replicate 6 false)).mid.b=8 := rfl
 have hc (s : ℕ) :
   activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C (1:ℤ))) s =
   cutCoeffA27 (X:ℤ[X]) X 1 (central28 (List.replicate 6 false)++[true]) s := by
   rw [map_one,activity_word_uniformB485,activity_uniformB485,activity_word_sourceB485]
 have h0 := activity_coeff2B485 1
 have h1 := activity_coeff3B485 1
 have h2 := activity_coeff4B485 1
 rw [hc 2] at h0
 rw [hc 3] at h1
 rw [hc 4] at h2
 have c0 : coeff (frame (List.replicate 6 false)).mid.p 1 2=3 := by
   rw [source_cut_coeffA27 _ 1 2 2 (by rw [ha])]
   norm_num at h0 ⊢; exact h0
 have c1 : coeff (frame (List.replicate 6 false)).mid.p 2 2=30 := by
   rw [source_cut_coeffA27 _ 2 2 3 (by rw [ha])]
   norm_num at h1 ⊢; exact h1
 have c2 : coeff (frame (List.replicate 6 false)).mid.p 3 2=100 := by
   rw [source_cut_coeffA27 _ 3 2 4 (by rw [ha])]
   norm_num at h2 ⊢; exact h2
 dsimp only
 norm_num [ha,hb,InPolygon,c0,c1,c2]

#print axioms activity_gap_shiftB485
#print axioms activity_gap_negativeB485
#print axioms activity_horizontal_failureB485
#print axioms activity_positive_palindromeB485
#print axioms source18_rawB485
end
end MathGKM.Markov
