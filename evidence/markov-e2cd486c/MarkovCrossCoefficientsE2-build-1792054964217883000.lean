import MarkovCrossTail53D
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
theorem cross_tail_coeff1E2 (n c r : ℕ) (hn : 4 ≤ n) (hc : c ≠ 2) :
 crossTail153D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+1) := by
 simpa only [crossTail153D,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] using second_run_coeff07F1 n c r (2*n+1) (by omega) (by omega)
theorem cross_tail_coeff2E2 (n c r : ℕ) (hn : 4 ≤ n) (hc : c ≠ 2) :
 crossTail253D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+2) := by
 simpa only [crossTail253D,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] using second_run_coeff07F1 n c r (2*n+2) (by omega) (by omega)
theorem cross_tail_coeff3E2 (n c r : ℕ) (hn : 4 ≤ n) (hc : c ≠ 2) :
 crossTail353D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+3) := by
 have he := extract_three_bands53D n c r (2*n+3) hc (by omega) (by omega)
 have hs := second_series53D n c r (2*n+3) (by omega)
 have hk : 2*n+3-(2*n+3)=0 := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff 0 (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))=1*thirdTailCoeff053D n c r (2*r-c:ℕ) := by
  simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 unfold crossTail353D
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] at hs
 omega
theorem cross_tail_coeff4E2 (n c r : ℕ) (hn : 4 ≤ n) (hc : c ≠ 2) :
 crossTail453D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+4) := by
 have he := extract_three_bands53D n c r (2*n+4) hc (by omega) (by omega)
 have hs := second_series53D n c r (2*n+4) (by omega)
 have hk : 2*n+4-(2*n+3)=1 := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff 1 (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))=6*thirdTailCoeff053D n c r (2*r-c:ℕ)+1*thirdTailCoeff153D n c r (2*r-c:ℕ) := by
  simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 unfold crossTail453D
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] at hs
 omega
theorem cross_tail_coeff5E2 (n c r : ℕ) (hn : 4 ≤ n) (hc : c ≠ 2) :
 crossTail553D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+5) := by
 have he := extract_three_bands53D n c r (2*n+5) hc (by omega) (by omega)
 have hs := second_series53D n c r (2*n+5) (by omega)
 have hk : 2*n+5-(2*n+3)=2 := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff 2 (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))=21*thirdTailCoeff053D n c r (2*r-c:ℕ)+6*thirdTailCoeff153D n c r (2*r-c:ℕ)+1*thirdTailCoeff253D n c r (2*r-c:ℕ) := by
  simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 unfold crossTail553D
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] at hs
 omega
theorem cross_tail_coeff6E2 (n c r : ℕ) (hn : 4 ≤ n) (hc : c ≠ 2) :
 crossTail653D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+6) := by
 have he := extract_three_bands53D n c r (2*n+6) hc (by omega) (by omega)
 have hs := second_series53D n c r (2*n+6) (by omega)
 have hk : 2*n+6-(2*n+3)=3 := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff 3 (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))=56*thirdTailCoeff053D n c r (2*r-c:ℕ)+21*thirdTailCoeff153D n c r (2*r-c:ℕ)+6*thirdTailCoeff253D n c r (2*r-c:ℕ)+1*thirdTailCoeff353D n c r (2*r-c:ℕ) := by
  simp only [thirdTailPoly53D,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 unfold crossTail653D
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] at hs
 omega
end
end MathGKM.Markov
