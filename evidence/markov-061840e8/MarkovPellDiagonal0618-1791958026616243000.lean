import MarkovPellMatching0618
/-! Machine-authored 061840e8. Every matching diagonal is raw log-concave. -/
namespace MathGKM.Markov
noncomputable section

theorem match_diagonal_interior0618 (i j k : ℕ) :
 coeff (matchPair0618 U V (i+j+k+3)).2 i (j+2)*
 coeff (matchPair0618 U V (i+j+k+3)).2 (i+2) j ≤
 coeff (matchPair0618 U V (i+j+k+3)).2 (i+1) (j+1)^2 := by
 rw [(match_coeff0618 _ _ _).2,(match_coeff0618 _ _ _).2,
   (match_coeff0618 _ _ _).2]
 have e0 : i+j+k+3-(j+2)=i+(k+1) := by omega
 have e1 : i+j+k+3-j=(i+2)+(k+1) := by omega
 have e2 : i+j+k+3-(j+1)=(i+1)+(k+1) := by omega
 have f0 : i+j+k+3-i-1=(j+2)+k := by omega
 have f1 : i+j+k+3-(i+2)-1=j+k := by omega
 have f2 : i+j+k+3-(i+1)-1=(j+1)+k := by omega
 rw [e0,e1,e2,f0,f1,f2,Nat.choose_symm_add,Nat.choose_symm_add,
   Nat.choose_symm_add,Nat.choose_symm_add,Nat.choose_symm_add,Nat.choose_symm_add]
 have h := lc_product6
   ((i+k+1).choose (k+1)) ((i+k+2).choose (k+1)) ((i+k+3).choose (k+1))
   ((j+k+2).choose k) ((j+k+1).choose k) ((j+k).choose k)
   (by positivity) (by positivity) (by positivity)
   (by simpa [Nat.add_assoc] using choose_upper_lc6 (i+k+1) (k+1))
   (by simpa [mul_comm,Nat.add_assoc] using choose_upper_lc6 (j+k) k)
 convert h using 1 <;> congr 4 <;> omega

theorem match_diagonal0618 (n i j : ℕ) :
 coeff (matchPair0618 U V n).2 i (j+2)*
 coeff (matchPair0618 U V n).2 (i+2) j ≤
 coeff (matchPair0618 U V n).2 (i+1) (j+1)^2 := by
 by_cases hn : i+j+3≤n
 · obtain ⟨k,hk⟩ : ∃ k, n=i+j+k+3 := ⟨n-(i+j+3),by omega⟩
   subst n
   exact match_diagonal_interior0618 i j k
 · rw [(match_coeff0618 n i (j+2)).2]
   have hz : (n-i-1).choose (j+2)=0 := Nat.choose_eq_zero_of_lt (by omega)
   rw [hz,Int.natCast_zero,mul_zero,zero_mul]
   exact sq_nonneg _

#print axioms match_diagonal0618
end
end MathGKM.Markov
