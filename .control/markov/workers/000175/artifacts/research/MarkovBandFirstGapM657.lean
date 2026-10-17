import MarkovBandResidualM831
import MarkovBandBudgetObstructionM139
/-! Machine-authored live worker 6576ccc5. The first adjacent inequality of
every correction factor in the nonnegative-exponent band. This auxiliary
inequality is not asserted to prove log-concavity of the full source row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem band_first_gap_certificateM657 (d t : ℕ) (r : Bool) :
 0 ≤ 7*(bandLinearM139 (d+2*(t+2)+(if r then 2 else 1)) (t+2) r)^2-
   5*(if r then 2*((t:ℤ)+3)*((t:ℤ)+4)^2 else 2*((t:ℤ)+3)^2*((t:ℤ)+4))*
     bandQuadraticM139 (d+2*(t+2)+(if r then 2 else 1)) (t+2) r := by
 cases r <;> simp only [bandLinearM139,bandQuadraticM139,Bool.false_eq_true,
   if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one]
   <;> ring_nf <;> positivity

theorem band_first_adjacentM657 (d k : ℕ) (r : Bool) :
 (bandAtM139 d k r).coeff 0*(bandAtM139 d k r).coeff 2 ≤
   (bandAtM139 d k r).coeff 1^2 := by
 by_cases hk : 2 ≤ k
 · obtain ⟨t, rfl⟩ := Nat.exists_eq_add_of_le hk
   rw [Nat.add_comm 2 t]
   have hq : 2 ≤ d+2*(t+2)+(if r then 2 else 1) := by omega
   have hn : 2*((d+2*(t+2)+(if r then 2 else 1))+(t+2)+1)+1 ≤
       sourceNME9C (d+2*(t+2)+(if r then 2 else 1)) r := by
     cases r <;> simp [sourceNME9C] <;> omega
   have h0 := band_Q_constantM139 (d+2*(t+2)+(if r then 2 else 1)) (t+2) r
   have h1 := band_Q_linearM139 _ (t+2) r hq hn
   have h2 := band_Q_quadraticM139 _ (t+2) r hq hn
   have hp := band_first_gap_certificateM657 d t r
   have he : (if r then 2*((t:ℤ)+3)*((t:ℤ)+4)^2 else 2*((t:ℤ)+3)^2*((t:ℤ)+4))=
       (bandAtM139 d (t+2) r).coeff 0 := by
     rw [bandAtM139,h0]
     cases r <;> simp <;> ring
   rw [he,←h1,←h2] at hp
   change 0 ≤ 7*(30*(bandAtM139 d (t+2) r).coeff 1)^2-
     5*(bandAtM139 d (t+2) r).coeff 0*(1260*(bandAtM139 d (t+2) r).coeff 2) at hp
   nlinarith
 · have hz : (bandAtM139 d k r).coeff 2=0 := by
     exact band_Q_tailM139 _ k 2 r (by omega)
   rw [hz,mul_zero]
   exact sq_nonneg _

end
end MathGKM.Markov
