import MarkovBandShiftM831
import MarkovBandBudgetCoeffsM139
/-! Machine-authored 831d426f. Unconditional coefficient nonnegativity and
strict interval support for the complete nonnegative-exponent band. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem band_gain_nonnegM831 (q k m : ℕ) (r : Bool) :
 0 ≤ (bandGainM139 q r k).coeff m := by
 cases k with
 | zero => cases r <;> cases m <;> norm_num [bandGainM139]
 | succ k =>
   have hm (n : ℕ) : 0 ≤ ((X+1)*fibBandM139 n k).coeff m := by
     rw [add_mul,one_mul,coeff_add]
     apply add_nonneg _ (fib_band_nonnegM831 n k m)
     cases m with
     | zero => simp
     | succ m => rw [coeff_X_mul]; exact fib_band_nonnegM831 n k m
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true,coeff_add]
     <;> exact add_nonneg (add_nonneg (fib_band_nonnegM831 _ _ _) (fib_band_nonnegM831 _ _ _)) (hm _)

theorem band_gain_posM831 (q k m : ℕ) (r : Bool) (hm : m ≤ k) :
 0 < (bandGainM139 q r k).coeff m := by
 cases k with
 | zero => have : m=0 := by omega; subst m; cases r <;> norm_num [bandGainM139]
 | succ k =>
   have h0 := fib_band_nonnegM831 q k m
   have h1 := (fib_band_pos_iffM831 (q+1) (k+1) m).mpr hm
   have h2 := fib_band_nonnegM831 q (k+1) m
   have hx (n : ℕ) : 0 ≤ ((X+1)*fibBandM139 n k).coeff m := by
     rw [add_mul,one_mul,coeff_add]
     apply add_nonneg _ (fib_band_nonnegM831 n k m)
     cases m with
     | zero => simp
     | succ m => rw [coeff_X_mul]; exact fib_band_nonnegM831 n k m
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true,coeff_add]
   · have := hx (q+1); omega
   · have := hx q; omega

theorem band_at_zeroM831 (d : ℕ) (r : Bool) :
 bandAtM139 d 0 r=if r then 8 else 4 := by
 cases r <;> norm_num [bandAtM139,bandQM139,bandGainM139]

theorem band_at_initial_monoM831 (d i : ℕ) (r : Bool) :
 (bandAtM139 d 0 r).coeff i ≤ (bandAtM139 d 1 r).coeff i := by
 rcases i with _|_|i
 · unfold bandAtM139
   rw [band_Q_constantM139,band_Q_constantM139]
   cases r <;> norm_num
 · rw [band_at_zeroM831]
   have hz : (if r then (8:Polynomial ℤ) else 4).coeff 1=0 := by cases r <;> norm_num
   rw [hz]
   exact band_Q_linear_nonnegM139 _ 1 r
     (by cases r <;> simp <;> omega)
     (by cases r <;> simp [sourceNME9C] <;> omega)
 · unfold bandAtM139
   rw [band_Q_tailM139 _ 0 (i+2) r (by omega),band_Q_tailM139 _ 1 (i+2) r (by omega)]

theorem band_at_nonneg_monoM831 (d k i : ℕ) (r : Bool) :
 0 ≤ (bandAtM139 d k r).coeff i ∧
 (bandAtM139 d k r).coeff i ≤ (bandAtM139 d (k+1) r).coeff i := by
 induction k with
 | zero =>
   refine ⟨?_,band_at_initial_monoM831 d i r⟩
   rw [band_at_zeroM831]
   cases r <;> cases i <;> norm_num
 | succ k ih =>
   have he := congrArg (fun p : Polynomial ℤ => p.coeff i) (band_at_diagonalM831 d k r)
   simp only [coeff_add,coeff_sub,coeff_ofNat_mul] at he
   have hg := band_gain_nonnegM831 (d+2*k+(if r then 2 else 1)+2) (k+2) i r
   constructor <;> omega

theorem band_boundary_nonnegativeM831 : BandBoundaryNonnegM139 := by
 intro k i r
 exact (band_at_nonneg_monoM831 0 k i r).1

theorem band_at_nonnegativeM831 (d k i : ℕ) (r : Bool) :
 0 ≤ (bandAtM139 d k r).coeff i := (band_at_nonneg_monoM831 d k i r).1

theorem band_at_monotone_dM831 (d k i : ℕ) (r : Bool) :
 (bandAtM139 d k r).coeff i ≤ (bandAtM139 (d+1) k r).coeff i :=
 (band_nonneg_monoM139 band_boundary_nonnegativeM831 k r).2 d i

theorem band_at_positiveM831 (d k i : ℕ) (r : Bool) (hi : i ≤ k) :
 0 < (bandAtM139 d k r).coeff i := by
 rcases k with _|_|k
 · have : i=0 := by omega
   subst i
   rw [band_at_zeroM831]
   cases r <;> norm_num
 · rcases i with _|i
   · unfold bandAtM139
     rw [band_Q_constantM139]
     cases r <;> norm_num
   · have : i=0 := by omega
     subst i
     exact band_Q_top_posM139 _ 1 r
       (by cases r <;> simp <;> omega)
       (by cases r <;> simp [sourceNME9C] <;> omega)
 · have he := congrArg (fun p : Polynomial ℤ => p.coeff i) (band_at_diagonalM831 d k r)
   simp only [coeff_add,coeff_sub,coeff_ofNat_mul] at he
   have h0 := band_at_nonneg_monoM831 d k i r
   have hg := band_gain_posM831 (d+2*k+(if r then 2 else 1)+2) (k+2) i r hi
   omega

theorem band_Q_nonnegativeM831 (q k i : ℕ) (r : Bool)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) : 0 ≤ (bandQM139 q r k).coeff i := by
 have he : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 have h := band_at_nonnegativeM831 (bandExponentM139 q k r) k i r
 simpa only [bandAtM139,he] using h

theorem band_Q_positive_iffM831 (q k i : ℕ) (r : Bool)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 0 < (bandQM139 q r k).coeff i ↔ i ≤ k := by
 constructor
 · intro hi
   by_contra h
   rw [band_Q_tailM139 q k i r (by omega)] at hi
   omega
 · intro hi
   have he : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
     cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
       Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
   have h := band_at_positiveM831 (bandExponentM139 q k r) k i r hi
   simpa only [bandAtM139,he] using h

end
end MathGKM.Markov
