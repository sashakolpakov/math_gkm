import MarkovIntegerPolynomialM9DB
/-! Machine-authored 6738b4ea. Computational dense polynomial certificates.
Every sign certificate is checked by ordinary kernel reduction. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000

def denseAddM673 {α : Type} (add : α → α → α) : List α → List α → List α
 | [], q => q
 | p, [] => p
 | a::p, b::q => add a b :: denseAddM673 add p q

def denseMulM673 {α : Type} (zero : α) (add mul : α → α → α) :
 List α → List α → List α
 | [], _ => []
 | a::p, q => denseAddM673 add (q.map (mul a))
     (zero :: denseMulM673 zero add mul p q)

def denseEvalM673 {α : Type} (f : α → ℤ) (x : ℤ) : List α → ℤ
 | [] => 0
 | a::p => f a + x*denseEvalM673 f x p

theorem dense_eval_addM673 {α : Type} (add : α → α → α)
 (f : α → ℤ) (hf : ∀ a b, f (add a b)=f a+f b) (x : ℤ) (p q : List α) :
 denseEvalM673 f x (denseAddM673 add p q)=
 denseEvalM673 f x p+denseEvalM673 f x q := by
 induction p generalizing q with
 | nil => simp [denseAddM673,denseEvalM673]
 | cons a p ih =>
   cases q with
   | nil => simp [denseAddM673,denseEvalM673]
   | cons b q => simp only [denseAddM673,denseEvalM673,hf,ih]; ring

theorem dense_eval_mapM673 {α : Type} (mul : α → α → α)
 (f : α → ℤ) (hf : ∀ a b, f (mul a b)=f a*f b) (x : ℤ) (a : α) (p : List α) :
 denseEvalM673 f x (p.map (mul a))=f a*denseEvalM673 f x p := by
 induction p with
 | nil => simp [denseEvalM673]
 | cons b p ih => simp only [List.map_cons,denseEvalM673,hf,ih]; ring

theorem dense_eval_mulM673 {α : Type} (zero : α) (add mul : α → α → α)
 (f : α → ℤ) (h0 : f zero=0) (ha : ∀ a b, f (add a b)=f a+f b)
 (hm : ∀ a b, f (mul a b)=f a*f b) (x : ℤ) (p q : List α) :
 denseEvalM673 f x (denseMulM673 zero add mul p q)=
 denseEvalM673 f x p*denseEvalM673 f x q := by
 induction p with
 | nil => simp [denseMulM673,denseEvalM673]
 | cons a p ih =>
   rw [denseMulM673,dense_eval_addM673 add f ha,
     dense_eval_mapM673 mul f hm]
   simp only [denseEvalM673,h0,ih]
   ring

abbrev DenseZM673 := List (List ℤ)
def denseZAddM673 : DenseZM673 → DenseZM673 → DenseZM673 :=
 denseAddM673 (denseAddM673 (·+·))
def denseZMulM673 : DenseZM673 → DenseZM673 → DenseZM673 :=
 denseMulM673 [] (denseAddM673 (·+·)) (denseMulM673 0 (·+·) (·*·))
def denseZEvalM673 (x k : ℤ) (p : DenseZM673) : ℤ :=
 denseEvalM673 (denseEvalM673 id k) x p

theorem dense_q_eval_addM673 (x k : ℤ) (p q : DenseZM673) :
 denseZEvalM673 x k (denseZAddM673 p q)=denseZEvalM673 x k p+denseZEvalM673 x k q := by
 apply dense_eval_addM673
 intro a b
 exact dense_eval_addM673 (·+·) id (by intros; rfl) k a b

theorem dense_q_eval_mulM673 (x k : ℤ) (p q : DenseZM673) :
 denseZEvalM673 x k (denseZMulM673 p q)=denseZEvalM673 x k p*denseZEvalM673 x k q := by
 apply dense_eval_mulM673
 · rfl
 · intro a b; exact dense_eval_addM673 (·+·) id (by intros; rfl) k a b
 · intro a b; exact dense_eval_mulM673 0 (·+·) (·*·) id rfl
     (by intros; rfl) (by intros; rfl) k a b

inductive PolyExprM673 where
 | c : ℤ → PolyExprM673
 | x : PolyExprM673
 | k : PolyExprM673
 | add : PolyExprM673 → PolyExprM673 → PolyExprM673
 | mul : PolyExprM673 → PolyExprM673 → PolyExprM673

def exprEvalM673 (x k : ℤ) : PolyExprM673 → ℤ
 | .c a => a
 | .x => x
 | .k => k
 | .add a b => exprEvalM673 x k a+exprEvalM673 x k b
 | .mul a b => exprEvalM673 x k a*exprEvalM673 x k b

def exprDenseM673 : PolyExprM673 → DenseZM673
 | .c a => [[a]]
 | .x => [[],[1]]
 | .k => [[0,1]]
 | .add a b => denseZAddM673 (exprDenseM673 a) (exprDenseM673 b)
 | .mul a b => denseZMulM673 (exprDenseM673 a) (exprDenseM673 b)

theorem expr_dense_correctM673 (x k : ℤ) (e : PolyExprM673) :
 denseZEvalM673 x k (exprDenseM673 e)=exprEvalM673 x k e := by
 induction e with
 | c a => simp [exprDenseM673,denseZEvalM673,denseEvalM673,exprEvalM673]
 | x => simp [exprDenseM673,denseZEvalM673,denseEvalM673,exprEvalM673]
 | k => simp [exprDenseM673,denseZEvalM673,denseEvalM673,exprEvalM673]
 | add a b ha hb => simp only [exprDenseM673,dense_q_eval_addM673,ha,hb,exprEvalM673]
 | mul a b ha hb => simp only [exprDenseM673,dense_q_eval_mulM673,ha,hb,exprEvalM673]

def denseNonnegM673 (p : DenseZM673) : Prop :=
 ∀ a ∈ p, ∀ b ∈ a, 0 ≤ b

instance (p : DenseZM673) : Decidable (denseNonnegM673 p) :=
 inferInstanceAs (Decidable (∀ a ∈ p, ∀ b ∈ a, 0 ≤ b))

theorem dense_eval_nonnegM673 {α : Type} (f : α → ℤ) (x : ℤ) (p : List α)
 (hx : 0 ≤ x) (hp : ∀ a ∈ p, 0 ≤ f a) : 0 ≤ denseEvalM673 f x p := by
 induction p with
 | nil => rfl
 | cons a p ih =>
   simp only [denseEvalM673]
   exact add_nonneg (hp a (by simp)) (mul_nonneg hx
     (ih (fun b hb => hp b (by simp [hb]))))

theorem expr_nonneg_certificateM673 (e : PolyExprM673)
 (h : denseNonnegM673 (exprDenseM673 e)) (x k : ℤ) (hx : 0 ≤ x) (hk : 0 ≤ k) :
 0 ≤ exprEvalM673 x k e := by
 rw [←expr_dense_correctM673]
 apply dense_eval_nonnegM673 _ _ _ hx
 intro a ha
 exact dense_eval_nonnegM673 id k a hk (h a ha)

end MathGKM.Markov
