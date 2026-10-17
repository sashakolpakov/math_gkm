import MarkovTemplateIntegerM673
/-! Machine-authored 6738b4ea. Proved computational representation change
for kernel certificates; no native evaluation. -/
namespace MathGKM.Markov
local infixl:65 " +ₑ " => PolyExprM673.add
local infixl:70 " *ₑ " => PolyExprM673.mul
def topFastExprM673 (K c : ℕ) : PolyExprM673 :=
 exprSumM673 (fun l => .c (Nat.fast_choose (c+l) c:ℤ) *ₑ
 (productExprM673 (2*c+5) (c+3-l) (c+l) (.x +ₑ .c (2*c+8)) (.k +ₑ .c K) +ₑ
 .c 4 *ₑ productExprM673 (2*c+5) (c+3-l) (c+l+2) (.x +ₑ .c (2*c+8)) (.k +ₑ .c (K+1)))) (c+4)
theorem top_int_fastM673 (K c : ℕ) : topIntExprM673 K c=topFastExprM673 K c := by
 simp only [topIntExprM673,topFastExprM673,Nat.choose_eq_fast_choose]
end MathGKM.Markov
