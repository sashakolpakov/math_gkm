import MathGKM.Round91AllocationsA
import MathGKM.Round91BinomialAttemptA

/- Machine-authored round91. Exact orientation-one bridge for a supported
central parameter domain. Remaining parameter cases are not assumed proved. -/
namespace SparseCentralR91
open SparseRankR89 SparseCoupledR90
noncomputable section
set_option maxHeartbeats 2000000

theorem count_value (s d r j b m : ℕ)
    (hd : r+j+b=s+2*d) (hm : b ≤ d → s+2*(d-b)=m) :
    count s d r j b=(d.choose b : ℤ)*(m.choose r : ℤ) := by
  by_cases hb : b ≤ d
  · have he := hm hb
    by_cases hj : b ≤ j
    · simp [count,hb,hj,hd,he]
    · have hr : m < r := by omega
      simp [count,hb,hj,Nat.choose_eq_zero_of_lt hr]
  · simp [count,hb,Nat.choose_eq_zero_of_lt (by omega : d < b)]

theorem zero_eval (n r j q x : ℕ) (hd : r+j+q=2*n) (hx : q+x=n) :
    count (isolated n 1) (cells n 1) r j q=
      (n.choose q : ℤ)*((2*x).choose r : ℤ) := by
  simp only [isolated,cells,or_true,if_true]
  apply count_value
  · omega
  · intro hq; omega

theorem one_formula (n r j b : ℕ) (hn : 2 ≤ n) :
    oneCount n 1 r j b=(n-1 : ℕ)*(shifted 2 (n-2) r j b) := by
  rw [← (Accepted3c5512444ed7f17d3a8e718f.obligation n 1 (by omega)).1 r j b]
  have he := one_count_one (n-2) r j b
  rw [show 2*(n-2)+4=2*n by omega] at he
  rw [show ((n-1 : ℕ):ℤ)=((n-2 : ℕ):ℤ)+1 by omega]
  exact he

theorem one_eval (n r j b x : ℕ) (hn : 2 ≤ n)
    (hd : r+j+b+1=2*n) (hx : b+1+x=n) :
    oneCount n 1 r j b=(n-1 : ℕ)*
      (if r=0 then 0 else ((n-2).choose b : ℤ)*((2*x).choose (r-1) : ℤ)) := by
  rw [one_formula n r j b hn]
  unfold shifted
  split_ifs with hr
  · rfl
  · congr 1
    apply count_value
    · omega
    · intro hb; omega

theorem supported_one_central (n j i b q x : ℕ)
    (hn : 2 ≤ n) (hd : i+j+q=2*n) (hx : q+x=n)
    (hq : 2 ≤ q) (hi : i ≤ 2*x+1) (hb : b+3=2*q) :
    (PairConvolutionR78.P (2*n) 1 j (2*i+2) 1 b i).card  ≤ 
      (PairConvolutionR78.P (2*n) 1 j (2*i+2) 1 b (i+1)).card := by
  rw [central_iff n 1 j i b (by omega)]
  have eq0 : 2*n-i-j=q := by omega
  have eq1 : 2*n-(i+1)-j=q-1 := by omega
  have eq2 : 2*n-(i+2)-j=q-2 := by omega
  have hA : allocation n 1 j i (i+2) b =
      (n-1 : ℕ)*((n.choose q : ℤ)*((2*x).choose i : ℤ))*
        (if q=2 then 0 else ((n-2).choose (q-3) : ℤ)*((2*x+4).choose (i+1) : ℤ)) := by
    unfold allocation
    rw [eq0]
    by_cases hh : q=2
    · have he : ¬q ≤ b := by omega
      rw [if_neg he,if_pos hh]
      ring
    · rw [if_pos (by omega : q ≤ b),if_neg hh,show b-q=q-3 by omega,
        zero_eval n i j q x hd hx,
        one_eval n (i+2) j (q-3) (x+2) hn (by omega) (by omega),
        if_neg (by omega : i+2 ≠ 0),show i+2-1=i+1 by omega,
        show 2*(x+2)=2*x+4 by omega]
      ring
  have hB : allocation n 1 j (i+2) i b =
      (n-1 : ℕ)*(if i=0 then 0 else ((n-2).choose (q-1) : ℤ)*((2*x).choose (i-1) : ℤ))*
        ((n.choose (q-2) : ℤ)*((2*x+4).choose (i+2) : ℤ)) := by
    unfold allocation
    rw [eq2,if_pos (by omega : q-2 ≤ b),show b-(q-2)=q-1 by omega,
      zero_eval n (i+2) j (q-2) (x+2) (by omega) (by omega),
      one_eval n i j (q-1) x hn (by omega) (by omega),
      show 2*(x+2)=2*x+4 by omega]
    ring
  have hM : allocation n 1 j (i+1) (i+1) b =
      (n-1 : ℕ)*((n.choose (q-1) : ℤ)*((2*x+2).choose (i+1) : ℤ))*
        (((n-2).choose (q-2) : ℤ)*((2*x+2).choose i : ℤ)) := by
    unfold allocation
    rw [eq1,if_pos (by omega : q-1 ≤ b),show b-(q-1)=q-2 by omega,
      zero_eval n (i+1) j (q-1) (x+1) (by omega) (by omega),
      one_eval n (i+1) j (q-2) (x+1) hn (by omega) (by omega),
      if_neg (by omega : i+1 ≠ 0),show i+1-1=i by omega,
      show 2*(x+1)=2*x+2 by omega]
    ring
  rw [hA,hB,hM]
  have hh := mul_le_mul_of_nonneg_left (mixed_binomial n q x i hx hq hi)
    (show (0:ℤ) ≤ (n-1 : ℕ) by positivity)
  nlinarith only [hh]

end
end SparseCentralR91
#print axioms SparseCentralR91.supported_one_central
