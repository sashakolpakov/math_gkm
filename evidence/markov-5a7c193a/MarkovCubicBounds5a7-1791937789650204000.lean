import MathGKM.MarkovLogConcavity

/-! Machine-authored exact polynomial inequality certificates, worker 5a7c193a. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def cubicA5a7 (m : ℝ) := m*(m-1)*(m-2)
def cubicB5a7 (n m s : ℝ) := 3*(2*(n-1)+3*m-5*m^2+n*m+n*m^2-4*s)
def cubicC5a7 (n m : ℝ) := 3*(2*n*(n-1)+m*(n-1)*(n-4))
def cubicD5a7 (n : ℝ) := (n+1)*n*(n-1)

theorem cubic_large_cert5a7 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
    0 ≤ cubicB5a7 (x+3+y) (x+3) (2*y) ∧
    0 ≤ cubicB5a7 (x+3+y) (x+3) (2*y)^2-
      cubicA5a7 (x+3)*cubicC5a7 (x+3+y) (x+3) ∧
    0 ≤ cubicC5a7 (x+3+y) (x+3)^2-
      cubicB5a7 (x+3+y) (x+3) 0*cubicD5a7 (x+3+y) ∧
    0 ≤ cubicB5a7 (x+3+y) (x+3) (2*y)*cubicC5a7 (x+3+y) (x+3)-
      cubicA5a7 (x+3)*cubicD5a7 (x+3+y) := by
  unfold cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
  constructor
  · ring_nf; positivity
  constructor
  · ring_nf; positivity
  constructor <;> ring_nf <;> positivity

theorem cubic_small_cert5a7 (x : ℝ) (hx : 0 ≤ x) :
    0 ≤ cubicC5a7 (x+4) 0^2-cubicB5a7 (x+4) 0 0*cubicD5a7 (x+4) ∧
    0 ≤ cubicC5a7 (x+3) 1^2-cubicB5a7 (x+3) 1 0*cubicD5a7 (x+3) ∧
    0 ≤ cubicC5a7 (x+3) 2^2-cubicB5a7 (x+3) 2 0*cubicD5a7 (x+3) := by
  unfold cubicB5a7 cubicC5a7 cubicD5a7
  constructor
  · ring_nf; positivity
  constructor <;> ring_nf <;> positivity

theorem cubic_inequalities5a7 (n m : ℕ) (s : ℝ)
    (hmn : m ≤ n) (hsize : 4 ≤ m+n) (hs : 0 ≤ s)
    (hsu : s ≤ 2*((n:ℝ)-m))
    (hB : 0 ≤ cubicB5a7 n m s) (hC : 0 ≤ cubicC5a7 n m)
    (hD : 0 ≤ cubicD5a7 n) :
    cubicA5a7 m*cubicC5a7 n m ≤ cubicB5a7 n m s^2 ∧
    cubicB5a7 n m s*cubicD5a7 n ≤ cubicC5a7 n m^2 ∧
    cubicA5a7 m*cubicD5a7 n ≤ cubicB5a7 n m s*cubicC5a7 n m := by
  have hbhi : cubicB5a7 n m s ≤ cubicB5a7 n m 0 := by unfold cubicB5a7; linarith
  have hbD := mul_le_mul_of_nonneg_right hbhi hD
  by_cases hm : 3 ≤ m
  · have hx : 0 ≤ (m:ℝ)-3 := by
      have h : (3:ℝ) ≤ m := by exact_mod_cast hm
      linarith
    have hy : 0 ≤ (n:ℝ)-m := by
      have h : (m:ℝ) ≤ n := by exact_mod_cast hmn
      linarith
    have he1 : (m:ℝ)-3+3=m := by ring
    have he2 : (m:ℝ)-3+3+((n:ℝ)-m)=n := by ring
    have hc := cubic_large_cert5a7 ((m:ℝ)-3) ((n:ℝ)-m) hx hy
    rw [he1,show (m:ℝ)+((n:ℝ)-m)=n by ring] at hc
    obtain ⟨hlo,hgap1,hgap2,hgap3⟩ := hc
    have hblo : cubicB5a7 n m (2*((n:ℝ)-m)) ≤ cubicB5a7 n m s := by
      unfold cubicB5a7; linarith
    have hsq := sq_le_sq₀ hlo hB |>.mpr hblo
    have hprod := mul_le_mul_of_nonneg_right hblo hC
    exact ⟨by linarith,by linarith,by linarith⟩
  · have hz : cubicA5a7 m=0 := by
      interval_cases m <;> norm_num [cubicA5a7]
    have hgap : 0 ≤ cubicC5a7 n m^2-cubicB5a7 n m 0*cubicD5a7 n := by
      interval_cases m
      · have hx : 0 ≤ (n:ℝ)-4 := by
          have h : (4:ℝ) ≤ n := by exact_mod_cast (show 4 ≤ n by omega)
          linarith
        simpa using (cubic_small_cert5a7 ((n:ℝ)-4) hx).1
      · have hx : 0 ≤ (n:ℝ)-3 := by
          have h : (3:ℝ) ≤ n := by exact_mod_cast (show 3 ≤ n by omega)
          linarith
        simpa using (cubic_small_cert5a7 ((n:ℝ)-3) hx).2.1
      · by_cases hn : n=2
        · subst n; norm_num [cubicB5a7,cubicC5a7,cubicD5a7]
        · have hx : 0 ≤ (n:ℝ)-3 := by
            have h : (3:ℝ) ≤ n := by exact_mod_cast (show 3 ≤ n by omega)
            linarith
          simpa using (cubic_small_cert5a7 ((n:ℝ)-3) hx).2.2
    rw [hz]
    exact ⟨by simpa using sq_nonneg (cubicB5a7 n m s),by linarith,
      by simpa using mul_nonneg hB hC⟩

def CubicSeq5a7 (A B C D : ℝ) (k : ℤ) : ℝ :=
  if k=0 then A else if k=1 then B else if k=2 then C else if k=3 then D else 0

def CubicPoly5a7 (A B E D : ℝ) : Polynomial ℝ := C A+C B*X+C E*X^2+C D*X^3

theorem cubic_nonneg5a7 {A B C D : ℝ} (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hC : 0 ≤ C) (hD : 0 ≤ D) (k : ℤ) : 0 ≤ CubicSeq5a7 A B C D k := by
  unfold CubicSeq5a7; split_ifs <;> first | assumption | exact le_rfl

theorem cubic_crossLC5a7 {A B C D : ℝ} (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hC : 0 ≤ C) (hD : 0 ≤ D) (h1 : A*C ≤ B^2) (h2 : B*D ≤ C^2)
    (h3 : A*D ≤ B*C) : CrossLC (CubicSeq5a7 A B C D) := by
  intro i j hij
  by_cases hi : 0 ≤ i ∧ i ≤ 3
  · by_cases hj : -1 ≤ j ∧ j ≤ 2
    · obtain ⟨hi0,hi3⟩ := hi
      obtain ⟨hj0,hj2⟩ := hj
      interval_cases i <;> interval_cases j <;> norm_num [CubicSeq5a7] at * <;> nlinarith
    · have hz : CubicSeq5a7 A B C D (j+1)=0 := by
        simp only [CubicSeq5a7]; split_ifs <;> first | omega | rfl
      rw [hz,mul_zero]
      exact mul_nonneg (cubic_nonneg5a7 hA hB hC hD _) (cubic_nonneg5a7 hA hB hC hD _)
  · have hz : CubicSeq5a7 A B C D i=0 := by
      simp only [CubicSeq5a7]; split_ifs <;> first | omega | rfl
    rw [hz,zero_mul]
    exact mul_nonneg (cubic_nonneg5a7 hA hB hC hD _) (cubic_nonneg5a7 hA hB hC hD _)

theorem coeffSeq_cubic5a7 (A B E D : ℝ) :
    CoeffSeq (CubicPoly5a7 A B E D)=CubicSeq5a7 A B E D := by
  funext k
  by_cases hk : k < 0
  · simp [CoeffSeq,CubicSeq5a7,hk,show k ≠ 0 by omega,
      show k ≠ 1 by omega,show k ≠ 2 by omega,show k ≠ 3 by omega]
  · lift k to ℕ using (show 0 ≤ k by omega)
    by_cases h0 : k=0
    · subst k; norm_num [CoeffSeq,CubicPoly5a7,CubicSeq5a7]
    by_cases h1 : k=1
    · subst k; norm_num [CoeffSeq,CubicPoly5a7,CubicSeq5a7]
    by_cases h2 : k=2
    · subst k; change (CubicPoly5a7 A B E D).coeff 2=E; simp [CubicPoly5a7]
    by_cases h3 : k=3
    · subst k; change (CubicPoly5a7 A B E D).coeff 3=D; simp [CubicPoly5a7]
    simp [CoeffSeq,CubicPoly5a7,CubicSeq5a7,coeff_X,coeff_C,h0,h1,h2,h3,
      Ne.symm h1,Ne.symm h2,Ne.symm h3,show ¬ (k:ℤ)<0 by omega,
      show (k:ℤ) ≠ 2 by omega,show (k:ℤ) ≠ 3 by omega]

#print axioms cubic_inequalities5a7
#print axioms cubic_crossLC5a7
end
end MathGKM.Markov
