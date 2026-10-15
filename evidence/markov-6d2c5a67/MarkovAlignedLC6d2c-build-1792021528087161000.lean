import MarkovAlignedCount6d2c
/-! Machine-authored 6d2c5a67. Universal LC of the exact aligned count
layers on R^n L. This concerns constant coefficients only. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem linear_binomial_cross6d (r n : ℕ) (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B) :
 CrossLC (CoeffSeq (X^r*((1+X)^n*(C A+C B*X)))) := by
 have h := crossLC_pascal (crossLC_quad hA hB (show (0:ℝ) ≤ 0 by norm_num)
   (show A*0 ≤ B^2 by nlinarith)) n
 rw [←coeffSeq_quadratic,←coeffSeq_binomial_mul] at h
 simp only [Quadratic,map_zero,zero_mul,add_zero] at h
 induction r with
 | zero => simpa using h
 | succ r ih =>
   simpa [pow_succ',mul_assoc] using crossLC_X_mul ih

theorem linear_binomial_integer_lc6d (r n s : ℕ) (A B : ℤ)
 (hA : 0 ≤ A) (hB : 0 ≤ B) :
 let p : ℤ[X] := X^r*((1+X)^n*(C A+C B*X))
 p.coeff s*p.coeff (s+2) ≤ p.coeff (s+1)^2 := by
 have h := crossLC_adjacent (linear_binomial_cross6d r n (A:ℝ) (B:ℝ)
   (by exact_mod_cast hA) (by exact_mod_cast hB)) (s+1)
 have hi : (s:ℤ)+1-1=s := by omega
 have hj : (s:ℤ)+1+1=(s+2:ℕ) := by omega
 rw [hi,hj] at h
 simp only [CoeffSeq,Int.natCast_nonneg,not_lt.mpr,if_false,Int.toNat_natCast] at h
 have hc (k : ℕ) :
   ((X^r*((1+X)^n*(C A+C B*X)):ℤ[X]).coeff k:ℝ)=
   (X^r*((1+X)^n*(C (A:ℝ)+C (B:ℝ)*X)):ℝ[X]).coeff k := by
   have hh : Polynomial.map (Int.castRingHom ℝ)
      (X^r*((1+X)^n*(C A+C B*X)):ℤ[X]) =
      (X^r*((1+X)^n*(C (A:ℝ)+C (B:ℝ)*X)):ℝ[X]) := by simp
   simpa only [Polynomial.coeff_map,Int.castRingHom_apply] using
     congrArg (fun p : ℝ[X] => p.coeff k) hh
 dsimp only
 have hh :
   (((X^r*((1+X)^n*(C A+C B*X)):ℤ[X]).coeff s:ℝ) *
   ((X^r*((1+X)^n*(C A+C B*X)):ℤ[X]).coeff (s+2):ℝ)) ≤
   (((X^r*((1+X)^n*(C A+C B*X)):ℤ[X]).coeff (s+1):ℝ))^2 := by
     rw [hc,hc,hc]
     simpa [CoeffSeq,show ¬(s:ℤ)+1<0 by omega] using h
 exact_mod_cast hh

theorem singleAAligned_lc6d (n e s : ℕ) (hn : 1 ≤ n) :
 (singleAAligned6d n (n+1) e).coeff s*
 (singleAAligned6d n (n+1) e).coeff (s+2) ≤
 (singleAAligned6d n (n+1) e).coeff (s+1)^2 := by
 by_cases he : e=0
 · subst e
   rw [singleAAligned_zero6d n hn]
   have h := linear_binomial_integer_lc6d 0 0 s 1 1 (by norm_num) (by norm_num)
   simpa using h
 by_cases hen : e<n
 · rw [singleAAligned_below6d n e (by omega) hen]
   simpa [mul_assoc] using linear_binomial_integer_lc6d 1 (e-1) s 2 (e+1)
     (by norm_num) (by positivity)
 by_cases heq : e=n
 · subst e
   rw [singleAAligned_at6d n hn]
   simpa [mul_assoc] using linear_binomial_integer_lc6d 1 (n-1) s 3 (n+2)
     (by norm_num) (by positivity)
 · rw [singleAAligned_above6d n e (by omega)]
   have h := linear_binomial_integer_lc6d 2 (e-1) s ((2*n+2-e:ℕ):ℤ) 0
     (by positivity) (by norm_num)
   simpa [mul_assoc,mul_comm,mul_left_comm] using h

theorem source_aligned_constant_lc6d (n e s : ℕ) (hn : 1 ≤ n) :
 let w := central28 (oneAPath68 n)++[true]
 (degreeLayer07a7 (X:ℤ[X]) w s (s+e)).coeff 0*
 (degreeLayer07a7 (X:ℤ[X]) w (s+2) (s+2+e)).coeff 0 ≤
 (degreeLayer07a7 (X:ℤ[X]) w (s+1) (s+1+e)).coeff 0^2 := by
 dsimp only
 rw [source_aligned_count6d,source_aligned_count6d,source_aligned_count6d]
 exact singleAAligned_lc6d n e s hn

#print axioms singleAAligned_lc6d
#print axioms source_aligned_constant_lc6d
end
end MathGKM.Markov
