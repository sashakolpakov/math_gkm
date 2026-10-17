import MarkovMiddleDiscreteMD02
/-! Machine-authored f8d0715b. Rational polynomial representation used only
with an explicit natural-parameter bridge; no fractional LC assumption. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def middleKernelQMF8D (D k : ℚ) (a b : ℕ) : ℚ :=
 ∑ l ∈ range (b+1), ((a+l).choose a:ℚ)*choosePolyM0D3 (D+a) (b-l)*
   choosePolyM0D3 k (a+l+2)

theorem middle_kernel_castMF8D (D k a b : ℕ) :
 (middleKernelMD02 D k a b:ℚ)=middleKernelQMF8D D k a b := by
 simp only [middleKernelMD02,middleKernelQMF8D,Int.cast_sum,Int.cast_mul,
   Int.cast_natCast,←Nat.cast_add,choose_poly_natM0D3]

def correctionQMF8D (d k : ℚ) (c : ℕ) (r : Bool) : ℚ :=
 4*(if r then
 middleKernelQMF8D (d+c+4) k c (c+1)+
 2*middleKernelQMF8D (d+c+5) k (c+1) (c+2)+
 middleKernelQMF8D (d+c+4) k (c+1) (c+2)+
 middleKernelQMF8D (d+c+4) k c (c+2)+middleKernelQMF8D (d+c+5) k c (c+2)
 else
 2*middleKernelQMF8D (d+c+5) k (c+1) (c+2)+
 middleKernelQMF8D (d+c+5) k c (c+1)+
 middleKernelQMF8D (d+c+6) k (c+1) (c+2)+middleKernelQMF8D (d+c+5) k c (c+2))

theorem correction_castMF8D (d k c : ℕ) (r : Bool) :
 (correctionShortMD02 d k c r:ℚ)=correctionQMF8D d k c r := by
 cases r <;> simp only [correctionShortMD02,correctionQMF8D,Bool.false_eq_true,
   if_false,if_true,Int.cast_mul,Int.cast_add,Int.cast_ofNat,middle_kernel_castMF8D,
   Nat.cast_add,Nat.cast_ofNat]

def middleQMF8D (x k : ℚ) (r : Bool) (c : ℕ) : ℚ :=
 topShortQMEB6 x (x+3*k+(if r then 5 else 4)) c+
 correctionQMF8D (x+(if r then 3 else 2)) k c r

theorem middle_raw_castMF8D (x k c : ℕ) (r : Bool) :
 (middleRawMD02 x k r c:ℚ)=middleQMF8D x k r c := by
 have hs (d T i : ℕ) : (topShortSumMEB6 d T i:ℚ)=topShortQMEB6 d T i := by
   rw [←top_mass_short_sumMEB6,top_short_castMEB6]
 cases r <;> simp only [middleRawMD02,middleQMF8D,middleBaseMD02,
   Bool.false_eq_true,if_false,if_true,Int.cast_add,hs,correction_castMF8D,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat]
 · rw [show x+4-2=x+2 by omega]
   norm_cast
 · rw [show x+5-2=x+3 by omega]
   norm_cast

theorem middle_q_positive_transferMF8D (r : Bool) (c : ℕ)
 (h : ∀ x k : ℚ, 0 ≤ x → 0 ≤ k →
 middleQMF8D x k r c*middleQMF8D x k r (c+2) < middleQMF8D x k r (c+1)^2)
 (x k : ℕ) : 0 < middleGapMD02 r c x k := by
 have hh := h x k (by positivity) (by positivity)
 rw [←middle_raw_castMF8D,←middle_raw_castMF8D,←middle_raw_castMF8D] at hh
 have hi : middleRawMD02 x k r c*middleRawMD02 x k r (c+2) <
   middleRawMD02 x k r (c+1)^2 := by exact_mod_cast hh
 exact sub_pos.mpr hi

end
end MathGKM.Markov
