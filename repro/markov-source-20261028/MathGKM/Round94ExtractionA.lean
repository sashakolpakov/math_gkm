import MathGKM.Round94BoundaryA
import MathGKM.Round91OneOrientationA

/- Machine-authored round94. Complete alpha-one coefficient, retaining both
weighted classes in the same expression and all boundary guards. -/
namespace CompensationR94
open SparseRankR89 SparseCoupledR90 SparseCentralR91
noncomputable section
set_option maxHeartbeats 2000000

def weight (n b : ℕ) : ℤ :=
  (n:ℤ)*((n-3).choose b:ℤ)+2*(if b=0 then 0 else ((n-3).choose (b-1):ℤ))

theorem zero_eval (n r j q x : ℕ) (hn : 3 ≤ n)
    (hd : r+j+q=2*n) (hx : q+x=n) :
    count (isolated n 0) (cells n 0) r j q=
      ((n-1).choose q:ℤ)*((2*x).choose r:ℤ) := by
  simp only [isolated,cells,show n ≠ 0 by omega,show ¬(0:ℕ)=1 by omega,
    false_or,if_false]
  apply count_value
  · omega
  · intro hq; omega

theorem one_formula (n r j b : ℕ) (hn : 3 ≤ n) :
    oneCount n 0 r j b=(n:ℤ)*shifted 4 (n-3) r j b+
      2*punctured 2 (n-3) r j b := by
  rw [← (Accepted3c5512444ed7f17d3a8e718f.obligation n 0 (by omega)).1 r j b]
  have he := one_count_zero (n-3) r j b
  rw [show 2*(n-3)+6=2*n by omega] at he
  simpa [show ((n-3:ℕ):ℤ)+3=(n:ℤ) by omega] using he

theorem one_eval (n r j b x : ℕ) (hn : 3 ≤ n)
    (hd : r+j+b+1=2*n) (hx : b+1+x=n) :
    oneCount n 0 r j b = if r=0 then 0 else
      weight n b*((2*x).choose (r-1):ℤ) := by
  rw [one_formula n r j b hn]
  by_cases hr : r=0
  · simp [shifted,punctured,hr]
  rw [if_neg hr]
  have he : shifted 4 (n-3) r j b =
      ((n-3).choose b:ℤ)*((2*x).choose (r-1):ℤ) := by
    rw [shifted,if_neg hr]
    apply count_value
    · omega
    · intro hb; omega
  have hp : punctured 2 (n-3) r j b =
      (if b=0 then 0 else ((n-3).choose (b-1):ℤ))*((2*x).choose (r-1):ℤ) := by
    by_cases hb : b=0
    · simp [punctured,hb]
    rw [if_neg hb]
    by_cases hj : j=0
    · have hz : 2*x < r-1 := by omega
      simp [punctured,hj,Nat.choose_eq_zero_of_lt hz]
    rw [punctured,if_neg (by tauto),shifted,if_neg hr]
    apply count_value
    · omega
    · intro hb'; omega
  rw [he,hp]
  unfold weight
  ring

theorem weight_simplify (n b : ℕ) (hn : 3 ≤ n) (hb : b ≤ n-2) :
    weight n b=(n-b:ℕ)*((n-2).choose b:ℤ) := by
  have h0 := Nat.choose_mul_succ_eq (n-3) b
  rw [show n-3+1=n-2 by omega] at h0
  have e0 : ((n-2).choose b:ℤ)*(n-2-b:ℕ)=
      ((n-3).choose b:ℤ)*(n-2:ℕ) := by exact_mod_cast h0.symm
  have e1 : ((n-2:ℕ):ℤ)*(if b=0 then 0 else ((n-3).choose (b-1):ℤ))=
      (b:ℤ)*((n-2).choose b:ℤ) := by
    by_cases hz : b=0
    · simp [hz]
    rw [if_neg hz]
    have he := Nat.add_one_mul_choose_eq (n-3) (b-1)
    rw [show n-3+1=n-2 by omega,show b-1+1=b by omega] at he
    have hc : ((n-2:ℕ):ℤ)*((n-3).choose (b-1):ℤ)=
        ((n-2).choose b:ℤ)*(b:ℤ) := by exact_mod_cast he
    simpa [mul_comm] using hc
  have en : ((n-2:ℕ):ℤ)=(n:ℤ)-2 := by omega
  have eb : ((n-2-b:ℕ):ℤ)=(n:ℤ)-2-(b:ℤ) := by omega
  have eb' : ((n-b:ℕ):ℤ)=(n:ℤ)-(b:ℤ) := by omega
  rw [en,eb] at e0
  rw [en] at e1
  apply mul_left_cancel₀ (show (n-2:ℤ) ≠ 0 by omega)
  unfold weight
  rw [eb']
  linear_combination -(n:ℤ)*e0+2*e1

theorem one_simple (n r j b x : ℕ) (hn : 3 ≤ n)
    (hd : r+j+b+1=2*n) (hx : b+1+x=n) (hb : b ≤ n-2) :
    oneCount n 0 r j b = if r=0 then 0 else
      (x+1:ℤ)*((n-2).choose b:ℤ)*((2*x).choose (r-1):ℤ) := by
  rw [one_eval n r j b x hn hd hx]
  by_cases hr : r=0
  · simp [hr]
  simp only [if_neg hr]
  rw [weight_simplify n b hn hb]
  have he : ((n-b:ℕ):ℤ)=(x+1:ℤ) := by omega
  rw [he]
end
end CompensationR94
#print axioms CompensationR94.one_eval
