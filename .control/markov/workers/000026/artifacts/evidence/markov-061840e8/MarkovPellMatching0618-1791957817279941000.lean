import MarkovResidualSupport725
import MarkovBinomialLC6ade
/-! Machine-authored 061840e8. Alternating-path matching polynomials.
The formulas are proved from a positive recurrence, not imported as axioms. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def matchPair0618 {R : Type*} [CommRing R] (u v : R) : ℕ → R × R
 | 0 => (1,1)
 | n+1 => let z := matchPair0618 u v n
          (z.1+u*z.2+v*z.1,z.1+u*z.2)

theorem match_coeff0618 (n i j : ℕ) :
 coeff (matchPair0618 U V n).1 i j =
   ((n-j).choose i : ℤ)*((n-i).choose j : ℤ) ∧
 coeff (matchPair0618 U V n).2 i j =
   ((n-j).choose i : ℤ)*((n-i-1).choose j : ℤ) := by
 induction n generalizing i j with
 | zero =>
   simp [matchPair0618,coeff,Polynomial.coeff_one,Nat.choose_zero_left]
   split_ifs <;> simp_all
 | succ n ih =>
   have hp (i j : ℕ) : coeff (matchPair0618 U V (n+1)).2 i j =
       (((n+1-j).choose i : ℕ):ℤ)*((n+1-i-1).choose j : ℤ) := by
     cases i with
     | zero =>
       simp only [matchPair0618,coeff_add725,coeff_U_zero725,add_zero]
       rw [(ih 0 j).1]
       simp
     | succ i =>
       change coeff ((matchPair0618 U V n).1+U*(matchPair0618 U V n).2) (i+1) j = _
       rw [coeff_add725,coeff_U_succ725,(ih (i+1) j).1,(ih i j).2]
       have e1 : n-(i+1)=n-i-1 := by omega
       have e2 : n+1-(i+1)-1=n-i-1 := by omega
       rw [e1,e2]
       by_cases hj : j≤n
       · have e : n+1-j=(n-j)+1 := by omega
         rw [e,Nat.choose_succ_succ]
         push_cast
         ring
       · have hz : (n-i-1).choose j=0 := Nat.choose_eq_zero_of_lt (by omega)
         simp [hz]
   refine ⟨?_,hp i j⟩
   have he : (matchPair0618 U V (n+1)).1=
       (matchPair0618 U V (n+1)).2+V*(matchPair0618 U V n).1 := rfl
   rw [he,coeff_add725]
   cases j with
   | zero => rw [coeff_V_zero725,hp]; simp
   | succ j =>
     rw [coeff_V_succ725,hp,(ih i j).1]
     have e1 : n+1-(j+1)=n-j := by omega
     have e2 : n+1-i-1=n-i := by omega
     rw [e1,e2]
     by_cases hi : i≤n
     · have e : n+1-i=(n-i)+1 := by omega
       rw [e,Nat.choose_succ_succ]
       push_cast
       ring
     · have hz : (n-j).choose i=0 := Nat.choose_eq_zero_of_lt (by omega)
       simp [hz]

#print axioms match_coeff0618
end
end MathGKM.Markov
