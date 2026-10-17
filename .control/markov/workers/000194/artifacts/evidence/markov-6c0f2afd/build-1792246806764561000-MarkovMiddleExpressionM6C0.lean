import MarkovDenseCertificateM6C0
/-! Machine-authored 6c0f2afd. Exact expression representation of the full
middle coefficient and gap, with the rational shift explicitly retained. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def exprSumM6C0 (f : ℕ → PolyExprM6C0) : ℕ → PolyExprM6C0
 | 0 => .c 0
 | n+1 => exprSumM6C0 f n +ₑ f n

theorem expr_sum_evalM6C0 (x k : ℚ) (f : ℕ → PolyExprM6C0) (n : ℕ) :
 exprEvalM6C0 x k (exprSumM6C0 f n)=∑ j ∈ range n, exprEvalM6C0 x k (f j) := by
 induction n with
 | zero => simp [exprSumM6C0,exprEvalM6C0]
 | succ n ih => simp [exprSumM6C0,exprEvalM6C0,sum_range_succ,ih]

def chooseExprM6C0 (e : PolyExprM6C0) : ℕ → PolyExprM6C0
 | 0 => .c 1
 | n+1 => (chooseExprM6C0 e n *ₑ (e +ₑ .c (-(n:ℚ)))) *ₑ .c ((n+1:ℚ)⁻¹)

theorem choose_expr_evalM6C0 (x k : ℚ) (e : PolyExprM6C0) (n : ℕ) :
 exprEvalM6C0 x k (chooseExprM6C0 e n)=choosePolyM0D3 (exprEvalM6C0 x k e) n := by
 induction n with
 | zero => simp [chooseExprM6C0,exprEvalM6C0,choose_poly_zeroM0D3]
 | succ n ih =>
   simp only [chooseExprM6C0,exprEvalM6C0,ih,choose_poly_succM0D3]
   rw [div_eq_mul_inv,sub_eq_add_neg]

def topExprM6C0 (d T : PolyExprM6C0) (i : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c ((i+l).choose i:ℚ) *ₑ
 chooseExprM6C0 (d +ₑ .c (2*i+8)) (i+3-l) *ₑ
 (chooseExprM6C0 T (i+l) +ₑ .c 4 *ₑ chooseExprM6C0 (T +ₑ .c 1) (i+l+2))) (i+4)

theorem top_expr_evalM6C0 (x k : ℚ) (d T : PolyExprM6C0) (i : ℕ) :
 exprEvalM6C0 x k (topExprM6C0 d T i)=
 topShortQMEB6 (exprEvalM6C0 x k d) (exprEvalM6C0 x k T) i := by
 simp only [topExprM6C0,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,topShortQMEB6]
 apply sum_congr rfl
 intro l hl
 congr 3
 ring

def kernelExprM6C0 (D k : PolyExprM6C0) (a b : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c ((a+l).choose a:ℚ) *ₑ
 chooseExprM6C0 (D +ₑ .c a) (b-l) *ₑ chooseExprM6C0 k (a+l+2)) (b+1)

theorem kernel_expr_evalM6C0 (x k : ℚ) (D t : PolyExprM6C0) (a b : ℕ) :
 exprEvalM6C0 x k (kernelExprM6C0 D t a b)=
 middleKernelQMF8D (exprEvalM6C0 x k D) (exprEvalM6C0 x k t) a b := by
 simp only [kernelExprM6C0,expr_sum_evalM6C0,exprEvalM6C0,
   choose_expr_evalM6C0,middleKernelQMF8D]

def correctionExprM6C0 (d k : PolyExprM6C0) (c : ℕ) (r : Bool) : PolyExprM6C0 :=
 .c 4 *ₑ (if r then
 kernelExprM6C0 (d +ₑ .c (c+4)) k c (c+1) +ₑ
 .c 2 *ₑ kernelExprM6C0 (d +ₑ .c (c+5)) k (c+1) (c+2) +ₑ
 kernelExprM6C0 (d +ₑ .c (c+4)) k (c+1) (c+2) +ₑ
 kernelExprM6C0 (d +ₑ .c (c+4)) k c (c+2) +ₑ
 kernelExprM6C0 (d +ₑ .c (c+5)) k c (c+2)
 else
 .c 2 *ₑ kernelExprM6C0 (d +ₑ .c (c+5)) k (c+1) (c+2) +ₑ
 kernelExprM6C0 (d +ₑ .c (c+5)) k c (c+1) +ₑ
 kernelExprM6C0 (d +ₑ .c (c+6)) k (c+1) (c+2) +ₑ
 kernelExprM6C0 (d +ₑ .c (c+5)) k c (c+2))

theorem correction_expr_evalM6C0 (x k : ℚ) (d t : PolyExprM6C0) (c : ℕ) (r : Bool) :
 exprEvalM6C0 x k (correctionExprM6C0 d t c r)=
 correctionQMF8D (exprEvalM6C0 x k d) (exprEvalM6C0 x k t) c r := by
 cases r <;> simp only [correctionExprM6C0,correctionQMF8D,
   Bool.false_eq_true,if_false,if_true,exprEvalM6C0,kernel_expr_evalM6C0]
 all_goals simp only [add_assoc]

def middleExprM6C0 (K : ℕ) (r : Bool) (c : ℕ) : PolyExprM6C0 :=
 let t := PolyExprM6C0.k +ₑ .c K
 topExprM6C0 .x (.x +ₑ .c 3 *ₑ t +ₑ .c (if r then 5 else 4)) c +ₑ
 correctionExprM6C0 (.x +ₑ .c (if r then 3 else 2)) t c r

theorem middle_expr_evalM6C0 (x k : ℚ) (K c : ℕ) (r : Bool) :
 exprEvalM6C0 x k (middleExprM6C0 K r c)=middleQMF8D x (k+K) r c := by
 simp only [middleExprM6C0,exprEvalM6C0,top_expr_evalM6C0,
   correction_expr_evalM6C0,middleQMF8D]

def middleGapExprM6C0 (K : ℕ) (r : Bool) (c : ℕ) : PolyExprM6C0 :=
 middleExprM6C0 K r (c+1) *ₑ middleExprM6C0 K r (c+1) +ₑ
 .c (-1) *ₑ (middleExprM6C0 K r c *ₑ middleExprM6C0 K r (c+2))

theorem middle_gap_expr_evalM6C0 (x k : ℚ) (K c : ℕ) (r : Bool) :
 exprEvalM6C0 x k (middleGapExprM6C0 K r c)=
 middleQMF8D x (k+K) r (c+1)^2-middleQMF8D x (k+K) r c*middleQMF8D x (k+K) r (c+2) := by
 simp only [middleGapExprM6C0,exprEvalM6C0,middle_expr_evalM6C0]
 ring

theorem middle_gap_dense_transferM6C0 (K c : ℕ) (r : Bool)
 (h : denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 K r c))) (x k : ℕ) :
 0 ≤ middleGapMD02 r c x (k+K) := by
 have hp := expr_nonneg_certificateM6C0 _ h (x:ℚ) (k:ℚ) (by positivity) (by positivity)
 rw [middle_gap_expr_evalM6C0] at hp
 rw [←Nat.cast_add,←middle_raw_castMF8D,←middle_raw_castMF8D,←middle_raw_castMF8D] at hp
 exact_mod_cast hp

end MathGKM.Markov
