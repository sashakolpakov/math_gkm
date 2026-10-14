import MarkovTopSource58d2
/-! Machine-authored b5dbe087. Literal middle coefficient for the vertical triple. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem source_top_vertical_middleB5 (path : List Bool) (i j : ℕ)
 (hd : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
 ((j:ℝ)+1)*(coeff (frame path).mid.p i (j+1) : ℝ)=
 ((i+j).choose i : ℝ)*
   (((frame path).mid.a-1 : ℝ)*(j+1)+((frame path).mid.b-1 : ℝ)*i) := by
 cases i with
 | zero =>
   have h := upper_slice_factor774 path 1 (by omega)
   rw [quotient_linear5a7] at h
   have he : (frame path).mid.a+(frame path).mid.b-1-2*1=j := by omega
   rw [he] at h
   have hc := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
   rw [diagonal_raw_coeff_on16 path 1 0 (j+1) (by omega)] at hc
   simp only [Polynomial.mul_coeff_zero,Polynomial.add_coeff_zero,
     Polynomial.sub_coeff_zero,Polynomial.coeff_X_zero,Polynomial.coeff_natCast,
     Polynomial.coeff_one_zero,Polynomial.coeff_zero_one_add_X_pow,mul_zero,zero_add] at hc
   rw [hc]
   simp
   <;> ring
 | succ i =>
   rw [source_top_middle58 path i (j+1) (by omega)]
   have h := top_middle_binomial58 i (j+1)
   have he : i+(j+1)=i+1+j := by omega
   rw [he] at h
   simp only [Nat.succ_eq_add_one,Nat.cast_add,Nat.cast_one]
   rw [he]
   linear_combination ((frame path).mid.b-1 : ℝ)*h

theorem top_vertical_last_binomialB5 (i j : ℕ) :
 ((j:ℝ)+1)*(j+2)*((i+j+2).choose i : ℝ)=
 ((i:ℝ)+j+1)*(i+j+2)*((i+j).choose i : ℝ) := by
 have h := top_last_binomial58 j i
 rw [Nat.choose_symm_of_eq_add (n:=j+i+2) (a:=j+2) (b:=i) (by omega),
   Nat.choose_symm_add] at h
 simpa [Nat.add_comm,Nat.add_left_comm,Nat.add_assoc,add_comm,add_left_comm,add_assoc] using h

#print axioms source_top_vertical_middleB5
end
end MathGKM.Markov
