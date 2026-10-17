import MarkovLowConvolutionMA45
/-! Machine-authored a45def12. Universal adjacent ratios strictly below the cutoff. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem q_low_adjacentMA45 (j s n : ℕ) (hn : n+1 < j) :
 (qPolyM7E2 j (s+1)^2).coeff n*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff (n+1) ≤
 (qPolyM7E2 j (s+1)^2).coeff (n+1)*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff n := by
 let D : ℝ := (2*s+10)*(2*s+11)
 let a : ℝ := (s+4)*(s+6)
 let C (m : ℕ) : ℝ := ((2*s+m+9).choose m:ℝ)
 let A (m : ℕ) : ℝ := (qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff m
 let B (m : ℕ) : ℝ := (qPolyM7E2 j (s+1)^2).coeff m
 have ha (m : ℕ) (hm : m < j) :
     D*A m=16*C m*(D*(j:ℝ)*(j-m)+a*(m:ℝ)*(m-1)) := by
   have H := q_product_scaledMA45 j s (s+2) m hm
   rw [show s+(s+2)+m+7=2*s+m+9 by omega] at H
   dsimp [D,A,C,a]
   push_cast at H
   convert H using 1 <;> ring
 have hb (m : ℕ) (hm : m < j) :
     D*B m=16*C m*(D*(j:ℝ)*(j-m)+(a+1)*(m:ℝ)*(m-1)) := by
   have H := q_product_scaledMA45 j (s+1) (s+1) m hm
   rw [show (s+1)+(s+1)+m+7=2*s+m+9 by omega] at H
   dsimp [D,B,C,a]
   rw [pow_two]
   push_cast at H
   convert H using 1 <;> ring
 have he : D^2*(B (n+1)*A n-B n*A (n+1)) =
     256*C n*C (n+1)*D*(j:ℝ)*n*(2*j-n-1) := by
   calc
    _ = (D*B (n+1))*(D*A n)-(D*B n)*(D*A (n+1)) := by ring
    _ = _ := by
      rw [ha n (by omega),ha (n+1) hn,hb n (by omega),hb (n+1) hn]
      push_cast
      ring
 have hc (m : ℕ) : 0 ≤ C m := by dsimp [C]; positivity
 have hd : 0 < D := by dsimp [D]; positivity
 have hjn : (n:ℝ)+1 < j := by exact_mod_cast hn
 have hp : 0 ≤ (2:ℝ)*j-n-1 := by linarith
 have hh : 0 ≤ D^2*(B (n+1)*A n-B n*A (n+1)) := by
   rw [he]
   positivity
 have hh' := nonneg_of_mul_nonneg_right hh (sq_pos_of_pos hd)
 exact sub_nonneg.mp hh'

end
end MathGKM.Markov
