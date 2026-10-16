import MarkovThirdSmallBridge54MAE2
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird54c0_1M762 (q : ℤ) : ℤ := 48
def sThird54c0_2M762 (q : ℤ) : ℤ := 360
def sThird54c0_3M762 (q : ℤ) : ℤ := 480
def sThird54c0_4M762 (q : ℤ) : ℤ := 72
def sThird54c1_2M762 (q : ℤ) : ℤ := -216-72*q
def sThird54c1_3M762 (q : ℤ) : ℤ := -2832-408*q
def sThird54c1_4M762 (q : ℤ) : ℤ := -4440+120*q
def sThird54c1_5M762 (q : ℤ) : ℤ := -1152+312*q
def sThird54c1_6M762 (q : ℤ) : ℤ := 48*q
def sThird54c2_3M762 (q : ℤ) : ℤ := 1440+1584*q+432*q^2
def sThird54c2_4M762 (q : ℤ) : ℤ := 8160+3996*q+108*q^2
def sThird54c2_5M762 (q : ℤ) : ℤ := 9360-1152*q-864*q^2
def sThird54c2_6M762 (q : ℤ) : ℤ := 720-4248*q-216*q^2
def sThird54c2_7M762 (q : ℤ) : ℤ := -624-432*q+432*q^2
def sThird54c2_8M762 (q : ℤ) : ℤ := 144+252*q+108*q^2
def sThird54c3_3M762 (q : ℤ) : ℤ := -210-535*q-450*q^2-125*q^3
def sThird54c3_4M762 (q : ℤ) : ℤ := -2436-3700*q-1575*q^2-125*q^3
def sThird54c3_5M762 (q : ℤ) : ℤ := -6894-4725*q+300*q^2+375*q^3
def sThird54c3_6M762 (q : ℤ) : ℤ := -4488+4290*q+3675*q^2+375*q^3
def sThird54c3_7M762 (q : ℤ) : ℤ := 2610+7215*q+750*q^2-375*q^3
def sThird54c3_8M762 (q : ℤ) : ℤ := 828-1320*q-2625*q^2-375*q^3
def sThird54c3_9M762 (q : ℤ) : ℤ := -1266-1955*q-600*q^2+125*q^3
def sThird54c3_10M762 (q : ℤ) : ℤ := 336+730*q+525*q^2+125*q^3
def sThird54EM762 (q j : ℤ) : ℤ :=
 sThird54c0_1M762 q*vFallM115 (j-0*q) 1+
 sThird54c0_2M762 q*vFallM115 (j-0*q) 2+
 sThird54c0_3M762 q*vFallM115 (j-0*q) 3+
 sThird54c0_4M762 q*vFallM115 (j-0*q) 4+
 sThird54c1_2M762 q*vFallM115 (j-1*q) 2+
 sThird54c1_3M762 q*vFallM115 (j-1*q) 3+
 sThird54c1_4M762 q*vFallM115 (j-1*q) 4+
 sThird54c1_5M762 q*vFallM115 (j-1*q) 5+
 sThird54c1_6M762 q*vFallM115 (j-1*q) 6+
 sThird54c2_3M762 q*vFallM115 (j-2*q) 3+
 sThird54c2_4M762 q*vFallM115 (j-2*q) 4+
 sThird54c2_5M762 q*vFallM115 (j-2*q) 5+
 sThird54c2_6M762 q*vFallM115 (j-2*q) 6+
 sThird54c2_7M762 q*vFallM115 (j-2*q) 7+
 sThird54c2_8M762 q*vFallM115 (j-2*q) 8+
 sThird54c3_3M762 q*vFallM115 (j-3*q) 3+
 sThird54c3_4M762 q*vFallM115 (j-3*q) 4+
 sThird54c3_5M762 q*vFallM115 (j-3*q) 5+
 sThird54c3_6M762 q*vFallM115 (j-3*q) 6+
 sThird54c3_7M762 q*vFallM115 (j-3*q) 7+
 sThird54c3_8M762 q*vFallM115 (j-3*q) 8+
 sThird54c3_9M762 q*vFallM115 (j-3*q) 9+
 sThird54c3_10M762 q*vFallM115 (j-3*q) 10

theorem sThird54coeffM762 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird54J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird54J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird54J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird54J3MAE2 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird54EM762 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird54J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird54J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird54J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird54J3MAE2 (q:ℤ[X]) X)=C (sThird54c0_1M762 q)*X^(m+0*q+1) +
 C (sThird54c0_2M762 q)*X^(m+0*q+2) +
 C (sThird54c0_3M762 q)*X^(m+0*q+3) +
 C (sThird54c0_4M762 q)*X^(m+0*q+4) +
 C (sThird54c1_2M762 q)*X^(m+1*q+2) +
 C (sThird54c1_3M762 q)*X^(m+1*q+3) +
 C (sThird54c1_4M762 q)*X^(m+1*q+4) +
 C (sThird54c1_5M762 q)*X^(m+1*q+5) +
 C (sThird54c1_6M762 q)*X^(m+1*q+6) +
 C (sThird54c2_3M762 q)*X^(m+2*q+3) +
 C (sThird54c2_4M762 q)*X^(m+2*q+4) +
 C (sThird54c2_5M762 q)*X^(m+2*q+5) +
 C (sThird54c2_6M762 q)*X^(m+2*q+6) +
 C (sThird54c2_7M762 q)*X^(m+2*q+7) +
 C (sThird54c2_8M762 q)*X^(m+2*q+8) +
 C (sThird54c3_3M762 q)*X^(m+3*q+3) +
 C (sThird54c3_4M762 q)*X^(m+3*q+4) +
 C (sThird54c3_5M762 q)*X^(m+3*q+5) +
 C (sThird54c3_6M762 q)*X^(m+3*q+6) +
 C (sThird54c3_7M762 q)*X^(m+3*q+7) +
 C (sThird54c3_8M762 q)*X^(m+3*q+8) +
 C (sThird54c3_9M762 q)*X^(m+3*q+9) +
 C (sThird54c3_10M762 q)*X^(m+3*q+10) := by
   simp only [sThird54J0MAE2,sThird54J1MAE2,sThird54J2MAE2,sThird54J3MAE2,sThird54c0_1M762,sThird54c0_2M762,sThird54c0_3M762,sThird54c0_4M762,sThird54c1_2M762,sThird54c1_3M762,sThird54c1_4M762,sThird54c1_5M762,sThird54c1_6M762,sThird54c2_3M762,sThird54c2_4M762,sThird54c2_5M762,sThird54c2_6M762,sThird54c2_7M762,sThird54c2_8M762,sThird54c3_3M762,sThird54c3_4M762,sThird54c3_5M762,sThird54c3_6M762,sThird54c3_7M762,sThird54c3_8M762,sThird54c3_9M762,sThird54c3_10M762,
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
 simp only [sThird54EM762,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
