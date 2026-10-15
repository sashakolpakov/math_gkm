import MarkovRunJets3BDEE
/-! Machine-authored 6604cff8. Universal fourth run jet by recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def jetClosed34N6604 (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (48*X + 1080*X^2 + 6264*X^3 + 16704*X^4 + 22464*X^5 + 10704*X^6 + -11376*X^7 + -22176*X^8 + -16176*X^9 + -6216*X^10 + -1224*X^11 + -96*X^12 + 2*N + -130*N*X + -1416*N*X^2 + -4784*N*X^3 + -6070*N*X^4 + 1230*N*X^5 + 11520*N*X^6 + 10960*N*X^7 + 630*N*X^8 + -5830*N*X^9 + -4472*N*X^10 + -1440*N*X^11 + -194*N*X^12 + -6*N*X^13 + -1*N^2 + 117*N^2*X + 614*N^2*X^2 + 866*N^2*X^3 + -655*N^2*X^4 + -2725*N^2*X^5 + -1580*N^2*X^6 + 1820*N^2*X^7 + 2545*N^2*X^8 + 475*N^2*X^9 + -794*N^2*X^10 + -542*N^2*X^11 + -129*N^2*X^12 + -11*N^2*X^13 + -2*N^3 + -38*N^3*X + -84*N^3*X^2 + 68*N^3*X^3 + 322*N^3*X^4 + 102*N^3*X^5 + -408*N^3*X^6 + -328*N^3*X^7 + 162*N^3*X^8 + 262*N^3*X^9 + 44*N^3*X^10 + -60*N^3*X^11 + -34*N^3*X^12 + -6*N^3*X^13 + 1*N^4 + 3*N^4*X + -2*N^4*X^2 + -14*N^4*X^3 + -5*N^4*X^4 + 25*N^4*X^5 + 20*N^4*X^6 + -20*N^4*X^7 + -25*N^4*X^8 + 5*N^4*X^9 + 14*N^4*X^10 + 2*N^4*X^11 + -3*N^4*X^12 + -1*N^4*X^13)+X^n*(-48*X + -1080*X^2 + -6264*X^3 + -16704*X^4 + -22464*X^5 + -10704*X^6 + 11376*X^7 + 22176*X^8 + 16176*X^9 + 6216*X^10 + 1224*X^11 + 96*X^12 + -88*N*X + -1008*N*X^2 + -3560*N*X^3 + -4720*N*X^4 + 720*N*X^5 + 8800*N*X^6 + 8560*N*X^7 + 480*N*X^8 + -4600*N*X^9 + -3440*N*X^10 + -1032*N*X^11 + -112*N*X^12 + -48*N^2*X + -288*N^2*X^2 + -480*N^2*X^3 + 240*N^2*X^4 + 1440*N^2*X^5 + 960*N^2*X^6 + -960*N^2*X^7 + -1440*N^2*X^8 + -240*N^2*X^9 + 480*N^2*X^10 + 288*N^2*X^11 + 48*N^2*X^12 + -8*N^3*X + -24*N^3*X^2 + 8*N^3*X^3 + 88*N^3*X^4 + 48*N^3*X^5 + -112*N^3*X^6 + -112*N^3*X^7 + 48*N^3*X^8 + 88*N^3*X^9 + 8*N^3*X^10 + -24*N^3*X^11 + -8*N^3*X^12)
theorem jet_closed_34N6604 (n : ℕ) :
 24*(1-X)^9*(runEntryBDEE 3 n).coeff 4=jetClosed34N6604 n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_3_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed34N6604] <;> ring
 | one =>
   rw [run_base_3_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed34N6604] <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 3 n 3
   have hp := jet_closed_33BDEE (n+1)
   have he : jetClosed34N6604 (n+2)=(1+X)*jetClosed34N6604 (n+1)-X*jetClosed34N6604 n+
       4*(1-X)^2*(1+X)^2*jetClosed33BDEE (n+1) := by
     simp only [jetClosed34N6604,jetClosed33BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 24*(1-X)^9*h+(1+X)*ih1-X*ih+4*(1-X)^2*(1+X)^2*hp
end
end MathGKM.Markov
