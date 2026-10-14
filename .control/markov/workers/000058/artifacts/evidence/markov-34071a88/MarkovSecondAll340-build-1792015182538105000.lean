import MarkovSecondSource340
import MarkovAmbientSourceBounds77c2
import MarkovPellSum9a72
/-! Machine-authored 34071a88. All denominators in the stronger j=2 row. -/
namespace MathGKM.Markov
noncomputable section

theorem source_second_ambient_all340 (path : List Bool) (i : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i 2)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) 2) :
 let m := (frame path).mid
 let s := i+2-m.a
 (s+2 : ℤ)*(m.b-1-s)*coeff m.p i 2*coeff m.p (i+2) 2 ≤
 (s+1 : ℤ)*(m.b-2-s)*coeff m.p (i+1) 2^2 := by
 by_cases hb : 5 ≤ (frame path).mid.b
 · exact source_second_ambient340 path i hb h0 h2
 by_cases ha : (frame path).mid.a=1
 · have h := source_one_ambient77 path ha i 2 (by simpa [ha] using h0) (by simpa [ha] using h2)
   dsimp only at h ⊢
   rw [ha,show i+2-1=i+1 by omega]
   push_cast
   convert h using 1 <;> ring
 have hi := frame_reduced path
 have hnear : (frame path).mid.b=(frame path).mid.a+1 := by
   by_contra hh
   have he : (frame path).mid.a=2 ∧ (frame path).mid.b=4 := by omega
   have hc := hi.2.2
   rw [he.1,he.2] at hc
   norm_num at hc
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hnear
 simp only [(right_labels650 n).1,(right_labels650 n).2] at h0 h2 ha hb
 have hn : n ≤ 2 := by omega
 dsimp only
 rw [(right_labels650 n).1,(right_labels650 n).2]
 unfold InPolygon at h0 h2
 interval_cases n
 · omega
 · omega
 · have he : i=2 := by omega
   subst i
   simp only [right_coeff_sum9a72]
   norm_num [pellSum9a72,Finset.sum_range_succ,Nat.choose]

#print axioms source_second_ambient_all340
end
end MathGKM.Markov
