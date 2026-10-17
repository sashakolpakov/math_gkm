import MarkovPolynomialCertificateMBEC
/-! Machine-authored 1c65a306. Universal parameter certificate at fixed deficiency 4.
The symbolic identity is checked by ring; finite input data supplies no axiom. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 8000

def core4M1C6 {R : Type*} [CommRing R] (u v : R) : R :=
  28327936 +
  15100928*v +
  2677760*v^2 +
  157696*v^3 +
  40686592*u +
  18197504*u*v +
  2615296*u*v^2 +
  118784*u*v^3 +
  20564992*u^2 +
  7201024*u^2*v +
  749312*u^2*v^2 +
  20992*u^2*v^3 +
  4743424*u^3 +
  1142272*u^3*v +
  62976*u^3*v^2 +
  511744*u^4 +
  62976*u^4*v +
  20992*u^5

def factored4M1C6 {R : Type*} [CommRing R] (u v : R) : R :=
  (u+2)*(u+3)*(u+3)*(u+4)*(u+4)*(u+v+5)*(u+v+6)*(u+v+6)*(u+v+7)*core4M1C6 u v

theorem certificate_4_factorM1C6 :
 certificateGapMBEC 4 = factored4M1C6 U V := by
 unfold certificateGapMBEC certificateConvMBEC certificateKernelMBEC
 norm_num only [sum_range_succ,prod_range_succ,sum_range_zero,prod_range_zero,
   Nat.reduceAdd,Nat.reduceSub,integerWeightMBEC,ite_true,ite_false,Nat.cast_zero,
   Int.reduceMul,Int.cast_ofNat,Int.cast_one,Int.cast_zero,zero_mul,mul_zero,zero_add,
   mul_one,one_mul]
 norm_num only [show (1:ℕ)≠0 by omega,show (2:ℕ)≠0 by omega,
   show (3:ℕ)≠0 by omega,show (4:ℕ)≠0 by omega,show (5:ℕ)≠0 by omega,ite_false]
 unfold factored4M1C6 core4M1C6
 norm_num
 <;> ring

theorem certificate_4_evalM1C6 (k s : ℕ) :
 clearedGapMBEC (4+k) s 4=factored4M1C6 (k:ℤ) (s:ℤ) := by
 rw [←certificate_gap_evalMBEC,certificate_4_factorM1C6]
 simp [factored4M1C6,core4M1C6,map_mul,map_add,map_pow,
   certificate_eval_uMBEC,certificate_eval_vMBEC]

theorem certificate_4_positiveM1C6 (k s : ℕ) :
 0 < clearedGapMBEC (4+k) s 4 := by
 rw [certificate_4_evalM1C6]
 unfold factored4M1C6 core4M1C6
 positivity

theorem reverse_4M1C6 (j s : ℕ) (hj : 4 ≤ j) :
 reverseConvMBEC j (s+1) (s+1) 4*reverseConvMBEC j s (s+2) 3 ≤
 reverseConvMBEC j (s+1) (s+1) 3*reverseConvMBEC j s (s+2) 4 := by
 obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
 exact (cleared_gap_iffMBEC (4+k) s 4 (by omega)).mp
   (certificate_4_positiveM1C6 k s).le

end
end MathGKM.Markov
