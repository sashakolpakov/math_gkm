import MarkovPellExcess00b3
import MarkovPellLowerFormula26ca
/-! Machine-authored 3979f3c7. Literal source triples and a uniform obstruction
to summing their inequalities across different source polynomials. Not a root refutation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def bottom3979 (n j : ℕ) : ℚ :=
 (coeff (frame (List.replicate (n+1) true)).mid.p (n+2) j : ℚ)

theorem bottom_zero3979 (n : ℕ) : bottom3979 n 0=1 := by
 unfold bottom3979
 rw [right_bottom00b3 (n+1) (n+2) 0 (by omega)]
 norm_num

theorem bottom_one3979 (n : ℕ) : bottom3979 n 1=3*n+5 := by
 unfold bottom3979
 rw [right_lower_unbounded00b3 (n+1) (n+2) 1 0 (by omega)]
 norm_num [lowerCoeff00b3,lowerTerm00b3,Finset.sum_range_succ,Nat.choose_one_right]
 push_cast
 ring

theorem bottom_two3979 (n : ℕ) :
 bottom3979 n 2=17/2*(n:ℚ)^2+23/2*n+6 := by
 unfold bottom3979
 rw [right_lower_unbounded00b3 (n+1) (n+2) 2 1 (by omega)]
 norm_num [lowerCoeff00b3,lowerTerm00b3,Finset.sum_range_succ]
 push_cast
 simp only [choose_two_rat26ca]
 push_cast
 ring

theorem bottom_polygon3979 (n : ℕ) :
 InPolygon (n+2) (n+3) (n+2) 0 ∧
 InPolygon (n+2) (n+3) (n+2) 1 ∧
 InPolygon (n+2) (n+3) (n+2) 2 := by
 unfold InPolygon
 constructor
 · constructor <;> nlinarith
 constructor
 · constructor <;> nlinarith
 · constructor <;> nlinarith

theorem bottom_gap3979 (n : ℕ) :
 2*(bottom3979 n 1^2-bottom3979 n 0*bottom3979 n 2)=
 (n:ℚ)^2+37*n+38 := by
 rw [bottom_zero3979,bottom_one3979,bottom_two3979]
 ring

theorem bottom_raw_vertical3979 (n : ℕ) :
 coeff (frame (List.replicate (n+1) true)).mid.p (n+2) 0 *
 coeff (frame (List.replicate (n+1) true)).mid.p (n+2) 2 ≤
 coeff (frame (List.replicate (n+1) true)).mid.p (n+2) 1^2 := by
 have h := bottom_gap3979 n
 have hn : (0:ℚ) ≤ n := Nat.cast_nonneg n
 have hc : bottom3979 n 0*bottom3979 n 2 ≤ bottom3979 n 1^2 := by nlinarith [sq_nonneg (n:ℚ)]
 exact_mod_cast hc

def bottomSum3979 (N j : ℕ) : ℚ := ∑ n ∈ Finset.range N, bottom3979 n j

theorem bottom_sum_zero3979 (N : ℕ) : bottomSum3979 N 0=N := by
 simp [bottomSum3979,bottom_zero3979]

theorem bottom_sum_one3979 (N : ℕ) :
 bottomSum3979 N 1=(3*(N:ℚ)^2+7*N)/2 := by
 induction N with
 | zero => simp [bottomSum3979]
 | succ N ih =>
   rw [bottomSum3979,Finset.sum_range_succ]
   change bottomSum3979 N 1+bottom3979 N 1=_
   rw [ih,bottom_one3979]
   push_cast
   ring

theorem bottom_sum_two3979 (N : ℕ) :
 bottomSum3979 N 2=(17*(N:ℚ)^3+9*(N:ℚ)^2+10*N)/6 := by
 induction N with
 | zero => simp [bottomSum3979]
 | succ N ih =>
   rw [bottomSum3979,Finset.sum_range_succ]
   change bottomSum3979 N 2+bottom3979 N 2=_
   rw [ih,bottom_two3979]
   push_cast
   ring

theorem bottom_sum_gap3979 (N : ℕ) :
 12*(bottomSum3979 N 0*bottomSum3979 N 2-bottomSum3979 N 1^2)=
 (N:ℚ)^2*(7*(N:ℚ)^2-108*N-127) := by
 rw [bottom_sum_zero3979,bottom_sum_one3979,bottom_sum_two3979]
 ring

/-- Every summand is a valid source triple satisfying raw LC. Their equal-weight
sum fails LC for every N>=17; sums across sources are not a source polynomial. -/
theorem bottom_sum_failure3979 (N : ℕ) (hN : 17 ≤ N) :
 bottomSum3979 N 1^2 < bottomSum3979 N 0*bottomSum3979 N 2 := by
 have hn : (17:ℚ) ≤ N := by exact_mod_cast hN
 have hp : 0 < 7*(N:ℚ)^2-108*N-127 := by
   nlinarith [sq_nonneg ((N:ℚ)-17)]
 have hsq : 0 < (N:ℚ)^2 := by positivity
 have hmul := mul_pos hsq hp
 have hg := bottom_sum_gap3979 N
 nlinarith

#print axioms bottom_raw_vertical3979
#print axioms bottom_polygon3979
#print axioms bottom_sum_failure3979
end
end MathGKM.Markov
