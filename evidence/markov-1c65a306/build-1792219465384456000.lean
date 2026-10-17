import MarkovPolynomialCertificateMBEC
/-! Machine-authored 1c65a306. Universal parameter certificate at fixed deficiency 5.
The symbolic identity is checked by ring; finite input data supplies no axiom. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 8000

def core5M1C6 {R : Type*} [CommRing R] (u v : R) : R :=
  12367872000 +
  8412948480*v +
  2131084800*v^2 +
  238018560*v^3 +
  9884160*v^4 +
  26610370560*u +
  16223809536*u*v +
  3647159040*u*v^2 +
  357292032*u*v^3 +
  12824832*u*v^4 +
  23902480896*u^2 +
  12831493632*u^2*v +
  2499497472*u^2*v^2 +
  207725568*u^2*v^3 +
  6139392*u^2*v^4 +
  11698950912*u^3 +
  5379010560*u^3*v +
  873284352*u^3*v^2 +
  58066944*u^3*v^3 +
  1281792*u^3*v^4 +
  3418613760*u^4 +
  1290843648*u^4*v +
  163636224*u^4*v^2 +
  7756800*u^4*v^3 +
  98304*u^4*v^4 +
  612460032*u^5 +
  177629184*u^5*v +
  15579648*u^5*v^2 +
  393216*u^5*v^3 +
  65920512*u^6 +
  13016064*u^6*v +
  589824*u^6*v^2 +
  3911424*u^7 +
  393216*u^7*v +
  98304*u^8

def factored5M1C6 {R : Type*} [CommRing R] (u v : R) : R :=
  (u+3)*(u+4)*(u+4)*(u+5)*(u+5)*(u+v+5)*(u+v+6)*(u+v+6)*(u+v+7)*(u+v+7)*core5M1C6 u v

theorem certificate_5_factorM1C6 :
 certificateGapMBEC 5 = factored5M1C6 U V := by
 unfold certificateGapMBEC certificateConvMBEC certificateKernelMBEC
 norm_num only [sum_range_succ,prod_range_succ,sum_range_zero,prod_range_zero,
   Nat.reduceAdd,Nat.reduceSub,integerWeightMBEC,ite_true,ite_false,Nat.cast_zero,
   Int.reduceMul,Int.cast_ofNat,Int.cast_one,Int.cast_zero,zero_mul,mul_zero,zero_add,
   mul_one,one_mul]
 norm_num only [show (1:ℕ)≠0 by omega,show (2:ℕ)≠0 by omega,
   show (3:ℕ)≠0 by omega,show (4:ℕ)≠0 by omega,show (5:ℕ)≠0 by omega,ite_false]
 unfold factored5M1C6 core5M1C6
 norm_num
 <;> ring

theorem certificate_5_evalM1C6 (k s : ℕ) :
 clearedGapMBEC (5+k) s 5=factored5M1C6 (k:ℤ) (s:ℤ) := by
 rw [←certificate_gap_evalMBEC,certificate_5_factorM1C6]
 simp [factored5M1C6,core5M1C6,map_mul,map_add,map_pow,
   certificate_eval_uMBEC,certificate_eval_vMBEC]

theorem certificate_5_positiveM1C6 (k s : ℕ) :
 0 < clearedGapMBEC (5+k) s 5 := by
 rw [certificate_5_evalM1C6]
 unfold factored5M1C6 core5M1C6
 positivity

theorem reverse_5M1C6 (j s : ℕ) (hj : 5 ≤ j) :
 reverseConvMBEC j (s+1) (s+1) 5*reverseConvMBEC j s (s+2) 4 ≤
 reverseConvMBEC j (s+1) (s+1) 4*reverseConvMBEC j s (s+2) 5 := by
 obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
 exact (cleared_gap_iffMBEC (5+k) s 5 (by omega)).mp
   (certificate_5_positiveM1C6 k s).le

end
end MathGKM.Markov
