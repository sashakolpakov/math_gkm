import MarkovRunJets2BDEE
/-! Machine-authored 6604cff8. Universal fourth run jet by recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def jetClosed24N6604 (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (408*X^2 + 5880*X^3 + 32664*X^4 + 98424*X^5 + 183024*X^6 + 222384*X^7 + 180144*X^8 + 96624*X^9 + 33144*X^10 + 6744*X^11 + 696*X^12 + 24*X^13 + -4*N*X + -676*N*X^2 + -6148*N*X^3 + -22572*N*X^4 + -41872*N*X^5 + -36712*N*X^6 + 1208*N*X^7 + 37288*N*X^8 + 40348*N*X^9 + 21708*N*X^10 + 6412*N*X^11 + 964*N*X^12 + 56*N*X^13 + 10*N^2*X + 412*N^2*X^2 + 2240*N^2*X^3 + 4596*N^2*X^4 + 2506*N^2*X^5 + -5224*N^2*X^6 + -9584*N^2*X^7 + -4504*N^2*X^8 + 2686*N^2*X^9 + 4236*N^2*X^10 + 2096*N^2*X^11 + 484*N^2*X^12 + 46*N^2*X^13 + -8*N^3*X + -104*N^3*X^2 + -296*N^3*X^3 + -120*N^3*X^4 + 640*N^3*X^5 + 880*N^3*X^6 + -80*N^3*X^7 + -880*N^3*X^8 + -520*N^3*X^9 + 120*N^3*X^10 + 248*N^3*X^11 + 104*N^3*X^12 + 16*N^3*X^13 + 2*N^4*X + 8*N^4*X^2 + 4*N^4*X^3 + -24*N^4*X^4 + -34*N^4*X^5 + 16*N^4*X^6 + 56*N^4*X^7 + 16*N^4*X^8 + -34*N^4*X^9 + -24*N^4*X^10 + 4*N^4*X^11 + 8*N^4*X^12 + 2*N^4*X^13)+X^n*(-408*X^2 + -5880*X^3 + -32664*X^4 + -98424*X^5 + -183024*X^6 + -222384*X^7 + -180144*X^8 + -96624*X^9 + -33144*X^10 + -6744*X^11 + -696*X^12 + -24*X^13 + -12*N*X + -724*N*X^2 + -6196*N*X^3 + -22428*N*X^4 + -41608*N*X^5 + -36808*N*X^6 + 792*N*X^7 + 37192*N*X^8 + 40612*N*X^9 + 21852*N*X^10 + 6364*N*X^11 + 916*N*X^12 + 48*N*X^13 + -22*N^2*X + -436*N^2*X^2 + -2192*N^2*X^3 + -4476*N^2*X^4 + -2566*N^2*X^5 + 4984*N^2*X^6 + 9584*N^2*X^7 + 4744*N^2*X^8 + -2626*N^2*X^9 + -4356*N^2*X^10 + -2144*N^2*X^11 + -460*N^2*X^12 + -34*N^2*X^13 + -12*N^3*X + -104*N^3*X^2 + -272*N^3*X^3 + -120*N^3*X^4 + 580*N^3*X^5 + 880*N^3*X^6 + -880*N^3*X^8 + -580*N^3*X^9 + 120*N^3*X^10 + 272*N^3*X^11 + 104*N^3*X^12 + 12*N^3*X^13 + -2*N^4*X + -8*N^4*X^2 + -4*N^4*X^3 + 24*N^4*X^4 + 34*N^4*X^5 + -16*N^4*X^6 + -56*N^4*X^7 + -16*N^4*X^8 + 34*N^4*X^9 + 24*N^4*X^10 + -4*N^4*X^11 + -8*N^4*X^12 + -2*N^4*X^13)
theorem jet_closed_24N6604 (n : ℕ) :
 24*(1-X)^9*(runEntryBDEE 2 n).coeff 4=jetClosed24N6604 n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_2_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed24N6604] <;> ring
 | one =>
   rw [run_base_2_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed24N6604] <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 2 n 3
   have hp := jet_closed_23BDEE (n+1)
   have he : jetClosed24N6604 (n+2)=(1+X)*jetClosed24N6604 (n+1)-X*jetClosed24N6604 n+
       4*(1-X)^2*(1+X)^2*jetClosed23BDEE (n+1) := by
     simp only [jetClosed24N6604,jetClosed23BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 24*(1-X)^9*h+(1+X)*ih1-X*ih+4*(1-X)^2*(1+X)^2*hp
end
end MathGKM.Markov
