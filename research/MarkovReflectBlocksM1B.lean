import MarkovBackwardTwoM1B
/-! Machine-authored 1b02dddc. Full reflected block decomposition with guarded shifts. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
theorem reflect_shift_padM1B (H : ℤ[X]) (s m t : ℕ)
 (hd : H.natDegree≤ s) (ht : m+s≤ t) :
 reflect t (X^m*H)=X^(t-m-s)*reflect s H := by
 have he : t=(t-s)+s := by omega
 rw [he,reflect_mul _ _ (by compute_degree; omega) hd,reflect_monomial,
   revAt_le (by omega : m≤ t-s)]
 congr 2
 omega

theorem reflect_five_blocksM1B (H0 H1 H2 H3 H4 : ℤ[X]) (n : ℕ)
 (h0 : H0.natDegree≤12) (h1 : H1.natDegree≤12) (h2 : H2.natDegree≤13)
 (h3 : H3.natDegree≤14) (h4 : H4.natDegree≤15) :
 reflect (4*n+15) (H0+X^n*H1+X^(2*n)*H2+X^(3*n)*H3+X^(4*n)*H4)=
 X^(4*n+3)*reflect 12 H0+X^(3*n+3)*reflect 12 H1+
 X^(2*n+2)*reflect 13 H2+X^(n+1)*reflect 14 H3+reflect 15 H4 := by
 have hz := reflect_shift_padM1B H0 12 0 (4*n+15) h0 (by omega)
 simp only [pow_zero,one_mul] at hz
 rw [reflect_add,reflect_add,reflect_add,reflect_add,hz,
   reflect_shift_padM1B H1 12 n (4*n+15) h1 (by omega),
   reflect_shift_padM1B H2 13 (2*n) (4*n+15) h2 (by omega),
   reflect_shift_padM1B H3 14 (3*n) (4*n+15) h3 (by omega),
   reflect_shift_padM1B H4 15 (4*n) (4*n+15) h4 (by omega)]
 simp only [show 4*n+15-0-12=4*n+3 by omega,
   show 4*n+15-n-12=3*n+3 by omega,
   show 4*n+15-2*n-13=2*n+2 by omega,
   show 4*n+15-3*n-14=n+1 by omega,
   show 4*n+15-4*n-15=0 by omega,pow_zero,one_mul]

theorem backward_five_blocksM1B (P H0 H1 H2 H3 H4 : ℤ[X]) (n j : ℕ)
 (hj : j≤4*n+7)
 (h0 : H0.natDegree≤12) (h1 : H1.natDegree≤12) (h2 : H2.natDegree≤13)
 (h3 : H3.natDegree≤14) (h4 : H4.natDegree≤15)
 (h : (1-X)^8*P=H0+X^n*H1+X^(2*n)*H2+X^(3*n)*H3+X^(4*n)*H4) :
 P.coeff j=convSevenK0B
  (X^(4*n+3)*reflect 12 H0+X^(3*n+3)*reflect 12 H1+
   X^(2*n+2)*reflect 13 H2+X^(n+1)*reflect 14 H3+reflect 15 H4) (4*n+7-j) := by
 have he : (1-X)^8*P=0+X^0*(H0+X^n*H1+X^(2*n)*H2+X^(3*n)*H3+X^(4*n)*H4) := by
   simpa only [pow_zero,one_mul,zero_add] using h
 have hb := backward_coeff_generalM94 P 0 _ 0 (4*n+7) j (by omega)
   (by simp) (by compute_degree; omega) he
 change P.coeff j=convSevenK0B (reflect (4*n+7+8) _) (0+(4*n+7)-j) at hb
 rw [show 4*n+7+8=4*n+15 by omega,zero_add,
   reflect_five_blocksM1B H0 H1 H2 H3 H4 n h0 h1 h2 h3 h4] at hb
 exact hb
end
end MathGKM.Markov
