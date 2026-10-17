import MarkovGFAlgebraM13E
import MarkovThreeSeriesM9E2
/-! Machine-authored 13e37040. Universal source-attached rational series split.
The D and E coefficient extractions are not presumed from numerical evidence. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 16000000
set_option maxRecDepth 10000
attribute [local irreducible] U V

theorem gf_source_numerM13E (r : Bool) :
 threeNumerM9E2 r=gfSourceNumM13E (C U) (C V) X r := by
 have h0 := fib_zero6
 have h1 := fib_one6
 have h2 := fib_rec6 0
 have h3 := fib_rec6 1
 have h4 := fib_rec6 2
 norm_num only [Nat.reduceAdd] at h2 h3 h4
 cases r <;> simp only [threeNumerM9E2,threePolyM9E2,threeCubicM9E2,
   Bool.false_eq_true,if_false,if_true,Nat.reduceAdd,h4,h3,h2,h0,h1,
   cubeTraceM9E2,cubeSecondM9E2,S,gfSourceNumM13E,
   map_add,map_sub,map_mul,map_pow,map_ofNat,map_one] <;> ring

theorem gf_source_denomM13E :
 threeDenomM9E2=gfSmallM13E (C U) (C V) X*gfCubeM13E (C U) (C V) X := by
 simp only [threeDenomM9E2,cubeTraceM9E2,cubeSecondM9E2,S,
   gfSmallM13E,gfCubeM13E,map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]
 ring

def gfDDenomM13E : PowerSeries BiPoly :=
 gfRampM13E (C V) X*gfUpperM13E (C V) X*gfCubeM13E (C U) (C V) X
def gfEDenomM13E : PowerSeries BiPoly :=
 gfRampM13E (C V) X*gfLowerM13E (C V) X*gfSmallM13E (C U) (C V) X
def gfLDenomM13E : PowerSeries BiPoly := gfUpperM13E (C V) X*gfLowerM13E (C V) X

theorem gf_d_constantM13E : constantCoeff gfDDenomM13E=1 := by
 simp [gfDDenomM13E,gfRampM13E,gfUpperM13E,gfCubeM13E]
theorem gf_e_constantM13E : constantCoeff gfEDenomM13E=1 := by
 simp [gfEDenomM13E,gfRampM13E,gfLowerM13E,gfSmallM13E]
theorem gf_l_constantM13E : constantCoeff gfLDenomM13E=1 := by
 simp [gfLDenomM13E,gfUpperM13E,gfLowerM13E]

def gfDSeriesM13E (r : Bool) : PowerSeries BiPoly :=
 gfDNumM13E (C U) (C V) X r*invOfUnit gfDDenomM13E 1
def gfESeriesM13E (r : Bool) : PowerSeries BiPoly :=
 gfENumM13E (C U) (C V) X r*invOfUnit gfEDenomM13E 1
def gfLSeriesM13E (r : Bool) : PowerSeries BiPoly :=
 gfLowNumM13E (C U) (C V) X r*invOfUnit gfLDenomM13E 1

theorem gf_d_equationM13E (r : Bool) :
 gfDDenomM13E*gfDSeriesM13E r=gfDNumM13E (C U) (C V) X r := by
 rw [gfDSeriesM13E,mul_left_comm,gfDDenomM13E] -- expose and refold below
 change gfDNumM13E (C U) (C V) X r*(gfDDenomM13E*invOfUnit gfDDenomM13E 1)=_
 rw [mul_invOfUnit _ 1 (by simpa using gf_d_constantM13E),mul_one]
theorem gf_e_equationM13E (r : Bool) :
 gfEDenomM13E*gfESeriesM13E r=gfENumM13E (C U) (C V) X r := by
 rw [gfESeriesM13E,mul_left_comm]
 rw [mul_invOfUnit _ 1 (by simpa using gf_e_constantM13E),mul_one]
theorem gf_l_equationM13E (r : Bool) :
 gfLDenomM13E*gfLSeriesM13E r=gfLowNumM13E (C U) (C V) X r := by
 rw [gfLSeriesM13E,mul_left_comm]
 rw [mul_invOfUnit _ 1 (by simpa using gf_l_constantM13E),mul_one]

theorem gf_source_splitM13E (r : Bool) :
 threeSeriesM9E2 r=gfDSeriesM13E r+gfESeriesM13E r+gfLSeriesM13E r := by
 let F := gfSmallM13E (C U) (C V) X
 let G := gfCubeM13E (C U) (C V) X
 let R := gfRampM13E (C V) X
 let A := gfUpperM13E (C V) X
 let B := gfLowerM13E (C V) X
 have hS := three_series_equationM9E2 r
 rw [gf_source_denomM13E,gf_source_numerM13E] at hS
 have hD := gf_d_equationM13E r
 have hE := gf_e_equationM13E r
 have hL := gf_l_equationM13E r
 have hAlg := gf_algebraM13E (C U) (C V) X r
 change (F*G)*threeSeriesM9E2 r=_ at hS
 change (R*A*G)*gfDSeriesM13E r=_ at hD
 change (R*B*F)*gfESeriesM13E r=_ at hE
 change (A*B)*gfLSeriesM13E r=_ at hL
 change _*R*A*B=_*B*F+_*A*G+_*F*G*R at hAlg
 have hn : R*A*B*F*G≠0 := by
   intro hz
   have hh := congrArg constantCoeff hz
   simp [R,A,B,F,G,gfRampM13E,gfUpperM13E,gfLowerM13E,gfSmallM13E,gfCubeM13E] at hh
 apply mul_left_cancel₀ hn
 linear_combination R*A*B*hS-B*F*hD-A*G*hE-R*F*G*hL+hAlg

theorem gf_source_coeff_splitM13E (q : ℕ) (r : Bool) :
 threePolyM9E2 q r=PowerSeries.coeff q (gfDSeriesM13E r)+
   PowerSeries.coeff q (gfESeriesM13E r)+PowerSeries.coeff q (gfLSeriesM13E r) := by
 have h := congrArg (PowerSeries.coeff q) (gf_source_splitM13E r)
 simpa only [threeSeriesM9E2,coeff_mk,map_add] using h

end
end MathGKM.Markov
