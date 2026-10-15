import MarkovNormalJetsFDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def normalLocal100FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 2 + -24*x + -132*x^2 + -400*x^3 + -744*x^4 + -792*x^5 + -492*x^6 + -192*x^7 + -42*x^8 + 12*Z*x + 180*Z*x^2 + 336*Z*x^3 + 444*Z*x^4 + 552*Z*x^5 + 300*Z*x^6 + 48*Z*x^7 + 36*Z*x^8 + 12*Z*x^9 + -24*Z^2*x^2 + 48*Z^2*x^3 + 312*Z^2*x^4 + 288*Z^2*x^5 + 24*Z^2*x^6 + 48*Z^2*x^7 + 72*Z^2*x^8 + 16*Z^3*x^3 + -96*Z^3*x^4 + 120*Z^3*x^5 + 192*Z^3*x^7 + -96*Z^3*x^8 + -8*Z^3*x^9 + 2*N + 18*N*x + 60*N*x^2 + 92*N*x^3 + 48*N*x^4 + -48*N*x^5 + -92*N*x^6 + -60*N*x^7 + -18*N*x^8 + -2*N*x^9 + 216*N*Z*x^2 + 384*N*Z*x^3 + 24*N*Z*x^4 + -192*N*Z*x^5 + -120*N*Z*x^6 + -192*N*Z*x^7 + -120*N*Z*x^8 + -48*N*Z^2*x^3 + 192*N*Z^2*x^4 + 336*N*Z^2*x^5 + -192*N*Z^2*x^6 + -336*N*Z^2*x^7 + 48*N*Z^2*x^9 + 48*N^2*Z*x^2 + 96*N^2*Z*x^3 + -48*N^2*Z*x^4 + -192*N^2*Z*x^5 + -48*N^2*Z*x^6 + 96*N^2*Z*x^7 + 48*N^2*Z*x^8
theorem normal_local_generic_100FDDA (N Z x : RunFieldBDEE) (hx : 1-x≠0) :
 (1-x)^6*(2*((normalJet31FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+0) (Z*x^0) x))^3-6*((normalJet31FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+0) (Z*x^0) x))*((normalJet32FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet12FDDA (N+0) (Z*x^0) x))+6*((normalJet33FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet13FDDA (N+0) (Z*x^0) x))+6*(((normalJet21FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet01FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet31FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet11FDDA (N+0) (Z*x^0) x))*(normalJet12FDDA (N+0) (Z*x^0) x)+((normalJet22FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet02FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet32FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet12FDDA (N+0) (Z*x^0) x))*(normalJet11FDDA (N+0) (Z*x^0) x))-6*((normalJet21FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet01FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet31FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet11FDDA (N+0) (Z*x^0) x))*(normalJet11FDDA (N+0) (Z*x^0) x)*(((normalJet31FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+0) (Z*x^0) x))+((normalJet31FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet11FDDA (N+0) (Z*x^0) x)))+6*((normalJet21FDDA (N+0) (Z*x^0) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet01FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet31FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet11FDDA (N+0) (Z*x^0) x))*((normalJet01FDDA (N+0) (Z*x^0) x)-(normalJet20FDDA (N+0) (Z*x^0) x)*(normalJet11FDDA (N+0) (Z*x^0) x)))=normalLocal100FDDA N Z x := by
 unfold normalLocal100FDDA normalJet01FDDA normalJet02FDDA normalJet13FDDA normalJet11FDDA normalJet12FDDA normalJet20FDDA normalJet21FDDA normalJet22FDDA normalJet31FDDA normalJet32FDDA normalJet33FDDA
 field_simp
 <;> ring
end
end MathGKM.Markov
