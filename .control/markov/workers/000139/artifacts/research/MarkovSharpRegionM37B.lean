import MarkovMomentSupportM37B
/-! Machine-authored 37bf1d20. Discriminant criterion for raw binomial
mixtures. Index subtraction below is real subtraction, not natural truncation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def SharpRegionM37B (n : ℕ) (k : ℤ) (lo hi : ℕ) : Prop :=
 (n+2:ℝ)*((k:ℝ)*2-hi-lo+3)^2 ≤
   4*(n+1)*((k:ℝ)-hi+2)*((k:ℝ)-lo+2)

theorem binomial_sharp_lcM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) (lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0) (h : SharpRegionM37B n k lo hi) :
 CoeffSeq ((1+X)^n*P) k*CoeffSeq ((1+X)^n*P) (k+2) ≤
 CoeffSeq ((1+X)^n*P) (k+1)^2 := by
 apply binomial_lc_supportM37B P n k ((k:ℝ)-hi+2) ((k:ℝ)-lo+2) hpos
 · intro r hr _
   have hn : P.coeff r≠0 := mem_support_iff.mp hr
   have hu : r≤hi := le_trans (le_natDegree_of_ne_zero hn) hP
   have hl : lo≤r := by by_contra h; exact hn (hlow r (by omega))
   have hu' : (r:ℝ)≤hi := by exact_mod_cast hu
   have hl' : (lo:ℝ)≤r := by exact_mod_cast hl
   constructor <;> linarith
 · convert h using 1 <;> dsimp [SharpRegionM37B] at * <;> ring

theorem integer_binomial_sharp_lcM37B (P : ℤ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0) (h : SharpRegionM37B n k lo hi) :
 (((1+X)^n*P):ℤ[X]).coeff k * (((1+X)^n*P):ℤ[X]).coeff (k+2) ≤
 (((1+X)^n*P):ℤ[X]).coeff (k+1)^2 := by
 apply (integer_moment_lc_iffM37B P n k).mpr
 apply (moment_lc_iffM37B (P.map (Int.castRingHom ℝ)) n k).mp
 exact binomial_sharp_lcM37B (P.map (Int.castRingHom ℝ)) n k lo hi
   (le_trans Polynomial.natDegree_map_le hP)
   (fun r => by simpa using hpos r) (fun r hr => by simp [hlow r hr]) h

end
end MathGKM.Markov
