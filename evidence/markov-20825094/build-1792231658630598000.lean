import MarkovTopSteinBalanceM208
/-! Machine-authored 20825094. Positive expectation for the actual q-tilted
base in the wedge a≥2m. The finite stationary law is proved, not assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000

theorem stein_sum_positiveM208 (a H : ℝ) (m : ℕ) (w : ℕ → ℝ)
 (hm : 2 ≤ m) (ha : 2*(m:ℝ) ≤ a) (hH : 6*a+m+8 ≤ 2*H)
 (hw : ∀ k, k ≤ m → 0 < w k)
 (hL : (∑ k ∈ range (m+1), w k*steinLM208 a m H k)=0) :
 0 < ∑ k ∈ range (m+1), w k*steinScalarM208 a H k ((m:ℝ)-k) := by
 have hm' : (2:ℝ) ≤ m := by exact_mod_cast hm
 have ha0 : 0 < a := by linarith
 have hD := stein_den_positiveM208 a m H hm' ha hH
 have hC := stein_Cp_positiveM208 a m H hm' ha hH
 have hR := stein_reduced_positiveM208 a m H hm' ha hH
 have hmass : 0 < ∑ k ∈ range (m+1), w k := by
   apply sum_pos'
   · intro k hk
     exact (hw k (by have := mem_range.mp hk; omega)).le
   · exact ⟨0,mem_range.mpr (by omega),hw 0 (by omega)⟩
 have hK : 0 < a*(m:ℝ)*(m-1)*steinreducedM208 a m H := by
   have hm0 : (0:ℝ) < m := by linarith
   have hm1 : (0:ℝ) < (m:ℝ)-1 := by linarith
   positivity
 have hsum := sum_le_sum (s:=range (m+1)) (fun k hk => show
   w k*(a*(m:ℝ)*(m-1)*steinreducedM208 a m H) ≤
   w k*(steindenM208 a m H*(4*a+7)*steinScalarM208 a H k ((m:ℝ)-k)+
   (2*(a+2)*steindenM208 a m H+4*steinCpM208 a m H)*steinLM208 a m H k) from by
     have hk0 : 0 ≤ (k:ℝ) := by positivity
     have hk1 : (k:ℝ) ≤ m := by exact_mod_cast (show k ≤ m by have := mem_range.mp hk; omega)
     have hp : 0 ≤ (k:ℝ)*((m:ℝ)-k) := mul_nonneg hk0 (sub_nonneg.mpr hk1)
     have hs : 0 ≤ (m:ℝ)^2-4*((k:ℝ)*((m:ℝ)-k)) := by nlinarith [sq_nonneg ((m:ℝ)-2*k)]
     have he := stein_point_certificateM208 a m H k
     have hh : 0 ≤ steinCpM208 a m H*(8*a+14)*((k:ℝ)*((m:ℝ)-k))*
         ((m:ℝ)^2-4*((k:ℝ)*((m:ℝ)-k))) := by positivity
     exact mul_le_mul_of_nonneg_left (by linarith [he]) (hw k (by have := mem_range.mp hk; omega)).le)
 have hsimp : (∑ k ∈ range (m+1), w k*(steindenM208 a m H*(4*a+7)*
     steinScalarM208 a H k ((m:ℝ)-k)+
     (2*(a+2)*steindenM208 a m H+4*steinCpM208 a m H)*steinLM208 a m H k))=
   steindenM208 a m H*(4*a+7)*(∑ k ∈ range (m+1), w k*steinScalarM208 a H k ((m:ℝ)-k)) := by
   simp only [mul_add,sum_add_distrib]
   have hh (c : ℝ) (f : ℕ → ℝ) : (∑ k ∈ range (m+1), w k*(c*f k))=
       c*∑ k ∈ range (m+1), w k*f k := by
     rw [mul_sum]; apply sum_congr rfl; intro k hk; ring
   rw [hh,hh,hL]
   ring
 rw [hsimp,←sum_mul] at hsum
 have hp := (mul_pos hmass hK).trans_le hsum
 exact (mul_pos_iff_of_pos_left (mul_pos hD (by linarith))).mp hp

theorem stein_scalar_castM208 (d i m k : ℕ) (hk : k ≤ m) :
 betaGroupScalarMCA9 d i m k=
 steinScalarM208 ((i:ℝ)+1) ((d:ℝ)+2*i+9) k ((m:ℝ)-k) := by
 unfold betaGroupScalarMCA9 betaScalarMCA9 steinScalarM208
 push_cast
 rw [Nat.cast_sub hk]

theorem stein_base_positiveM208 (d i m : ℕ)
 (hm : 2 ≤ m) (ha : 2*m ≤ i+1) (hH : 6*(i+1)+m+8 ≤ 2*(d+2*i+9)) :
 0 < ∑ k ∈ range (m+1), steinPairM208 d i m k*betaGroupScalarMCA9 d i m k := by
 have hp := stein_sum_positiveM208 ((i:ℝ)+1) ((d:ℝ)+2*i+9) m (steinPairM208 d i m)
   hm (by exact_mod_cast ha) (by exact_mod_cast hH)
   (fun k _ => stein_pair_positiveM208 d i m k) (stein_pair_stationaryM208 d i m)
 convert hp using 1
 apply sum_congr rfl
 intro k hk
 rw [stein_scalar_castM208 d i m k (by have := mem_range.mp hk; omega)]

end
end MathGKM.Markov
