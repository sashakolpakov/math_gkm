import MarkovPositiveRowsMDAB
import MarkovMinimalRatioMDAB
import MarkovCross774
/-! Machine-authored daba8bcf. Uniform minimal-denominator CrossLC with
the actual residual coefficient bridge, support, and zero extension. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def minCoeffMDAB (j k : ℕ) : ℚ := ((rowHMFFD (2*j+1) j).coeff k:ℚ)

theorem choose_raise_twoMDAB (m b : ℕ) (hb : b ≤ m) :
 ((m+1).choose (b+2):ℚ)*(b+1)*(b+2)=
 (m.choose b:ℚ)*(m-b)*(m+1) := by
 have h0 := choose_lower_step67 m b hb
 have h1 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.add_one_mul_choose_eq m (b+1))
 push_cast at h1
 linear_combination (m+1:ℚ)*h0-(b+1:ℚ)*h1

theorem minCoeff_scaledMDAB (j k : ℕ) (hk : k ≤ j) :
 minCoeffMDAB j k*minDenMDAB k=minWeightMDAB j k*minBaseMDAB j k := by
 have hb : minBaseMDAB j k=
   ((2*k+3).choose k:ℚ)*((j+k+3).choose (2*k+3):ℚ) := by
   have h := diagonalJ_min_coeffMDAB j k
   rw [diagonalJ_coeffMDAB] at h
   simp only [Nat.zero_add] at h
   unfold minBaseMDAB
   exact_mod_cast h
 have hc := choose_raise_twoMDAB (j+k+3) (2*k+3) (by omega)
 push_cast at hc
 unfold minCoeffMDAB
 rw [rowH_min_coeffMDAB,hb]
 push_cast
 unfold minDenMDAB minWeightMDAB
 linear_combination 4*((2*k+3).choose k:ℚ)*hc

theorem minCoeff_stepMDAB (j k : ℕ) (hk : k+1 ≤ j) :
 minCoeffMDAB j (k+1)*minRatioDenMDAB j k=
 minCoeffMDAB j k*minNumerMDAB j k := by
 have h0 := minCoeff_scaledMDAB j k (by omega)
 have h1 := minCoeff_scaledMDAB j (k+1) hk
 have hb := minBase_stepMDAB j k (by omega)
 push_cast at h1
 unfold minRatioDenMDAB minNumerMDAB
 linear_combination (k+1:ℚ)*(k+4)*minWeightMDAB j k*h1-
   (j+k+4:ℚ)*(j-k)*minWeightMDAB j (k+1)*h0+
   minWeightMDAB j k*minWeightMDAB j (k+1)*hb

theorem minCoeff_adjacentMDAB (j k : ℕ) (hk : k+2 ≤ j) :
 minCoeffMDAB j k*minCoeffMDAB j (k+2) ≤ minCoeffMDAB j (k+1)^2 := by
 have hn (s : ℕ) : 0 ≤ minCoeffMDAB j s := by
   unfold minCoeffMDAB
   exact_mod_cast rowH_coeff_nonnegMDAB (2*j+1) j s (by omega)
 have h := ratio_cross67 (minCoeffMDAB j k) (minCoeffMDAB j (k+1))
   (minCoeffMDAB j (k+1)) (minCoeffMDAB j (k+2))
   (minNumerMDAB j k) (minNumerMDAB j (k+1))
   (minRatioDenMDAB j k) (minRatioDenMDAB j (k+1))
   (hn _) (hn _) (min_ratio_den_posMDAB j k (by positivity) (by positivity))
   (min_ratio_den_posMDAB j (k+1) (by positivity) (by positivity))
   (minCoeff_stepMDAB j k (by omega))
   (by simpa only [Nat.cast_add,Nat.cast_one,Nat.add_assoc] using minCoeff_stepMDAB j (k+1) hk)
 have hg := min_ratio_decreasingMDAB (k:ℚ) ((j:ℚ)-k-2) (by positivity)
   (by
     have hq : (k:ℚ)+2 ≤ j := by exact_mod_cast hk
     linarith)
 have he : (k:ℚ)+((j:ℚ)-k-2)+2=j := by ring
 rw [he] at hg
 simpa only [pow_two] using h hg

theorem minimal_row_crossMDAB (j : ℕ) :
 CrossLC (CoeffSeq ((rowHMFFD (2*j+1) j).map (Int.castRingHom ℝ))) := by
 let f := CoeffSeq ((rowHMFFD (2*j+1) j).map (Int.castRingHom ℝ))
 have hz (k : ℤ) (hk : k<0 ∨ (j:ℤ)<k) : f k=0 := by
   dsimp [f,CoeffSeq]
   rcases hk with hk|hk
   · rw [if_pos hk]
   · rw [if_neg (by omega),Polynomial.coeff_map,
       Polynomial.coeff_eq_zero_of_natDegree_lt ((rowH_degreeMFFD (2*j+1) j).trans_lt (by omega))]
     simp
 have hp (k : ℤ) (hk0 : 0 ≤ k) (hkj : k ≤ j) : 0 < f k := by
   dsimp [f,CoeffSeq]
   rw [if_neg (by omega),Polynomial.coeff_map,Int.coe_castRingHom]
   exact_mod_cast rowH_coeff_posMDAB (2*j+1) j k.toNat (by omega) (by omega)
 have hn (k : ℤ) : 0 ≤ f k := by
   by_cases h0 : 0 ≤ k
   · by_cases hj : k ≤ j
     · exact (hp k h0 hj).le
     · rw [hz k (Or.inr (by omega))]
   · rw [hz k (Or.inl (by omega))]
 apply crossLC_of_adjacent_interval774 f hn
 · intro k
   by_cases h0 : k ≤ 0
   · rw [hz (k-1) (Or.inl (by omega)),zero_mul]
     exact sq_nonneg _
   by_cases hj : (j:ℤ) ≤ k
   · rw [hz (k+1) (Or.inr (by omega)),mul_zero]
     exact sq_nonneg _
   have hh := minCoeff_adjacentMDAB j (k-1).toNat (by omega)
   unfold minCoeffMDAB at hh
   have hh' : (rowHMFFD (2*j+1) j).coeff (k-1).toNat*
     (rowHMFFD (2*j+1) j).coeff ((k-1).toNat+2) ≤
       (rowHMFFD (2*j+1) j).coeff ((k-1).toNat+1)^2 := by exact_mod_cast hh
   dsimp [f,CoeffSeq]
   simp only [show ¬k-1<0 by omega,show ¬k<0 by omega,show ¬k+1<0 by omega,
     if_false,Polynomial.coeff_map,Int.coe_castRingHom]
   have h1 : (k-1).toNat+1=k.toNat := by omega
   have h2 : (k-1).toNat+2=(k+1).toNat := by omega
   rw [h1,h2] at hh'
   exact_mod_cast hh'
 · intro i k l hik hkl hi hl
   have hi0 : 0 ≤ i := by
     by_contra h
     rw [hz i (Or.inl (by omega))] at hi
     linarith
   have hlj : l ≤ j := by
     by_contra h
     rw [hz l (Or.inr (by omega))] at hl
     linarith
   exact hp k (by omega) (by omega)

end
end MathGKM.Markov
