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
 · constructor
   · nlinarith
   · omega
 constructor
 · constructor
   · nlinarith
   · omega
 · constructor
   · nlinarith
   · omega

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
 unfold bottom3979 at hc
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

theorem bottom_sum_lc_iff3979 (N : ℕ) :
 bottomSum3979 N 0*bottomSum3979 N 2 ≤ bottomSum3979 N 1^2 ↔ N ≤ 16 := by
 constructor
 · intro h
   by_contra hn
   exact (not_lt_of_ge h) (bottom_sum_failure3979 N (by omega))
 · intro hn
   have h0 : (0:ℚ) ≤ N := Nat.cast_nonneg N
   have h16 : (N:ℚ) ≤ 16 := by exact_mod_cast hn
   have hprod := mul_nonneg h0 (sub_nonneg.mpr h16)
   have hq : 7*(N:ℚ)^2-108*N-127 ≤ 0 := by nlinarith
   have hmul := mul_nonpos_of_nonneg_of_nonpos (sq_nonneg (N:ℚ)) hq
   have hg := bottom_sum_gap3979 N
   nlinarith

theorem right_bottom_vertical3979 (n : ℕ) :
 coeff (frame (List.replicate n true)).mid.p (n+1) 0 *
 coeff (frame (List.replicate n true)).mid.p (n+1) 2 ≤
 coeff (frame (List.replicate n true)).mid.p (n+1) 1^2 := by
 cases n with
 | zero =>
   simp only [right_coeff_sum9a72]
   norm_num [pellSum9a72,Finset.sum_range_succ,Nat.choose]
 | succ n => exact bottom_raw_vertical3979 n

theorem excess_vertical_zero3979 (n i j : ℕ) (hij : i+j=n+1) :
 excessCoeff00b3 0 i j*excessCoeff00b3 2 i (j+2) ≤
 excessCoeff00b3 1 i (j+1)^2 := by
 by_cases hj : j=0
 · subst j
   have hi : i=n+1 := by omega
   subst i
   have h := right_bottom_vertical3979 n
   rwa [right_excess_coeff00b3 n (n+1) 0 0 (by omega),
     right_excess_coeff00b3 n (n+1) 2 2 (by omega),
     right_excess_coeff00b3 n (n+1) 1 1 (by omega)] at h
 · rw [excess_zero00b3,if_neg hj,zero_mul]
   exact sq_nonneg _

#print axioms bottom_raw_vertical3979
#print axioms bottom_polygon3979
#print axioms bottom_sum_failure3979
#print axioms bottom_sum_lc_iff3979
#print axioms excess_vertical_zero3979
end
end MathGKM.Markov
