import MarkovCentralHighME10
import MarkovMiddleRationalMF8D
/-! Machine-authored e108e0e2. Exact rational representation of shifted
integer source coefficients. No nonintegral log-concavity premise. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def topShortQME10 (h T : ℚ) (c : ℕ) : ℚ :=
 ∑ l ∈ range (c+4), ((c+l).choose c:ℚ)*choosePolyM0D3 (h+2*c+4) (c+3-l)*
 (choosePolyM0D3 T (c+l)+4*choosePolyM0D3 (T+1) (c+l+2))

def correctionShortQME10 (e k : ℚ) (c : ℕ) (r : Bool) : ℚ :=
 4*(if r then
 middleKernelQMF8D (e+c+2) k c (c+1)+
 2*middleKernelQMF8D (e+c+3) k (c+1) (c+2)+
 middleKernelQMF8D (e+c+2) k (c+1) (c+2)+
 middleKernelQMF8D (e+c+2) k c (c+2)+middleKernelQMF8D (e+c+3) k c (c+2)
 else
 2*middleKernelQMF8D (e+c+3) k (c+1) (c+2)+
 middleKernelQMF8D (e+c+3) k c (c+1)+
 middleKernelQMF8D (e+c+4) k (c+1) (c+2)+middleKernelQMF8D (e+c+3) k c (c+2))

def centralQValueME10 (h k : ℚ) (c : ℕ) (r : Bool) : ℚ :=
 topShortQME10 h (3*k+h+(if r then 1 else 0)) c+
 correctionShortQME10 (h+(if r then 1 else 0)) k c r

theorem top_short_castME10 (h T c : ℕ) :
 (topShortME10 h T c:ℚ)=topShortQME10 h T c := by
 simp only [topShortME10,topShortQME10,Int.cast_sum,Int.cast_mul,Int.cast_add,
   Int.cast_natCast,Int.cast_ofNat,choose_poly_natM0D3,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one]

theorem correction_short_castME10 (e k c : ℕ) (r : Bool) :
 (correctionShortME10 e k c r:ℚ)=correctionShortQME10 e k c r := by
 cases r <;> simp only [correctionShortME10,correctionShortQME10,Bool.false_eq_true,
   if_false,if_true,Int.cast_mul,Int.cast_add,Int.cast_ofNat,middle_kernel_castMF8D,
   Nat.cast_add,Nat.cast_ofNat]

theorem central_raw_castME10 (h k c : ℕ) (r : Bool) :
 (centralRawME10 h k c r:ℚ)=centralQValueME10 h k c r := by
 cases r <;> simp only [centralRawME10,centralQValueME10,centralTME10,Bool.false_eq_true,
   if_false,if_true,Int.cast_add,top_short_castME10,correction_short_castME10,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero]

end
end MathGKM.Markov
