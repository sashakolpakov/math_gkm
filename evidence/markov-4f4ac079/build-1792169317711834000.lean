import MarkovNewtonM295
/-! Machine-authored request 4f4ac079. Exact finite Newton tests for functions
with proved separate polynomial degree bounds. No sign condition is assumed true. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000

def PolyBoundM4F4 (f : ℚ → ℚ) (n : ℕ) : Prop :=
 ∃ P : Polynomial ℚ, P.natDegree ≤ n ∧ ∀ x, P.eval x=f x

theorem poly_constM4F4 (a : ℚ) (n : ℕ) : PolyBoundM4F4 (fun _ => a) n := by
 exact ⟨C a, by simp, by simp⟩

theorem poly_addM4F4 {f g : ℚ → ℚ} {n : ℕ}
 (hf : PolyBoundM4F4 f n) (hg : PolyBoundM4F4 g n) :
 PolyBoundM4F4 (fun x => f x+g x) n := by
 obtain ⟨P,hP,eP⟩ := hf
 obtain ⟨Q,hQ,eQ⟩ := hg
 exact ⟨P+Q,(natDegree_add_le ..).trans (max_le hP hQ),by simp [eP,eQ]⟩

theorem poly_subM4F4 {f g : ℚ → ℚ} {n : ℕ}
 (hf : PolyBoundM4F4 f n) (hg : PolyBoundM4F4 g n) :
 PolyBoundM4F4 (fun x => f x-g x) n := by
 obtain ⟨P,hP,eP⟩ := hf
 obtain ⟨Q,hQ,eQ⟩ := hg
 exact ⟨P-Q,(natDegree_sub_le ..).trans (max_le hP hQ),by simp [eP,eQ]⟩

theorem poly_mulM4F4 {f g : ℚ → ℚ} {m n : ℕ}
 (hf : PolyBoundM4F4 f m) (hg : PolyBoundM4F4 g n) :
 PolyBoundM4F4 (fun x => f x*g x) (m+n) := by
 obtain ⟨P,hP,eP⟩ := hf
 obtain ⟨Q,hQ,eQ⟩ := hg
 exact ⟨P*Q,(natDegree_mul_le ..).trans (Nat.add_le_add hP hQ),by simp [eP,eQ]⟩

theorem poly_monoM4F4 {f : ℚ → ℚ} {m n : ℕ}
 (hf : PolyBoundM4F4 f m) (hm : m ≤ n) : PolyBoundM4F4 f n := by
 obtain ⟨P,hP,eP⟩ := hf
 exact ⟨P,hP.trans hm,eP⟩

theorem poly_sumM4F4 {ι : Type*} (s : Finset ι) (f : ι → ℚ → ℚ) (n : ℕ)
 (h : ∀ k∈s, PolyBoundM4F4 (f k) n) : PolyBoundM4F4 (fun x => ∑ k∈s, f k x) n := by
 classical
 induction s using Finset.induction_on with
 | empty => simpa using poly_constM4F4 0 n
 | @insert a s ha ih =>
   simp only [sum_insert ha]
   exact poly_addM4F4 (h a (mem_insert_self _ _))
     (ih (fun k hk => h k (mem_insert_of_mem hk)))

theorem poly_affineM4F4 {f : ℚ → ℚ} {n : ℕ}
 (hf : PolyBoundM4F4 f n) (a b : ℚ) :
 PolyBoundM4F4 (fun x => f (a*x+b)) n := by
 obtain ⟨P,hP,eP⟩ := hf
 refine ⟨P.comp (C a*X+C b),?_,by simp [eP]⟩
 have hd : (C a*X+C b).natDegree ≤ 1 := by
   exact natDegree_add_le_of_degree_le
     (natDegree_mul_le.trans (by simp)) (by simp)
 exact natDegree_comp_le.trans ((Nat.mul_le_mul_left _ hd).trans (by simpa using hP))

theorem poly_chooseM4F4 (k : ℕ) : PolyBoundM4F4 (fun x => choosePolyM0D3 x k) k := by
 refine ⟨C ((k.factorial:ℚ)⁻¹)*descPochhammer ℚ k,?_,?_⟩
 · exact natDegree_mul_le.trans (by simp [descPochhammer_natDegree])
 · intro x
   simp [choosePolyM0D3,div_eq_mul_inv,mul_comm]

theorem diff_nat_castM4F4 (f : ℚ → ℚ) (r x : ℕ) :
 (fwdDiff 1)^[r] (fun n : ℕ => f n) x=(fwdDiff (1:ℚ))^[r] f x := by
 induction r generalizing x with
 | zero => rfl
 | succ r ih =>
   simp only [Function.iterate_succ_apply',fwdDiff,ih,Nat.cast_add,Nat.cast_one]

theorem diff_int_castM4F4 (f : ℕ → ℤ) (r x : ℕ) :
 (((fwdDiff 1)^[r] f x : ℤ):ℚ)=(fwdDiff 1)^[r] (fun n => (f n:ℚ)) x := by
 induction r generalizing x with
 | zero => rfl
 | succ r ih => simp only [Function.iterate_succ_apply',fwdDiff,Int.cast_sub,ih]

theorem diff_vanishM4F4 {f : ℕ → ℤ} {F : ℚ → ℚ} {n r : ℕ}
 (h : PolyBoundM4F4 F n) (he : ∀ x : ℕ, (f x:ℚ)=F x) (hr : n<r) :
 (fwdDiff 1)^[r] f=0 := by
 obtain ⟨P,hP,eP⟩ := h
 have hz := Polynomial.fwdDiff_iter_eq_zero_of_degree_lt (hP.trans_lt hr)
 funext x
 apply Int.cast_injective (α:=ℚ)
 rw [diff_int_castM4F4]
 have hfun : (fun n : ℕ => (f n:ℚ))=(fun n : ℕ => P.eval (n:ℚ)) := by
   funext n
   rw [he,eP]
 rw [hfun,diff_nat_castM4F4,hz]
 rfl

theorem diff_swapM4F4 (f : ℕ → ℕ → ℤ) (r s x y : ℕ) :
 (fwdDiff 1)^[s] (fun b => (fwdDiff 1)^[r] (fun a => f a b) x) y=
 (fwdDiff 1)^[r] (fun a => (fwdDiff 1)^[s] (f a) y) x := by
 simp only [fwdDiff_iter_eq_sum_shift,Finset.smul_sum,smul_smul]
 rw [sum_comm]
 apply sum_congr rfl
 intro a ha
 apply sum_congr rfl
 intro b hb
 congr 1
 ring

def SeparateBoundM4F4 (f : ℕ → ℕ → ℤ) (m n : ℕ) : Prop :=
 (∀ y : ℕ, ∃ F : ℚ → ℚ, PolyBoundM4F4 F m ∧ ∀ x : ℕ, (f x y:ℚ)=F x) ∧
 (∀ x : ℕ, ∃ F : ℚ → ℚ, PolyBoundM4F4 F n ∧ ∀ y : ℕ, (f x y:ℚ)=F y)

theorem newton_outsideM4F4 {f : ℕ → ℕ → ℤ} {m n r s : ℕ}
 (h : SeparateBoundM4F4 f m n) (ho : m<r ∨ n<s) : newtonCoeffM295 f r s=0 := by
 rcases ho with hr | hs
 · have hz (y : ℕ) : (fwdDiff 1)^[r] (fun x => f x y)=0 := by
     obtain ⟨F,hF,he⟩ := h.1 y
     exact diff_vanishM4F4 hF he hr
   simp only [newtonCoeffM295,hz,Pi.zero_apply]
   simp [fwdDiff_iter_eq_sum_shift]
 · rw [newtonCoeffM295,diff_swapM4F4]
   have hz (x : ℕ) : (fwdDiff 1)^[s] (f x)=0 := by
     obtain ⟨F,hF,he⟩ := h.2 x
     exact diff_vanishM4F4 hF he hs
   simp only [hz,Pi.zero_apply]
   simp [fwdDiff_iter_eq_sum_shift]

theorem newton_finite_iffM4F4 {f : ℕ → ℕ → ℤ} {m n : ℕ}
 (h : SeparateBoundM4F4 f m n) :
 (∀ r s, 0≤newtonCoeffM295 f r s) ↔
 (∀ r ≤ m, ∀ s ≤ n, 0≤newtonCoeffM295 f r s) := by
 constructor
 · exact fun hp r _ s _ => hp r s
 · intro hp r s
   by_cases hr : r ≤ m
   · by_cases hs : s ≤ n
     · exact hp r hr s hs
     · rw [newton_outsideM4F4 h (Or.inr (by omega))]
   · rw [newton_outsideM4F4 h (Or.inl (by omega))]

theorem newton_finite_nonnegM4F4 {f : ℕ → ℕ → ℤ} {m n : ℕ}
 (h : SeparateBoundM4F4 f m n)
 (hp : ∀ r ≤ m, ∀ s ≤ n, 0≤newtonCoeffM295 f r s) (x y : ℕ) : 0≤f x y := by
 exact newton_nonnegM295 f ((newton_finite_iffM4F4 h).mpr hp) x y
end
end MathGKM.Markov
