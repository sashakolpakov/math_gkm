import MarkovRampPrefixM9F23
/-! Machine-authored 9f234835. Exact ratios for the ramp-weighted binomials.
Every denominator is proved positive before cancellation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem nb_positiveM9F23 (b n : ℕ) : 0 < nbNatM8F7 b n := by
 unfold nbNatM8F7
 exact_mod_cast Nat.choose_pos (by omega : b ≤ n+b)

theorem nb_raiseM9F23 (b n : ℕ) :
 nbNatM8F7 (b+1) n=((n:ℝ)+b+1)/(b+1)*nbNatM8F7 b n := by
 have h := Nat.succ_mul_choose_eq (n+b) b
 have he : ((n:ℝ)+b+1)*nbNatM8F7 b n=nbNatM8F7 (b+1) n*(b+1) := by
   unfold nbNatM8F7
   exact_mod_cast (show (n+b+1)*(n+b).choose b=(n+(b+1)).choose (b+1)*(b+1) by
     simpa [Nat.add_assoc] using h)
 rw [div_mul_eq_mul_div]
 apply (eq_div_iff (by positivity : (b:ℝ)+1≠0)).mpr
 exact he.symm

theorem nb_nextM9F23 (b n : ℕ) :
 nbNatM8F7 b (n+1)=((n:ℝ)+b+1)/(n+1)*nbNatM8F7 b n := by
 have h := Nat.choose_mul_succ_eq (n+b) b
 have he : nbNatM8F7 b n*((n:ℝ)+b+1)=nbNatM8F7 b (n+1)*(n+1) := by
   unfold nbNatM8F7
   exact_mod_cast (show (n+b).choose b*(n+b+1)=(n+1+b).choose b*(n+1) by
     simpa [show n+b+1-b=n+1 by omega,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm] using h)
 rw [div_mul_eq_mul_div]
 apply (eq_div_iff (by positivity : (n:ℝ)+1≠0)).mpr
 nlinarith only [he]

theorem weighted_positiveM9F23 (b r k : ℕ) (hk : k ≤ r) :
 0 < weightedReverseM9F23 b r k := by
 rw [weightedReverseM9F23,if_pos hk]
 apply mul_pos _ (nb_positiveM9F23 _ _)
 unfold weightNatM9F23
 split_ifs with h
 · norm_num
 · have : 0 < k := by omega
   positivity

theorem weighted_nonnegM9F23 (b r k : ℕ) : 0 ≤ weightedReverseM9F23 b r k := by
 by_cases hk : k ≤ r
 · exact (weighted_positiveM9F23 b r k hk).le
 · simp [weightedReverseM9F23,hk]

theorem weighted_initial_ratioM9F23 (b r : ℕ) :
 weightedReverseM9F23 b r 0 / weightedReverseM9F23 (b+1) r 0=
 ((b:ℝ)+1)/(r+b+1) := by
 simp only [weightedReverseM9F23,Nat.zero_le,if_true,weightNatM9F23,Nat.sub_zero,one_mul]
 rw [nb_raiseM9F23]
 have hn := (nb_positiveM9F23 b r).ne'
 field_simp

theorem weighted_first_ratioM9F23 (b n : ℕ) :
 (weightedReverseM9F23 b (n+1) 1-weightedReverseM9F23 b (n+1) 0)/
   weightedReverseM9F23 (b+1) (n+1) 1=
 ((b:ℝ)+1)*(3*((n:ℝ)+1)-b)/(4*(n+1)*(n+b+1)) := by
 simp only [weightedReverseM9F23,Nat.zero_le,Nat.le_add_left,if_true,weightNatM9F23,
   Nat.sub_zero,Nat.add_sub_cancel,Nat.one_ne_zero,if_false,Nat.cast_one,mul_one,one_mul]
 rw [nb_nextM9F23,nb_raiseM9F23]
 have hn := (nb_positiveM9F23 b n).ne'
 field_simp
 <;> ring

theorem weighted_tail_ratioM9F23 (b n k : ℕ) (hk : 1 ≤ k) :
 (weightedReverseM9F23 b (k+n+1) (k+1)-weightedReverseM9F23 b (k+n+1) k)/
   weightedReverseM9F23 (b+1) (k+n+1) (k+1)=
 ((b:ℝ)+1)*((n:ℝ)+1-b*k)/((k+1)*(n+1)*(n+b+1)) := by
 have h1 : k+1 ≤ k+n+1 := by omega
 have h0 : k ≤ k+n+1 := by omega
 simp only [weightedReverseM9F23,if_pos h1,if_pos h0,weightNatM9F23,
   if_neg (show k+1≠0 by omega),if_neg (show k≠0 by omega),
   show k+n+1-(k+1)=n by omega,show k+n+1-k=n+1 by omega]
 rw [nb_nextM9F23,nb_raiseM9F23]
 have hn := (nb_positiveM9F23 b n).ne'
 push_cast
 field_simp
 <;> ring

end
end MathGKM.Markov
