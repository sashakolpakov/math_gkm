import MarkovOffsetFormulaM58E
import MarkovSquares3556
/-! Machine-authored 58e57003. Actual-source lower rows, including the axis. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

def lowerValM58E (j d i : ℕ) : ℤ :=
 ∑ h∈range (i-1), ((2*d).choose h:ℤ)*((2*i-2-h).choose i:ℤ)*
  (((j+i+1).choose (2*i-1-h):ℤ)+((j+i).choose (2*i-1-h):ℤ))

theorem lower_nonnegM58E (j d i : ℕ) : 0 ≤ lowerValM58E j d i := by
 unfold lowerValM58E
 exact sum_nonneg (fun _ _ => by positivity)

theorem lower_lowM58E (j d i : ℕ) (hi : i ≤ 1) : lowerValM58E j d i=0 := by
 unfold lowerValM58E
 rw [show i-1=0 by omega]
 simp

theorem lower_two_formulaM58E (j d i : ℕ) :
 coeff (fib6 (j+d+1)^2+V*fib6 (j+d)^2) i j=lowerValM58E j d i := by
 cases j with
 | zero =>
   have hc : coeff (fib6 (0+d+1)^2+V*fib6 (0+d)^2) i 0=
     coeff (fib6 (d+1)^2) i 0 := by
     simp [coeff,V,Polynomial.coeff_X_mul]
   rw [hc]
   by_cases hi : i ≤ 1
   · rw [show d+1=0+d+1 by omega,offset_square_lowM58E _ _ _ hi,lower_lowM58E _ _ _ hi]
   · rw [show d+1=0+d+1 by omega,offset_square_formulaM58E _ _ _ (by omega)]
     unfold lowerValM58E
     apply sum_congr rfl
     intro h hh
     have hh' := mem_range.mp hh
     rw [Nat.choose_eq_zero_of_lt (by omega : 0+i < 2*i-1-h)]
     simp
 | succ j =>
   have hc : coeff (fib6 (j+1+d+1)^2+V*fib6 (j+1+d)^2) i (j+1)=
     coeff (fib6 (j+1+d+1)^2) i (j+1)+coeff (fib6 (j+d+1)^2) i j := by
     simp [coeff,V,Polynomial.coeff_X_mul,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm]
   rw [hc]
   by_cases hi : i ≤ 1
   · rw [offset_square_lowM58E _ _ _ hi,offset_square_lowM58E _ _ _ hi,
       lower_lowM58E _ _ _ hi,add_zero]
   · rw [offset_square_formulaM58E _ _ _ (by omega),offset_square_formulaM58E _ _ _ (by omega)]
     unfold lowerValM58E
     rw [←sum_add_distrib]
     apply sum_congr rfl
     intro h hh
     simp only [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm]
     ring

theorem source_two_lower_formulaM58E (path : List Bool) (j d i : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*(j+d)+1) :
 coeff (frame path).mid.p i j=lowerValM58E j d i := by
 obtain ⟨q,hq,hb',hp⟩ := source_two_squares3556 path ha
 have he : q=j+d := by omega
 subst q
 rw [hp]
 exact lower_two_formulaM58E j d i

end
end MathGKM.Markov
