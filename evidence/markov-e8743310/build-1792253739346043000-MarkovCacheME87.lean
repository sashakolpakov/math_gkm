import MarkovTemplateFastM673
/-! Machine-authored e8743310. Compositional certificates for the existing
integer polynomial evaluator. Every computational premise is kernel checked. -/
namespace MathGKM.Markov
set_option maxHeartbeats 8000000

theorem cache_mulME87 (e f : PolyExprM673) (a b c : DenseZM673)
 (he : exprDenseM673 e=a) (hf : exprDenseM673 f=b)
 (h : denseZMulM673 a b=c) : exprDenseM673 (.mul e f)=c :=
 (congrArg₂ denseZMulM673 he hf).trans h

theorem cache_addME87 (e f : PolyExprM673) (a b c : DenseZM673)
 (he : exprDenseM673 e=a) (hf : exprDenseM673 f=b)
 (h : denseZAddM673 a b=c) : exprDenseM673 (.add e f)=c :=
 (congrArg₂ denseZAddM673 he hf).trans h

theorem cache_fallME87 (e : PolyExprM673) (n : ℕ) (a b c : DenseZM673)
 (he : exprDenseM673 (fallingExprM673 e n)=a)
 (hf : exprDenseM673 (.add e (.c (-(n:ℤ)) ))=b)
 (h : denseZMulM673 a b=c) : exprDenseM673 (fallingExprM673 e (n+1))=c :=
 cache_mulME87 _ _ _ _ _ he hf h

theorem cache_sumME87 (f : ℕ → PolyExprM673) (n : ℕ) (a b c : DenseZM673)
 (he : exprDenseM673 (exprSumM673 f n)=a)
 (hf : exprDenseM673 (f n)=b) (h : denseZAddM673 a b=c) :
 exprDenseM673 (exprSumM673 f (n+1))=c := cache_addME87 _ _ _ _ _ he hf h

end MathGKM.Markov
