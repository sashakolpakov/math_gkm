import MarkovBandSourceM831
import MarkovBandCrossM831
/-! Machine-authored 831d426f. A uniform augmented-residual route to all
horizontal inequalities in the band. Its shape premise remains unproved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def bandResidualM831 (q k : ℕ) (r : Bool) : Polynomial ℤ :=
 bandQM139 q r k+X*rowHMFFD (sourceNME9C q r) (q+k+1)
def bandRowM831 (q k : ℕ) (r : Bool) : Polynomial ℤ :=
 X^2*((X+1)^bandExponentM139 q k r*bandResidualM831 q k r)

theorem source_band_residual_coeffM831 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)=(bandRowM831 q k r).coeff i := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_band_factorM139 q k r hq hn]
 congr 1
 unfold lowerRowMFFD bandCorrectionM139 bandRowM831 bandResidualM831 bandExponentM139
 ring

theorem band_residual_nonnegM831 (q k i : ℕ) (r : Bool)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 0 ≤ (bandResidualM831 q k r).coeff i := by
 rw [bandResidualM831,coeff_add]
 apply add_nonneg (band_Q_nonnegativeM831 q k i r hn)
 cases i with
 | zero => simp
 | succ i => rw [coeff_X_mul]; exact rowH_coeff_nonnegMDAB _ (q+k+1) i hn

theorem band_residual_posM831 (q k i : ℕ) (r : Bool)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hi : i ≤ q+k+2) :
 0 < (bandResidualM831 q k r).coeff i := by
 rw [bandResidualM831,coeff_add]
 cases i with
 | zero =>
   simp only [coeff_X_mul_zero,add_zero]
   exact (band_Q_positive_iffM831 q k 0 r hn).mpr (by omega)
 | succ i =>
   rw [coeff_X_mul]
   exact add_pos_of_nonneg_of_pos (band_Q_nonnegativeM831 q k (i+1) r hn)
     (rowH_coeff_posMDAB _ (q+k+1) i hn (by omega))

theorem band_residual_tailM831 (q k i : ℕ) (r : Bool) (hi : q+k+2 < i) :
 (bandResidualM831 q k r).coeff i=0 := by
 rw [bandResidualM831,coeff_add,band_Q_tailM139 q k i r (by omega),zero_add]
 cases i with
 | zero => omega
 | succ i => rw [coeff_X_mul,rowH_tailMFFD _ (q+k+1) i (by omega)]

theorem band_row_crossM831 (q k : ℕ) (r : Bool)
 (h : CrossLC (CoeffSeq ((bandResidualM831 q k r).map (Int.castRingHom ℝ)))) :
 CrossLC (CoeffSeq ((bandRowM831 q k r).map (Int.castRingHom ℝ))) := by
 have hp := crossLC_pascal h (bandExponentM139 q k r)
 rw [←coeffSeq_binomial_mul] at hp
 have hh := crossLC_X_pow_mul46 _ hp 2
 simpa only [bandRowM831,Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,add_comm (1:ℝ[X]) X] using hh

theorem source_band_lc_of_residualM831 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r)
 (h : CrossLC (CoeffSeq ((bandResidualM831 q k r).map (Int.castRingHom ℝ)))) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
   threeRawM9E2 q r (i+1) (q+k+1)^2 := by
 have hh := crossLC_adjacent (band_row_crossM831 q k r h) (i+1)
 simp only [CoeffSeq,show ¬(i:ℤ)<0 by omega,show ¬(i:ℤ)+1<0 by omega,
   show ¬(i:ℤ)+1+1<0 by omega,add_sub_cancel_right,if_false,
   Int.toNat_natCast,Polynomial.coeff_map] at hh
 have h1 : ((i:ℤ)+1).toNat=i+1 := by omega
 have h2 : ((i:ℤ)+1+1).toNat=i+2 := by omega
 rw [h1,h2] at hh
 simp only [←source_band_residual_coeffM831 q k _ r hq hn,Int.coe_castRingHom] at hh
 exact_mod_cast hh

end
end MathGKM.Markov
