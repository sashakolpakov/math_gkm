import MarkovEndpointBinomialsMA45
/-! Machine-authored a45def12. The exact cutoff step in the ordered ratio. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem q_cutoff_adjacent_succMA45 (k s : ℕ) :
 (qPolyM7E2 (k+2) (s+1)^2).coeff (k+1)*
   (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) (s+2)).coeff (k+2) ≤
 (qPolyM7E2 (k+2) (s+1)^2).coeff (k+2)*
   (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) (s+2)).coeff (k+1) := by
 let D : ℝ := (2*s+10)*(2*s+11)
 let a : ℝ := (s+4)*(s+6)
 let C : ℝ := ((2*s+k+10).choose (k+1):ℝ)
 let T : ℝ := ((2*s+k+11).choose k:ℝ)
 let H : ℝ := ((s+k+5).choose k:ℝ)
 let E : ℝ := ((s+k+5).choose (k+2):ℝ)
 let F : ℝ := ((s+k+6).choose (k+2):ℝ)
 let G : ℝ := ((s+k+7).choose (k+2):ℝ)
 let S : ℝ := (s+4)*(s+5)+(s+k+6)*(s+k+7)
 let A (n : ℕ) := (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) (s+2)).coeff n
 let B (n : ℕ) := (qPolyM7E2 (k+2) (s+1)^2).coeff n
 have ha : D*A (k+1)=16*C*(D*(k+2)+a*(k:ℝ)*(k+1)) := by
   have h := q_product_scaledMA45 (k+2) s (s+2) (k+1) (by omega)
   rw [show s+(s+2)+(k+1)+7=2*s+k+10 by omega] at h
   dsimp [D,A,C,a]
   push_cast at h
   convert h using 1 <;> ring
 have hb : D*B (k+1)=16*C*(D*(k+2)+(a+1)*(k:ℝ)*(k+1)) := by
   have h := q_product_scaledMA45 (k+2) (s+1) (s+1) (k+1) (by omega)
   rw [show (s+1)+(s+1)+(k+1)+7=2*s+k+10 by omega] at h
   dsimp [D,B,C,a]
   rw [pow_two]
   push_cast at h
   convert h using 1 <;> ring
 have ha' : A (k+2)=16*a*T+4*(k+2)*(E+G) := by
   have h := q_product_cutoff_succMA45 k s (s+2)
   rw [show s+(s+2)+k+9=2*s+k+11 by omega,show s+2+k+5=s+k+7 by omega] at h
   dsimp [A,a,T,E,G]
   push_cast at h
   convert h using 1 <;> ring
 have hb' : B (k+2)=16*(a+1)*T+8*(k+2)*F := by
   have h := q_product_cutoff_succMA45 k (s+1) (s+1)
   rw [show (s+1)+(s+1)+k+9=2*s+k+11 by omega,show s+1+k+5=s+k+6 by omega] at h
   dsimp [B,a,T,F]
   rw [pow_two]
   push_cast at h
   convert h using 1 <;> ring
 have hdif : E-2*F+G=H := by
   have h := choose_second_differenceMA45 (s+k+5) k
   rw [show s+k+5+2=s+k+7 by omega,show s+k+5+1=s+k+6 by omega] at h
   dsimp [E,F,G,H]
   linarith only [h]
 have hsum : (k+2:ℝ)*(k+1)*(E+G)=H*S := endpoint_sum_scaledMA45 s k
 have hbound : 0 ≤ 4*T-H*(k+1)*(k+2) := sub_nonneg.mpr (cutoff_binomial_boundMA45 s k)
 have hpoly : 0 ≤ (k+2:ℝ)^2*D-S-a*(k+2)*(k+1) :=
   cutoff_scalar_positiveMA45 s k (Nat.cast_nonneg _) (Nat.cast_nonneg _)
 let M : ℝ := D*(4*T-(k+2)*H)-(k:ℝ)*(k+1)*(E+G+a*H)
 have hid : (k+2:ℝ)*M =
   (k+2:ℝ)*D*(4*T-H*(k+1)*(k+2)) +
   (k:ℝ)*H*((k+2:ℝ)^2*D-S-a*(k+2)*(k+1)) := by
   dsimp [M]
   linear_combination -(k:ℝ)*hsum
 have hd : 0 < D := by dsimp [D]; positivity
 have hH : 0 ≤ H := by dsimp [H]; positivity
 have hM : 0 ≤ M := by
   apply nonneg_of_mul_nonneg_right (a:= (k+2:ℝ)) _ (by positivity)
   rw [hid]
   positivity
 have hgap : D*(B (k+2)*A (k+1)-B (k+1)*A (k+2)) = 64*C*(k+2)*M := by
   calc
    _ = B (k+2)*(D*A (k+1))-(D*B (k+1))*A (k+2) := by ring
    _ = _ := by
      rw [ha,hb,ha',hb']
      dsimp [M]
      rw [← hdif]
      ring
 have hC : 0 ≤ C := by dsimp [C]; positivity
 have hg : 0 ≤ D*(B (k+2)*A (k+1)-B (k+1)*A (k+2)) := by
   rw [hgap]
   positivity
 exact sub_nonneg.mp (nonneg_of_mul_nonneg_right hg hd)

end
end MathGKM.Markov
