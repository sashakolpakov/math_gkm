import MarkovNormalJetsFDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def normalLocal111FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 4 + -6*x + -72*x^2 + -308*x^3 + -696*x^4 + -840*x^5 + -584*x^6 + -252*x^7 + -60*x^8 + -2*x^9 + 504*Z*x^3 + 768*Z*x^4 + 336*Z*x^5 + 288*Z*x^6 + 120*Z*x^7 + -96*Z*x^8 + -240*Z^2*x^5 + 1008*Z^2*x^6 + 480*Z^2*x^7 + -672*Z^2*x^8 + 144*Z^2*x^9 + 48*Z^2*x^10 + 24*Z^3*x^7 + -288*Z^3*x^8 + 656*Z^3*x^9 + -288*Z^3*x^10 + 24*Z^3*x^11 + 2*N + 18*N*x + 60*N*x^2 + 92*N*x^3 + 48*N*x^4 + -48*N*x^5 + -92*N*x^6 + -60*N*x^7 + -18*N*x^8 + -2*N*x^9 + 312*N*Z*x^3 + 576*N*Z*x^4 + -72*N*Z*x^5 + -576*N*Z*x^6 + -216*N*Z*x^7 + -24*N*Z*x^9 + -96*N*Z^2*x^5 + 288*N*Z^2*x^6 + 384*N*Z^2*x^7 + -384*N*Z^2*x^8 + -288*N*Z^2*x^9 + 96*N*Z^2*x^10 + 48*N^2*Z*x^3 + 96*N^2*Z*x^4 + -48*N^2*Z*x^5 + -192*N^2*Z*x^6 + -48*N^2*Z*x^7 + 96*N^2*Z*x^8 + 48*N^2*Z*x^9
theorem normal_local_generic_111FDDA (N Z x : RunFieldBDEE) (hx : 1-x≠0) :
 (1-x)^6*(2*((normalJet31FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x))^3-6*((normalJet31FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x))*((normalJet32FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet12FDDA (N+1) (Z*x^1) x))+6*((normalJet33FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet13FDDA (N+1) (Z*x^1) x))+6*(((normalJet21FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet01FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet31FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x))*(normalJet12FDDA (N+1) (Z*x^1) x)+((normalJet22FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet02FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet32FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet12FDDA (N+1) (Z*x^1) x))*(normalJet11FDDA (N+1) (Z*x^1) x))-6*((normalJet21FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet01FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet31FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x))*(normalJet11FDDA (N+1) (Z*x^1) x)*(((normalJet31FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x))+((normalJet31FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x)))+6*((normalJet21FDDA (N+1) (Z*x^1) x)+(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet01FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet31FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x))*((normalJet01FDDA (N+1) (Z*x^1) x)-(normalJet20FDDA (N+1) (Z*x^1) x)*(normalJet11FDDA (N+1) (Z*x^1) x)))=normalLocal111FDDA N Z x := by
 unfold normalLocal111FDDA normalJet01FDDA normalJet02FDDA normalJet13FDDA normalJet11FDDA normalJet12FDDA normalJet20FDDA normalJet21FDDA normalJet22FDDA normalJet31FDDA normalJet32FDDA normalJet33FDDA
 field_simp
 <;> ring
end
end MathGKM.Markov
