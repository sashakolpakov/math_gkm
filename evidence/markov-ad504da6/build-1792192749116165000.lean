import MarkovZeroNormalizedMAD5
import MarkovPolynomialWeightMFEE
/-! Machine-authored ad504da6. A complete centered-cut bridge that retains
all signed zero-factor terms. Pair ordering remains an explicit hypothesis. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 4000000

def pairDenMAD5 (B : ℝ[X]) (p : ℕ × ℕ) : ℝ := B.coeff p.1*B.coeff p.2
def pairGapMAD5 (A B C : ℝ[X]) (p : ℕ × ℕ) : ℝ :=
 2*pairDenMAD5 B p-A.coeff p.1*C.coeff p.2-C.coeff p.1*A.coeff p.2

theorem symmetric_cut_sumMAD5 (A B C : ℝ[X]) (h n : ℕ) :
 (∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then pairGapMAD5 A B C p else 0)=
 2*((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff n := by
 have he : (∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then pairGapMAD5 A B C p else 0)=
   (∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then
     B.coeff p.1*B.coeff p.2-A.coeff p.1*C.coeff p.2 else 0)+
   (∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then
     B.coeff p.1*B.coeff p.2-C.coeff p.1*A.coeff p.2 else 0) := by
   rw [←sum_add_distrib]
   apply sum_congr rfl
   intro p hp
   split_ifs <;> simp only [pairGapMAD5,pairDenMAD5] <;> ring
 rw [he,←cut_gap_coeffMFEE,←cut_gap_coeffMFEE]
 rw [mul_comm (cutPolyMFEE h C) (cutPolyMFEE h A)]
 ring

theorem cut_zeroMAD5 (P : ℝ[X]) : cutPolyMFEE 0 P=P := by
 ext k
 simp [cut_poly_coeffMFEE]

def PairOrderMAD5 (A B C : ℝ[X]) : Prop :=
 ∀ n p ∈ antidiagonal n, ∀ q ∈ antidiagonal n,
 min p.1 p.2 ≤ min q.1 q.2 →
 pairGapMAD5 A B C p*pairDenMAD5 B q ≤ pairGapMAD5 A B C q*pairDenMAD5 B p

theorem symmetric_cut_nonnegMAD5 (A B C : ℝ[X])
 (hA : ∀ k, 0 ≤ A.coeff k) (hB : ∀ k, 0 ≤ B.coeff k)
 (hC : ∀ k, 0 ≤ C.coeff k) (hgap : ∀ n, 0 ≤ (B^2-A*C).coeff n)
 (horder : PairOrderMAD5 A B C) (h n : ℕ) :
 0 ≤ ((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff n := by
 have hb : ∀ p ∈ antidiagonal n, 0 ≤ pairDenMAD5 B p := by
   intro p hp
   exact mul_nonneg (hB _) (hB _)
 have hz : ∀ p ∈ antidiagonal n, pairDenMAD5 B p=0 → pairGapMAD5 A B C p ≤ 0 := by
   intro p hp he
   unfold pairGapMAD5
   rw [he]
   have h1 := mul_nonneg (hA p.1) (hC p.2)
   have h2 := mul_nonneg (hC p.1) (hA p.2)
   linarith
 have ht : 0 ≤ ∑ p ∈ antidiagonal n, pairGapMAD5 A B C p := by
   have hs := symmetric_cut_sumMAD5 A B C 0 n
   simp only [Nat.zero_le,ite_true,cut_zeroMAD5] at hs
   rw [hs]
   exact mul_nonneg (by norm_num) (hgap n)
 have hc := normalized_rank_zeroMAD5 (antidiagonal n) (fun p => min p.1 p.2)
   (pairGapMAD5 A B C) (pairDenMAD5 B) hb hz ht (horder n) h
 rw [symmetric_cut_sumMAD5] at hc
 linarith

end
end MathGKM.Markov
