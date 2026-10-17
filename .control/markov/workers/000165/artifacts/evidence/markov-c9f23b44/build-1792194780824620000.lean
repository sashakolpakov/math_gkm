import Mathlib
/-! Machine-authored c9f23b44. A small, proved dense-polynomial evaluator.
Concrete computations are checked by the kernel, never native_decide. -/
namespace MathGKM.Markov

def denseAddMC9F {α : Type} (add : α → α → α) : List α → List α → List α
 | [], b => b
 | a, [] => a
 | a::as, b::bs => add a b :: denseAddMC9F add as bs

def denseMulMC9F {α : Type} (zero : α) (add mul : α → α → α) : List α → List α → List α
 | [], _ => []
 | [a], b => b.map (mul a)
 | a::as, b => denseAddMC9F add (b.map (mul a))
     (zero :: denseMulMC9F zero add mul as b)

def denseEvalMC9F {α : Type} (f : α → ℚ) (x : ℚ) : List α → ℚ
 | [] => 0
 | a::as => f a + x * denseEvalMC9F f x as

theorem dense_eval_addMC9F {α : Type} (add : α → α → α) (f : α → ℚ)
 (h : ∀ a b, f (add a b)=f a+f b) (x : ℚ) (a b : List α) :
 denseEvalMC9F f x (denseAddMC9F add a b)=denseEvalMC9F f x a+denseEvalMC9F f x b := by
 induction a generalizing b with
 | nil => simp [denseAddMC9F,denseEvalMC9F]
 | cons a as ih =>
   cases b with
   | nil => simp [denseAddMC9F,denseEvalMC9F]
   | cons b bs => simp only [denseAddMC9F,denseEvalMC9F,h,ih]; ring

theorem dense_eval_mapMC9F {α : Type} (mul : α → α → α) (f : α → ℚ)
 (h : ∀ a b, f (mul a b)=f a*f b) (x : ℚ) (a : α) (b : List α) :
 denseEvalMC9F f x (b.map (mul a))=f a*denseEvalMC9F f x b := by
 induction b with
 | nil => simp [denseEvalMC9F]
 | cons b bs ih => simp only [List.map_cons,denseEvalMC9F,h,ih]; ring

theorem dense_eval_mulMC9F {α : Type} (zero : α) (add mul : α → α → α)
 (f : α → ℚ) (hz : f zero=0) (ha : ∀ a b, f (add a b)=f a+f b)
 (hm : ∀ a b, f (mul a b)=f a*f b) (x : ℚ) (a b : List α) :
 denseEvalMC9F f x (denseMulMC9F zero add mul a b)=denseEvalMC9F f x a*denseEvalMC9F f x b := by
 induction a with
 | nil => simp [denseMulMC9F,denseEvalMC9F]
 | cons a as ih =>
   cases as with
   | nil => simpa [denseMulMC9F,denseEvalMC9F] using dense_eval_mapMC9F mul f hm x a b
   | cons a' as =>
     rw [denseMulMC9F,dense_eval_addMC9F add f ha,dense_eval_mapMC9F mul f hm]
     simp only [denseEvalMC9F,hz,ih]
     ring
     simp

@[reducible] def DenseMC9F : ℕ → Type
 | 0 => ℤ
 | n+1 => List (DenseMC9F n)

instance denseDecEqMC9F (n : ℕ) : DecidableEq (DenseMC9F n) := by
 induction n with
 | zero => exact Int.instDecidableEq
 | succ n ih => letI := ih; exact inferInstanceAs (DecidableEq (List (DenseMC9F n)))

def dzeroMC9F : (n : ℕ) → DenseMC9F n
 | 0 => 0
 | _+1 => []
def daddMC9F : (n : ℕ) → DenseMC9F n → DenseMC9F n → DenseMC9F n
 | 0 => Int.add
 | n+1 => denseAddMC9F (daddMC9F n)
def dmulMC9F : (n : ℕ) → DenseMC9F n → DenseMC9F n → DenseMC9F n
 | 0 => Int.mul
 | n+1 => denseMulMC9F (dzeroMC9F n) (daddMC9F n) (dmulMC9F n)
def dnegMC9F : (n : ℕ) → DenseMC9F n → DenseMC9F n
 | 0 => Int.neg
 | n+1 => List.map (dnegMC9F n)
def devalMC9F : (n : ℕ) → (ℕ → ℚ) → DenseMC9F n → ℚ
 | 0, _, a => (a:ℚ)
 | n+1, v, a => denseEvalMC9F (devalMC9F n (fun k => v (k+1))) (v 0) a

theorem deval_zeroMC9F (n : ℕ) (v : ℕ → ℚ) : devalMC9F n v (dzeroMC9F n)=0 := by
 cases n <;> rfl
theorem deval_addMC9F (n : ℕ) (v : ℕ → ℚ) (a b : DenseMC9F n) :
 devalMC9F n v (daddMC9F n a b)=devalMC9F n v a+devalMC9F n v b := by
 induction n generalizing v with
 | zero => exact Int.cast_add a b
 | succ n ih => exact dense_eval_addMC9F _ _ (ih _) _ a b
theorem deval_mulMC9F (n : ℕ) (v : ℕ → ℚ) (a b : DenseMC9F n) :
 devalMC9F n v (dmulMC9F n a b)=devalMC9F n v a*devalMC9F n v b := by
 induction n generalizing v with
 | zero => exact Int.cast_mul a b
 | succ n ih => exact dense_eval_mulMC9F _ _ _ _ (deval_zeroMC9F _ _) (deval_addMC9F _ _) (ih _) _ a b
theorem deval_negMC9F (n : ℕ) (v : ℕ → ℚ) (a : DenseMC9F n) :
 devalMC9F n v (dnegMC9F n a) = -devalMC9F n v a := by
 induction n generalizing v with
 | zero => exact Int.cast_neg a
 | succ n ih =>
   induction a with
   | nil => simp [dnegMC9F,devalMC9F,denseEvalMC9F]
   | cons a as ihl =>
     change devalMC9F n _ (dnegMC9F n a) + v 0 * devalMC9F (n+1) v (dnegMC9F (n+1) as) = _
     rw [ih,ihl]
     change _ = -(devalMC9F n _ a + v 0 * devalMC9F (n+1) v as)
     ring

def dpositiveMC9F : (n : ℕ) → DenseMC9F n → Bool
 | 0, a => decide (0 ≤ a)
 | n+1, a => a.all (dpositiveMC9F n)

theorem deval_nonnegMC9F (n : ℕ) (v : ℕ → ℚ) (hv : ∀ k, 0 ≤ v k)
 (a : DenseMC9F n) (ha : dpositiveMC9F n a=true) : 0 ≤ devalMC9F n v a := by
 induction n generalizing v with
 | zero =>
   change (0:ℚ) ≤ (a:ℤ)
   exact_mod_cast (of_decide_eq_true ha : (0:ℤ) ≤ a)
 | succ n ih =>
   induction a with
   | nil => exact le_refl 0
   | cons a as ihl =>
     have hh : dpositiveMC9F n a=true ∧ dpositiveMC9F (n+1) as=true := by
       simpa only [dpositiveMC9F,List.all_cons,Bool.and_eq_true] using ha
     exact add_nonneg (ih _ (fun k => hv (k+1)) a hh.1) (mul_nonneg (hv 0) (ihl hh.2))

end MathGKM.Markov
