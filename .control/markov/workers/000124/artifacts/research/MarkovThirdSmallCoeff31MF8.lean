import MarkovThirdSmallBridge31MF8
import MarkovThirdInverseM115
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def sThird31c0_2MF8 (q : ℤ) : ℤ := 6
def sThird31c0_3MF8 (q : ℤ) : ℤ := 12
def sThird31c0_4MF8 (q : ℤ) : ℤ := 6
def sThird31c1_3MF8 (q : ℤ) : ℤ := -96+48*q
def sThird31c1_4MF8 (q : ℤ) : ℤ := -336-24*q
def sThird31c1_5MF8 (q : ℤ) : ℤ := -72-24*q
def sThird31c2_3MF8 (q : ℤ) : ℤ := 72+60*q+12*q^2
def sThird31c2_4MF8 (q : ℤ) : ℤ := 816+240*q
def sThird31c2_5MF8 (q : ℤ) : ℤ := 720-228*q-36*q^2
def sThird31c2_6MF8 (q : ℤ) : ℤ := 48-72*q+24*q^2
def sThird31c3_3MF8 (q : ℤ) : ℤ := -24-78*q-81*q^2-27*q^3
def sThird31c3_4MF8 (q : ℤ) : ℤ := -396-561*q-162*q^2+27*q^3
def sThird31c3_5MF8 (q : ℤ) : ℤ := -768-6*q+378*q^2+54*q^3
def sThird31c3_6MF8 (q : ℤ) : ℤ := 42+816*q+108*q^2-54*q^3
def sThird31c3_7MF8 (q : ℤ) : ℤ := -36-204*q-297*q^2-27*q^3
def sThird31c3_8MF8 (q : ℤ) : ℤ := 6+33*q+54*q^2+27*q^3
def sThird31EMF8 (q j : ℤ) : ℤ :=
 sThird31c0_2MF8 q*vFallM115 (j-0*q) 2+
 sThird31c0_3MF8 q*vFallM115 (j-0*q) 3+
 sThird31c0_4MF8 q*vFallM115 (j-0*q) 4+
 sThird31c1_3MF8 q*vFallM115 (j-1*q) 3+
 sThird31c1_4MF8 q*vFallM115 (j-1*q) 4+
 sThird31c1_5MF8 q*vFallM115 (j-1*q) 5+
 sThird31c2_3MF8 q*vFallM115 (j-2*q) 3+
 sThird31c2_4MF8 q*vFallM115 (j-2*q) 4+
 sThird31c2_5MF8 q*vFallM115 (j-2*q) 5+
 sThird31c2_6MF8 q*vFallM115 (j-2*q) 6+
 sThird31c3_3MF8 q*vFallM115 (j-3*q) 3+
 sThird31c3_4MF8 q*vFallM115 (j-3*q) 4+
 sThird31c3_5MF8 q*vFallM115 (j-3*q) 5+
 sThird31c3_6MF8 q*vFallM115 (j-3*q) 6+
 sThird31c3_7MF8 q*vFallM115 (j-3*q) 7+
 sThird31c3_8MF8 q*vFallM115 (j-3*q) 8

theorem sThird31coeffMF8 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*(sThird31J0MF8 (q:ℤ[X]) X+
   X^(1*q)*sThird31J1MF8 (q:ℤ[X]) X+
   X^(2*q)*sThird31J2MF8 (q:ℤ[X]) X+
   X^(3*q)*sThird31J3MF8 (q:ℤ[X]) X)) :
 120*P.coeff j=sThird31EMF8 q ((j:ℤ)-m) := by
 have hp : X^m*(sThird31J0MF8 (q:ℤ[X]) X+
   X^(1*q)*sThird31J1MF8 (q:ℤ[X]) X+
   X^(2*q)*sThird31J2MF8 (q:ℤ[X]) X+
   X^(3*q)*sThird31J3MF8 (q:ℤ[X]) X)=C (sThird31c0_2MF8 q)*X^(m+0*q+2) +
 C (sThird31c0_3MF8 q)*X^(m+0*q+3) +
 C (sThird31c0_4MF8 q)*X^(m+0*q+4) +
 C (sThird31c1_3MF8 q)*X^(m+1*q+3) +
 C (sThird31c1_4MF8 q)*X^(m+1*q+4) +
 C (sThird31c1_5MF8 q)*X^(m+1*q+5) +
 C (sThird31c2_3MF8 q)*X^(m+2*q+3) +
 C (sThird31c2_4MF8 q)*X^(m+2*q+4) +
 C (sThird31c2_5MF8 q)*X^(m+2*q+5) +
 C (sThird31c2_6MF8 q)*X^(m+2*q+6) +
 C (sThird31c3_3MF8 q)*X^(m+3*q+3) +
 C (sThird31c3_4MF8 q)*X^(m+3*q+4) +
 C (sThird31c3_5MF8 q)*X^(m+3*q+5) +
 C (sThird31c3_6MF8 q)*X^(m+3*q+6) +
 C (sThird31c3_7MF8 q)*X^(m+3*q+7) +
 C (sThird31c3_8MF8 q)*X^(m+3*q+8) := by
   simp only [sThird31J0MF8,sThird31J1MF8,sThird31J2MF8,sThird31J3MF8,sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8,
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
 simp only [sThird31EMF8,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
