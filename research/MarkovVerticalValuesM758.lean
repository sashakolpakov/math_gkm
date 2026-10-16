import MarkovVerticalInverseM758
/-! Machine-authored 7584c5d0. Integral coefficient adapter, retaining zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def vH0c1M758 (a r s q : ℤ) : ℤ := 8*s

def vH0c2M758 (a r s q : ℤ) : ℤ := -32*s+16*r^2

def vH0c3M758 (a r s q : ℤ) : ℤ := 48*s-48*r-32*r^2+8*a+32*a*r

def vH0c4M758 (a r s q : ℤ) : ℤ := -32*s+64*r+16*r^2-32*a-32*a*r+16*a^2

def vH0c5M758 (a r s q : ℤ) : ℤ := 8*s-16*r+8*a

def vH1c2M758 (a r s q : ℤ) : ℤ := -8*r+16*r*q-8*r^2-8*a*r*q

def vH1c3M758 (a r s q : ℤ) : ℤ := 48*r-24*a+16*a*q-32*a*r-8*a^2*q

def vH1c4M758 (a r s q : ℤ) : ℤ := -32*r-32*r*q+16*r^2+8*a+16*a*q+16*a*r*q-24*a^2-8*a^2*q

def vH1c5M758 (a r s q : ℤ) : ℤ := -48*r-8*a-16*a*q+32*a*r-16*a^2+8*a^2*q

def vH1c6M758 (a r s q : ℤ) : ℤ := 40*r+16*r*q-8*r^2-40*a-16*a*q-8*a*r*q+8*a^2+8*a^2*q

def vH2c2M758 (a r s q : ℤ) : ℤ := 2+3*r+1*r^2+3*a*q+2*a*r*q+1*a^2*q^2

def vH2c3M758 (a r s q : ℤ) : ℤ := -4+4*r+2*r^2+16*a+4*a*q+6*a*r+4*a*r*q+6*a^2*q+2*a^2*q^2

def vH2c4M758 (a r s q : ℤ) : ℤ := -2-1*r-1*r^2+21*a-1*a*q+10*a*r-2*a*r*q+9*a^2+10*a^2*q-1*a^2*q^2

def vH2c5M758 (a r s q : ℤ) : ℤ := 8-4*r^2+12*a-4*a*r-8*a*r*q+12*a^2-4*a^2*q-4*a^2*q^2

def vH2c6M758 (a r s q : ℤ) : ℤ := -2+1*r-1*r^2+22*a+1*a*q-12*a*r-2*a*r*q-2*a^2-12*a^2*q-1*a^2*q^2

def vH2c7M758 (a r s q : ℤ) : ℤ := -4-4*r+2*r^2+12*a-4*a*q-2*a*r+4*a*r*q-4*a^2-2*a^2*q+2*a^2*q^2

def vH2c8M758 (a r s q : ℤ) : ℤ := 2-3*r+1*r^2-3*a-3*a*q+2*a*r+2*a*r*q+1*a^2+2*a^2*q+1*a^2*q^2

def vE0M758 (a r s q j : ℤ) : ℤ :=
 vH0c1M758 a r s q*vFallM758 j 1+vH0c2M758 a r s q*vFallM758 j 2+vH0c3M758 a r s q*vFallM758 j 3+vH0c4M758 a r s q*vFallM758 j 4+vH0c5M758 a r s q*vFallM758 j 5

def vE1M758 (a r s q j : ℤ) : ℤ :=
 vH1c2M758 a r s q*vFallM758 j 2+vH1c3M758 a r s q*vFallM758 j 3+vH1c4M758 a r s q*vFallM758 j 4+vH1c5M758 a r s q*vFallM758 j 5+vH1c6M758 a r s q*vFallM758 j 6

def vE2M758 (a r s q j : ℤ) : ℤ :=
 vH2c2M758 a r s q*vFallM758 j 2+vH2c3M758 a r s q*vFallM758 j 3+vH2c4M758 a r s q*vFallM758 j 4+vH2c5M758 a r s q*vFallM758 j 5+vH2c6M758 a r s q*vFallM758 j 6+vH2c7M758 a r s q*vFallM758 j 7+vH2c8M758 a r s q*vFallM758 j 8

def vEM758 (a r s q j : ℤ) : ℤ := vE0M758 a r s q j+vE1M758 a r s q (j-q)+vE2M758 a r s q (j-2*q)

theorem vN_coeff_scaledM758 (n a r s j : ℕ) :
 6*(vNseedMDE6 n a r s).coeff j=vEM758 a r s (n+1) j := by
 have hs := vN_sparseM758 n a r s
 have hp : vH0M758 (a:ℤ[X]) r s (n+1) X+
   X^(n+1)*vH1M758 (a:ℤ[X]) r s (n+1) X+
   X^(2*(n+1))*vH2M758 (a:ℤ[X]) r s (n+1) X=
 C (vH0c1M758 a r s (n+1))*X^(0*(n+1)+1) +
 C (vH0c2M758 a r s (n+1))*X^(0*(n+1)+2) +
 C (vH0c3M758 a r s (n+1))*X^(0*(n+1)+3) +
 C (vH0c4M758 a r s (n+1))*X^(0*(n+1)+4) +
 C (vH0c5M758 a r s (n+1))*X^(0*(n+1)+5) +
 C (vH1c2M758 a r s (n+1))*X^(1*(n+1)+2) +
 C (vH1c3M758 a r s (n+1))*X^(1*(n+1)+3) +
 C (vH1c4M758 a r s (n+1))*X^(1*(n+1)+4) +
 C (vH1c5M758 a r s (n+1))*X^(1*(n+1)+5) +
 C (vH1c6M758 a r s (n+1))*X^(1*(n+1)+6) +
 C (vH2c2M758 a r s (n+1))*X^(2*(n+1)+2) +
 C (vH2c3M758 a r s (n+1))*X^(2*(n+1)+3) +
 C (vH2c4M758 a r s (n+1))*X^(2*(n+1)+4) +
 C (vH2c5M758 a r s (n+1))*X^(2*(n+1)+5) +
 C (vH2c6M758 a r s (n+1))*X^(2*(n+1)+6) +
 C (vH2c7M758 a r s (n+1))*X^(2*(n+1)+7) +
 C (vH2c8M758 a r s (n+1))*X^(2*(n+1)+8) := by
   simp only [vH0M758,vH1M758,vH2M758,vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at hs
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j hs
 change (vNseedMDE6 n a r s).coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 have hshift (j q k : ℤ) : vFallM758 j (q+k)=vFallM758 (j-q) k := by
   unfold vFallM758
   split_ifs <;> first | omega | ring
 simp only [vEM758,vE0M758,vE1M758,vE2M758,Nat.cast_add,
   Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,zero_mul,zero_add,one_mul,hshift]
 ring

end
end MathGKM.Markov
