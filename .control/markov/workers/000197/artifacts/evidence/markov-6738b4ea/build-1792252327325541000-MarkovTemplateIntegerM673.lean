import MarkovDenseIntegerM673
import MarkovMiddleNineteenM673
import MarkovMiddleIntegerPolyM9DB
/-! Machine-authored 6738b4ea. Factorial-cleared two-variable template
certificates. Scaling is proved positive and removed in the conclusion. -/
namespace MathGKM.Markov
open Finset Polynomial
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM673.add
local infixl:70 " *ₑ " => PolyExprM673.mul

def exprSumM673 (f : ℕ → PolyExprM673) : ℕ → PolyExprM673
 | 0 => .c 0
 | n+1 => exprSumM673 f n +ₑ f n

theorem expr_sum_evalM673 (x k : ℤ) (f : ℕ → PolyExprM673) (n : ℕ) :
 exprEvalM673 x k (exprSumM673 f n)=∑ j ∈ range n, exprEvalM673 x k (f j) := by
 induction n with
 | zero => simp [exprSumM673,exprEvalM673]
 | succ n ih => simp [exprSumM673,exprEvalM673,sum_range_succ,ih]

def fallingExprM673 (e : PolyExprM673) : ℕ → PolyExprM673
 | 0 => .c 1
 | n+1 => fallingExprM673 e n *ₑ (e +ₑ .c (-(n:ℤ)))

theorem falling_expr_evalM673 (x k : ℤ) (e : PolyExprM673) (n : ℕ) :
 exprEvalM673 x k (fallingExprM673 e n)=
 (descPochhammer ℤ n).eval (exprEvalM673 x k e) := by
 induction n with
 | zero => simp [fallingExprM673,exprEvalM673]
 | succ n ih =>
   simp only [fallingExprM673,exprEvalM673,ih,descPochhammer_succ_eval]
   ring

def productExprM673 (N a b : ℕ) (e f : PolyExprM673) : PolyExprM673 :=
 .c ((N.factorial/(a.factorial*b.factorial):ℕ):ℤ) *ₑ fallingExprM673 e a *ₑ fallingExprM673 f b

theorem product_expr_evalM673 (x k : ℤ) (e f : PolyExprM673) (u v N a b : ℕ)
 (hu : exprEvalM673 x k e=(u:ℤ)) (hv : exprEvalM673 x k f=(v:ℤ)) (hn : a+b ≤ N) :
 exprEvalM673 x k (productExprM673 N a b e f)=
 (N.factorial:ℤ)*(u.choose a:ℤ)*(v.choose b:ℤ) := by
 simp only [productExprM673,exprEvalM673,falling_expr_evalM673,hu,hv,
   descPochhammer_eval_eq_descFactorial]
 have hd : a.factorial*b.factorial ∣ N.factorial := by
   have h := Nat.factorial_mul_factorial_dvd_factorial (Nat.le_add_right a b)
   rw [Nat.add_sub_cancel_left] at h
   exact h.trans (Nat.factorial_dvd_factorial hn)
 have h : (N.factorial/(a.factorial*b.factorial))*u.descFactorial a*v.descFactorial b=
   N.factorial*u.choose a*v.choose b := by
   rw [Nat.descFactorial_eq_factorial_mul_choose,Nat.descFactorial_eq_factorial_mul_choose]
   calc
    _ = ((N.factorial/(a.factorial*b.factorial))*(a.factorial*b.factorial))*u.choose a*v.choose b := by ring
    _ = _ := by rw [Nat.div_mul_cancel hd]
 exact_mod_cast h

def topIntExprM673 (K c : ℕ) : PolyExprM673 :=
 exprSumM673 (fun l => .c ((c+l).choose c:ℤ) *ₑ
 (productExprM673 (2*c+5) (c+3-l) (c+l) (.x +ₑ .c (2*c+8)) (.k +ₑ .c K) +ₑ
 .c 4 *ₑ productExprM673 (2*c+5) (c+3-l) (c+l+2) (.x +ₑ .c (2*c+8)) (.k +ₑ .c (K+1)))) (c+4)

theorem top_int_expr_evalM673 (d t K c : ℕ) :
 exprEvalM673 d t (topIntExprM673 K c)=
 ((2*c+5).factorial:ℤ)*topShortSumMEB6 d (t+K) c := by
 simp only [topIntExprM673,expr_sum_evalM673,exprEvalM673,topShortSumMEB6,mul_sum]
 apply sum_congr rfl
 intro l hl
 have hl' : l ≤ c+3 := by have := mem_range.mp hl; omega
 rw [product_expr_evalM673 _ _ _ _ (d+2*c+8) (t+K) _ _ _
     (by simp [exprEvalM673]; push_cast; ring) (by simp [exprEvalM673]) (by omega),
   product_expr_evalM673 _ _ _ _ (d+2*c+8) (t+K+1) _ _ _
     (by simp [exprEvalM673]; push_cast; ring) (by simp [exprEvalM673]; push_cast; ring) (by omega)]
 ring

def templateGapExprM673 (c : ℕ) : PolyExprM673 :=
 .c (((c:ℤ)+4)*((2*c+5).factorial:ℤ)*((2*(c+2)+5).factorial:ℤ)) *ₑ
   topIntExprM673 (c+2) (c+1) *ₑ topIntExprM673 (c+2) (c+1) +ₑ
 .c (-(((c:ℤ)+5)*((2*(c+1)+5).factorial:ℤ)^2)) *ₑ
   topIntExprM673 (c+2) c *ₑ topIntExprM673 (c+2) (c+2)

theorem template_gap_expr_evalM673 (d t c : ℕ) :
 exprEvalM673 d t (templateGapExprM673 c)=integerGapScaleM9DB c*
 (((c:ℤ)+4)*topShortSumMEB6 d (t+(c+2)) (c+1)^2-
 ((c:ℤ)+5)*topShortSumMEB6 d (t+(c+2)) c*topShortSumMEB6 d (t+(c+2)) (c+2)) := by
 simp only [templateGapExprM673,exprEvalM673,top_int_expr_evalM673,integerGapScaleM9DB]
 ring

theorem template_integer_transferM673 (c : ℕ)
 (h : denseNonnegM673 (exprDenseM673 (templateGapExprM673 c))) (d T : ℕ) (hT : c+2 ≤ T) :
 ((c:ℤ)+5)*topMassM55C d T c*topMassM55C d T (c+2) ≤
 ((c:ℤ)+4)*topMassM55C d T (c+1)^2 := by
 have hp := expr_nonneg_certificateM673 _ h (d:ℤ) ((T-(c+2):ℕ):ℤ) (by positivity) (by positivity)
 rw [template_gap_expr_evalM673,Nat.sub_add_cancel hT] at hp
 have hh := (mul_nonneg_iff_of_pos_left (integer_gap_scale_positiveM9DB c)).mp hp
 simpa only [top_mass_short_sumMEB6,sub_nonneg] using hh
end MathGKM.Markov
