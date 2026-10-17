import MarkovBandPositiveM831
import MarkovBoundaryPositiveM831
import MarkovPositiveRowsMDAB
/-! Machine-authored 831d426f. An exact positive diagonal sum for the
correction factor, including the previously conjectured boundary identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def diagonalFibM831 (d k : ℕ) : Polynomial ℤ := fibBandM139 (d+2*k+1) k

theorem fib_band_oneM831 (n : ℕ) (hn : 2 ≤ n) :
 fibBandM139 n 1=2+C (n:ℤ)*X := by
 ext m
 rw [fib_band_closed_coeffM831]
 rcases m with _|_|m
 · norm_num
 · norm_num [coeff_C_mul,show n-1-1+1+1=n by omega]
 · simp [Nat.choose_eq_zero_of_lt (by omega : 1+1 < m+2+1),coeff_C_mul,
     show m+2≠0 by omega,show m+2≠1 by omega]

theorem diagonal_fib_zeroM831 (d : ℕ) : diagonalFibM831 d 0=1 := by
 simp [diagonalFibM831,fib_band_zeroM139]

theorem band_gain_diagonalM831 (d k : ℕ) (r : Bool) :
 bandGainM139 (d+2*k+(if r then 2 else 1)+2) r (k+2)=
 (if r then 2 else 1)*diagonalFibM831 d (k+2)+
 (if r then 1 else 2)*diagonalFibM831 d (k+1) := by
 have h := fib_band_shiftM831 (d+2*k+3) (k+1) (by omega)
 rw [show d+2*k+3+2=d+2*(k+2)+1 by omega,
   show d+2*k+3+1=d+2*k+4 by omega,
   show d+2*k+3=d+2*(k+1)+1 by omega] at h
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,bandGainM139,diagonalFibM831]
 · rw [show d+2*k+1+2=d+2*(k+1)+1 by omega,
     show d+2*(k+1)+1+1=d+2*k+4 by omega]
   linear_combination -h
 · rw [show d+2*k+2+2=d+2*k+4 by omega,
     show d+2*k+4+1=d+2*(k+2)+1 by omega]
   linear_combination -h

theorem band_at_oneM831 (d : ℕ) (r : Bool) :
 bandAtM139 d 1 r=
 4*((if r then 2 else 1)*diagonalFibM831 d 1+(if r then 5 else 4)) := by
 unfold bandAtM139
 simp only [bandQM139,bandGainM139,fib_band_zeroM139]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,diagonalFibM831]
 all_goals
   repeat rw [fib_band_oneM831 _ (by omega)]
   push_cast
   simp only [map_add,map_ofNat]
   ring

theorem band_at_positive_sumM831 (d k : ℕ) (r : Bool) :
 bandAtM139 d k r=4*((if r then 2 else 1)*doublePrefixMDAB (diagonalFibM831 d) (k+1)+
   (if r then 1 else 2)*doublePrefixMDAB (diagonalFibM831 d) k) := by
 induction k using Nat.twoStepInduction with
 | zero => rw [band_at_zeroM831]; cases r <;> norm_num [doublePrefixMDAB,diagonal_fib_zeroM831]
 | one =>
   rw [band_at_oneM831]
   cases r <;> simp [doublePrefixMDAB,sum_range_succ,diagonal_fib_zeroM831] <;> ring
 | more k h0 h1 =>
   have he := band_at_diagonalM831 d k r
   rw [band_gain_diagonalM831,h0,h1] at he
   have hp0 := doublePrefix_secondMDAB (diagonalFibM831 d) k
   have hp1 := doublePrefix_secondMDAB (diagonalFibM831 d) (k+1)
   rw [show k+1+1=k+2 by omega,show k+1+2=k+2+1 by omega] at hp1
   linear_combination he-4*(if r then 2 else 1)*hp1-4*(if r then 1 else 2)*hp0

theorem diagonal_fib_min_coeffM831 (k m : ℕ) :
 (diagonalFibM831 0 k).coeff m=
 ((2*m+1).choose m:ℤ)*((k+m+1).choose (2*m+1):ℤ) := by
 rw [diagonalFibM831,fib_band_closed_coeffM831]
 rw [show 0+2*k+1-k-1+m+1=k+m+1 by omega]
 have h := Nat.choose_mul (n:=k+m+1) (k:=2*m+1) (s:=m) (by omega)
 rw [show k+m+1-m=k+1 by omega,show 2*m+1-m=m+1 by omega] at h
 have hh : (k+1).choose (m+1)*(k+m+1).choose m=
     (2*m+1).choose m*(k+m+1).choose (2*m+1) := by nlinarith [h]
 exact_mod_cast hh

theorem diagonal_fib_prefix_coeffM831 (k m : ℕ) :
 (doublePrefixMDAB (diagonalFibM831 0) k).coeff m=
 ((2*m+1).choose m:ℤ)*((k+m+2).choose (2*m+3):ℤ) := by
 simp only [doublePrefixMDAB,finsetSum_coeff,coeff_C_mul,diagonal_fib_min_coeffM831]
 have h := weighted_chooseMDAB (m+1) (2*m+1) k (by omega)
 rw [show k+(m+1)+1=k+m+2 by omega,show 2*m+1+2=2*m+3 by omega] at h
 calc
  _ = ((2*m+1).choose m:ℤ)*
       ∑ s ∈ range k, ((k:ℤ)-s)*((s+(m+1)).choose (2*m+1):ℤ) := by
    rw [mul_sum]
    apply sum_congr rfl
    intro s hs
    rw [show s+(m+1)=s+m+1 by omega]
    ring
  _ = _ := by rw [h]

theorem central_doubleM831 (m : ℕ) :
 ((2*m+2).choose (m+1):ℤ)=2*((2*m+1).choose m:ℤ) := by
 have h := Nat.choose_succ_succ (2*m+1) m
 have hs : (2*m+1).choose (m+1)=(2*m+1).choose m := by
   rw [←Nat.choose_symm (show m+1 ≤ 2*m+1 by omega)]
   congr 1 <;> omega
 simp only [Nat.succ_eq_add_one] at h
 rw [hs,show 2*m+1+1=2*m+2 by omega] at h
 have hz : ((2*m+2).choose (m+1):ℤ)=
   ((2*m+1).choose m:ℤ)+((2*m+1).choose m:ℤ) := by exact_mod_cast h
 omega

theorem band_boundary_positive_formulaM831 : BandBoundaryPositiveFormulaM831 := by
 intro k m r
 rw [band_at_positive_sumM831]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,coeff_ofNat_mul,coeff_add,
   one_mul,diagonal_fib_prefix_coeffM831,boundaryBinomialM831]
   <;> rw [central_doubleM831,show k+1+m+2=k+m+3 by omega] <;> ring

theorem band_boundary_formulaM831 : BandBoundaryFormulaM139 :=
 boundary_formula_iff_positiveM831.mpr band_boundary_positive_formulaM831

end
end MathGKM.Markov
