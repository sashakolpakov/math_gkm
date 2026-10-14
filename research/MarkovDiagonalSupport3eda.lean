import MarkovSaturation3eda
/-! Machine-authored request 3edac4bf. Interval support and CrossLC transport
for every raw diagonal, including the lower half and zero extension. -/
namespace MathGKM.Markov
noncomputable section

def rawDiagonal3eda (path : List Bool) (n k : ℕ) : ℤ :=
 if k≤n then coeff (frame path).mid.p k (n-k) else 0

theorem rawDiagonal_nonneg3eda (path : List Bool) (n k : ℕ) :
 0≤rawDiagonal3eda path n k := by
 unfold rawDiagonal3eda
 split_ifs
 · exact raw_coeff_nonneg18 path _ _
 · exact le_rfl

theorem rawDiagonal_interval_nat3eda (path : List Bool) (n i k l : ℕ)
 (hik : i≤k) (hkl : k≤l) (hi : 0<rawDiagonal3eda path n i)
 (hl : 0<rawDiagonal3eda path n l) : 0<rawDiagonal3eda path n k := by
 have hin : i≤n := by by_contra h; simp [rawDiagonal3eda,h] at hi
 have hln : l≤n := by by_contra h; simp [rawDiagonal3eda,h] at hl
 have hkn : k≤n := by omega
 simp only [rawDiagonal3eda,hin,hln,hkn,if_true] at hi hl ⊢
 have hp := (source_positive_iff_polygon3eda path i (n-i)).mp hi
 apply source_saturated3eda
 constructor
 · have hab := (frame_reduced path).2.1
   have hiadd : i+(n-i)=n := by omega
   have hkadd : k+(n-k)=n := by omega
   have hdiff : 0≤((frame path).mid.b-(frame path).mid.a)*(k-i) := Nat.zero_le _
   have hmul := Nat.mul_le_mul_left ((frame path).mid.b-(frame path).mid.a) hik
   have hba : (frame path).mid.b-(frame path).mid.a+(frame path).mid.a=(frame path).mid.b := by omega
   nlinarith [hp.1]
 · have h := hp.2
   omega

theorem rawDiagonal_interval3eda (path : List Bool) (n : ℕ) :
 IntervalSupport774 (zeroSeq725 (rawDiagonal3eda path n)) :=
 zeroSeq_interval725 _ (rawDiagonal_interval_nat3eda path n)

theorem rawDiagonal_cross_iff3eda (path : List Bool) (n : ℕ) :
 CrossLC (zeroSeq725 (rawDiagonal3eda path n)) ↔
 ∀ k, rawDiagonal3eda path n k*rawDiagonal3eda path n (k+2)≤
   rawDiagonal3eda path n (k+1)^2 :=
 zeroSeq_cross_iff725 _ (rawDiagonal_nonneg3eda path n) (rawDiagonal_interval3eda path n)

#print axioms rawDiagonal_interval3eda
#print axioms rawDiagonal_cross_iff3eda
end
end MathGKM.Markov
