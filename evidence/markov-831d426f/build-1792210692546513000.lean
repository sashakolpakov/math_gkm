import MarkovBandSumM831
import MarkovAdjacent67c3
/-! Machine-authored 831d426f. Universal log-concavity of the actual d=0
correction factor. This is not log-concavity of the sum forming the source row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

def boundaryBaseM831 (k m : ℕ) : ℚ :=
 ((k+1).choose (m+1):ℚ)*((k+m+2).choose (m+1):ℚ)
def boundaryWeightM831 (k m : ℚ) (r : Bool) : ℚ := if r then 3*k+m+6 else 3*k+3-m
def boundaryNumerM831 (k m : ℚ) (r : Bool) : ℚ :=
 (2*m+3)*(k-m)*(k+m+3)*boundaryWeightM831 k (m+1) r
def boundaryDenomM831 (k m : ℚ) (r : Bool) : ℚ :=
 (2*m+5)*(m+2)^2*boundaryWeightM831 k m r
def boundaryCoeffM831 (k m : ℕ) (r : Bool) : ℚ := (bandAtM139 0 k r).coeff m

theorem boundary_base_stepM831 (k m : ℕ) (hm : m ≤ k) :
 boundaryBaseM831 k (m+1)*((m:ℚ)+2)^2=
 boundaryBaseM831 k m*((k:ℚ)-m)*(k+m+3) := by
 have h1 := choose_lower_step67 (k+1) (m+1) (by omega)
 have h2 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.add_one_mul_choose_eq (k+m+2) (m+1))
 push_cast at h1 h2
 unfold boundaryBaseM831
 rw [show k+(m+1)+2=k+m+2+1 by omega]
 linear_combination ((k+m+2+1).choose (m+1+1):ℚ)*((m:ℚ)+2)*h1-
   ((k+1).choose (m+1):ℚ)*((k:ℚ)-m)*h2

theorem boundary_coeff_scaledM831 (k m : ℕ) (r : Bool) (hm : m ≤ k) :
 (2*(m:ℚ)+3)*boundaryCoeffM831 k m r=
 2*boundaryWeightM831 k m r*boundaryBaseM831 k m := by
 have h := band_boundary_formulaM831 k m r hm
 have hc := Nat.choose_mul (n:=k+m+2) (k:=2*m+2) (s:=m+1) (by omega)
 rw [show k+m+2-(m+1)=k+1 by omega,show 2*m+2-(m+1)=m+1 by omega] at hc
 have hcz : ((k+m+2).choose (2*m+2):ℤ)*((2*m+2).choose (m+1):ℤ)=
   ((k+1).choose (m+1):ℤ)*((k+m+2).choose (m+1):ℤ) := by
   exact_mod_cast (hc.trans (Nat.mul_comm _ _))
 rw [mul_assoc (2*_ : ℤ),hcz] at h
 unfold boundaryCoeffM831 boundaryWeightM831 boundaryBaseM831
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at * <;> exact_mod_cast h

theorem boundary_coeff_stepM831 (k m : ℕ) (r : Bool) (hm : m+1 ≤ k) :
 boundaryCoeffM831 k (m+1) r*boundaryDenomM831 k m r=
 boundaryCoeffM831 k m r*boundaryNumerM831 k m r := by
 have h0 := boundary_coeff_scaledM831 k m r (by omega)
 have h1 := boundary_coeff_scaledM831 k (m+1) r hm
 have hb := boundary_base_stepM831 k m (by omega)
 push_cast at h1
 unfold boundaryNumerM831 boundaryDenomM831
 linear_combination boundaryWeightM831 k m r*((m:ℚ)+2)^2*h1-
   ((k:ℚ)-m)*(k+m+3)*boundaryWeightM831 k (m+1) r*h0+
   2*boundaryWeightM831 k m r*boundaryWeightM831 k (m+1) r*hb

theorem boundary_ratio_decreasingM831 (m t : ℚ) (r : Bool) (hm : 0 ≤ m) (ht : 0 ≤ t) :
 boundaryNumerM831 (m+t+2) (m+1) r*boundaryDenomM831 (m+t+2) m r ≤
 boundaryNumerM831 (m+t+2) m r*boundaryDenomM831 (m+t+2) (m+1) r := by
 apply sub_nonneg.mp
 cases r <;> simp only [boundaryNumerM831,boundaryDenomM831,boundaryWeightM831,
   Bool.false_eq_true,if_false,if_true] <;> ring_nf <;> positivity

theorem boundary_denom_posM831 (k m : ℚ) (r : Bool) (hm : 0 ≤ m) (hk : m ≤ k) :
 0 < boundaryDenomM831 k m r := by
 have h0 : 0 < 3*k+3-m := by linarith
 have h1 : 0 < 3*k+m+6 := by linarith
 cases r <;> simp only [boundaryDenomM831,boundaryWeightM831,
   Bool.false_eq_true,if_false,if_true] <;> positivity

theorem boundary_coeff_adjacentM831 (k m : ℕ) (r : Bool) :
 boundaryCoeffM831 k m r*boundaryCoeffM831 k (m+2) r ≤ boundaryCoeffM831 k (m+1) r^2 := by
 by_cases hm : m+2 ≤ k
 · have hn (s : ℕ) : 0 ≤ boundaryCoeffM831 k s r := by
     unfold boundaryCoeffM831
     exact_mod_cast band_at_nonnegativeM831 0 k s r
   have h := ratio_cross67 (boundaryCoeffM831 k m r) (boundaryCoeffM831 k (m+1) r)
     (boundaryCoeffM831 k (m+1) r) (boundaryCoeffM831 k (m+2) r)
     (boundaryNumerM831 k m r) (boundaryNumerM831 k (m+1) r)
     (boundaryDenomM831 k m r) (boundaryDenomM831 k (m+1) r)
     (hn _) (hn _)
     (boundary_denom_posM831 k m r (by positivity) (by exact_mod_cast (show m ≤ k by omega)))
     (boundary_denom_posM831 k (m+1) r (by positivity) (by exact_mod_cast (show m+1 ≤ k by omega)))
     (boundary_coeff_stepM831 k m r (by omega))
     (by simpa only [Nat.cast_add,Nat.cast_one,Nat.add_assoc] using boundary_coeff_stepM831 k (m+1) r hm)
   have ht : (0:ℚ) ≤ (k:ℚ)-m-2 := by
     have hh : (m:ℚ)+2 ≤ k := by exact_mod_cast hm
     linarith
   have hg := boundary_ratio_decreasingM831 (m:ℚ) ((k:ℚ)-m-2) r (by positivity) ht
   rw [show (m:ℚ)+((k:ℚ)-m-2)+2=k by ring] at hg
   simpa only [pow_two] using h hg
 · have hz : boundaryCoeffM831 k (m+2) r=0 := by
     unfold boundaryCoeffM831 bandAtM139
     rw [band_Q_tailM139 _ k (m+2) r (by omega),Int.cast_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _

theorem boundary_raw_adjacentM831 (k m : ℕ) (r : Bool) :
 (bandAtM139 0 k r).coeff m*(bandAtM139 0 k r).coeff (m+2) ≤
   (bandAtM139 0 k r).coeff (m+1)^2 := by
 have h := boundary_coeff_adjacentM831 k m r
 unfold boundaryCoeffM831 at h
 exact_mod_cast h

end
end MathGKM.Markov
