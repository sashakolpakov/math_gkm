import MarkovBinomialPolyM0D3
/-! Machine-authored e8743310. Raw coefficient gaps for the explicit
top five rows. Positive rational scales are removed in each conclusion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem top_small_gapsME87 (n : ℕ) (hn : 4 ≤ n) :
 ((n+2).choose 2:ℤ) ≤ (3*(n:ℤ)-1)^2 ∧
 (4*((n:ℤ)-3))*((n+2).choose 3:ℤ) ≤ (4*(n.choose 2:ℤ))^2 := by
 have hx : (0:ℚ) ≤ (n:ℚ)-4 := by exact_mod_cast (show (4:ℤ) ≤ n by omega)
 have h0 : (0:ℚ) ≤ (17/2)*((n:ℚ)-4)^2+(121/2)*((n:ℚ)-4)+106 := by positivity
 have h1 : (0:ℚ) ≤ (10/3)*((n:ℚ)-4)^4+(136/3)*((n:ℚ)-4)^3+
   (698/3)*((n:ℚ)-4)^2+(1628/3)*((n:ℚ)-4)+496 := by positivity
 have he0 : (3*(n:ℚ)-1)^2-((n+2).choose 2:ℚ)=
   (17/2)*((n:ℚ)-4)^2+(121/2)*((n:ℚ)-4)+106 := by
   rw [choose_poly_natM0D3]
   norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have he1 : (4*(n.choose 2:ℚ))^2-(4*((n:ℚ)-3))*((n+2).choose 3:ℚ)=
   (10/3)*((n:ℚ)-4)^4+(136/3)*((n:ℚ)-4)^3+
   (698/3)*((n:ℚ)-4)^2+(1628/3)*((n:ℚ)-4)+496 := by
   simp only [choose_poly_natM0D3]
   norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 rw [←he0] at h0
 rw [←he1] at h1
 constructor
 · exact_mod_cast (sub_nonneg.mp h0)
 · exact_mod_cast (sub_nonneg.mp h1)

theorem top_four_gapsME87 (n : ℕ) (hn : 7 ≤ n) :
 (4*((n:ℤ)-6))*(((n+1).choose 3:ℤ)+4*(n.choose 3:ℤ)) ≤ (8*((n-2).choose 2:ℤ))^2 ∧
 (8*((n-2).choose 2:ℤ))*((n+2).choose 4:ℤ) ≤
   (((n+1).choose 3:ℤ)+4*(n.choose 3:ℤ))^2 := by
 have hn' : (7:ℚ) ≤ n := by exact_mod_cast hn
 have hx : (0:ℚ) ≤ (n:ℚ)-7 := by linarith
 have h0 : (0:ℚ) ≤ (38/3)*((n:ℚ)-7)^4+(668/3)*((n:ℚ)-7)^3+
   (4474/3)*((n:ℚ)-7)^2+(13780/3)*((n:ℚ)-7)+5616 := by positivity
 have h1 : (0:ℚ) ≤ (19/36)*((n:ℚ)-7)^6+(58/3)*((n:ℚ)-7)^5+
   (10639/36)*((n:ℚ)-7)^4+(14489/6)*((n:ℚ)-7)^3+
   (100192/9)*((n:ℚ)-7)^2+(82396/3)*((n:ℚ)-7)+28336 := by positivity
 have he0 : (8*((n-2).choose 2:ℚ))^2-
   (4*((n:ℚ)-6))*(((n+1).choose 3:ℚ)+4*(n.choose 3:ℚ))=
   (38/3)*((n:ℚ)-7)^4+(668/3)*((n:ℚ)-7)^3+
   (4474/3)*((n:ℚ)-7)^2+(13780/3)*((n:ℚ)-7)+5616 := by
   simp only [choose_poly_natM0D3]
   norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.cast_sub (show 2 ≤ n by omega)]
   ring
 have he1 : (((n+1).choose 3:ℚ)+4*(n.choose 3:ℚ))^2-
   (8*((n-2).choose 2:ℚ))*((n+2).choose 4:ℚ)=
   (19/36)*((n:ℚ)-7)^6+(58/3)*((n:ℚ)-7)^5+
   (10639/36)*((n:ℚ)-7)^4+(14489/6)*((n:ℚ)-7)^3+
   (100192/9)*((n:ℚ)-7)^2+(82396/3)*((n:ℚ)-7)+28336 := by
   simp only [choose_poly_natM0D3]
   norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.cast_sub (show 2 ≤ n by omega)]
   ring
 rw [←he0] at h0
 rw [←he1] at h1
 constructor
 · exact_mod_cast (sub_nonneg.mp h0)
 · exact_mod_cast (sub_nonneg.mp h1)
end
end MathGKM.Markov
