import MarkovTopVerticalB5
/-! Machine-authored b5dbe087. The uniform vertical top-face multiplicative
constant one is sharp, witnessed by actual numerator-one source polynomials. -/
namespace MathGKM.Markov
noncomputable section

theorem vertical_sharp_coeffB5 (j k : ℕ) (hk : k ≤ 2) :
 coeff (frame (List.replicate (j+1) false)).mid.p 1 (j+k)=(j+k+1 : ℤ) := by
 have h := source_one_coeff6 (List.replicate (j+1) false) (left_spine_a274 _) 0
   (j+k) (2-k) (by rw [spine_b6]; omega)
 rw [Nat.choose_symm_of_eq_add (n:=0+1+(j+k)) (a:=j+k) (b:=1) (by omega)] at h
 simpa [Nat.choose_one_right] using h

theorem vertical_sharp_polygonB5 (j k : ℕ) (hk : k ≤ 2) :
 InPolygon (frame (List.replicate (j+1) false)).mid.a
   (frame (List.replicate (j+1) false)).mid.b 1 (j+k) := by
 rw [left_spine_a274,spine_b6]
 unfold InPolygon
 constructor <;> omega

theorem vertical_uniform_constant_sharpB5 (c : ℝ) (hc : 1 < c) :
 ∃ (path : List Bool) (i j : ℕ),
   InPolygon (frame path).mid.a (frame path).mid.b i j ∧
   InPolygon (frame path).mid.a (frame path).mid.b i (j+1) ∧
   InPolygon (frame path).mid.a (frame path).mid.b i (j+2) ∧
   i+j+2=(frame path).mid.a+(frame path).mid.b-1 ∧
   (coeff (frame path).mid.p i (j+1) : ℝ)^2 <
     c*(coeff (frame path).mid.p i j : ℝ)*coeff (frame path).mid.p i (j+2) := by
 obtain ⟨j,hj⟩ := exists_nat_gt (1/(c-1))
 have hc0 : 0 < c-1 := by linarith
 have hprod : 1 < (j:ℝ)*(c-1) := (div_lt_iff₀ hc0).mp hj
 refine ⟨List.replicate (j+1) false,1,j,
   ?_,vertical_sharp_polygonB5 j 1 (by omega),
   vertical_sharp_polygonB5 j 2 (by omega),?_,?_⟩
 · simpa using vertical_sharp_polygonB5 j 0 (by omega)
 · rw [left_spine_a274,spine_b6]; omega
 · have h0 := vertical_sharp_coeffB5 j 0 (by omega)
   have h1 := vertical_sharp_coeffB5 j 1 (by omega)
   have h2 := vertical_sharp_coeffB5 j 2 (by omega)
   simp only [Nat.add_zero] at h0
   rw [h0,h1,h2]
   push_cast
   have hn : (0:ℝ) ≤ j := by positivity
   have hx : (j:ℝ) ≤ (j+1)*(j+3) := by nlinarith
   have hh := mul_le_mul_of_nonneg_right hx (le_of_lt hc0)
   nlinarith

#print axioms vertical_sharp_coeffB5
#print axioms vertical_uniform_constant_sharpB5
end
end MathGKM.Markov
