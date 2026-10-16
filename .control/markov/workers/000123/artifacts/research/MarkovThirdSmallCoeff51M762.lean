import MarkovThirdSmallBridge51MAE2
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird51c0_3M762 (q : ℤ) : ℤ := 72
def sThird51c0_4M762 (q : ℤ) : ℤ := 480
def sThird51c0_5M762 (q : ℤ) : ℤ := 360
def sThird51c0_6M762 (q : ℤ) : ℤ := 48
def sThird51c1_3M762 (q : ℤ) : ℤ := -96-48*q
def sThird51c1_4M762 (q : ℤ) : ℤ := -1776-312*q
def sThird51c1_5M762 (q : ℤ) : ℤ := -4680-120*q
def sThird51c1_6M762 (q : ℤ) : ℤ := -2016+408*q
def sThird51c1_7M762 (q : ℤ) : ℤ := -72+72*q
def sThird51c2_3M762 (q : ℤ) : ℤ := 72+180*q+108*q^2
def sThird51c2_4M762 (q : ℤ) : ℤ := 1968+2160*q+432*q^2
def sThird51c2_5M762 (q : ℤ) : ℤ := 8352+3384*q-216*q^2
def sThird51c2_6M762 (q : ℤ) : ℤ := 8208-2304*q-864*q^2
def sThird51c2_7M762 (q : ℤ) : ℤ := 600-3564*q+108*q^2
def sThird51c2_8M762 (q : ℤ) : ℤ := 144*q+432*q^2
def sThird51c3_3M762 (q : ℤ) : ℤ := -24-130*q-225*q^2-125*q^3
def sThird51c3_4M762 (q : ℤ) : ℤ := -756-1945*q-1350*q^2-125*q^3
def sThird51c3_5M762 (q : ℤ) : ℤ := -4032-4680*q-375*q^2+375*q^3
def sThird51c3_6M762 (q : ℤ) : ℤ := -5820+285*q+3000*q^2+375*q^3
def sThird51c3_7M762 (q : ℤ) : ℤ := -1368+5910*q+1425*q^2-375*q^3
def sThird51c3_8M762 (q : ℤ) : ℤ := 756+1425*q-1950*q^2-375*q^3
def sThird51c3_9M762 (q : ℤ) : ℤ := -336-1100*q-825*q^2+125*q^3
def sThird51c3_10M762 (q : ℤ) : ℤ := 60+235*q+300*q^2+125*q^3
def sThird51EM762 (q j : ℤ) : ℤ :=
 sThird51c0_3M762 q*vFallM115 (j-0*q) 3+
 sThird51c0_4M762 q*vFallM115 (j-0*q) 4+
 sThird51c0_5M762 q*vFallM115 (j-0*q) 5+
 sThird51c0_6M762 q*vFallM115 (j-0*q) 6+
 sThird51c1_3M762 q*vFallM115 (j-1*q) 3+
 sThird51c1_4M762 q*vFallM115 (j-1*q) 4+
 sThird51c1_5M762 q*vFallM115 (j-1*q) 5+
 sThird51c1_6M762 q*vFallM115 (j-1*q) 6+
 sThird51c1_7M762 q*vFallM115 (j-1*q) 7+
 sThird51c2_3M762 q*vFallM115 (j-2*q) 3+
 sThird51c2_4M762 q*vFallM115 (j-2*q) 4+
 sThird51c2_5M762 q*vFallM115 (j-2*q) 5+
 sThird51c2_6M762 q*vFallM115 (j-2*q) 6+
 sThird51c2_7M762 q*vFallM115 (j-2*q) 7+
 sThird51c2_8M762 q*vFallM115 (j-2*q) 8+
 sThird51c3_3M762 q*vFallM115 (j-3*q) 3+
 sThird51c3_4M762 q*vFallM115 (j-3*q) 4+
 sThird51c3_5M762 q*vFallM115 (j-3*q) 5+
 sThird51c3_6M762 q*vFallM115 (j-3*q) 6+
 sThird51c3_7M762 q*vFallM115 (j-3*q) 7+
 sThird51c3_8M762 q*vFallM115 (j-3*q) 8+
 sThird51c3_9M762 q*vFallM115 (j-3*q) 9+
 sThird51c3_10M762 q*vFallM115 (j-3*q) 10

theorem sThird51coeffM762 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird51J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird51J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird51J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird51J3MAE2 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird51EM762 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird51J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird51J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird51J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird51J3MAE2 (q:ℤ[X]) X)=C (sThird51c0_3M762 q)*X^(m+0*q+3) +
 C (sThird51c0_4M762 q)*X^(m+0*q+4) +
 C (sThird51c0_5M762 q)*X^(m+0*q+5) +
 C (sThird51c0_6M762 q)*X^(m+0*q+6) +
 C (sThird51c1_3M762 q)*X^(m+1*q+3) +
 C (sThird51c1_4M762 q)*X^(m+1*q+4) +
 C (sThird51c1_5M762 q)*X^(m+1*q+5) +
 C (sThird51c1_6M762 q)*X^(m+1*q+6) +
 C (sThird51c1_7M762 q)*X^(m+1*q+7) +
 C (sThird51c2_3M762 q)*X^(m+2*q+3) +
 C (sThird51c2_4M762 q)*X^(m+2*q+4) +
 C (sThird51c2_5M762 q)*X^(m+2*q+5) +
 C (sThird51c2_6M762 q)*X^(m+2*q+6) +
 C (sThird51c2_7M762 q)*X^(m+2*q+7) +
 C (sThird51c2_8M762 q)*X^(m+2*q+8) +
 C (sThird51c3_3M762 q)*X^(m+3*q+3) +
 C (sThird51c3_4M762 q)*X^(m+3*q+4) +
 C (sThird51c3_5M762 q)*X^(m+3*q+5) +
 C (sThird51c3_6M762 q)*X^(m+3*q+6) +
 C (sThird51c3_7M762 q)*X^(m+3*q+7) +
 C (sThird51c3_8M762 q)*X^(m+3*q+8) +
 C (sThird51c3_9M762 q)*X^(m+3*q+9) +
 C (sThird51c3_10M762 q)*X^(m+3*q+10) := by
   simp only [sThird51J0MAE2,sThird51J1MAE2,sThird51J2MAE2,sThird51J3MAE2,sThird51c0_3M762,sThird51c0_4M762,sThird51c0_5M762,sThird51c0_6M762,sThird51c1_3M762,sThird51c1_4M762,sThird51c1_5M762,sThird51c1_6M762,sThird51c1_7M762,sThird51c2_3M762,sThird51c2_4M762,sThird51c2_5M762,sThird51c2_6M762,sThird51c2_7M762,sThird51c2_8M762,sThird51c3_3M762,sThird51c3_4M762,sThird51c3_5M762,sThird51c3_6M762,sThird51c3_7M762,sThird51c3_8M762,sThird51c3_9M762,sThird51c3_10M762,
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
 simp only [sThird51EM762,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
