import MarkovMiddleDiscreteMD02
/-! Machine-authored d0292f14. Positive binomial expansion and every mixed
Newton coefficient of the actual correction. No gap positivity is inferred. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 7000000

theorem kernel_binomial_expansionMD02 (D d k a b : ℕ) :
 middleKernelMD02 (d+D) k a b=
 ∑ l ∈ range (b+1), ∑ p ∈ range (b-l+1),
 ((a+l).choose a:ℤ)*((D+a).choose (b-l-p):ℤ)*(d.choose p:ℤ)*(k.choose (a+l+2):ℤ) := by
 unfold middleKernelMD02
 apply sum_congr rfl
 intro l hl
 have h := Nat.add_choose_eq d (D+a) (b-l)
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at h
 have hc := congrArg (fun n : ℕ => (n:ℤ)) h
 push_cast at hc
 rw [show d+D+a=d+(D+a) by omega,hc,mul_sum,sum_mul]
 apply sum_congr rfl
 intro p hp
 ring

theorem newton_separatedMD02 (f g : ℕ → ℤ) (a b : ℕ) :
 newtonCoeffMD02 (fun x y => f x*g y) a b=
 ((fwdDiff 1)^[a] f 0)*((fwdDiff 1)^[b] g 0) := by
 unfold newtonCoeffMD02
 have h (y : ℕ) : (fun x => f x*g y)=(g y) • f := by
   funext x
   simp only [Pi.smul_apply,smul_eq_mul]
   ring
 simp only [h,fwdDiff_iter_const_smul,Pi.smul_apply,smul_eq_mul]
 have he : (fun y => g y*((fwdDiff 1)^[a] f) 0)=
   ((fwdDiff 1)^[a] f 0) • g := by
   funext y
   simp only [Pi.smul_apply,smul_eq_mul]
   ring
 rw [he,fwdDiff_iter_const_smul]
 rfl

theorem newton_binomial_basisMD02 (p q a b : ℕ) :
 newtonCoeffMD02 (fun x y => (x.choose p:ℤ)*(y.choose q:ℤ)) a b=
 (if a=p then 1 else 0)*(if b=q then 1 else 0) := by
 rw [newton_separatedMD02,fwdDiff_iter_choose_zero,fwdDiff_iter_choose_zero]

theorem newton_sumMD02 {α : Type*} (I : Finset α) (f : α → ℕ → ℕ → ℤ) (a b : ℕ) :
 newtonCoeffMD02 (fun x y => ∑ i ∈ I, f i x y) a b=
 ∑ i ∈ I, newtonCoeffMD02 (f i) a b := by
 unfold newtonCoeffMD02
 simp_rw [show ∀ y, (fun x => ∑ i ∈ I, f i x y) = ∑ i ∈ I, (fun x => f i x y) by
   intro y; ext x; simp]
 simp only [fwdDiff_iter_finsetSum,Finset.sum_apply]
 rw [show (fun y => ∑ i ∈ I, (fwdDiff 1)^[a] (fun x => f i x y) 0)=
   ∑ i ∈ I, (fun y => (fwdDiff 1)^[a] (fun x => f i x y) 0) by ext y; simp]
 simp only [fwdDiff_iter_finsetSum,Finset.sum_apply]

theorem newton_smulMD02 (z : ℤ) (f : ℕ → ℕ → ℤ) (a b : ℕ) :
 newtonCoeffMD02 (fun x y => z*f x y) a b=z*newtonCoeffMD02 f a b := by
 unfold newtonCoeffMD02
 simp_rw [show ∀ y, (fun x => z*f x y)=z • (fun x => f x y) by intro y; rfl]
 simp only [fwdDiff_iter_const_smul,Pi.smul_apply,smul_eq_mul]
 rw [show (fun y => z*((fwdDiff 1)^[a] (fun x => f x y) 0))=
   z • (fun y => (fwdDiff 1)^[a] (fun x => f x y) 0) by rfl,
   fwdDiff_iter_const_smul]
 rfl

theorem newton_addMD02 (f g : ℕ → ℕ → ℤ) (a b : ℕ) :
 newtonCoeffMD02 (fun x y => f x y+g x y) a b=
 newtonCoeffMD02 f a b+newtonCoeffMD02 g a b := by
 unfold newtonCoeffMD02
 simp_rw [show ∀ y, (fun x => f x y+g x y)=(fun x => f x y)+(fun x => g x y) by intro y; rfl]
 simp only [fwdDiff_iter_add,Pi.add_apply]
 rw [show (fun y => ((fwdDiff 1)^[a] (fun x => f x y) 0)+
   ((fwdDiff 1)^[a] (fun x => g x y) 0))=
   (fun y => ((fwdDiff 1)^[a] (fun x => f x y) 0))+
   (fun y => ((fwdDiff 1)^[a] (fun x => g x y) 0)) by rfl,fwdDiff_iter_add]
 rfl

theorem kernel_newton_formulaMD02 (D a b m n : ℕ) :
 newtonCoeffMD02 (fun d k => middleKernelMD02 (d+D) k a b) m n=
 ∑ l ∈ range (b+1), ∑ p ∈ range (b-l+1),
 ((a+l).choose a:ℤ)*((D+a).choose (b-l-p):ℤ)*
 (if m=p then 1 else 0)*(if n=a+l+2 then 1 else 0) := by
 simp_rw [kernel_binomial_expansionMD02,newton_sumMD02]
 apply sum_congr rfl
 intro l hl
 apply sum_congr rfl
 intro p hp
 simp only [mul_assoc,newton_smulMD02,newton_binomial_basisMD02]

theorem kernel_newton_nonnegMD02 (D a b m n : ℕ) :
 0 ≤ newtonCoeffMD02 (fun d k => middleKernelMD02 (d+D) k a b) m n := by
 rw [kernel_newton_formulaMD02]
 positivity

theorem correction_newton_nonnegMD02 (D c m n : ℕ) (r : Bool) :
 0 ≤ newtonCoeffMD02 (fun d k => correctionShortMD02 (d+D) k c r) m n := by
 have h (A a b : ℕ) := kernel_newton_nonnegMD02 A a b m n
 cases r <;> simp only [correctionShortMD02,Bool.false_eq_true,if_false,if_true,
   Nat.add_assoc,newton_smulMD02,newton_addMD02]
 all_goals
   apply mul_nonneg (by norm_num)
   repeat' apply add_nonneg
   all_goals first | exact h _ _ _ | exact mul_nonneg (by norm_num) (h _ _ _)

end
end MathGKM.Markov
