import MarkovUpperSumM2B3
/-! Machine-authored 2b34268b. Exact positive upper-row source formula. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000

def upperValM2B3 (N d i : ℕ) : ℤ :=
 if i=0 then 0 else ∑ h∈range (i+1), ((2*d+h-1).choose h:ℤ)*
 ((2*i-2-h).choose (i-h):ℤ)*
 (((N+i-h+1).choose (2*i-1-h):ℤ)+((N+i-h).choose (2*i-1-h):ℤ))

theorem upper_val_nonnegM2B3 (N d i : ℕ) : 0 ≤ upperValM2B3 N d i := by
 unfold upperValM2B3
 split_ifs
 · positivity
 · exact sum_nonneg (fun _ _ => by positivity)

theorem upper_square_zeroM2B3 (N d : ℕ) :
 coeff (fib6 (N+d+1)^2) 0 (N+2*d)=0 := by
 unfold coeff
 rw [pow_two,Polynomial.mul_coeff_zero,fib_zero_jet3556,←pow_add,
   Polynomial.coeff_X_pow]
 simp [show N+2*d ≠ N+d+1+(N+d+1) by omega]

theorem upper_square_oneM2B3 (N d : ℕ) (hd : 1 ≤ d) :
 coeff (fib6 (N+d+1)^2) 1 (N+2*d)=2*(d:ℤ) := by
 rw [pow_two,bicoeff_mulM3A1,sum_comm]
 rw [sum_range_succ,sum_range_succ,sum_range_zero,zero_add]
 simp only [Nat.sub_zero,Nat.sub_self]
 rw [upper_edgeM2B3 N d 1 hd (by omega),upper_edge_revM2B3 N d 1 hd (by omega)]
 simp
 ring

theorem upper_two_formulaM2B3 (N d i : ℕ) (hN : 1 ≤ N) (hd : 1 ≤ d) :
 coeff (fib6 (N+d+1)^2+V*fib6 (N+d)^2) i (N+2*d)=upperValM2B3 N d i := by
 have hj : 1 ≤ N+2*d := by omega
 have he : coeff (fib6 (N+d+1)^2+V*fib6 (N+d)^2) i (N+2*d)=
   coeff (fib6 (N+d+1)^2) i (N+2*d)+
   coeff (fib6 (N-1+d+1)^2) i (N-1+2*d) := by
   have hj' : N+2*d=(N-1+2*d)+1 := by omega
   rw [hj']
   simp [coeff,V,Polynomial.coeff_X_mul,show N-1+d+1=N+d by omega]
 rw [he]
 by_cases hi0 : i=0
 · subst i
   rw [upper_square_zeroM2B3,upper_square_zeroM2B3]
   simp [upperValM2B3]
 by_cases hi1 : i=1
 · subst i
   rw [upper_square_oneM2B3 N d hd,upper_square_oneM2B3 (N-1) d hd]
   norm_num [upperValM2B3,sum_range_succ]
   ring
 · rw [upper_square_formulaM2B3 N d i hd (by omega),
     upper_square_formulaM2B3 (N-1) d i hd (by omega),←sum_add_distrib]
   unfold upperValM2B3
   rw [if_neg hi0]
   apply sum_congr rfl
   intro h hh
   have hh' := mem_range.mp hh
   rw [show N-1+i-h+1=N+i-h by omega]
   ring

theorem source_two_upper_formulaM2B3 (path : List Bool) (N d i : ℕ)
 (hN : 1 ≤ N) (hd : 1 ≤ d) (ha : (frame path).mid.a=2)
 (hb : (frame path).mid.b=2*(N+d)+1) :
 coeff (frame path).mid.p i (N+2*d)=upperValM2B3 N d i := by
 obtain ⟨q,hq,hb',hp⟩ := source_two_squares3556 path ha
 have he : q=N+d := by omega
 subst q
 rw [hp]
 exact upper_two_formulaM2B3 N d i hN hd

end
end MathGKM.Markov
