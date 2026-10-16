import MarkovSmallBlocksMEA
/-! Machine-authored ead8a96f. All-index raw small-column gap certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

theorem s43zeroMEA (q j : ℤ) (hq : 2 ≤ q) (hj : j ≤ 0) :
 s43EMEA q j=0 := by
 unfold s43EMEA
 rw [vFall_zeroM758 (j-0*q) 1 (by omega)]
 rw [vFall_zeroM758 (j-0*q) 2 (by omega)]
 rw [vFall_zeroM758 (j-0*q) 3 (by omega)]
 rw [vFall_zeroM758 (j-1*q) 2 (by omega)]
 rw [vFall_zeroM758 (j-1*q) 3 (by omega)]
 rw [vFall_zeroM758 (j-1*q) 4 (by omega)]
 rw [vFall_zeroM758 (j-1*q) 5 (by omega)]
 rw [vFall_zeroM758 (j-2*q) 2 (by omega)]
 rw [vFall_zeroM758 (j-2*q) 3 (by omega)]
 rw [vFall_zeroM758 (j-2*q) 4 (by omega)]
 rw [vFall_zeroM758 (j-2*q) 5 (by omega)]
 rw [vFall_zeroM758 (j-2*q) 6 (by omega)]
 rw [vFall_zeroM758 (j-2*q) 7 (by omega)]
 ring

theorem s43pastMEA (q j : ℤ) (hq : 2 ≤ q) (hj : 2*q+5 ≤ j) :
 s43EMEA q j=0 := by
 unfold s43EMEA
 rw [vFall_polyM758 (j-0*q) 1 (by omega)]
 rw [vFall_polyM758 (j-0*q) 2 (by omega)]
 rw [vFall_polyM758 (j-0*q) 3 (by omega)]
 rw [vFall_polyM758 (j-1*q) 2 (by omega)]
 rw [vFall_polyM758 (j-1*q) 3 (by omega)]
 rw [vFall_polyM758 (j-1*q) 4 (by omega)]
 rw [vFall_polyM758 (j-1*q) 5 (by omega)]
 rw [vFall_polyM758 (j-2*q) 2 (by omega)]
 rw [vFall_polyM758 (j-2*q) 3 (by omega)]
 rw [vFall_polyM758 (j-2*q) 4 (by omega)]
 rw [vFall_polyM758 (j-2*q) 5 (by omega)]
 rw [vFall_polyM758 (j-2*q) 6 (by omega)]
 rw [vFall_polyM758 (j-2*q) 7 (by omega)]
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring

theorem s43first1MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((1)-1)*s43EMEA (x+8) ((1)+1) ≤
 s43EMEA (x+8) (1)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((1)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((1)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((1)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((1)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((1)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((1)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((1)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((1)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((1)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43first2MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((2)-1)*s43EMEA (x+8) ((2)+1) ≤
 s43EMEA (x+8) (2)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((2)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((2)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((2)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((2)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((2)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((2)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((2)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((2)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((2)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((2)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((2)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((2)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((2)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((2)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((2)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((2)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43first3MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((3)-1)*s43EMEA (x+8) ((3)+1) ≤
 s43EMEA (x+8) (3)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((3)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((3)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((3)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((3)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((3)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((3)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((3)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((3)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((3)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((3)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((3)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((3)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((3)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((3)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((3)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((3)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((3)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((3)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((3)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((3)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((3)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43first4MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((4)-1)*s43EMEA (x+8) ((4)+1) ≤
 s43EMEA (x+8) (4)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((4)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((4)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((4)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((4)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((4)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((4)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((4)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((4)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((4)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((4)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((4)-0*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((4)-1*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((4)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((4)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((4)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((4)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((4)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((4)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((4)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((4)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((4)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43lowMEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+y+5) ((x+5)-1)*s43EMEA (x+y+5) ((x+5)+1) ≤
 s43EMEA (x+y+5) (x+5)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((x+5)-1)-0*(x+y+5)) 1 (by omega)]
 rw [vFall_polyM758 (((x+5)-1)-0*(x+y+5)) 2 (by omega)]
 rw [vFall_polyM758 (((x+5)-1)-0*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-1*(x+y+5)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-1*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-1*(x+y+5)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-1*(x+y+5)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-2*(x+y+5)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-2*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-2*(x+y+5)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-2*(x+y+5)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-2*(x+y+5)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+5)-1)-2*(x+y+5)) 7 (by omega)]
 rw [vFall_polyM758 (((x+5)+1)-0*(x+y+5)) 1 (by omega)]
 rw [vFall_polyM758 (((x+5)+1)-0*(x+y+5)) 2 (by omega)]
 rw [vFall_polyM758 (((x+5)+1)-0*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-1*(x+y+5)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-1*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-1*(x+y+5)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-1*(x+y+5)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-2*(x+y+5)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-2*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-2*(x+y+5)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-2*(x+y+5)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-2*(x+y+5)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+5)+1)-2*(x+y+5)) 7 (by omega)]
 rw [vFall_polyM758 ((x+5)-0*(x+y+5)) 1 (by omega)]
 rw [vFall_polyM758 ((x+5)-0*(x+y+5)) 2 (by omega)]
 rw [vFall_polyM758 ((x+5)-0*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+5)-1*(x+y+5)) 2 (by omega)]
 rw [vFall_zeroM758 ((x+5)-1*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+5)-1*(x+y+5)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+5)-1*(x+y+5)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+5)-2*(x+y+5)) 2 (by omega)]
 rw [vFall_zeroM758 ((x+5)-2*(x+y+5)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+5)-2*(x+y+5)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+5)-2*(x+y+5)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+5)-2*(x+y+5)) 6 (by omega)]
 rw [vFall_zeroM758 ((x+5)-2*(x+y+5)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43cross1MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((x+8+1)-1)*s43EMEA (x+8) ((x+8+1)+1) ≤
 s43EMEA (x+8) (x+8+1)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((x+8+1)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+1)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+1)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+1)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+1)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((x+8+1)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+1)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+1)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+1)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+1)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+1)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+1)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+1)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((x+8+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((x+8+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+8+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((x+8+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+8+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+8+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((x+8+1)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43cross2MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((x+8+2)-1)*s43EMEA (x+8) ((x+8+2)+1) ≤
 s43EMEA (x+8) (x+8+2)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((x+8+2)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+2)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+2)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+2)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+2)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+2)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((x+8+2)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+2)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+2)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+2)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+2)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+2)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+2)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+2)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((x+8+2)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((x+8+2)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+2)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+2)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+2)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+2)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((x+8+2)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+2)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((x+8+2)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+8+2)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+8+2)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+2)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((x+8+2)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43cross3MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((x+8+3)-1)*s43EMEA (x+8) ((x+8+3)+1) ≤
 s43EMEA (x+8) (x+8+3)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((x+8+3)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+3)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+3)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+3)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+3)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+3)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+3)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((x+8+3)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+3)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+3)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+3)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+3)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+3)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+3)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+3)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((x+8+3)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((x+8+3)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+3)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+3)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+3)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+3)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((x+8+3)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+3)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((x+8+3)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+8+3)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+8+3)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+3)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((x+8+3)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43cross4MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((x+8+4)-1)*s43EMEA (x+8) ((x+8+4)+1) ≤
 s43EMEA (x+8) (x+8+4)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((x+8+4)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+4)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+4)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+4)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+4)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+4)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+4)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((x+8+4)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+4)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+4)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+4)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+4)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+4)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+4)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+4)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((x+8+4)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((x+8+4)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+4)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+4)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+4)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+4)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((x+8+4)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+4)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((x+8+4)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+8+4)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+8+4)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+4)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((x+8+4)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43cross5MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((x+8+5)-1)*s43EMEA (x+8) ((x+8+5)+1) ≤
 s43EMEA (x+8) (x+8+5)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((x+8+5)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+5)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+5)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+5)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+5)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+5)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+5)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((x+8+5)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((x+8+5)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+5)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+5)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((x+8+5)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((x+8+5)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((x+8+5)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((x+8+5)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((x+8+5)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((x+8+5)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+5)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+5)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((x+8+5)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((x+8+5)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((x+8+5)-1*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+5)-2*(x+8)) 2 (by omega)]
 rw [vFall_zeroM758 ((x+8+5)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 ((x+8+5)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((x+8+5)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((x+8+5)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((x+8+5)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43midMEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+y+6) ((2*x+y+12)-1)*s43EMEA (x+y+6) ((2*x+y+12)+1) ≤
 s43EMEA (x+y+6) (2*x+y+12)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((2*x+y+12)-1)-0*(x+y+6)) 1 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)-1)-0*(x+y+6)) 2 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)-1)-0*(x+y+6)) 3 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)-1)-1*(x+y+6)) 2 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)-1)-1*(x+y+6)) 3 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)-1)-1*(x+y+6)) 4 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)-1)-1*(x+y+6)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)-1)-2*(x+y+6)) 2 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)-1)-2*(x+y+6)) 3 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)-1)-2*(x+y+6)) 4 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)-1)-2*(x+y+6)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)-1)-2*(x+y+6)) 6 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)-1)-2*(x+y+6)) 7 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)+1)-0*(x+y+6)) 1 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)+1)-0*(x+y+6)) 2 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)+1)-0*(x+y+6)) 3 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)+1)-1*(x+y+6)) 2 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)+1)-1*(x+y+6)) 3 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)+1)-1*(x+y+6)) 4 (by omega)]
 rw [vFall_polyM758 (((2*x+y+12)+1)-1*(x+y+6)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)+1)-2*(x+y+6)) 2 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)+1)-2*(x+y+6)) 3 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)+1)-2*(x+y+6)) 4 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)+1)-2*(x+y+6)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)+1)-2*(x+y+6)) 6 (by omega)]
 rw [vFall_zeroM758 (((2*x+y+12)+1)-2*(x+y+6)) 7 (by omega)]
 rw [vFall_polyM758 ((2*x+y+12)-0*(x+y+6)) 1 (by omega)]
 rw [vFall_polyM758 ((2*x+y+12)-0*(x+y+6)) 2 (by omega)]
 rw [vFall_polyM758 ((2*x+y+12)-0*(x+y+6)) 3 (by omega)]
 rw [vFall_polyM758 ((2*x+y+12)-1*(x+y+6)) 2 (by omega)]
 rw [vFall_polyM758 ((2*x+y+12)-1*(x+y+6)) 3 (by omega)]
 rw [vFall_polyM758 ((2*x+y+12)-1*(x+y+6)) 4 (by omega)]
 rw [vFall_polyM758 ((2*x+y+12)-1*(x+y+6)) 5 (by omega)]
 rw [vFall_zeroM758 ((2*x+y+12)-2*(x+y+6)) 2 (by omega)]
 rw [vFall_zeroM758 ((2*x+y+12)-2*(x+y+6)) 3 (by omega)]
 rw [vFall_zeroM758 ((2*x+y+12)-2*(x+y+6)) 4 (by omega)]
 rw [vFall_zeroM758 ((2*x+y+12)-2*(x+y+6)) 5 (by omega)]
 rw [vFall_zeroM758 ((2*x+y+12)-2*(x+y+6)) 6 (by omega)]
 rw [vFall_zeroM758 ((2*x+y+12)-2*(x+y+6)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43tail1MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((2*(x+8)+1)-1)*s43EMEA (x+8) ((2*(x+8)+1)+1) ≤
 s43EMEA (x+8) (2*(x+8)+1)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+1)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+1)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+1)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+1)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+1)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+1)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+1)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 ((2*(x+8)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((2*(x+8)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((2*(x+8)+1)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43tail2MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((2*(x+8)+2)-1)*s43EMEA (x+8) ((2*(x+8)+2)+1) ≤
 s43EMEA (x+8) (2*(x+8)+2)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+2)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+2)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+2)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+2)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+2)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-2*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+2)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 ((2*(x+8)+2)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((2*(x+8)+2)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43tail3MEA (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 s43EMEA (x+8) ((2*(x+8)+3)-1)*s43EMEA (x+8) ((2*(x+8)+3)+1) ≤
 s43EMEA (x+8) (2*(x+8)+3)^2 := by
 unfold s43EMEA
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-2*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)-1)-2*(x+8)) 5 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+3)-1)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 (((2*(x+8)+3)-1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-2*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-2*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-2*(x+8)) 6 (by omega)]
 rw [vFall_polyM758 (((2*(x+8)+3)+1)-2*(x+8)) 7 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-0*(x+8)) 1 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-0*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-0*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-1*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-1*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-1*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-1*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-2*(x+8)) 2 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-2*(x+8)) 3 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-2*(x+8)) 4 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-2*(x+8)) 5 (by omega)]
 rw [vFall_polyM758 ((2*(x+8)+3)-2*(x+8)) 6 (by omega)]
 rw [vFall_zeroM758 ((2*(x+8)+3)-2*(x+8)) 7 (by omega)]
 apply sub_nonneg.mp
 simp only [s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA]
 ring_nf
 positivity

theorem s43adjacentMEA (q j : ℤ) (hq : 2 ≤ q) :
 s43EMEA q (j-1)*s43EMEA q (j+1) ≤ s43EMEA q j^2 := by
 by_cases h0 : j ≤ 1
 · rw [s43zeroMEA q (j-1) hq (by omega),zero_mul]; exact sq_nonneg _
 by_cases h1 : 2*q+4 ≤ j
 · rw [s43pastMEA q (j+1) hq (by omega),mul_zero]; exact sq_nonneg _
 by_cases hq8 : q < 8
 · interval_cases q <;> interval_cases j <;>
     norm_num [s43EMEA,s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA,vFallM758]
 have hq' : 8 ≤ q := by omega
 by_cases hj2 : j=2
 · subst j
   convert s43first2MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hj3 : j=3
 · subst j
   convert s43first3MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hj4 : j=4
 · subst j
   convert s43first4MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hl : j ≤ q
 · convert s43lowMEA (j-5) (q-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc1 : j=q+1
 · convert s43cross1MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc2 : j=q+2
 · convert s43cross2MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc3 : j=q+3
 · convert s43cross3MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc4 : j=q+4
 · convert s43cross4MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc5 : j=q+5
 · convert s43cross5MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hm : j ≤ 2*q
 · convert s43midMEA (j-q-6) (2*q-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 have ht : j=2*q+1 ∨ j=2*q+2 ∨ j=2*q+3 := by omega
 rcases ht with ht|ht|ht
 · convert s43tail1MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert s43tail2MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert s43tail3MEA (q-8) 0 (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega

end
end MathGKM.Markov
