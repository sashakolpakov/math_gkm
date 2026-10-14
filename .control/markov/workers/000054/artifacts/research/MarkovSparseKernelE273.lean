import MarkovSecondKernelE273
/-! Machine-authored e27336bc. Sparse fourth-difference numerator and a
fixed-length exact coefficient formula for every non-Pell source second slice. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
def sparse00E273 (N c r q : ℤ) := 2 + -3*r + 1*r^2 + -3*c + 2*c*r + 1*c^2 + -3*N*c + 2*N*c*r + 2*N*c^2 + 1*N^2*c^2
def sparse01E273 (N c r q : ℤ) := -4 + -4*r + 2*r^2 + 12*c + -2*c*r + -4*c^2 + -4*N*c + 4*N*c*r + -2*N*c^2 + 2*N^2*c^2
def sparse02E273 (N c r q : ℤ) := -2 + 1*r + -1*r^2 + 22*c + -12*c*r + -2*c^2 + 1*N*c + -2*N*c*r + -12*N*c^2 + -1*N^2*c^2
def sparse03E273 (N c r q : ℤ) := 8 + -4*r^2 + 12*c + -4*c*r + 12*c^2 + -8*N*c*r + -4*N*c^2 + -4*N^2*c^2
def sparse04E273 (N c r q : ℤ) := -2 + -1*r + -1*r^2 + 21*c + 10*c*r + 9*c^2 + -1*N*c + -2*N*c*r + 10*N*c^2 + -1*N^2*c^2
def sparse05E273 (N c r q : ℤ) := -4 + 4*r + 2*r^2 + 16*c + 6*c*r + 4*N*c + 4*N*c*r + 6*N*c^2 + 2*N^2*c^2
def sparse06E273 (N c r q : ℤ) := 2 + 3*r + 1*r^2 + 3*N*c + 2*N*c*r + 1*N^2*c^2
def sparse11E273 (N c r q : ℤ) := 40*r + -8*r^2 + -40*c + 8*c^2 + 16*N*r + -16*N*c + -8*N*c*r + 8*N*c^2
def sparse12E273 (N c r q : ℤ) := -48*r + -8*c + 32*c*r + -16*c^2 + -16*N*c + 8*N*c^2
def sparse13E273 (N c r q : ℤ) := -32*r + 16*r^2 + 8*c + -24*c^2 + -32*N*r + 16*N*c + 16*N*c*r + -8*N*c^2
def sparse14E273 (N c r q : ℤ) := 48*r + -24*c + -32*c*r + 16*N*c + -8*N*c^2
def sparse15E273 (N c r q : ℤ) := -8*r + -8*r^2 + 16*N*r + -8*N*c*r
def sparse21E273 (N c r q : ℤ) := 8*q + -16*r + 8*c
def sparse22E273 (N c r q : ℤ) := -32*q + 64*r + 16*r^2 + -32*c + -32*c*r + 16*c^2
def sparse23E273 (N c r q : ℤ) := 48*q + -48*r + -32*r^2 + 8*c + 32*c*r
def sparse24E273 (N c r q : ℤ) := -32*q + 16*r^2
def sparse25E273 (N c r q : ℤ) := 8*q

def sparseKernelE273 (n c r : ℕ) : ℤ[X] :=
 C (sparse00E273 n c r (2*r-c:ℕ))*X^(0*(n+1)+0) +
 C (sparse01E273 n c r (2*r-c:ℕ))*X^(0*(n+1)+1) +
 C (sparse02E273 n c r (2*r-c:ℕ))*X^(0*(n+1)+2) +
 C (sparse03E273 n c r (2*r-c:ℕ))*X^(0*(n+1)+3) +
 C (sparse04E273 n c r (2*r-c:ℕ))*X^(0*(n+1)+4) +
 C (sparse05E273 n c r (2*r-c:ℕ))*X^(0*(n+1)+5) +
 C (sparse06E273 n c r (2*r-c:ℕ))*X^(0*(n+1)+6) +
 C (sparse11E273 n c r (2*r-c:ℕ))*X^(1*(n+1)+1) +
 C (sparse12E273 n c r (2*r-c:ℕ))*X^(1*(n+1)+2) +
 C (sparse13E273 n c r (2*r-c:ℕ))*X^(1*(n+1)+3) +
 C (sparse14E273 n c r (2*r-c:ℕ))*X^(1*(n+1)+4) +
 C (sparse15E273 n c r (2*r-c:ℕ))*X^(1*(n+1)+5) +
 C (sparse21E273 n c r (2*r-c:ℕ))*X^(2*(n+1)+1) +
 C (sparse22E273 n c r (2*r-c:ℕ))*X^(2*(n+1)+2) +
 C (sparse23E273 n c r (2*r-c:ℕ))*X^(2*(n+1)+3) +
 C (sparse24E273 n c r (2*r-c:ℕ))*X^(2*(n+1)+4) +
 C (sparse25E273 n c r (2*r-c:ℕ))*X^(2*(n+1)+5)

theorem secondKernel_sparseE273 (n c r : ℕ) :
 secondKernelE273 n c r (2*r-c:ℕ) X (X^(n+1))=sparseKernelE273 n c r := by
 unfold secondKernelE273 sparseKernelE273
 dsimp [hKernelE273,kKernelE273,cKernelE273,dKernelE273]
 simp only [sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 push_cast
 simp only [map_add,map_mul,map_pow,map_neg,map_ofNat,map_natCast,map_one,map_zero]
 simp only [pow_add,pow_mul]
 ring

def chooseShiftE273 (j k : ℕ) : ℤ :=
 if k≤j then (Nat.choose (3+(j-k)) 3:ℤ) else 0
def fourthReadE273 (p : ℤ[X]) (j : ℕ) : ℤ :=
 PowerSeries.coeff j ((PowerSeries.mk (fun n => (Nat.choose (3+n) 3:ℤ)))*
   (p:PowerSeries ℤ))
theorem fourthRead_addE273 (p q : ℤ[X]) (j : ℕ) :
 fourthReadE273 (p+q) j=fourthReadE273 p j+fourthReadE273 q j := by
 simp [fourthReadE273,mul_add]
theorem fourthRead_monomialE273 (a : ℤ) (k j : ℕ) :
 fourthReadE273 (C a*X^k) j=a*chooseShiftE273 j k := by
 simp only [fourthReadE273,Polynomial.coe_mul,Polynomial.coe_C,
   Polynomial.coe_pow,Polynomial.coe_X,← mul_assoc,
   PowerSeries.coeff_mul_X_pow',PowerSeries.coeff_mul_C,PowerSeries.coeff_mk]
 unfold chooseShiftE273
 split_ifs <;> ring

theorem fourthRead_clearE273 (p q : ℤ[X]) (h : (1-X)^4*p=q) (j : ℕ) :
 p.coeff j=fourthReadE273 q j := by
 rw [coeff_of_fourth_differenceE273 p q h j]
 simp [fourthReadE273,PowerSeries.coeff_mul]

def secondExplicitE273 (n c r j : ℕ) : ℤ :=
 sparse00E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (0*(n+1)+0) +
 sparse01E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (0*(n+1)+1) +
 sparse02E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (0*(n+1)+2) +
 sparse03E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (0*(n+1)+3) +
 sparse04E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (0*(n+1)+4) +
 sparse05E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (0*(n+1)+5) +
 sparse06E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (0*(n+1)+6) +
 sparse11E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (1*(n+1)+1) +
 sparse12E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (1*(n+1)+2) +
 sparse13E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (1*(n+1)+3) +
 sparse14E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (1*(n+1)+4) +
 sparse15E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (1*(n+1)+5) +
 sparse21E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (2*(n+1)+1) +
 sparse22E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (2*(n+1)+2) +
 sparse23E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (2*(n+1)+3) +
 sparse24E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (2*(n+1)+4) +
 sparse25E273 n c r (2*r-c:ℕ)*chooseShiftE273 j (2*(n+1)+5) + if c=2 ∧ j=2*n+3 then 2 else 0

theorem secondCompressed_explicitE273 (n c r j : ℕ) :
 (secondCompressed446 n c r).coeff j=secondExplicitE273 n c r j := by
 have he := secondKernel_clearE273 n c r
 rw [secondKernel_sparseE273] at he
 have hh := fourthRead_clearE273 _ _ he j
 rw [fourthRead_addE273] at hh
 have hc : fourthReadE273 (if c=2 then 2*X^(2*n+3)*(1-X)^4 else 0) j=
   if c=2 ∧ j=2*n+3 then 2 else 0 := by
   by_cases h2 : c=2
   · rw [if_pos h2]
     have he' : (1-X)^4*(2*X^(2*n+3):ℤ[X])=2*X^(2*n+3)*(1-X)^4 := by ring
     rw [← fourthRead_clearE273 _ _ he' j]
     simp [h2,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]
   · simp [h2,fourthReadE273]
 rw [hc] at hh
 simpa only [sparseKernelE273,secondExplicitE273,fourthRead_addE273,
   fourthRead_monomialE273] using hh

theorem source_second_explicitE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2) :
 2*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 secondExplicitE273 n (frame rest).mid.b (frame rest).mid.a j := by
 rw [source_second_raw_compressed446 n rest i j hij,secondCompressed_explicitE273]

#print axioms secondKernel_sparseE273
#print axioms secondCompressed_explicitE273
#print axioms source_second_explicitE273
end
end MathGKM.Markov
