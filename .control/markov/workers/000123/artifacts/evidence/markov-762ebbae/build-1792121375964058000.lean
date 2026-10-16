import MarkovThirdSmallBridge52MAE2
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird52c0_2M762 (q : ℤ) : ℤ := 24
def sThird52c0_3M762 (q : ℤ) : ℤ := 336
def sThird52c0_4M762 (q : ℤ) : ℤ := 408
def sThird52c0_5M762 (q : ℤ) : ℤ := 192
def sThird52c1_3M762 (q : ℤ) : ℤ := -576-192*q
def sThird52c1_4M762 (q : ℤ) : ℤ := -3192-216*q
def sThird52c1_5M762 (q : ℤ) : ℤ := -3984+72*q
def sThird52c1_6M762 (q : ℤ) : ℤ := -888+312*q
def sThird52c1_7M762 (q : ℤ) : ℤ := 24*q
def sThird52c2_3M762 (q : ℤ) : ℤ := 288+504*q+216*q^2
def sThird52c2_4M762 (q : ℤ) : ℤ := 3672+2916*q+324*q^2
def sThird52c2_5M762 (q : ℤ) : ℤ := 9552+2160*q-432*q^2
def sThird52c2_6M762 (q : ℤ) : ℤ := 6048-3240*q-648*q^2
def sThird52c2_7M762 (q : ℤ) : ℤ := -432-2664*q+216*q^2
def sThird52c2_8M762 (q : ℤ) : ℤ := 72+324*q+324*q^2
def sThird52c3_3M762 (q : ℤ) : ℤ := -60-235*q-300*q^2-125*q^3
def sThird52c3_4M762 (q : ℤ) : ℤ := -1200-2500*q-1425*q^2-125*q^3
def sThird52c3_5M762 (q : ℤ) : ℤ := -4980-4785*q-150*q^2+375*q^3
def sThird52c3_6M762 (q : ℤ) : ℤ := -5640+1530*q+3225*q^2+375*q^3
def sThird52c3_7M762 (q : ℤ) : ℤ := -132+6435*q+1200*q^2-375*q^3
def sThird52c3_8M762 (q : ℤ) : ℤ := 960+600*q-2175*q^2-375*q^3
def sThird52c3_9M762 (q : ℤ) : ℤ := -588-1415*q-750*q^2+125*q^3
def sThird52c3_10M762 (q : ℤ) : ℤ := 120+370*q+375*q^2+125*q^3
def sThird52EM762 (q j : ℤ) : ℤ :=
 sThird52c0_2M762 q*vFallM115 (j-0*q) 2+
 sThird52c0_3M762 q*vFallM115 (j-0*q) 3+
 sThird52c0_4M762 q*vFallM115 (j-0*q) 4+
 sThird52c0_5M762 q*vFallM115 (j-0*q) 5+
 sThird52c1_3M762 q*vFallM115 (j-1*q) 3+
 sThird52c1_4M762 q*vFallM115 (j-1*q) 4+
 sThird52c1_5M762 q*vFallM115 (j-1*q) 5+
 sThird52c1_6M762 q*vFallM115 (j-1*q) 6+
 sThird52c1_7M762 q*vFallM115 (j-1*q) 7+
 sThird52c2_3M762 q*vFallM115 (j-2*q) 3+
 sThird52c2_4M762 q*vFallM115 (j-2*q) 4+
 sThird52c2_5M762 q*vFallM115 (j-2*q) 5+
 sThird52c2_6M762 q*vFallM115 (j-2*q) 6+
 sThird52c2_7M762 q*vFallM115 (j-2*q) 7+
 sThird52c2_8M762 q*vFallM115 (j-2*q) 8+
 sThird52c3_3M762 q*vFallM115 (j-3*q) 3+
 sThird52c3_4M762 q*vFallM115 (j-3*q) 4+
 sThird52c3_5M762 q*vFallM115 (j-3*q) 5+
 sThird52c3_6M762 q*vFallM115 (j-3*q) 6+
 sThird52c3_7M762 q*vFallM115 (j-3*q) 7+
 sThird52c3_8M762 q*vFallM115 (j-3*q) 8+
 sThird52c3_9M762 q*vFallM115 (j-3*q) 9+
 sThird52c3_10M762 q*vFallM115 (j-3*q) 10

theorem sThird52coeffM762 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird52J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird52J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird52J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird52J3MAE2 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird52EM762 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird52J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird52J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird52J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird52J3MAE2 (q:ℤ[X]) X)=C (sThird52c0_2M762 q)*X^(m+0*q+2) +
 C (sThird52c0_3M762 q)*X^(m+0*q+3) +
 C (sThird52c0_4M762 q)*X^(m+0*q+4) +
 C (sThird52c0_5M762 q)*X^(m+0*q+5) +
 C (sThird52c1_3M762 q)*X^(m+1*q+3) +
 C (sThird52c1_4M762 q)*X^(m+1*q+4) +
 C (sThird52c1_5M762 q)*X^(m+1*q+5) +
 C (sThird52c1_6M762 q)*X^(m+1*q+6) +
 C (sThird52c1_7M762 q)*X^(m+1*q+7) +
 C (sThird52c2_3M762 q)*X^(m+2*q+3) +
 C (sThird52c2_4M762 q)*X^(m+2*q+4) +
 C (sThird52c2_5M762 q)*X^(m+2*q+5) +
 C (sThird52c2_6M762 q)*X^(m+2*q+6) +
 C (sThird52c2_7M762 q)*X^(m+2*q+7) +
 C (sThird52c2_8M762 q)*X^(m+2*q+8) +
 C (sThird52c3_3M762 q)*X^(m+3*q+3) +
 C (sThird52c3_4M762 q)*X^(m+3*q+4) +
 C (sThird52c3_5M762 q)*X^(m+3*q+5) +
 C (sThird52c3_6M762 q)*X^(m+3*q+6) +
 C (sThird52c3_7M762 q)*X^(m+3*q+7) +
 C (sThird52c3_8M762 q)*X^(m+3*q+8) +
 C (sThird52c3_9M762 q)*X^(m+3*q+9) +
 C (sThird52c3_10M762 q)*X^(m+3*q+10) := by
   simp only [sThird52J0MAE2,sThird52J1MAE2,sThird52J2MAE2,sThird52J3MAE2,sThird52c0_2M762,sThird52c0_3M762,sThird52c0_4M762,sThird52c0_5M762,sThird52c1_3M762,sThird52c1_4M762,sThird52c1_5M762,sThird52c1_6M762,sThird52c1_7M762,sThird52c2_3M762,sThird52c2_4M762,sThird52c2_5M762,sThird52c2_6M762,sThird52c2_7M762,sThird52c2_8M762,sThird52c3_3M762,sThird52c3_4M762,sThird52c3_5M762,sThird52c3_6M762,sThird52c3_7M762,sThird52c3_8M762,sThird52c3_9M762,sThird52c3_10M762,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 5 j h
 change P.coeff j=vInvM115 _ j at hc
 rw [hc]
 simp only [vInv_addM115,mul_add,vInv_monomialM115]
 have hs (j m q k : ℤ) : vFallM115 j (m+q+k)=vFallM115 (j-m-q) k := by
   unfold vFallM115
   split_ifs <;> first | omega | ring
 simp only [sThird52EM762,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
