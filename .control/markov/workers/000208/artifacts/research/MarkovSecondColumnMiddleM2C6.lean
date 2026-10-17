import MarkovSmallSourceMEA
import MarkovThreeRawM9E2
/-! Machine-authored 2c6e5ef0. Exact raw second-column cubic throughout
the middle interval, derived from the already proved sparse quotient. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

theorem second_column_middleM2C6 (q J : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hJ : J+2 ≤ q+(if r then 1 else 2)) :
 threeRawM9E2 q r 2 (q+1+J)=
 2*((J:ℤ)+1)*(J+2)*(J+(if r then 2 else 1)) := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 change threeRawM9E2 (n+1) r 2 (n+1+1+J)=_
 have hp : List.replicate n false++true::[r]=threePathM9E2 n r := rfl
 cases r
 · have hs := s32sourceMEA n [false]
     (by norm_num [frame,initial,advance]) (by norm_num [frame,initial,advance])
   dsimp only at hs
   rw [hp,(three_path_labelsM9E2 n false).2,three_path_polynomialM9E2] at hs
   norm_num only [Bool.false_eq_true,if_false] at hs hJ ⊢
   have hm : 3*(n+1)+2-(2*n+4)=n+1 := by omega
   rw [hm] at hs
   have hc := s32coeffMEA (2*(threePolyM9E2 (n+1) false).coeff 2) (n+1) (n+1)
     (n+1+1+J) (by simpa only [Nat.cast_add,Nat.cast_one] using hs)
   simp only [Polynomial.coeff_ofNat_mul] at hc
   change 6*(2*coeff (threePolyM9E2 (n+1) false) 2 (n+1+1+J))=_ at hc
   rw [three_raw_formulaM9E2] at hc
   have he : ((n+1+1+J:ℕ):ℤ)-(n+1:ℕ)=(J:ℤ)+1 := by omega
   rw [he] at hc
   simp only [s32EMEA,s32c0_1MEA,s32c0_2MEA,zero_mul,sub_zero,one_mul] at hc
   simp (disch := omega) only [vFall_zeroM758] at hc
   rw [vFall_polyM758 ((J:ℤ)+1) 1 (by omega),
     vFall_polyM758 ((J:ℤ)+1) 2 (by omega)] at hc
   nlinarith only [hc]
 · have hs := s31sourceMEA n [true]
     (by norm_num [frame,initial,advance]) (by norm_num [frame,initial,advance])
   dsimp only at hs
   rw [hp,(three_path_labelsM9E2 n true).2,three_path_polynomialM9E2] at hs
   norm_num only [if_true] at hs hJ ⊢
   have hm : 3*(n+1)+1-(2*n+4)=n := by omega
   rw [hm] at hs
   have hc := s31coeffMEA (2*(threePolyM9E2 (n+1) true).coeff 2) n (n+1)
     (n+1+1+J) (by simpa only [Nat.cast_add,Nat.cast_one] using hs)
   simp only [Polynomial.coeff_ofNat_mul] at hc
   change 6*(2*coeff (threePolyM9E2 (n+1) true) 2 (n+1+1+J))=_ at hc
   rw [three_raw_formulaM9E2] at hc
   have he : ((n+1+1+J:ℕ):ℤ)-n=(J:ℤ)+2 := by omega
   rw [he] at hc
   simp only [s31EMEA,s31c0_2MEA,s31c0_3MEA,zero_mul,sub_zero,one_mul] at hc
   simp (disch := omega) only [vFall_zeroM758] at hc
   rw [vFall_polyM758 ((J:ℤ)+2) 2 (by omega),
     vFall_polyM758 ((J:ℤ)+2) 3 (by omega)] at hc
   nlinarith only [hc]

end
end MathGKM.Markov
