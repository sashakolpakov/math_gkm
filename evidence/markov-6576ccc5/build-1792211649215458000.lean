import MarkovBandFirstGapM657
import MarkovBinomialTableM295
/-! Machine-authored 6576ccc5. Exact first two coefficients of the lower
row factor; they will be used without coefficient normalization. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem diagonalH_zeroM657 (d j : ℕ) :
 (diagonalHMDAB d j).coeff 0=
 ((j+3).choose 3:ℤ)+4*((j+4).choose 5:ℤ) := by
 rw [diagonalH_coeffMDAB]
 simp only [Nat.choose_zero_right,Nat.cast_one,mul_one]
 have h := weighted_chooseMDAB 3 3 j (by omega)
 norm_num only at h
 rw [h]

theorem diagonalH_oneM657 (d j : ℕ) :
 (diagonalHMDAB d j).coeff 1=
 (d:ℤ)*(((j+3).choose 4:ℤ)+4*((j+4).choose 6:ℤ))+
 5*(((j+4).choose 5:ℤ)+4*((j+5).choose 7:ℤ)) := by
 have step (s : ℕ) :
   ((s+3).choose 4:ℤ)*((d+s+1+3).choose 1:ℤ)=
   (d:ℤ)*((s+3).choose 4:ℤ)+5*((s+4).choose 5:ℤ) := by
   have h := congrArg (fun n : ℕ => (n:ℤ)) (Nat.add_one_mul_choose_eq (s+3) 4)
   norm_num at h
   rw [show s+3+1=s+4 by omega] at h
   simp only [Nat.choose_one_right,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
   linear_combination h
 rw [diagonalH_coeffMDAB]
 rw [step j]
 have hs : (∑ s ∈ range j, ((j:ℤ)-s)*((s+3).choose (1+3):ℤ)*
     ((d+s+1+3).choose 1:ℤ))=
     (d:ℤ)*((j+4).choose 6:ℤ)+5*((j+5).choose 7:ℤ) := by
   calc
    _ = (d:ℤ)*(∑ s ∈ range j, ((j:ℤ)-s)*((s+3).choose 4:ℤ))+
       5*(∑ s ∈ range j, ((j:ℤ)-s)*((s+4).choose 5:ℤ)) := by
      rw [mul_sum,mul_sum,←sum_add_distrib]
      apply sum_congr rfl
      intro s hsj
      rw [mul_assoc,step s]
      ring
    _ = _ := by rw [weighted_chooseMDAB 3 4 j (by omega),weighted_chooseMDAB 4 5 j (by omega)]
 rw [hs]
 ring

def lowerZeroM657 (j : ℚ) : ℚ :=
 choosePolyM0D3 (j+3) 3+4*choosePolyM0D3 (j+4) 5
def lowerOneM657 (d j : ℚ) : ℚ :=
 d*(choosePolyM0D3 (j+3) 4+4*choosePolyM0D3 (j+4) 6)+
 5*(choosePolyM0D3 (j+4) 5+4*choosePolyM0D3 (j+5) 7)

theorem diagonalH_zero_rationalM657 (d j : ℕ) :
 ((diagonalHMDAB d j).coeff 0:ℚ)=lowerZeroM657 j := by
 rw [diagonalH_zeroM657]
 push_cast
 simp only [choose_poly_natM0D3,lowerZeroM657,Nat.cast_add,Nat.cast_ofNat]

theorem diagonalH_one_rationalM657 (d j : ℕ) :
 ((diagonalHMDAB d j).coeff 1:ℚ)=lowerOneM657 d j := by
 rw [diagonalH_oneM657]
 push_cast
 simp only [choose_poly_natM0D3,lowerOneM657,Nat.cast_add,Nat.cast_ofNat]

end
end MathGKM.Markov
