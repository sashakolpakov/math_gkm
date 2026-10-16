import MarkovThirdSmallBridge43MAE2
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird43c0_1M762 (q : ℤ) : ℤ := 24
def sThird43c0_2M762 (q : ℤ) : ℤ := 96
def sThird43c0_3M762 (q : ℤ) : ℤ := 72
def sThird43c1_2M762 (q : ℤ) : ℤ := -96
def sThird43c1_3M762 (q : ℤ) : ℤ := -1056
def sThird43c1_4M762 (q : ℤ) : ℤ := -1056
def sThird43c1_5M762 (q : ℤ) : ℤ := -96
def sThird43c2_3M762 (q : ℤ) : ℤ := 720+648*q+144*q^2
def sThird43c2_4M762 (q : ℤ) : ℤ := 3312+960*q-96*q^2
def sThird43c2_5M762 (q : ℤ) : ℤ := 2040-1104*q-192*q^2
def sThird43c2_6M762 (q : ℤ) : ℤ := -144-576*q+96*q^2
def sThird43c2_7M762 (q : ℤ) : ℤ := 24+72*q+48*q^2
def sThird43c3_3M762 (q : ℤ) : ℤ := -120-296*q-240*q^2-64*q^3
def sThird43c3_4M762 (q : ℤ) : ℤ := -1296-1728*q-576*q^2
def sThird43c3_5M762 (q : ℤ) : ℤ := -2664-840*q+720*q^2+192*q^3
def sThird43c3_6M762 (q : ℤ) : ℤ := -240+2880*q+1152*q^2
def sThird43c3_7M762 (q : ℤ) : ℤ := 936+840*q-720*q^2-192*q^3
def sThird43c3_8M762 (q : ℤ) : ℤ := -576-1152*q-576*q^2
def sThird43c3_9M762 (q : ℤ) : ℤ := 120+296*q+240*q^2+64*q^3
def sThird43EM762 (q j : ℤ) : ℤ :=
 sThird43c0_1M762 q*vFallM115 (j-0*q) 1+
 sThird43c0_2M762 q*vFallM115 (j-0*q) 2+
 sThird43c0_3M762 q*vFallM115 (j-0*q) 3+
 sThird43c1_2M762 q*vFallM115 (j-1*q) 2+
 sThird43c1_3M762 q*vFallM115 (j-1*q) 3+
 sThird43c1_4M762 q*vFallM115 (j-1*q) 4+
 sThird43c1_5M762 q*vFallM115 (j-1*q) 5+
 sThird43c2_3M762 q*vFallM115 (j-2*q) 3+
 sThird43c2_4M762 q*vFallM115 (j-2*q) 4+
 sThird43c2_5M762 q*vFallM115 (j-2*q) 5+
 sThird43c2_6M762 q*vFallM115 (j-2*q) 6+
 sThird43c2_7M762 q*vFallM115 (j-2*q) 7+
 sThird43c3_3M762 q*vFallM115 (j-3*q) 3+
 sThird43c3_4M762 q*vFallM115 (j-3*q) 4+
 sThird43c3_5M762 q*vFallM115 (j-3*q) 5+
 sThird43c3_6M762 q*vFallM115 (j-3*q) 6+
 sThird43c3_7M762 q*vFallM115 (j-3*q) 7+
 sThird43c3_8M762 q*vFallM115 (j-3*q) 8+
 sThird43c3_9M762 q*vFallM115 (j-3*q) 9

theorem sThird43coeffM762 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird43J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird43J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird43J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird43J3MAE2 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird43EM762 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird43J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird43J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird43J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird43J3MAE2 (q:ℤ[X]) X)=C (sThird43c0_1M762 q)*X^(m+0*q+1) +
 C (sThird43c0_2M762 q)*X^(m+0*q+2) +
 C (sThird43c0_3M762 q)*X^(m+0*q+3) +
 C (sThird43c1_2M762 q)*X^(m+1*q+2) +
 C (sThird43c1_3M762 q)*X^(m+1*q+3) +
 C (sThird43c1_4M762 q)*X^(m+1*q+4) +
 C (sThird43c1_5M762 q)*X^(m+1*q+5) +
 C (sThird43c2_3M762 q)*X^(m+2*q+3) +
 C (sThird43c2_4M762 q)*X^(m+2*q+4) +
 C (sThird43c2_5M762 q)*X^(m+2*q+5) +
 C (sThird43c2_6M762 q)*X^(m+2*q+6) +
 C (sThird43c2_7M762 q)*X^(m+2*q+7) +
 C (sThird43c3_3M762 q)*X^(m+3*q+3) +
 C (sThird43c3_4M762 q)*X^(m+3*q+4) +
 C (sThird43c3_5M762 q)*X^(m+3*q+5) +
 C (sThird43c3_6M762 q)*X^(m+3*q+6) +
 C (sThird43c3_7M762 q)*X^(m+3*q+7) +
 C (sThird43c3_8M762 q)*X^(m+3*q+8) +
 C (sThird43c3_9M762 q)*X^(m+3*q+9) := by
   simp only [sThird43J0MAE2,sThird43J1MAE2,sThird43J2MAE2,sThird43J3MAE2,sThird43c0_1M762,sThird43c0_2M762,sThird43c0_3M762,sThird43c1_2M762,sThird43c1_3M762,sThird43c1_4M762,sThird43c1_5M762,sThird43c2_3M762,sThird43c2_4M762,sThird43c2_5M762,sThird43c2_6M762,sThird43c2_7M762,sThird43c3_3M762,sThird43c3_4M762,sThird43c3_5M762,sThird43c3_6M762,sThird43c3_7M762,sThird43c3_8M762,sThird43c3_9M762,
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
 simp only [sThird43EM762,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
