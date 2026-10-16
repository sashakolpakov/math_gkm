import MarkovThirdSmallBridge61MAE2
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird61c0_3M762 (q : ℤ) : ℤ := 72
def sThird61c0_4M762 (q : ℤ) : ℤ := 864
def sThird61c0_5M762 (q : ℤ) : ℤ := 1968
def sThird61c0_6M762 (q : ℤ) : ℤ := 864
def sThird61c0_7M762 (q : ℤ) : ℤ := 72
def sThird61c1_3M762 (q : ℤ) : ℤ := -96-96*q
def sThird61c1_4M762 (q : ℤ) : ℤ := -2496-960*q
def sThird61c1_5M762 (q : ℤ) : ℤ := -10944-1536*q
def sThird61c1_6M762 (q : ℤ) : ℤ := -12480+768*q
def sThird61c1_7M762 (q : ℤ) : ℤ := -2784+1632*q
def sThird61c1_8M762 (q : ℤ) : ℤ := 192*q
def sThird61c2_3M762 (q : ℤ) : ℤ := 72+240*q+192*q^2
def sThird61c2_4M762 (q : ℤ) : ℤ := 2544+3840*q+1152*q^2
def sThird61c2_5M762 (q : ℤ) : ℤ := 15336+10608*q+576*q^2
def sThird61c2_6M762 (q : ℤ) : ℤ := 26976+2688*q-2304*q^2
def sThird61c2_7M762 (q : ℤ) : ℤ := 13272-11568*q-1728*q^2
def sThird61c2_8M762 (q : ℤ) : ℤ := -720-6528*q+1152*q^2
def sThird61c2_9M762 (q : ℤ) : ℤ := 120+720*q+960*q^2
def sThird61c3_3M762 (q : ℤ) : ℤ := -24-156*q-324*q^2-216*q^3
def sThird61c3_4M762 (q : ℤ) : ℤ := -936-2940*q-2592*q^2-432*q^3
def sThird61c3_5M762 (q : ℤ) : ℤ := -6600-10488*q-3024*q^2+432*q^3
def sThird61c3_6M762 (q : ℤ) : ℤ := -14760-7596*q+4320*q^2+1296*q^3
def sThird61c3_7M762 (q : ℤ) : ℤ := -10800+10080*q+7560*q^2
def sThird61c3_8M762 (q : ℤ) : ℤ := -24+12204*q-864*q^2-1296*q^3
def sThird61c3_9M762 (q : ℤ) : ℤ := 984+120*q-4752*q^2-432*q^3
def sThird61c3_10M762 (q : ℤ) : ℤ := -600-1668*q-864*q^2+432*q^3
def sThird61c3_11M762 (q : ℤ) : ℤ := 120+444*q+540*q^2+216*q^3
def sThird61EM762 (q j : ℤ) : ℤ :=
 sThird61c0_3M762 q*vFallM115 (j-0*q) 3+
 sThird61c0_4M762 q*vFallM115 (j-0*q) 4+
 sThird61c0_5M762 q*vFallM115 (j-0*q) 5+
 sThird61c0_6M762 q*vFallM115 (j-0*q) 6+
 sThird61c0_7M762 q*vFallM115 (j-0*q) 7+
 sThird61c1_3M762 q*vFallM115 (j-1*q) 3+
 sThird61c1_4M762 q*vFallM115 (j-1*q) 4+
 sThird61c1_5M762 q*vFallM115 (j-1*q) 5+
 sThird61c1_6M762 q*vFallM115 (j-1*q) 6+
 sThird61c1_7M762 q*vFallM115 (j-1*q) 7+
 sThird61c1_8M762 q*vFallM115 (j-1*q) 8+
 sThird61c2_3M762 q*vFallM115 (j-2*q) 3+
 sThird61c2_4M762 q*vFallM115 (j-2*q) 4+
 sThird61c2_5M762 q*vFallM115 (j-2*q) 5+
 sThird61c2_6M762 q*vFallM115 (j-2*q) 6+
 sThird61c2_7M762 q*vFallM115 (j-2*q) 7+
 sThird61c2_8M762 q*vFallM115 (j-2*q) 8+
 sThird61c2_9M762 q*vFallM115 (j-2*q) 9+
 sThird61c3_3M762 q*vFallM115 (j-3*q) 3+
 sThird61c3_4M762 q*vFallM115 (j-3*q) 4+
 sThird61c3_5M762 q*vFallM115 (j-3*q) 5+
 sThird61c3_6M762 q*vFallM115 (j-3*q) 6+
 sThird61c3_7M762 q*vFallM115 (j-3*q) 7+
 sThird61c3_8M762 q*vFallM115 (j-3*q) 8+
 sThird61c3_9M762 q*vFallM115 (j-3*q) 9+
 sThird61c3_10M762 q*vFallM115 (j-3*q) 10+
 sThird61c3_11M762 q*vFallM115 (j-3*q) 11

theorem sThird61coeffM762 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird61J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird61J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird61J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird61J3MAE2 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird61EM762 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird61J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird61J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird61J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird61J3MAE2 (q:ℤ[X]) X)=C (sThird61c0_3M762 q)*X^(m+0*q+3) +
 C (sThird61c0_4M762 q)*X^(m+0*q+4) +
 C (sThird61c0_5M762 q)*X^(m+0*q+5) +
 C (sThird61c0_6M762 q)*X^(m+0*q+6) +
 C (sThird61c0_7M762 q)*X^(m+0*q+7) +
 C (sThird61c1_3M762 q)*X^(m+1*q+3) +
 C (sThird61c1_4M762 q)*X^(m+1*q+4) +
 C (sThird61c1_5M762 q)*X^(m+1*q+5) +
 C (sThird61c1_6M762 q)*X^(m+1*q+6) +
 C (sThird61c1_7M762 q)*X^(m+1*q+7) +
 C (sThird61c1_8M762 q)*X^(m+1*q+8) +
 C (sThird61c2_3M762 q)*X^(m+2*q+3) +
 C (sThird61c2_4M762 q)*X^(m+2*q+4) +
 C (sThird61c2_5M762 q)*X^(m+2*q+5) +
 C (sThird61c2_6M762 q)*X^(m+2*q+6) +
 C (sThird61c2_7M762 q)*X^(m+2*q+7) +
 C (sThird61c2_8M762 q)*X^(m+2*q+8) +
 C (sThird61c2_9M762 q)*X^(m+2*q+9) +
 C (sThird61c3_3M762 q)*X^(m+3*q+3) +
 C (sThird61c3_4M762 q)*X^(m+3*q+4) +
 C (sThird61c3_5M762 q)*X^(m+3*q+5) +
 C (sThird61c3_6M762 q)*X^(m+3*q+6) +
 C (sThird61c3_7M762 q)*X^(m+3*q+7) +
 C (sThird61c3_8M762 q)*X^(m+3*q+8) +
 C (sThird61c3_9M762 q)*X^(m+3*q+9) +
 C (sThird61c3_10M762 q)*X^(m+3*q+10) +
 C (sThird61c3_11M762 q)*X^(m+3*q+11) := by
   simp only [sThird61J0MAE2,sThird61J1MAE2,sThird61J2MAE2,sThird61J3MAE2,sThird61c0_3M762,sThird61c0_4M762,sThird61c0_5M762,sThird61c0_6M762,sThird61c0_7M762,sThird61c1_3M762,sThird61c1_4M762,sThird61c1_5M762,sThird61c1_6M762,sThird61c1_7M762,sThird61c1_8M762,sThird61c2_3M762,sThird61c2_4M762,sThird61c2_5M762,sThird61c2_6M762,sThird61c2_7M762,sThird61c2_8M762,sThird61c2_9M762,sThird61c3_3M762,sThird61c3_4M762,sThird61c3_5M762,sThird61c3_6M762,sThird61c3_7M762,sThird61c3_8M762,sThird61c3_9M762,sThird61c3_10M762,sThird61c3_11M762,
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
 simp only [sThird61EM762,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
