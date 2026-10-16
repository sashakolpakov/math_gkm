import MarkovBinomialAllM37B
/-! Machine-authored 37bf1d20. Exact unnormalized moments and raw gaps at
all integer indices. Signed seeds and zero weights are permitted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def weightM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) (r : ℕ) : ℝ :=
 P.coeff r*zchooseM37B (n+2) (k+2-r)

def massM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) : ℝ :=
 ∑ r∈P.support, weightM37B P n k r

def firstM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) : ℝ :=
 ∑ r∈P.support, weightM37B P n k r*((k:ℝ)+2-r)

def secondM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) : ℝ :=
 ∑ r∈P.support, weightM37B P n k r*((k:ℝ)+2-r)^2

def momentGapM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) : ℝ :=
 let W := massM37B P n k
 let U := firstM37B P n k
 let V := secondM37B P n k
 U*((n+2)*W-U)-(n+2)*(W*V-U^2)

theorem moment_reconstruct_allM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) :
 let W := massM37B P n k
 let U := firstM37B P n k
 let V := secondM37B P n k
 let D : ℝ := (n+1)*(n+2)
 V-U = D*CoeffSeq ((1+X)^n*P) k ∧
 (n+2)*U-V = D*CoeffSeq ((1+X)^n*P) (k+1) ∧
 (n+2)*(n+1)*W-(2*(n+2)-1)*U+V = D*CoeffSeq ((1+X)^n*P) (k+2) := by
 dsimp only
 have ht (r : ℕ) := zchoose_threeM37B n (k+2-r)
 simp only [Int.cast_sub,Int.cast_add,Int.cast_natCast,Int.cast_ofNat,
   show ∀ r:ℕ, k+2-r-2=k-r by omega,
   show ∀ r:ℕ, k+2-r-1=k+1-r by omega] at ht
 simp only [massM37B,firstM37B,secondM37B,binomial_coeff_allM37B,
   Finset.mul_sum,←Finset.sum_sub_distrib,←Finset.sum_add_distrib]
 constructor
 · apply Finset.sum_congr rfl
   intro r hr
   dsimp [weightM37B]
   linear_combination P.coeff r*(ht r).1
 constructor
 · apply Finset.sum_congr rfl
   intro r hr
   dsimp [weightM37B]
   linear_combination P.coeff r*(ht r).2.1
 · apply Finset.sum_congr rfl
   intro r hr
   dsimp [weightM37B]
   linear_combination P.coeff r*(ht r).2.2

theorem moment_gap_identityM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) :
 ((n+1:ℝ)*(n+2))^2 *
   (CoeffSeq ((1+X)^n*P) (k+1)^2 -
    CoeffSeq ((1+X)^n*P) k*CoeffSeq ((1+X)^n*P) (k+2)) =
 (n+1:ℝ)*momentGapM37B P n k := by
 obtain ⟨hL,hM,hR⟩ := moment_reconstruct_allM37B P n k
 dsimp only at hL hM hR
 have he : ((n+1:ℝ)*(n+2))^2 *
   (CoeffSeq ((1+X)^n*P) (k+1)^2 -
    CoeffSeq ((1+X)^n*P) k*CoeffSeq ((1+X)^n*P) (k+2)) =
 (((n+1:ℝ)*(n+2))*CoeffSeq ((1+X)^n*P) (k+1))^2 -
 (((n+1:ℝ)*(n+2))*CoeffSeq ((1+X)^n*P) k)*
 (((n+1:ℝ)*(n+2))*CoeffSeq ((1+X)^n*P) (k+2)) := by ring
 rw [he,←hL,←hM,←hR]
 dsimp [momentGapM37B]
 ring

theorem moment_lc_iffM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) :
 CoeffSeq ((1+X)^n*P) k*CoeffSeq ((1+X)^n*P) (k+2) ≤
   CoeffSeq ((1+X)^n*P) (k+1)^2 ↔ 0 ≤ momentGapM37B P n k := by
 have h := moment_gap_identityM37B P n k
 have h1 : (0:ℝ)<n+1 := by positivity
 have hD : (0:ℝ)<((n+1:ℝ)*(n+2))^2 := by positivity
 constructor
 · intro hg
   have hh := mul_nonneg (le_of_lt hD) (sub_nonneg.mpr hg)
   rw [h] at hh
   exact (mul_nonneg_iff_of_pos_left h1).mp hh
 · intro hg
   have hh := mul_nonneg (le_of_lt h1) hg
   rw [←h] at hh
   exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hD).mp hh)

theorem integer_moment_lc_iffM37B (P : ℤ[X]) (n k : ℕ) :
 (((1+X)^n*P):ℤ[X]).coeff k * (((1+X)^n*P):ℤ[X]).coeff (k+2) ≤
   (((1+X)^n*P):ℤ[X]).coeff (k+1)^2 ↔
 0 ≤ momentGapM37B (P.map (Int.castRingHom ℝ)) n k := by
 have he : (1+(X:ℝ[X]))^n*P.map (Int.castRingHom ℝ)=
   (((1+X)^n*P):ℤ[X]).map (Int.castRingHom ℝ) := by simp
 have h := moment_lc_iffM37B (P.map (Int.castRingHom ℝ)) n k
 rw [he] at h
 simpa only [CoeffSeq,Int.natCast_nonneg,not_lt.mpr (Int.natCast_nonneg k),
   show ¬((k:ℤ)+2<0) by omega,show ¬((k:ℤ)+1<0) by omega,
   if_false,Int.toNat_natCast,Int.toNat_add,Int.toNat_ofNat,coeff_map,
   Int.castRingHom_apply,←Int.cast_mul,←Int.cast_pow,Int.cast_le] using h

end
end MathGKM.Markov
