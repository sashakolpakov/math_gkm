import MarkovSecondOnsetSourceM5DC
/-! Machine-authored request 2532cf40. Scalar presentation retains the common raw scale. -/
namespace MathGKM.Markov
noncomputable section
def onsetCorrectionM253 (n c r q : ℤ) (k : ℕ) : ℤ :=
 match k with
 | 1 => h2Corr1M5DC n c r q
 | 2 => h2Corr2M5DC n c r q
 | 3 => h2Corr3M5DC n c r q
 | 4 => h2Corr4M5DC n c r q
 | 5 => h2Corr5M5DC n c r q
 | _ => 0
def onsetScalarLowM253 (n c r q : ℤ) (k : ℕ) : ℤ :=
 middleShape0M722 n c r (2*n+k)+onsetCorrectionM253 n c r q k
def onsetScalarHighM253 (n c r q : ℤ) (k : ℕ) : ℤ :=
 middleShape3M722 n c r (2*n+k)+onsetCorrectionM253 n c r q k

theorem secondOnset_lowM253 (n c r k : ℕ) (hl : 2*r<c) :
 secondOnsetValueM5DC n c r k = onsetScalarLowM253 n c r 0 k := by
 have hq : 2*r-c=0 := by omega
 have hh : 2*(r:ℤ)<(c:ℤ) := by omega
 unfold secondOnsetValueM5DC onsetScalarLowM253 middleRawValueM722 onsetCorrectionM253
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,if_pos hh,hq,Nat.cast_zero]
 split <;> rfl

theorem secondOnset_highM253 (n c r k : ℕ) (hl : c≤2*r) :
 secondOnsetValueM5DC n c r k = onsetScalarHighM253 n c r (2*r-c) k := by
 have hq : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have hh : ¬2*(r:ℤ)<(c:ℤ) := by omega
 unfold secondOnsetValueM5DC onsetScalarHighM253 middleRawValueM722 onsetCorrectionM253
 simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,if_neg hh,hq]
 split <;> rfl
end
end MathGKM.Markov
