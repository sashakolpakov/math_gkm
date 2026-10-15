import MarkovTailCoefficients53D
import MarkovFirstCoefficients07F1
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
def crossTail153D (n c r q : ℤ) : ℤ :=
 secondShape07F1 n c r (2*n+1)
def crossTail253D (n c r q : ℤ) : ℤ :=
 secondShape07F1 n c r (2*n+2)
def crossTail353D (n c r q : ℤ) : ℤ :=
 secondShape07F1 n c r (2*n+3)+15*thirdTailCoeff053D n c r q
def crossTail453D (n c r q : ℤ) : ℤ :=
 secondShape07F1 n c r (2*n+4)+90*thirdTailCoeff053D n c r q+15*thirdTailCoeff153D n c r q
def crossTail553D (n c r q : ℤ) : ℤ :=
 secondShape07F1 n c r (2*n+5)+315*thirdTailCoeff053D n c r q+90*thirdTailCoeff153D n c r q+15*thirdTailCoeff253D n c r q
def crossTail653D (n c r q : ℤ) : ℤ :=
 secondShape07F1 n c r (2*n+6)+840*thirdTailCoeff053D n c r q+315*thirdTailCoeff153D n c r q+90*thirdTailCoeff253D n c r q+15*thirdTailCoeff353D n c r q
theorem second_series53D (n c r j : ℕ) (hj : n+4 ≤ j) :
 secondShape07F1 n c r j=
 15*(PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))) := by
 have hl := extract_lowFDDA (n:ℤ) c r j (by omega)
 have ht := extract_tail07F1 (n:ℤ) c r (j-(n+2)) (by omega)
 have hf := second_shape_falling07F1 (n:ℤ) c r j
 have hk : ((j-(n+2):ℕ):ℤ)=(j:ℤ)-n-2 := by omega
 rw [hk] at ht
 have heq : (j:ℤ)-n-2+5=(j:ℤ)-n+3 := by ring
 rw [heq] at ht
 omega
theorem cross_tail_coeff153D (n c r : ℕ) (hn : 5 ≤ n) (hc : c ≠ 2) :
 crossTail153D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+1) := by
 simpa only [crossTail153D,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] using second_run_coeff07F1 n c r (2*n+1) (by omega) (by omega)
theorem cross_tail_coeff253D (n c r : ℕ) (hn : 5 ≤ n) (hc : c ≠ 2) :
 crossTail253D n c r (2*r-c:ℕ)=15*(thirdRunPolyADB2 n c r).coeff (2*n+2) := by
 simpa only [crossTail253D,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] using second_run_coeff07F1 n c r (2*n+2) (by omega) (by omega)
theorem cross_tail_coeff353D (n c r : ℕ) (hn : 5 ≤ n) (hc : c ≠ 2) :
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
theorem cross_tail_coeff453D (n c r : ℕ) (hn : 5 ≤ n) (hc : c ≠ 2) :
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
theorem cross_tail_coeff553D (n c r : ℕ) (hn : 5 ≤ n) (hc : c ≠ 2) :
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
theorem cross_tail_coeff653D (n c r : ℕ) (hn : 5 ≤ n) (hc : c ≠ 2) :
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
