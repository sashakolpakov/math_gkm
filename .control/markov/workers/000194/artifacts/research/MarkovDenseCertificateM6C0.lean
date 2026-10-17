import MarkovMiddleRationalMF8D
/-! Machine-authored 6c0f2afd. Computational dense polynomial certificates.
Every sign certificate is checked by ordinary kernel reduction. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000

def denseAddM6C0 {α : Type} (add : α → α → α) : List α → List α → List α
 | [], q => q
 | p, [] => p
 | a::p, b::q => add a b :: denseAddM6C0 add p q

def denseMulM6C0 {α : Type} (zero : α) (add mul : α → α → α) :
 List α → List α → List α
 | [], _ => []
 | a::p, q => denseAddM6C0 add (q.map (mul a))
     (zero :: denseMulM6C0 zero add mul p q)

def denseEvalM6C0 {α : Type} (f : α → ℚ) (x : ℚ) : List α → ℚ
 | [] => 0
 | a::p => f a + x*denseEvalM6C0 f x p

theorem dense_eval_addM6C0 {α : Type} (add : α → α → α)
 (f : α → ℚ) (hf : ∀ a b, f (add a b)=f a+f b) (x : ℚ) (p q : List α) :
 denseEvalM6C0 f x (denseAddM6C0 add p q)=
 denseEvalM6C0 f x p+denseEvalM6C0 f x q := by
 induction p generalizing q with
 | nil => simp [denseAddM6C0,denseEvalM6C0]
 | cons a p ih =>
   cases q with
   | nil => simp [denseAddM6C0,denseEvalM6C0]
   | cons b q => simp only [denseAddM6C0,denseEvalM6C0,hf,ih]; ring

theorem dense_eval_mapM6C0 {α : Type} (mul : α → α → α)
 (f : α → ℚ) (hf : ∀ a b, f (mul a b)=f a*f b) (x : ℚ) (a : α) (p : List α) :
 denseEvalM6C0 f x (p.map (mul a))=f a*denseEvalM6C0 f x p := by
 induction p with
 | nil => simp [denseEvalM6C0]
 | cons b p ih => simp only [List.map_cons,denseEvalM6C0,hf,ih]; ring

theorem dense_eval_mulM6C0 {α : Type} (zero : α) (add mul : α → α → α)
 (f : α → ℚ) (h0 : f zero=0) (ha : ∀ a b, f (add a b)=f a+f b)
 (hm : ∀ a b, f (mul a b)=f a*f b) (x : ℚ) (p q : List α) :
 denseEvalM6C0 f x (denseMulM6C0 zero add mul p q)=
 denseEvalM6C0 f x p*denseEvalM6C0 f x q := by
 induction p with
 | nil => simp [denseMulM6C0,denseEvalM6C0]
 | cons a p ih =>
   rw [denseMulM6C0,dense_eval_addM6C0 add f ha,
     dense_eval_mapM6C0 mul f hm]
   simp only [denseEvalM6C0,h0,ih]
   ring

abbrev DenseQM6C0 := List (List ℚ)
def denseQAddM6C0 : DenseQM6C0 → DenseQM6C0 → DenseQM6C0 :=
 denseAddM6C0 (denseAddM6C0 (·+·))
def denseQMulM6C0 : DenseQM6C0 → DenseQM6C0 → DenseQM6C0 :=
 denseMulM6C0 [] (denseAddM6C0 (·+·)) (denseMulM6C0 0 (·+·) (·*·))
def denseQEvalM6C0 (x k : ℚ) (p : DenseQM6C0) : ℚ :=
 denseEvalM6C0 (denseEvalM6C0 id k) x p

theorem dense_q_eval_addM6C0 (x k : ℚ) (p q : DenseQM6C0) :
 denseQEvalM6C0 x k (denseQAddM6C0 p q)=denseQEvalM6C0 x k p+denseQEvalM6C0 x k q := by
 apply dense_eval_addM6C0
 intro a b
 exact dense_eval_addM6C0 (·+·) id (by intros; rfl) k a b

theorem dense_q_eval_mulM6C0 (x k : ℚ) (p q : DenseQM6C0) :
 denseQEvalM6C0 x k (denseQMulM6C0 p q)=denseQEvalM6C0 x k p*denseQEvalM6C0 x k q := by
 apply dense_eval_mulM6C0
 · rfl
 · intro a b; exact dense_eval_addM6C0 (·+·) id (by intros; rfl) k a b
 · intro a b; exact dense_eval_mulM6C0 0 (·+·) (·*·) id rfl
     (by intros; rfl) (by intros; rfl) k a b

inductive PolyExprM6C0 where
 | c : ℚ → PolyExprM6C0
 | x : PolyExprM6C0
 | k : PolyExprM6C0
 | add : PolyExprM6C0 → PolyExprM6C0 → PolyExprM6C0
 | mul : PolyExprM6C0 → PolyExprM6C0 → PolyExprM6C0

def exprEvalM6C0 (x k : ℚ) : PolyExprM6C0 → ℚ
 | .c a => a
 | .x => x
 | .k => k
 | .add a b => exprEvalM6C0 x k a+exprEvalM6C0 x k b
 | .mul a b => exprEvalM6C0 x k a*exprEvalM6C0 x k b

def exprDenseM6C0 : PolyExprM6C0 → DenseQM6C0
 | .c a => [[a]]
 | .x => [[],[1]]
 | .k => [[0,1]]
 | .add a b => denseQAddM6C0 (exprDenseM6C0 a) (exprDenseM6C0 b)
 | .mul a b => denseQMulM6C0 (exprDenseM6C0 a) (exprDenseM6C0 b)

theorem expr_dense_correctM6C0 (x k : ℚ) (e : PolyExprM6C0) :
 denseQEvalM6C0 x k (exprDenseM6C0 e)=exprEvalM6C0 x k e := by
 induction e with
 | c a => simp [exprDenseM6C0,denseQEvalM6C0,denseEvalM6C0,exprEvalM6C0]
 | x => simp [exprDenseM6C0,denseQEvalM6C0,denseEvalM6C0,exprEvalM6C0]
 | k => simp [exprDenseM6C0,denseQEvalM6C0,denseEvalM6C0,exprEvalM6C0]
 | add a b ha hb => simp only [exprDenseM6C0,dense_q_eval_addM6C0,ha,hb,exprEvalM6C0]
 | mul a b ha hb => simp only [exprDenseM6C0,dense_q_eval_mulM6C0,ha,hb,exprEvalM6C0]

def denseNonnegM6C0 (p : DenseQM6C0) : Prop :=
 ∀ a ∈ p, ∀ b ∈ a, 0 ≤ b

instance (p : DenseQM6C0) : Decidable (denseNonnegM6C0 p) :=
 inferInstanceAs (Decidable (∀ a ∈ p, ∀ b ∈ a, 0 ≤ b))

theorem dense_eval_nonnegM6C0 {α : Type} (f : α → ℚ) (x : ℚ) (p : List α)
 (hx : 0 ≤ x) (hp : ∀ a ∈ p, 0 ≤ f a) : 0 ≤ denseEvalM6C0 f x p := by
 induction p with
 | nil => rfl
 | cons a p ih =>
   simp only [denseEvalM6C0]
   exact add_nonneg (hp a (by simp)) (mul_nonneg hx
     (ih (fun b hb => hp b (by simp [hb]))))

theorem expr_nonneg_certificateM6C0 (e : PolyExprM6C0)
 (h : denseNonnegM6C0 (exprDenseM6C0 e)) (x k : ℚ) (hx : 0 ≤ x) (hk : 0 ≤ k) :
 0 ≤ exprEvalM6C0 x k e := by
 rw [←expr_dense_correctM6C0]
 apply dense_eval_nonnegM6C0 _ _ _ hx
 intro a ha
 exact dense_eval_nonnegM6C0 id k a hk (h a ha)

end MathGKM.Markov
