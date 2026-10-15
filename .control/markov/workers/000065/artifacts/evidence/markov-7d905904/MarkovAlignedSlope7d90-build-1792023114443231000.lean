import MarkovAlignedCount6d2c
/-! Machine-authored 7d905904. An infinite actual-source obstruction to
the slanted (cut,degree) refinement. This is not a raw root reversal. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem aligned_top_below7d (n e : ℕ) (he : 1≤e) (hen : e<n) :
 (singleAAligned6d n (n+1) e).coeff (e+1)=(e+1:ℤ) := by
 rw [singleAAligned_below6d n e he hen]
 have hp : (X*(1+X)^(e-1)*(C 2+C (e+1:ℤ)*X):ℤ[X])=
     C 2*(X^1*(1+X)^(e-1))+C (e+1:ℤ)*(X^2*(1+X)^(e-1)) := by ring
 rw [hp]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow_mul']
 rw [if_pos (by omega),if_pos (by omega)]
 simp [Polynomial.coeff_one_add_X_pow,show e+1-2=e-1 by omega,
   Nat.choose_eq_zero_of_lt (show e-1<e by omega)]

theorem aligned_top_at7d (n : ℕ) (hn : 1≤n) :
 (singleAAligned6d n (n+1) n).coeff (n+1)=(n+2:ℤ) := by
 rw [singleAAligned_at6d n hn]
 have hp : (X*(1+X)^(n-1)*(C 3+C (n+2:ℤ)*X):ℤ[X])=
     C 3*(X^1*(1+X)^(n-1))+C (n+2:ℤ)*(X^2*(1+X)^(n-1)) := by ring
 rw [hp]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow_mul']
 rw [if_pos (by omega),if_pos (by omega)]
 simp [Polynomial.coeff_one_add_X_pow,show n+1-2=n-1 by omega,
   Nat.choose_eq_zero_of_lt (show n-1<n by omega)]

theorem source_slanted_count_gap7d (n : ℕ) (hn : 3≤n) :
 let w := central28 (oneAPath68 n)++[true]
 let a := (degreeLayer07a7 (X:ℤ[X]) w (n-1) ((n-1)+(n-2))).coeff 0
 let b := (degreeLayer07a7 (X:ℤ[X]) w n (n+(n-1))).coeff 0
 let c := (degreeLayer07a7 (X:ℤ[X]) w (n+1) ((n+1)+n)).coeff 0
 b^2-a*c=2-(n:ℤ) ∧ b^2<a*c := by
 dsimp only
 rw [source_aligned_count6d,source_aligned_count6d,source_aligned_count6d]
 have h1 := aligned_top_below7d n (n-2) (by omega) (by omega)
 have h2 := aligned_top_below7d n (n-1) (by omega) (by omega)
 have h3 := aligned_top_at7d n (by omega)
 rw [show n-2+1=n-1 by omega] at h1
 rw [show n-1+1=n by omega] at h2
 rw [h1,h2,h3]
 push_cast [Nat.cast_sub (show 2≤n by omega),Nat.cast_sub (show 1≤n by omega)]
 constructor
 · ring
 · have hn' : (3:ℤ)≤n := by exact_mod_cast hn
   nlinarith

#print axioms source_slanted_count_gap7d

theorem source_slanted_raw7d (n : ℕ) (hn : 3≤n) :
 let m := (frame (oneAPath68 n)).mid
 InPolygon m.a m.b (3*n) 0 ∧ InPolygon m.a m.b (3*n+1) 0 ∧
 InPolygon m.a m.b (3*n+2) 0 ∧
 coeff m.p (3*n) 0*coeff m.p (3*n+2) 0≤coeff m.p (3*n+1) 0^2 := by
 dsimp only
 obtain ⟨ha,hb⟩ := oneA_labels68 n
 have hp (t : ℕ) (ht : t≤2) :
     InPolygon (2*n+1) (2*n+3) (3*n+t) 0 := by
   constructor
   · simp only [mul_zero,add_zero]
     simpa [Nat.mul_comm] using
       Nat.mul_le_mul_left (2*n+3) (show 2*n+1≤3*n+t by omega)
   · omega
 refine ⟨?_,?_,?_,?_⟩
 · rw [ha,hb]; simpa using hp 0 (by omega)
 · rw [ha,hb]; exact hp 1 (by omega)
 · rw [ha,hb]; exact hp 2 (by omega)
 · exact boundary_raw_logConcave (oneAPath68 n) (3*n)

#print axioms source_slanted_raw7d
end
end MathGKM.Markov
