import MarkovThirdSmallBridge21MF8
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird21c1_2MF8 (q : ℤ) : ℤ := 12*q
def sThird21c1_3MF8 (q : ℤ) : ℤ := -48
def sThird21c1_4MF8 (q : ℤ) : ℤ := -24-12*q
def sThird21c2_3MF8 (q : ℤ) : ℤ := 72
def sThird21c2_4MF8 (q : ℤ) : ℤ := 240
def sThird21c2_5MF8 (q : ℤ) : ℤ := 72
def sThird21c3_3MF8 (q : ℤ) : ℤ := -24-52*q-36*q^2-8*q^3
def sThird21c3_4MF8 (q : ℤ) : ℤ := -216-172*q+16*q^3
def sThird21c3_5MF8 (q : ℤ) : ℤ := -72+240*q+120*q^2
def sThird21c3_6MF8 (q : ℤ) : ℤ := -20*q-96*q^2-16*q^3
def sThird21c3_7MF8 (q : ℤ) : ℤ := 4*q+12*q^2+8*q^3
def sThird21EMF8 (q j : ℤ) : ℤ :=
 sThird21c1_2MF8 q*vFallM115 (j-1*q) 2+
 sThird21c1_3MF8 q*vFallM115 (j-1*q) 3+
 sThird21c1_4MF8 q*vFallM115 (j-1*q) 4+
 sThird21c2_3MF8 q*vFallM115 (j-2*q) 3+
 sThird21c2_4MF8 q*vFallM115 (j-2*q) 4+
 sThird21c2_5MF8 q*vFallM115 (j-2*q) 5+
 sThird21c3_3MF8 q*vFallM115 (j-3*q) 3+
 sThird21c3_4MF8 q*vFallM115 (j-3*q) 4+
 sThird21c3_5MF8 q*vFallM115 (j-3*q) 5+
 sThird21c3_6MF8 q*vFallM115 (j-3*q) 6+
 sThird21c3_7MF8 q*vFallM115 (j-3*q) 7

theorem sThird21coeffMF8 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird21J0MF8 (q:ℤ[X]) X+
   X^(1*q)*sThird21J1MF8 (q:ℤ[X]) X+
   X^(2*q)*sThird21J2MF8 (q:ℤ[X]) X+
   X^(3*q)*sThird21J3MF8 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird21EMF8 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird21J0MF8 (q:ℤ[X]) X+
   X^(1*q)*sThird21J1MF8 (q:ℤ[X]) X+
   X^(2*q)*sThird21J2MF8 (q:ℤ[X]) X+
   X^(3*q)*sThird21J3MF8 (q:ℤ[X]) X)=C (sThird21c1_2MF8 q)*X^(m+1*q+2) +
 C (sThird21c1_3MF8 q)*X^(m+1*q+3) +
 C (sThird21c1_4MF8 q)*X^(m+1*q+4) +
 C (sThird21c2_3MF8 q)*X^(m+2*q+3) +
 C (sThird21c2_4MF8 q)*X^(m+2*q+4) +
 C (sThird21c2_5MF8 q)*X^(m+2*q+5) +
 C (sThird21c3_3MF8 q)*X^(m+3*q+3) +
 C (sThird21c3_4MF8 q)*X^(m+3*q+4) +
 C (sThird21c3_5MF8 q)*X^(m+3*q+5) +
 C (sThird21c3_6MF8 q)*X^(m+3*q+6) +
 C (sThird21c3_7MF8 q)*X^(m+3*q+7) := by
   simp only [sThird21J0MF8,sThird21J1MF8,sThird21J2MF8,sThird21J3MF8,sThird21c1_2MF8,sThird21c1_3MF8,sThird21c1_4MF8,sThird21c2_3MF8,sThird21c2_4MF8,sThird21c2_5MF8,sThird21c3_3MF8,sThird21c3_4MF8,sThird21c3_5MF8,sThird21c3_6MF8,sThird21c3_7MF8,
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
 simp only [sThird21EMF8,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
