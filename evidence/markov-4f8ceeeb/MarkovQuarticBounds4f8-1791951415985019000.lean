import Mathlib

/-! Machine-authored request 4f8ceeeb. Quartic coefficient certificates.
The natural-word statistics and source bridges are separate obligations. -/
namespace MathGKM.Markov
noncomputable section
def qa4f8 (m : ℝ) := m*(m-1)*(m-2)*(m-3)
def qb4f8 (n m s t : ℝ) :=
 4*((n-8)*m^3+18*m^2+(5*n-22)*m-6*n+12)+48*(1-m)*s+48*t
def qc4f8 (n m s : ℝ) :=
 6*(n^2*(m^2+3*m+6)+n*(-11*m^2-9*m-18)+26*m^2-10*m+12)+(144-48*n)*s
def qd4f8 (n m : ℝ) := 4*(n-1)*(n-2)*(3*n+m*(n-6))
def qe4f8 (n : ℝ) := (n+1)*n*(n-1)*(n-2)

theorem quartic_cert4f8 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 0 ≤ qb4f8 (x+6+y) (x+6) (2*y) 0 ∧
 0 ≤ qc4f8 (x+6+y) (x+6) (2*y) ∧
 0 ≤ qb4f8 (x+6+y) (x+6) (2*y) 0^2-qa4f8 (x+6)*qc4f8 (x+6+y) (x+6) 0 ∧
 0 ≤ qc4f8 (x+6+y) (x+6) (2*y)^2-qb4f8 (x+6+y) (x+6) 0 y*qd4f8 (x+6+y) (x+6) ∧
 0 ≤ qd4f8 (x+6+y) (x+6)^2-qc4f8 (x+6+y) (x+6) 0*qe4f8 (x+6+y) := by
 unfold qa4f8 qb4f8 qc4f8 qd4f8 qe4f8
 repeat' constructor
 all_goals ring_nf; positivity

theorem quartic_inequalities4f8 (n m s t : ℝ) (hm : 6 ≤ m) (hn : m ≤ n)
 (hs : 0 ≤ s) (hsu : s ≤ 2*(n-m)) (ht : 0 ≤ t) (htu : t ≤ n-m) :
 qa4f8 m*qc4f8 n m s ≤ qb4f8 n m s t^2 ∧
 qb4f8 n m s t*qd4f8 n m ≤ qc4f8 n m s^2 ∧
 qc4f8 n m s*qe4f8 n ≤ qd4f8 n m^2 := by
 have hc := quartic_cert4f8 (m-6) (n-m) (by linarith) (by linarith)
 rw [show m-6+6=m by ring,show m+(n-m)=n by ring] at hc
 obtain ⟨bl,cl,g1,g2,g3⟩ := hc
 have blo : qb4f8 n m (2*(n-m)) 0 ≤ qb4f8 n m s t := by
   unfold qb4f8
   nlinarith [mul_nonneg (show 0 ≤ m-1 by linarith) (show 0 ≤ 2*(n-m)-s by linarith)]
 have bup : qb4f8 n m s t ≤ qb4f8 n m 0 (n-m) := by
   unfold qb4f8
   nlinarith [mul_nonneg (show 0 ≤ m-1 by linarith) hs]
 have clo : qc4f8 n m (2*(n-m)) ≤ qc4f8 n m s := by
   unfold qc4f8
   nlinarith [mul_nonneg (show 0 ≤ n-3 by linarith) (show 0 ≤ 2*(n-m)-s by linarith)]
 have cup : qc4f8 n m s ≤ qc4f8 n m 0 := by
   unfold qc4f8
   nlinarith [mul_nonneg (show 0 ≤ n-3 by linarith) hs]
 have hm0 : 0 ≤ m := by linarith
 have hn0 : 0 ≤ n := by linarith
 have ap : 0 ≤ qa4f8 m := by
   unfold qa4f8
   have h1 : 0 ≤ m-1 := by linarith
   have h2 : 0 ≤ m-2 := by linarith
   have h3 : 0 ≤ m-3 := by linarith
   positivity
 have dp : 0 ≤ qd4f8 n m := by
   unfold qd4f8
   have h1 : 0 ≤ n-1 := by linarith
   have h2 : 0 ≤ n-2 := by linarith
   have h6 : 0 ≤ n-6 := by linarith
   positivity
 have ep : 0 ≤ qe4f8 n := by
   unfold qe4f8
   have h1 : 0 ≤ n-1 := by linarith
   have h2 : 0 ≤ n-2 := by linarith
   positivity
 have bsq := (sq_le_sq₀ bl (le_trans bl blo)).mpr blo
 have csq := (sq_le_sq₀ cl (le_trans cl clo)).mpr clo
 exact ⟨by linarith [mul_le_mul_of_nonneg_left cup ap],
   by linarith [mul_le_mul_of_nonneg_right bup dp],
   by linarith [mul_le_mul_of_nonneg_right cup ep]⟩

#print axioms quartic_inequalities4f8
end
end MathGKM.Markov
