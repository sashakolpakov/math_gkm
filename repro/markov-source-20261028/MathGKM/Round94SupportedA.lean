import MathGKM.Round94ExtractionA
import MathGKM.Round94BinomialA

/- Machine-authored round94. Complete weighted central comparison on the
supported parameter domain, without classwise sign assumptions. -/
namespace CompensationR94
open SparseRankR89 SparseCoupledR90 SparseCentralR91
noncomputable section
set_option maxHeartbeats 2000000

theorem supported (n j i b q x : ℕ) (hn : 3 ≤ n)
    (hd : i+j+q=2*n) (hx : q+x=n) (hxx : 1 ≤ x)
    (hq : 2 ≤ q) (hi : i ≤ 2*x+1) (hb : b+3=2*q) :
    (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card  ≤ 
      (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card := by
  rw [SparseCentralR91.central_iff n 0 j i b (by omega)]
  have eq0 : 2*n-i-j=q := by omega
  have eq1 : 2*n-(i+1)-j=q-1 := by omega
  have eq2 : 2*n-(i+2)-j=q-2 := by omega
  have hA : allocation n 0 j i (i+2) b =
      (((n-1).choose q:ℤ)*((2*x).choose i:ℤ))*
        (if q=2 then 0 else (x+3:ℤ)*((n-2).choose (q-3):ℤ)*((2*x+4).choose (i+1):ℤ)) := by
    unfold allocation
    rw [eq0]
    by_cases hh : q=2
    · rw [if_neg (by omega : ¬q ≤ b),if_pos hh]
      ring
    · rw [if_pos (by omega : q ≤ b),if_neg hh,show b-q=q-3 by omega,
        zero_eval n i j q x hn hd hx,
        one_simple n (i+2) j (q-3) (x+2) hn (by omega) (by omega) (by omega),
        if_neg (by omega : i+2 ≠ 0),show i+2-1=i+1 by omega,
        show 2*(x+2)=2*x+4 by omega]
      push_cast
      ring
  have hB : allocation n 0 j (i+2) i b =
      (if i=0 then 0 else (x+1:ℤ)*((n-2).choose (q-1):ℤ)*((2*x).choose (i-1):ℤ))*
        (((n-1).choose (q-2):ℤ)*((2*x+4).choose (i+2):ℤ)) := by
    unfold allocation
    rw [eq2,if_pos (by omega : q-2 ≤ b),show b-(q-2)=q-1 by omega,
      zero_eval n (i+2) j (q-2) (x+2) hn (by omega) (by omega),
      one_simple n i j (q-1) x hn (by omega) (by omega) (by omega),
      show 2*(x+2)=2*x+4 by omega]
    ring
  have hM : allocation n 0 j (i+1) (i+1) b =
      (((n-1).choose (q-1):ℤ)*((2*x+2).choose (i+1):ℤ))*
        ((x+2:ℤ)*((n-2).choose (q-2):ℤ)*((2*x+2).choose i:ℤ)) := by
    unfold allocation
    rw [eq1,if_pos (by omega : q-1 ≤ b),show b-(q-1)=q-2 by omega,
      zero_eval n (i+1) j (q-1) (x+1) hn (by omega) (by omega),
      one_simple n (i+1) j (q-2) (x+1) hn (by omega) (by omega) (by omega),
      if_neg (by omega : i+1 ≠ 0),show i+1-1=i by omega,
      show 2*(x+1)=2*x+2 by omega]
    push_cast
    ring
  rw [hA,hB,hM]
  exact mixed n q x i hx hq hxx hi
end
end CompensationR94
#print axioms CompensationR94.supported
