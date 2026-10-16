import MarkovThirdSmallBridge32MF8
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird32c0_1MF8 (q : ℤ) : ℤ := 6
def sThird32c0_2MF8 (q : ℤ) : ℤ := 12
def sThird32c0_3MF8 (q : ℤ) : ℤ := 6
def sThird32c1_2MF8 (q : ℤ) : ℤ := -24+24*q
def sThird32c1_3MF8 (q : ℤ) : ℤ := -288+24*q
def sThird32c1_4MF8 (q : ℤ) : ℤ := -192-48*q
def sThird32c2_3MF8 (q : ℤ) : ℤ := 288+168*q+24*q^2
def sThird32c2_4MF8 (q : ℤ) : ℤ := 1032+84*q-36*q^2
def sThird32c2_5MF8 (q : ℤ) : ℤ := 336-240*q
def sThird32c2_6MF8 (q : ℤ) : ℤ := -12*q+12*q^2
def sThird32c3_3MF8 (q : ℤ) : ℤ := -60-141*q-108*q^2-27*q^3
def sThird32c3_4MF8 (q : ℤ) : ℤ := -600-660*q-135*q^2+27*q^3
def sThird32c3_5MF8 (q : ℤ) : ℤ := -726+264*q+432*q^2+54*q^3
def sThird32c3_6MF8 (q : ℤ) : ℤ := 324+870*q+54*q^2-54*q^3
def sThird32c3_7MF8 (q : ℤ) : ℤ := -138-411*q-324*q^2-27*q^3
def sThird32c3_8MF8 (q : ℤ) : ℤ := 24+78*q+81*q^2+27*q^3
def sThird32EMF8 (q j : ℤ) : ℤ :=
 sThird32c0_1MF8 q*vFallM115 (j-0*q) 1+
 sThird32c0_2MF8 q*vFallM115 (j-0*q) 2+
 sThird32c0_3MF8 q*vFallM115 (j-0*q) 3+
 sThird32c1_2MF8 q*vFallM115 (j-1*q) 2+
 sThird32c1_3MF8 q*vFallM115 (j-1*q) 3+
 sThird32c1_4MF8 q*vFallM115 (j-1*q) 4+
 sThird32c2_3MF8 q*vFallM115 (j-2*q) 3+
 sThird32c2_4MF8 q*vFallM115 (j-2*q) 4+
 sThird32c2_5MF8 q*vFallM115 (j-2*q) 5+
 sThird32c2_6MF8 q*vFallM115 (j-2*q) 6+
 sThird32c3_3MF8 q*vFallM115 (j-3*q) 3+
 sThird32c3_4MF8 q*vFallM115 (j-3*q) 4+
 sThird32c3_5MF8 q*vFallM115 (j-3*q) 5+
 sThird32c3_6MF8 q*vFallM115 (j-3*q) 6+
 sThird32c3_7MF8 q*vFallM115 (j-3*q) 7+
 sThird32c3_8MF8 q*vFallM115 (j-3*q) 8

theorem sThird32coeffMF8 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird32J0MF8 (q:ℤ[X]) X+
   X^(1*q)*sThird32J1MF8 (q:ℤ[X]) X+
   X^(2*q)*sThird32J2MF8 (q:ℤ[X]) X+
   X^(3*q)*sThird32J3MF8 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird32EMF8 q ((j:ℤ)+1) := by
 have hp : X^m*(sThird32J0MF8 (q:ℤ[X]) X+
   X^(1*q)*sThird32J1MF8 (q:ℤ[X]) X+
   X^(2*q)*sThird32J2MF8 (q:ℤ[X]) X+
   X^(3*q)*sThird32J3MF8 (q:ℤ[X]) X)=C (sThird32c0_1MF8 q)*X^(m+0*q+1) +
 C (sThird32c0_2MF8 q)*X^(m+0*q+2) +
 C (sThird32c0_3MF8 q)*X^(m+0*q+3) +
 C (sThird32c1_2MF8 q)*X^(m+1*q+2) +
 C (sThird32c1_3MF8 q)*X^(m+1*q+3) +
 C (sThird32c1_4MF8 q)*X^(m+1*q+4) +
 C (sThird32c2_3MF8 q)*X^(m+2*q+3) +
 C (sThird32c2_4MF8 q)*X^(m+2*q+4) +
 C (sThird32c2_5MF8 q)*X^(m+2*q+5) +
 C (sThird32c2_6MF8 q)*X^(m+2*q+6) +
 C (sThird32c3_3MF8 q)*X^(m+3*q+3) +
 C (sThird32c3_4MF8 q)*X^(m+3*q+4) +
 C (sThird32c3_5MF8 q)*X^(m+3*q+5) +
 C (sThird32c3_6MF8 q)*X^(m+3*q+6) +
 C (sThird32c3_7MF8 q)*X^(m+3*q+7) +
 C (sThird32c3_8MF8 q)*X^(m+3*q+8) := by
   simp only [sThird32J0MF8,sThird32J1MF8,sThird32J2MF8,sThird32J3MF8,sThird32c0_1MF8,sThird32c0_2MF8,sThird32c0_3MF8,sThird32c1_2MF8,sThird32c1_3MF8,sThird32c1_4MF8,sThird32c2_3MF8,sThird32c2_4MF8,sThird32c2_5MF8,sThird32c2_6MF8,sThird32c3_3MF8,sThird32c3_4MF8,sThird32c3_5MF8,sThird32c3_6MF8,sThird32c3_7MF8,sThird32c3_8MF8,
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
 simp only [sThird32EMF8,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
