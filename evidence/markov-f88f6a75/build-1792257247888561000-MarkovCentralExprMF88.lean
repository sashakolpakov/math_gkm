import MarkovCentralRationalME10
import MarkovUnivariateCertificateM9DB
/-! Machine-authored f88f6a75. Exact univariate representation of central
raw coefficients; constant binomial factors use the proved fast computation. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def centralTopExprMF88 (h : ℕ) (T : PolyExprM6C0) (c : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c ((Nat.fast_choose (c+l) c : ℚ)*
   (Nat.fast_choose (h+2*c+4) (c+3-l) : ℚ)) *ₑ
   (chooseExprM6C0 T (c+l) +ₑ .c 4 *ₑ chooseExprM6C0 (T +ₑ .c 1) (c+l+2))) (c+4)

theorem central_top_expr_evalMF88 (x y : ℚ) (h c : ℕ) (T : PolyExprM6C0) :
 exprEvalM6C0 x y (centralTopExprMF88 h T c)=topShortQME10 h (exprEvalM6C0 x y T) c := by
 simp only [centralTopExprMF88,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,
   topShortQME10,←Nat.choose_eq_fast_choose]
 apply sum_congr rfl
 intro l hl
 have he : (h:ℚ)+2*c+4=((h+2*c+4:ℕ):ℚ) := by push_cast; ring
 simp only [he,←choose_poly_natM0D3]

def centralKernelExprMF88 (D : ℕ) (t : PolyExprM6C0) (a b : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c ((Nat.fast_choose (a+l) a:ℚ)*
   (Nat.fast_choose (D+a) (b-l):ℚ)) *ₑ chooseExprM6C0 t (a+l+2)) (b+1)

theorem central_kernel_expr_evalMF88 (x y : ℚ) (D a b : ℕ) (t : PolyExprM6C0) :
 exprEvalM6C0 x y (centralKernelExprMF88 D t a b)=middleKernelQMF8D D (exprEvalM6C0 x y t) a b := by
 simp only [centralKernelExprMF88,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,
   middleKernelQMF8D,←Nat.choose_eq_fast_choose,←Nat.cast_add,choose_poly_natM0D3]

def centralCorrectionExprMF88 (e : ℕ) (t : PolyExprM6C0) (c : ℕ) (r : Bool) : PolyExprM6C0 :=
 .c 4 *ₑ (if r then
 centralKernelExprMF88 (e+c+2) t c (c+1) +ₑ
 .c 2 *ₑ centralKernelExprMF88 (e+c+3) t (c+1) (c+2) +ₑ
 centralKernelExprMF88 (e+c+2) t (c+1) (c+2) +ₑ
 centralKernelExprMF88 (e+c+2) t c (c+2) +ₑ centralKernelExprMF88 (e+c+3) t c (c+2)
 else
 .c 2 *ₑ centralKernelExprMF88 (e+c+3) t (c+1) (c+2) +ₑ
 centralKernelExprMF88 (e+c+3) t c (c+1) +ₑ
 centralKernelExprMF88 (e+c+4) t (c+1) (c+2) +ₑ centralKernelExprMF88 (e+c+3) t c (c+2))

theorem central_correction_expr_evalMF88 (x y : ℚ) (e c : ℕ) (t : PolyExprM6C0) (r : Bool) :
 exprEvalM6C0 x y (centralCorrectionExprMF88 e t c r)=correctionShortQME10 e (exprEvalM6C0 x y t) c r := by
 cases r <;> simp [centralCorrectionExprMF88,correctionShortQME10,exprEvalM6C0,
   central_kernel_expr_evalMF88,Nat.cast_add]

def centralExprMF88 (h K c : ℕ) (r : Bool) : PolyExprM6C0 :=
 let t := PolyExprM6C0.x +ₑ .c K
 centralTopExprMF88 h (.c 3 *ₑ t +ₑ .c (h+(if r then 1 else 0))) c +ₑ
 centralCorrectionExprMF88 (h+(if r then 1 else 0)) t c r

theorem central_expr_evalMF88 (x y : ℚ) (h K c : ℕ) (r : Bool) :
 exprEvalM6C0 x y (centralExprMF88 h K c r)=centralQValueME10 h (x+K) c r := by
 cases r <;> simp [centralExprMF88,centralQValueME10,exprEvalM6C0,
   central_top_expr_evalMF88,central_correction_expr_evalMF88,Nat.cast_add,add_assoc]

def centralGapExprMF88 (h K c : ℕ) (r : Bool) : PolyExprM6C0 :=
 centralExprMF88 h K (c+1) r *ₑ centralExprMF88 h K (c+1) r +ₑ
 .c (-1) *ₑ (centralExprMF88 h K c r *ₑ centralExprMF88 h K (c+2) r)

theorem central_gap_expr_evalMF88 (x : ℚ) (h K c : ℕ) (r : Bool) :
 exprEvalM6C0 x 0 (centralGapExprMF88 h K c r)=
 centralQValueME10 h (x+K) (c+1) r^2-
 centralQValueME10 h (x+K) c r*centralQValueME10 h (x+K) (c+2) r := by
 simp only [centralGapExprMF88,exprEvalM6C0,central_expr_evalMF88]
 ring

theorem central_certificate_transferMF88 (h K c k : ℕ) (r : Bool)
 (hp : oneNonnegM9DB (centralGapExprMF88 h K c r)) (hk : K ≤ k) :
 centralRawME10 h k c r*centralRawME10 h k (c+2) r ≤ centralRawME10 h k (c+1) r^2 := by
 have he := one_nonneg_evalM9DB _ hp ((k-K:ℕ):ℚ) (by positivity)
 rw [central_gap_expr_evalMF88,←Nat.cast_add,Nat.sub_add_cancel hk] at he
 rw [←central_raw_castME10,←central_raw_castME10,←central_raw_castME10] at he
 have hh : (centralRawME10 h k c r:ℚ)*centralRawME10 h k (c+2) r ≤
   (centralRawME10 h k (c+1) r:ℚ)^2 := sub_nonneg.mp he
 exact_mod_cast hh

end MathGKM.Markov
