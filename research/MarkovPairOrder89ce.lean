import MarkovWindowLC6d34
/-! Machine-authored live request 89ce11ad. Increasing log-concave degree
weights, with zeros retained, and their exact two-index comparison order. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def NatCross89 (w : ℕ → ℝ) : Prop :=
 ∀ i j, i≤j → w i*w (j+1)≤w (i+1)*w j

theorem natCross_of_increasing_adjacent89 (w : ℕ → ℝ)
 (hn : ∀ i,0≤w i) (hm : Monotone w)
 (ha : ∀ i,w i*w (i+2)≤w (i+1)^2) : NatCross89 w := by
 have hmain : ∀ n i,w i*w (i+n+1)≤w (i+1)*w (i+n) := by
  intro n
  induction n with
  | zero => intro i; simp [mul_comm]
  | succ n ih =>
   intro i
   by_cases hz : w i=0
   · rw [hz,zero_mul];exact mul_nonneg (hn _) (hn _)
   have hp : 0<w (i+n+1) := lt_of_lt_of_le
     (lt_of_le_of_ne (hn i) (Ne.symm hz)) (hm (by omega))
   have h1 := mul_le_mul_of_nonneg_right (ih i) (hn (i+n+2))
   have h2 := mul_le_mul_of_nonneg_left (ha (i+n)) (hn (i+1))
   have h3 : w i*w (i+n+2)≤w (i+1)*w (i+n+1) := by
    apply (mul_le_mul_iff_right₀ hp).mp
    nlinarith only [h1,h2]
   simpa [Nat.add_assoc] using h3
 intro i j hij
 simpa [show i+(j-i)=j by omega] using hmain (j-i) i

theorem natCross_balanced89 {w : ℕ → ℝ} (hw : NatCross89 w)
 (i n m : ℕ) : w i*w (i+n+m)≤w (i+n)*w (i+m) := by
 induction n generalizing i m with
 | zero => simp
 | succ n ih =>
  cases m with
  | zero => simp [mul_comm]
  | succ m =>
   have h := hw i (i+n+m+1) (by omega)
   have h' := ih (i+1) m
   have h'' : w (i+1)*w (i+n+m+1)≤w (i+1+n)*w (i+1+m) := by
    simpa only [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using h'
   simpa only [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using le_trans h h''

/-- Weak supermajorization for sorted degree pairs. No positivity division. -/
theorem degree_pair_order89 {w : ℕ → ℝ} (hn : ∀ i,0≤w i)
 (hm : Monotone w) (hc : NatCross89 w)
 (a b c d : ℕ) (hab : a≤b) (hcd : c≤d)
 (hac : a≤c) (hs : a+b≤c+d) : w a*w b≤w c*w d := by
 by_cases hbd : b≤d
 · exact mul_le_mul (hm hac) (hm hbd) (hn _) (hn _)
 · have had : a≤d := le_trans hac hcd
   have he : a+(b-d)+(d-a)=b := by omega
   have h := natCross_balanced89 hc a (b-d) (d-a)
   rw [he,show a+(d-a)=d by omega] at h
   exact le_trans h (mul_le_mul_of_nonneg_right (hm (show a+(b-d)≤c by omega)) (hn _))

def DegreePairLE89 (x y : ℕ × ℕ) : Prop :=
 min x.1 x.2 ≤ min y.1 y.2 ∧ x.1+x.2≤y.1+y.2

theorem degree_pair_order_unsorted89 {w : ℕ → ℝ} (hn : ∀ i,0≤w i)
 (hm : Monotone w) (hc : NatCross89 w)
 (x y : ℕ × ℕ) (h : DegreePairLE89 x y) :
 w x.1*w x.2≤w y.1*w y.2 := by
 have hh := degree_pair_order89 hn hm hc (min x.1 x.2) (max x.1 x.2)
   (min y.1 y.2) (max y.1 y.2) min_le_max min_le_max h.1
   (by simpa only [min_add_max] using h.2)
 rcases le_total x.1 x.2 with hx|hx <;>
  rcases le_total y.1 y.2 with hy|hy <;>
  simpa [min_eq_left,hx,hy,min_eq_right,max_eq_left,max_eq_right,mul_comm] using hh

#print axioms natCross_of_increasing_adjacent89
#print axioms degree_pair_order_unsorted89
end
end MathGKM.Markov
