import MarkovRowParameterM468
/-! Machine-authored daba8bcf. A positive diagonal convolution for the
numerator-three lower-row residual. No shape premise is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem row_diagonal_operatorMDAB (F : ℕ → ℕ → Polynomial ℤ) (n j : ℕ)
 (h0 : F (n+2) (j+1)+F n j=F (n+1) (j+1)+(X+1)*F (n+1) j)
 (h1 : F (n+3) (j+1)+F (n+1) j=F (n+2) (j+1)+(X+1)*F (n+2) j)
 (h2 : F (n+3) (j+2)+F (n+1) (j+1)=F (n+2) (j+2)+(X+1)*F (n+2) (j+1))
 (h3 : F (n+4) (j+2)+F (n+2) (j+1)=F (n+3) (j+2)+(X+1)*F (n+3) (j+1)) :
 F (n+4) (j+2)+2*F (n+2) (j+1)+F n j=
 F (n+2) (j+2)+2*(X+1)*F (n+2) (j+1)+(X+1)^2*F (n+2) j := by
 linear_combination h0+(X+1)*h1+h2+h3

theorem rowH_diagonal_equationMDAB (n j : ℕ) (hn : j+1 ≤ n) :
 rowHMFFD (n+4) (j+2)-2*rowHMFFD (n+2) (j+1)+rowHMFFD n j=
 rowJMFFD (n+4) (j+2)+2*rowJMFFD (n+2) (j+1)+rowJMFFD n j := by
 have hh := row_diagonal_operatorMDAB rowHMFFD n j
   (rowH_parameterM468 n j hn)
   (rowH_parameterM468 (n+1) j (by omega))
   (rowH_parameterM468 (n+1) (j+1) (by omega))
   (rowH_parameterM468 (n+2) (j+1) (by omega))
 have hj := row_diagonal_operatorMDAB rowJMFFD n j
   (rowJ_parameterM468 n j hn)
   (rowJ_parameterM468 (n+1) j (by omega))
   (rowJ_parameterM468 (n+1) (j+1) (by omega))
   (rowJ_parameterM468 (n+2) (j+1) (by omega))
 have he : rowHMFFD (n+2) (j+2)=rowJMFFD (n+2) (j+2)+
   2*(X+1)*rowJMFFD (n+2) (j+1)+(X+1)^2*rowJMFFD (n+2) j+
   2*(1-X)*rowHMFFD (n+2) (j+1)-(X+1)^2*rowHMFFD (n+2) j := rfl
 rw [he] at hh
 linear_combination hh-hj

def diagonalJMDAB (d j : ℕ) : Polynomial ℤ := rowJMFFD (2*j+1+d) j
def diagonalHMDAB (d j : ℕ) : Polynomial ℤ := rowHMFFD (2*j+1+d) j
def doublePrefixMDAB (F : ℕ → Polynomial ℤ) (j : ℕ) : Polynomial ℤ :=
 ∑ s ∈ range j, C (j-s:ℤ)*F s

theorem doublePrefix_stepMDAB (F : ℕ → Polynomial ℤ) (j : ℕ) :
 doublePrefixMDAB F (j+1)=doublePrefixMDAB F j+∑ s ∈ range (j+1), F s := by
 unfold doublePrefixMDAB
 rw [sum_range_succ, sum_range_succ]
 simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_left, map_one, one_mul]
 rw [←add_assoc,←sum_add_distrib]
 congr 1
 apply sum_congr rfl
 intro s hs
 rw [show (j:ℤ)+1-s=(j-s)+1 by ring,map_add,map_one]
 ring

theorem doublePrefix_secondMDAB (F : ℕ → Polynomial ℤ) (j : ℕ) :
 doublePrefixMDAB F (j+2)-2*doublePrefixMDAB F (j+1)+doublePrefixMDAB F j=F (j+1) := by
 have h0 := doublePrefix_stepMDAB F j
 have h1 := doublePrefix_stepMDAB F (j+1)
 rw [sum_range_succ] at h1
 linear_combination h1-h0

theorem diagonalH_positive_sumMDAB (d j : ℕ) :
 diagonalHMDAB d j=diagonalJMDAB d j+4*doublePrefixMDAB (diagonalJMDAB d) j := by
 induction j using Nat.twoStepInduction with
 | zero => simp [diagonalHMDAB,diagonalJMDAB,rowHMFFD,doublePrefixMDAB]
 | one => simp [diagonalHMDAB,diagonalJMDAB,rowHMFFD,doublePrefixMDAB,rowJ_zeroM468]; ring
 | more j h0 h1 =>
   have hh := rowH_diagonal_equationMDAB (2*j+1+d) j (by omega)
   change rowHMFFD (2*j+1+d+4) (j+2)-2*rowHMFFD (2*j+1+d+2) (j+1)+
     diagonalHMDAB d j=rowJMFFD (2*j+1+d+4) (j+2)+
     2*rowJMFFD (2*j+1+d+2) (j+1)+diagonalJMDAB d j at hh
   rw [show 2*j+1+d+4=2*(j+2)+1+d by omega,
     show 2*j+1+d+2=2*(j+1)+1+d by omega] at hh
   change diagonalHMDAB d (j+2)-2*diagonalHMDAB d (j+1)+diagonalHMDAB d j=
     diagonalJMDAB d (j+2)+2*diagonalJMDAB d (j+1)+diagonalJMDAB d j at hh
   have hp := doublePrefix_secondMDAB (diagonalJMDAB d) j
   rw [h0,h1] at hh
   linear_combination hh-4*hp

theorem rowH_positive_sumMDAB (n j : ℕ) (hn : 2*j+1 ≤ n) :
 rowHMFFD n j= rowJMFFD n j+
   4*∑ s ∈ range j, C (j-s:ℤ)*rowJMFFD (n-2*j+2*s) s := by
 have h := diagonalH_positive_sumMDAB (n-2*j-1) j
 unfold diagonalHMDAB diagonalJMDAB doublePrefixMDAB at h
 rw [show 2*j+1+(n-2*j-1)=n by omega] at h
 convert h using 2
 congr 1
 apply sum_congr rfl
 intro s hs
 dsimp only
 rw [show 2*s+1+(n-2*j-1)=n-2*j+2*s by omega]

end
end MathGKM.Markov
