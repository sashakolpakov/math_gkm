import MathGKM.Round94AlgebraA
import MathGKM.Round90BinomialA

/- Machine-authored round94. Guarded two-allocation binomial sign proof. -/
namespace CompensationR94
open SparseRankR90
noncomputable section
set_option maxHeartbeats 2000000
theorem mixed (n q x i : ℕ) (hn : q+x=n) (hq : 2 ≤ q)
    (hx : 1 ≤ x) (hi : i ≤ 2*x+1) :
    (((n-1).choose q:ℤ)*((2*x).choose i:ℤ))*
      (if q=2 then 0 else (x+3:ℤ)*((n-2).choose (q-3):ℤ)*((2*x+4).choose (i+1):ℤ))+
    (if i=0 then 0 else (x+1:ℤ)*((n-2).choose (q-1):ℤ)*((2*x).choose (i-1):ℤ))*
      (((n-1).choose (q-2):ℤ)*((2*x+4).choose (i+2):ℤ))  ≤ 
    2*((((n-1).choose (q-1):ℤ)*((2*x+2).choose (i+1):ℤ))*
      ((x+2:ℤ)*((n-2).choose (q-2):ℤ)*((2*x+2).choose i:ℤ))) := by
  let Z0 : ℤ := ((n-1).choose q:ℤ)*((2*x).choose i:ℤ)
  let Z1 : ℤ := ((n-1).choose (q-1):ℤ)*((2*x+2).choose (i+1):ℤ)
  let Z2 : ℤ := ((n-1).choose (q-2):ℤ)*((2*x+4).choose (i+2):ℤ)
  let O0 : ℤ := if i=0 then 0 else (x+1:ℤ)*((n-2).choose (q-1):ℤ)*((2*x).choose (i-1):ℤ)
  let O1 : ℤ := (x+2:ℤ)*((n-2).choose (q-2):ℤ)*((2*x+2).choose i:ℤ)
  let O2 : ℤ := if q=2 then 0 else (x+3:ℤ)*((n-2).choose (q-3):ℤ)*((2*x+4).choose (i+1):ℤ)
  have hM : 0 ≤ Z1*O1 := by dsimp [Z1,O1]; positivity
  change Z0*O2+O0*Z2 ≤ 2*(Z1*O1)
  apply scalar (x:ℤ) i (Z0*O2) (O0*Z2) (Z1*O1) (by omega) (by omega) (by omega) hM
  · by_cases hqi : q=2
    · have hz : O2=0 := by simp [O2,hqi]
      rw [hz,mul_zero,mul_zero]
      have ha : 0 ≤ 2*(x:ℤ)-(i:ℤ)+1 := by omega
      positivity
    by_cases hii : i ≤ 2*x
    · have e0 := adjacent_product (n-1) q (2*x) i (by omega) (by omega) hii
      rw [show n-1-q+1=x by omega] at e0
      have em0 : ((2*x+1-i:ℕ):ℤ)=2*(x:ℤ)-(i:ℤ)+1 := by omega
      rw [em0] at e0
      push_cast at e0
      have eZ : (x:ℤ)*(i+1:ℤ)*(2*(x:ℤ)-(i:ℤ)+1)*Z1=
          2*(q:ℤ)*((x:ℤ)+1)*(2*(x:ℤ)+1)*Z0 := by
        dsimp [Z1,Z0]
        convert e0 using 1  <;> ring
      have e1 := adjacent_product (n-2) (q-2) (2*x+2) i (by omega) (by omega) (by omega)
      rw [show n-2-(q-2)+1=x+1 by omega,show q-2-1=q-3 by omega,
        show 2*x+2+2=2*x+4 by omega] at e1
      have em1 : ((2*x+2+1-i:ℕ):ℤ)=2*(x:ℤ)-(i:ℤ)+3 := by omega
      have eq1 : ((q-2:ℕ):ℤ)=(q:ℤ)-2 := by omega
      rw [em1,eq1] at e1
      push_cast at e1
      have eO : ((x:ℤ)+1)*(i+1:ℤ)*(2*(x:ℤ)-(i:ℤ)+3)*O2=
          2*((q:ℤ)-2)*((x:ℤ)+3)*(2*(x:ℤ)+3)*O1 := by
        dsimp [O2,O1]
        rw [if_neg hqi]
        convert congrArg (fun z:ℤ => ((x:ℤ)+3)*z) e1 using 1  <;> ring
      have he : 2*(q:ℤ)*(((x:ℤ)+1)^2*(2*(x:ℤ)+1)*(2*(x:ℤ)-(i:ℤ)+3)*(Z0*O2))=
          2*((q:ℤ)-2)*((x:ℤ)*((x:ℤ)+3)*(2*(x:ℤ)+3)*(2*(x:ℤ)-(i:ℤ)+1)*(Z1*O1)) := by
        linear_combination (x:ℤ)*(2*(x:ℤ)-(i:ℤ)+1)*Z1*eO-
          ((x:ℤ)+1)*(2*(x:ℤ)-(i:ℤ)+3)*O2*eZ
      have hp : 0 ≤ (x:ℤ)*((x:ℤ)+3)*(2*(x:ℤ)+3)*(2*(x:ℤ)-(i:ℤ)+1)*(Z1*O1) := by
        apply mul_nonneg
        · exact mul_nonneg (mul_nonneg (mul_nonneg (by omega) (by omega)) (by omega)) (by omega)
        · exact hM
      apply le_of_mul_le_mul_left _ (by omega : 0 < 2*(q:ℤ))
      nlinarith only [he,hp]
    · have hz : Z0=0 := by simp [Z0,Nat.choose_eq_zero_of_lt (by omega : 2*x < i)]
      rw [hz,zero_mul,mul_zero]
      have he : 2*(x:ℤ)-(i:ℤ)+1=0 := by omega
      rw [he,mul_zero,zero_mul]
  · by_cases hii : i=0
    · simp [O0,hii]
    have e0 := adjacent_product (n-2) (q-1) (2*x) (i-1) (by omega) (by omega) (by omega)
    rw [show n-2-(q-1)+1=x by omega,show q-1-1=q-2 by omega,
      show i-1+1=i by omega] at e0
    have em0 : ((2*x+1-(i-1):ℕ):ℤ)=2*(x:ℤ)-(i:ℤ)+2 := by omega
    have eq0 : ((q-1:ℕ):ℤ)=(q:ℤ)-1 := by omega
    have ei0 : ((i-1:ℕ):ℤ)=(i:ℤ)-1 := by omega
    rw [em0,eq0,ei0] at e0
    push_cast at e0
    have eO : (x:ℤ)*(i:ℤ)*(2*(x:ℤ)-(i:ℤ)+2)*O1=
        2*((q:ℤ)-1)*((x:ℤ)+2)*(2*(x:ℤ)+1)*O0 := by
      dsimp [O0,O1]
      rw [if_neg hii]
      convert congrArg (fun z:ℤ => ((x:ℤ)+2)*z) e0 using 1  <;> ring
    have e1 := adjacent_product (n-1) (q-1) (2*x+2) (i+1) (by omega) (by omega) (by omega)
    rw [show n-1-(q-1)+1=x+1 by omega,show q-1-1=q-2 by omega,
      show 2*x+2+2=2*x+4 by omega,show i+1+1=i+2 by omega] at e1
    have em1 : ((2*x+2+1-(i+1):ℕ):ℤ)=2*(x:ℤ)-(i:ℤ)+2 := by omega
    rw [em1,eq0] at e1
    push_cast at e1
    have eZ : ((x:ℤ)+1)*(i+2:ℤ)*(2*(x:ℤ)-(i:ℤ)+2)*Z2=
        2*((q:ℤ)-1)*((x:ℤ)+2)*(2*(x:ℤ)+3)*Z1 := by
      dsimp [Z2,Z1]
      convert e1 using 1  <;> ring
    have he : (2*(x:ℤ)-(i:ℤ)+2)*(((x:ℤ)+1)*(i+2:ℤ)*(2*(x:ℤ)+1)*(O0*Z2))=
        (2*(x:ℤ)-(i:ℤ)+2)*((x:ℤ)*(i:ℤ)*(2*(x:ℤ)+3)*(Z1*O1)) := by
      linear_combination (2*(x:ℤ)+1)*O0*eZ-(2*(x:ℤ)+3)*Z1*eO
    exact (mul_left_cancel₀ (by omega : 2*(x:ℤ)-(i:ℤ)+2 ≠ 0) he).le
end
end CompensationR94
#print axioms CompensationR94.mixed
