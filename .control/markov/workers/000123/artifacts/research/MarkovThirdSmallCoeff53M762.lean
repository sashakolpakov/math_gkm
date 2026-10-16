import MarkovThirdSmallBridge53MAE2
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird53c0_2M762 (q : ℤ) : ℤ := 192
def sThird53c0_3M762 (q : ℤ) : ℤ := 408
def sThird53c0_4M762 (q : ℤ) : ℤ := 336
def sThird53c0_5M762 (q : ℤ) : ℤ := 24
def sThird53c1_2M762 (q : ℤ) : ℤ := -48-24*q
def sThird53c1_3M762 (q : ℤ) : ℤ := -1512-312*q
def sThird53c1_4M762 (q : ℤ) : ℤ := -4128-72*q
def sThird53c1_5M762 (q : ℤ) : ℤ := -2760+216*q
def sThird53c1_6M762 (q : ℤ) : ℤ := -192+192*q
def sThird53c2_3M762 (q : ℤ) : ℤ := 720+972*q+324*q^2
def sThird53c2_4M762 (q : ℤ) : ℤ := 5760+3528*q+216*q^2
def sThird53c2_5M762 (q : ℤ) : ℤ := 9936+648*q-648*q^2
def sThird53c2_6M762 (q : ℤ) : ℤ := 3504-3888*q-432*q^2
def sThird53c2_7M762 (q : ℤ) : ℤ := -864-1620*q+324*q^2
def sThird53c2_8M762 (q : ℤ) : ℤ := 144+360*q+216*q^2
def sThird53c3_3M762 (q : ℤ) : ℤ := -120-370*q-375*q^2-125*q^3
def sThird53c3_4M762 (q : ℤ) : ℤ := -1758-3085*q-1500*q^2-125*q^3
def sThird53c3_5M762 (q : ℤ) : ℤ := -5940-4800*q+75*q^2+375*q^3
def sThird53c3_6M762 (q : ℤ) : ℤ := -5202+2865*q+3450*q^2+375*q^3
def sThird53c3_7M762 (q : ℤ) : ℤ := 1200+6870*q+975*q^2-375*q^3
def sThird53c3_8M762 (q : ℤ) : ℤ := 990-315*q-2400*q^2-375*q^3
def sThird53c3_9M762 (q : ℤ) : ℤ := -900-1700*q-675*q^2+125*q^3
def sThird53c3_10M762 (q : ℤ) : ℤ := 210+535*q+450*q^2+125*q^3
def sThird53EM762 (q j : ℤ) : ℤ :=
 sThird53c0_2M762 q*vFallM115 (j-0*q) 2+
 sThird53c0_3M762 q*vFallM115 (j-0*q) 3+
 sThird53c0_4M762 q*vFallM115 (j-0*q) 4+
 sThird53c0_5M762 q*vFallM115 (j-0*q) 5+
 sThird53c1_2M762 q*vFallM115 (j-1*q) 2+
 sThird53c1_3M762 q*vFallM115 (j-1*q) 3+
 sThird53c1_4M762 q*vFallM115 (j-1*q) 4+
 sThird53c1_5M762 q*vFallM115 (j-1*q) 5+
 sThird53c1_6M762 q*vFallM115 (j-1*q) 6+
 sThird53c2_3M762 q*vFallM115 (j-2*q) 3+
 sThird53c2_4M762 q*vFallM115 (j-2*q) 4+
 sThird53c2_5M762 q*vFallM115 (j-2*q) 5+
 sThird53c2_6M762 q*vFallM115 (j-2*q) 6+
 sThird53c2_7M762 q*vFallM115 (j-2*q) 7+
 sThird53c2_8M762 q*vFallM115 (j-2*q) 8+
 sThird53c3_3M762 q*vFallM115 (j-3*q) 3+
 sThird53c3_4M762 q*vFallM115 (j-3*q) 4+
 sThird53c3_5M762 q*vFallM115 (j-3*q) 5+
 sThird53c3_6M762 q*vFallM115 (j-3*q) 6+
 sThird53c3_7M762 q*vFallM115 (j-3*q) 7+
 sThird53c3_8M762 q*vFallM115 (j-3*q) 8+
 sThird53c3_9M762 q*vFallM115 (j-3*q) 9+
 sThird53c3_10M762 q*vFallM115 (j-3*q) 10

theorem sThird53coeffM762 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird53J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird53J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird53J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird53J3MAE2 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird53EM762 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird53J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird53J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird53J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird53J3MAE2 (q:ℤ[X]) X)=C (sThird53c0_2M762 q)*X^(m+0*q+2) +
 C (sThird53c0_3M762 q)*X^(m+0*q+3) +
 C (sThird53c0_4M762 q)*X^(m+0*q+4) +
 C (sThird53c0_5M762 q)*X^(m+0*q+5) +
 C (sThird53c1_2M762 q)*X^(m+1*q+2) +
 C (sThird53c1_3M762 q)*X^(m+1*q+3) +
 C (sThird53c1_4M762 q)*X^(m+1*q+4) +
 C (sThird53c1_5M762 q)*X^(m+1*q+5) +
 C (sThird53c1_6M762 q)*X^(m+1*q+6) +
 C (sThird53c2_3M762 q)*X^(m+2*q+3) +
 C (sThird53c2_4M762 q)*X^(m+2*q+4) +
 C (sThird53c2_5M762 q)*X^(m+2*q+5) +
 C (sThird53c2_6M762 q)*X^(m+2*q+6) +
 C (sThird53c2_7M762 q)*X^(m+2*q+7) +
 C (sThird53c2_8M762 q)*X^(m+2*q+8) +
 C (sThird53c3_3M762 q)*X^(m+3*q+3) +
 C (sThird53c3_4M762 q)*X^(m+3*q+4) +
 C (sThird53c3_5M762 q)*X^(m+3*q+5) +
 C (sThird53c3_6M762 q)*X^(m+3*q+6) +
 C (sThird53c3_7M762 q)*X^(m+3*q+7) +
 C (sThird53c3_8M762 q)*X^(m+3*q+8) +
 C (sThird53c3_9M762 q)*X^(m+3*q+9) +
 C (sThird53c3_10M762 q)*X^(m+3*q+10) := by
   simp only [sThird53J0MAE2,sThird53J1MAE2,sThird53J2MAE2,sThird53J3MAE2,sThird53c0_2M762,sThird53c0_3M762,sThird53c0_4M762,sThird53c0_5M762,sThird53c1_2M762,sThird53c1_3M762,sThird53c1_4M762,sThird53c1_5M762,sThird53c1_6M762,sThird53c2_3M762,sThird53c2_4M762,sThird53c2_5M762,sThird53c2_6M762,sThird53c2_7M762,sThird53c2_8M762,sThird53c3_3M762,sThird53c3_4M762,sThird53c3_5M762,sThird53c3_6M762,sThird53c3_7M762,sThird53c3_8M762,sThird53c3_9M762,sThird53c3_10M762,
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
 simp only [sThird53EM762,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
