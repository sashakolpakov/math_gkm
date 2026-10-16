import MarkovThirdSmallBridge65MAE2
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird65c0_1M762 (q : ℤ) : ℤ := 72
def sThird65c0_2M762 (q : ℤ) : ℤ := 864
def sThird65c0_3M762 (q : ℤ) : ℤ := 1968
def sThird65c0_4M762 (q : ℤ) : ℤ := 864
def sThird65c0_5M762 (q : ℤ) : ℤ := 72
def sThird65c1_2M762 (q : ℤ) : ℤ := -384-192*q
def sThird65c1_3M762 (q : ℤ) : ℤ := -6048-1632*q
def sThird65c1_4M762 (q : ℤ) : ℤ := -14016-768*q
def sThird65c1_5M762 (q : ℤ) : ℤ := -7872+1536*q
def sThird65c1_6M762 (q : ℤ) : ℤ := -576+960*q
def sThird65c1_7M762 (q : ℤ) : ℤ := 96+96*q
def sThird65c2_3M762 (q : ℤ) : ℤ := 2520+3120*q+960*q^2
def sThird65c2_4M762 (q : ℤ) : ℤ := 16944+11136*q+1152*q^2
def sThird65c2_5M762 (q : ℤ) : ℤ := 29496+4656*q-1728*q^2
def sThird65c2_6M762 (q : ℤ) : ℤ := 12384-11904*q-2304*q^2
def sThird65c2_7M762 (q : ℤ) : ℤ := -3576-8304*q+576*q^2
def sThird65c2_8M762 (q : ℤ) : ℤ := -528+768*q+1152*q^2
def sThird65c2_9M762 (q : ℤ) : ℤ := 360+528*q+192*q^2
def sThird65c3_3M762 (q : ℤ) : ℤ := -336-876*q-756*q^2-216*q^3
def sThird65c3_4M762 (q : ℤ) : ℤ := -4176-6972*q-3456*q^2-432*q^3
def sThird65c3_5M762 (q : ℤ) : ℤ := -14808-13944*q-2160*q^2+432*q^3
def sThird65c3_6M762 (q : ℤ) : ℤ := -17520-108*q+6912*q^2+1296*q^3
def sThird65c3_7M762 (q : ℤ) : ℤ := -720+20160*q+7560*q^2
def sThird65c3_8M762 (q : ℤ) : ℤ := 7344+9324*q-3456*q^2-1296*q^3
def sThird65c3_9M762 (q : ℤ) : ℤ := -1176-6792*q-5616*q^2-432*q^3
def sThird65c3_10M762 (q : ℤ) : ℤ := -1968-2244*q+432*q^3
def sThird65c3_11M762 (q : ℤ) : ℤ := 720+1452*q+972*q^2+216*q^3
def sThird65EM762 (q j : ℤ) : ℤ :=
 sThird65c0_1M762 q*vFallM115 (j-0*q) 1+
 sThird65c0_2M762 q*vFallM115 (j-0*q) 2+
 sThird65c0_3M762 q*vFallM115 (j-0*q) 3+
 sThird65c0_4M762 q*vFallM115 (j-0*q) 4+
 sThird65c0_5M762 q*vFallM115 (j-0*q) 5+
 sThird65c1_2M762 q*vFallM115 (j-1*q) 2+
 sThird65c1_3M762 q*vFallM115 (j-1*q) 3+
 sThird65c1_4M762 q*vFallM115 (j-1*q) 4+
 sThird65c1_5M762 q*vFallM115 (j-1*q) 5+
 sThird65c1_6M762 q*vFallM115 (j-1*q) 6+
 sThird65c1_7M762 q*vFallM115 (j-1*q) 7+
 sThird65c2_3M762 q*vFallM115 (j-2*q) 3+
 sThird65c2_4M762 q*vFallM115 (j-2*q) 4+
 sThird65c2_5M762 q*vFallM115 (j-2*q) 5+
 sThird65c2_6M762 q*vFallM115 (j-2*q) 6+
 sThird65c2_7M762 q*vFallM115 (j-2*q) 7+
 sThird65c2_8M762 q*vFallM115 (j-2*q) 8+
 sThird65c2_9M762 q*vFallM115 (j-2*q) 9+
 sThird65c3_3M762 q*vFallM115 (j-3*q) 3+
 sThird65c3_4M762 q*vFallM115 (j-3*q) 4+
 sThird65c3_5M762 q*vFallM115 (j-3*q) 5+
 sThird65c3_6M762 q*vFallM115 (j-3*q) 6+
 sThird65c3_7M762 q*vFallM115 (j-3*q) 7+
 sThird65c3_8M762 q*vFallM115 (j-3*q) 8+
 sThird65c3_9M762 q*vFallM115 (j-3*q) 9+
 sThird65c3_10M762 q*vFallM115 (j-3*q) 10+
 sThird65c3_11M762 q*vFallM115 (j-3*q) 11

theorem sThird65coeffM762 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird65J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird65J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird65J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird65J3MAE2 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird65EM762 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird65J0MAE2 (q:ℤ[X]) X+
   X^(1*q)*sThird65J1MAE2 (q:ℤ[X]) X+
   X^(2*q)*sThird65J2MAE2 (q:ℤ[X]) X+
   X^(3*q)*sThird65J3MAE2 (q:ℤ[X]) X)=C (sThird65c0_1M762 q)*X^(m+0*q+1) +
 C (sThird65c0_2M762 q)*X^(m+0*q+2) +
 C (sThird65c0_3M762 q)*X^(m+0*q+3) +
 C (sThird65c0_4M762 q)*X^(m+0*q+4) +
 C (sThird65c0_5M762 q)*X^(m+0*q+5) +
 C (sThird65c1_2M762 q)*X^(m+1*q+2) +
 C (sThird65c1_3M762 q)*X^(m+1*q+3) +
 C (sThird65c1_4M762 q)*X^(m+1*q+4) +
 C (sThird65c1_5M762 q)*X^(m+1*q+5) +
 C (sThird65c1_6M762 q)*X^(m+1*q+6) +
 C (sThird65c1_7M762 q)*X^(m+1*q+7) +
 C (sThird65c2_3M762 q)*X^(m+2*q+3) +
 C (sThird65c2_4M762 q)*X^(m+2*q+4) +
 C (sThird65c2_5M762 q)*X^(m+2*q+5) +
 C (sThird65c2_6M762 q)*X^(m+2*q+6) +
 C (sThird65c2_7M762 q)*X^(m+2*q+7) +
 C (sThird65c2_8M762 q)*X^(m+2*q+8) +
 C (sThird65c2_9M762 q)*X^(m+2*q+9) +
 C (sThird65c3_3M762 q)*X^(m+3*q+3) +
 C (sThird65c3_4M762 q)*X^(m+3*q+4) +
 C (sThird65c3_5M762 q)*X^(m+3*q+5) +
 C (sThird65c3_6M762 q)*X^(m+3*q+6) +
 C (sThird65c3_7M762 q)*X^(m+3*q+7) +
 C (sThird65c3_8M762 q)*X^(m+3*q+8) +
 C (sThird65c3_9M762 q)*X^(m+3*q+9) +
 C (sThird65c3_10M762 q)*X^(m+3*q+10) +
 C (sThird65c3_11M762 q)*X^(m+3*q+11) := by
   simp only [sThird65J0MAE2,sThird65J1MAE2,sThird65J2MAE2,sThird65J3MAE2,sThird65c0_1M762,sThird65c0_2M762,sThird65c0_3M762,sThird65c0_4M762,sThird65c0_5M762,sThird65c1_2M762,sThird65c1_3M762,sThird65c1_4M762,sThird65c1_5M762,sThird65c1_6M762,sThird65c1_7M762,sThird65c2_3M762,sThird65c2_4M762,sThird65c2_5M762,sThird65c2_6M762,sThird65c2_7M762,sThird65c2_8M762,sThird65c2_9M762,sThird65c3_3M762,sThird65c3_4M762,sThird65c3_5M762,sThird65c3_6M762,sThird65c3_7M762,sThird65c3_8M762,sThird65c3_9M762,sThird65c3_10M762,sThird65c3_11M762,
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
 simp only [sThird65EM762,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
