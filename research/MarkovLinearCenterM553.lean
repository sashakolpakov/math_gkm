import MarkovMomentSlackM553
/-! Machine-authored 55306a3b. Raw coefficient form of the linear certificate,
and a fixed-grid obstruction. Neither is an assertion of the source conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem moments_from_tripleM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) :
 let Q := (1+X)^n*P
 let L := CoeffSeq Q k
 let M := CoeffSeq Q (k+1)
 let R := CoeffSeq Q (k+2)
 massM37B P n k=L+2*M+R ∧
 firstM37B P n k=(n+2)*(L+M) ∧
 secondM37B P n k=(n+2)*((n+2)*L+M) := by
 dsimp only
 obtain ⟨hL,hM,hR⟩ := moment_reconstruct_allM37B P n k
 have hn : (n+1:ℝ)≠0 := by positivity
 have hd : ((n+1:ℝ)*(n+2))≠0 := by positivity
 have hW : (n+1:ℝ)*(n+2)*(massM37B P n k-
   (CoeffSeq ((1+X)^n*P) k+2*CoeffSeq ((1+X)^n*P) (k+1)+
    CoeffSeq ((1+X)^n*P) (k+2)))=0 := by
   linear_combination hL+2*hM+hR
 have hU : (n+1:ℝ)*(firstM37B P n k-(n+2)*
   (CoeffSeq ((1+X)^n*P) k+CoeffSeq ((1+X)^n*P) (k+1)))=0 := by
   linear_combination hL+hM
 have hU' := sub_eq_zero.mp ((mul_eq_zero.mp hU).resolve_left hn)
 refine ⟨sub_eq_zero.mp ((mul_eq_zero.mp hW).resolve_left hd),hU',?_⟩
 rw [hU'] at hL
 linear_combination hL

def tripleLinearM553 (H L M R C : ℝ) : ℝ :=
 4*(H-1)*(C*H*(L+M)-H*(H*L+M))-H*(C-1)^2*(L+2*M+R)

theorem linearMoment_tripleM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (C : ℝ) :
 linearMomentM553 P n k C=tripleLinearM553 (n+2)
   (CoeffSeq ((1+X)^n*P) k) (CoeffSeq ((1+X)^n*P) (k+1))
   (CoeffSeq ((1+X)^n*P) (k+2)) C := by
 obtain ⟨hW,hU,hV⟩ := moments_from_tripleM553 P n k
 unfold linearMomentM553
 rw [hW,hU,hV]
 unfold tripleLinearM553
 ring

theorem zero_smoothing_centerM553 (L M R C : ℝ) :
 tripleLinearM553 2 L M R C=
 -8*L+8*(C-1)*(L+M)-2*(C-1)^2*(L+2*M+R) := by
 unfold tripleLinearM553
 ring

theorem grid_gap_negativeM553 (L M R C d : ℝ)
 (hL : 0<L) (hM : 0≤M) (hd : 0<d) (hR : 4*d*(L+M)≤R)
 (hC : C≤1 ∨ 1+1/d≤C) : tripleLinearM553 2 L M R C<0 := by
 rw [zero_smoothing_centerM553]
 have hLM : 0≤L+M := by linarith
 have hR0 : 0≤R := le_trans (by positivity) hR
 have hW : 0≤L+2*M+R := by linarith
 rcases hC with hC | hC
 · have h1 := mul_nonpos_of_nonpos_of_nonneg (by linarith : C-1≤0) hLM
   have h2 := mul_nonneg (sq_nonneg (C-1)) hW
   nlinarith
 · have hcd : 1≤(C-1)*d := (div_le_iff₀ hd).mp (by linarith : 1/d≤C-1)
   have hc : 0≤C-1 := by have hp := one_div_pos.mpr hd; linarith
   have h1 := mul_le_mul_of_nonneg_left hR hc
   have h2 := mul_le_mul_of_nonneg_right hcd hLM
   have h3 : 4*(L+M)≤(C-1)*R := by nlinarith only [h1,h2]
   have h4 := mul_le_mul_of_nonneg_left h3 hc
   have h5 := mul_nonneg (sq_nonneg (C-1)) (show 0≤L+2*M by linarith)
   nlinarith only [hL,h4,h5]

theorem integer_grid_negativeM553 (L M R : ℝ) (d : ℕ) (hd : 0<d)
 (hL : 0<L) (hM : 0≤M) (hR : 4*(d:ℝ)*(L+M)≤R) (z : ℤ) :
 tripleLinearM553 2 L M R ((z:ℝ)/d)<0 := by
 apply grid_gap_negativeM553 L M R _ d hL hM (by exact_mod_cast hd) hR
 have hdR : (0:ℝ)<d := by exact_mod_cast hd
 by_cases hz : z≤(d:ℤ)
 · left
   apply (div_le_iff₀ hdR).mpr
   simpa using (show (z:ℝ)≤(d:ℝ) by exact_mod_cast hz)
 · right
   have hz' : (d:ℝ)+1≤z := by exact_mod_cast (show (d:ℤ)+1≤z by omega)
   apply (le_div_iff₀ hdR).mpr
   have he : (1+1/(d:ℝ))*(d:ℝ)=(d:ℝ)+1 := by field_simp
   rw [he]
   exact hz'

end
end MathGKM.Markov
