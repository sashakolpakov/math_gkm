import MarkovMiddleFixedDepthM6C0
/-! Machine-authored 9db2326d. Exact one-variable certificates with constant
folding. This changes the checking representation, not the raw coefficients. -/
namespace MathGKM.Markov
set_option maxHeartbeats 8000000

def exprAddM9DB : PolyExprM6C0 → PolyExprM6C0 → PolyExprM6C0
 | .c a, .c b => .c (a+b)
 | .c a, b => if a=0 then b else .add (.c a) b
 | a, .c b => if b=0 then a else .add a (.c b)
 | a,b => .add a b

def exprMulM9DB : PolyExprM6C0 → PolyExprM6C0 → PolyExprM6C0
 | .c a, .c b => .c (a*b)
 | .c a, b => if a=0 then .c 0 else if a=1 then b else .mul (.c a) b
 | a, .c b => if b=0 then .c 0 else if b=1 then a else .mul a (.c b)
 | a,b => .mul a b

theorem expr_add_evalM9DB (x k : ℚ) (a b : PolyExprM6C0) :
 exprEvalM6C0 x k (exprAddM9DB a b)=exprEvalM6C0 x k a+exprEvalM6C0 x k b := by
 cases a <;> cases b <;> simp [exprAddM9DB,exprEvalM6C0]
 all_goals split_ifs <;> simp_all [exprEvalM6C0]

theorem expr_mul_evalM9DB (x k : ℚ) (a b : PolyExprM6C0) :
 exprEvalM6C0 x k (exprMulM9DB a b)=exprEvalM6C0 x k a*exprEvalM6C0 x k b := by
 cases a <;> cases b <;> simp [exprMulM9DB,exprEvalM6C0]
 all_goals split_ifs <;> simp_all [exprEvalM6C0]

def exprFoldM9DB : PolyExprM6C0 → PolyExprM6C0
 | .c a => .c a
 | .x => .x
 | .k => .k
 | .add a b => exprAddM9DB (exprFoldM9DB a) (exprFoldM9DB b)
 | .mul a b => exprMulM9DB (exprFoldM9DB a) (exprFoldM9DB b)

theorem expr_fold_evalM9DB (x k : ℚ) (e : PolyExprM6C0) :
 exprEvalM6C0 x k (exprFoldM9DB e)=exprEvalM6C0 x k e := by
 induction e <;> simp_all [exprFoldM9DB,exprEvalM6C0,expr_add_evalM9DB,expr_mul_evalM9DB]

def exprOneM9DB : PolyExprM6C0 → List ℚ
 | .c a => [a]
 | .x => [0,1]
 | .k => []
 | .add a b => denseAddM6C0 (·+·) (exprOneM9DB a) (exprOneM9DB b)
 | .mul a b => denseMulM6C0 0 (·+·) (·*·) (exprOneM9DB a) (exprOneM9DB b)

theorem expr_one_evalM9DB (x : ℚ) (e : PolyExprM6C0) :
 denseEvalM6C0 id x (exprOneM9DB e)=exprEvalM6C0 x 0 e := by
 induction e with
 | c a => simp [exprOneM9DB,denseEvalM6C0,exprEvalM6C0]
 | x => simp [exprOneM9DB,denseEvalM6C0,exprEvalM6C0]
 | k => rfl
 | add a b ha hb =>
   rw [exprOneM9DB,dense_eval_addM6C0 (·+·) id (by intros; rfl),ha,hb]
   rfl
 | mul a b ha hb =>
   rw [exprOneM9DB,dense_eval_mulM6C0 0 (·+·) (·*·) id rfl
     (by intros; rfl) (by intros; rfl),ha,hb]
   rfl

def oneNonnegM9DB (e : PolyExprM6C0) : Prop :=
 ∀ a ∈ exprOneM9DB (exprFoldM9DB e), 0 ≤ a

instance (e : PolyExprM6C0) : Decidable (oneNonnegM9DB e) :=
 inferInstanceAs (Decidable (∀ a ∈ exprOneM9DB (exprFoldM9DB e), 0 ≤ a))

theorem one_nonneg_evalM9DB (e : PolyExprM6C0) (h : oneNonnegM9DB e)
 (x : ℚ) (hx : 0 ≤ x) : 0 ≤ exprEvalM6C0 x 0 e := by
 rw [←expr_fold_evalM9DB,←expr_one_evalM9DB]
 exact dense_eval_nonnegM6C0 id x _ hx h

theorem fixed_two_one_transferM9DB (c : ℕ) (r : Bool)
 (h : oneNonnegM9DB (fixedTwoExprM6C0 c r)) (x : ℕ) :
 0 ≤ middleGapMD02 r c x 2 := by
 by_cases hx : fixedTwoShiftM6C0 c r ≤ x
 · have hp := one_nonneg_evalM9DB _ h ((x-fixedTwoShiftM6C0 c r:ℕ):ℚ) (by positivity)
   rw [fixed_two_evalM6C0,←Nat.cast_add,Nat.sub_add_cancel hx] at hp
   have he (j : ℕ) := middle_raw_castMF8D x 2 j r
   norm_num only [Nat.cast_ofNat] at he
   rw [←he (c+1),←he c,←he (c+2)] at hp
   change 0 ≤ middleRawMD02 x 2 r (c+1)^2-
     middleRawMD02 x 2 r c*middleRawMD02 x 2 r (c+2)
   exact_mod_cast hp
 · have hxt : x+3*2+middleBaseMD02 r < c+2 := by
     unfold fixedTwoShiftM6C0 at hx
     omega
   have hz : middleRawMD02 x 2 r (c+2)=0 := by
     rw [middleRawMD02,correction_short_zeroMD02 _ _ _ r (by omega),add_zero,
       ←top_mass_short_sumMEB6,top_mass_zeroM55C _ _ _ hxt]
   rw [middleGapMD02,hz,mul_zero,sub_zero]
   exact sq_nonneg _

end MathGKM.Markov
