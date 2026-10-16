import MarkovVertexCoefficientsMAA6
import MarkovThirdAllMF8
/-! Machine-authored aa6c518b. Universal raw vertical LC above the lower u vertex. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] frame coeff

theorem vertex_gap_positiveMAA6 (a b : ℕ) (ha : 1≤a) (hab : a<b)
 (hb : 5≤b) :
 0<9*(a:ℤ)^2-7*a-8*((2*a-b:ℕ):ℤ)*(b-5) := by
 by_cases h : 2*a≤b
 · rw [Nat.sub_eq_zero_of_le h]
   have har : (1:ℤ)≤a := by exact_mod_cast ha
   norm_num
   nlinarith
 · have ht : b≤2*a := by omega
   have har : (3:ℤ)≤a := by exact_mod_cast (show 3≤a by omega)
   rw [Nat.cast_sub ht]
   push_cast
   nlinarith [sq_nonneg ((2:ℤ)*b-2*a-5)]

theorem source_vertex_verticalMAA6 (path : List Bool) :
 coeff (frame path).mid.p (frame path).mid.a 0*
 coeff (frame path).mid.p (frame path).mid.a 2≤
 coeff (frame path).mid.p (frame path).mid.a 1^2 := by
 by_cases hb : 5≤(frame path).mid.b
 · have h0 := source_vertex_zeroMAA6 path
   have h1 := source_vertex_oneMAA6 path (by omega)
   have h2 := source_vertex_twoMAA6 path hb
   obtain ⟨ha,hab,hcop⟩ := frame_reduced path
   have hg := vertex_gap_positiveMAA6 _ _ ha hab hb
   rw [h0,h1]
   nlinarith
 · have hab := (frame_reduced path).2.1
   simpa using vertical_first_fourMF8 path (frame path).mid.a 0 (by omega)
end
end MathGKM.Markov
