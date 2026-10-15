import MarkovRunJets1BDEE
/-! Machine-authored 6604cff8. Universal fourth run jet by recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def jetClosed14N6604 (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (-72*X + -360*X^2 + -456*X^3 + 504*X^4 + 1584*X^5 + 624*X^6 + -1296*X^7 + -1296*X^8 + 24*X^9 + 504*X^10 + 216*X^11 + 24*X^12 + 8*N + 108*N*X + 204*N*X^2 + -252*N*X^3 + -852*N*X^4 + -72*N*X^5 + 1208*N*X^6 + 648*N*X^7 + -672*N*X^8 + -612*N*X^9 + 60*N*X^10 + 180*N*X^11 + 44*N*X^12 + -12*N^2 + -36*N^2*X + 36*N^2*X^2 + 180*N^2*X^3 + -360*N^2*X^5 + -120*N^2*X^6 + 360*N^2*X^7 + 180*N^2*X^8 + -180*N^2*X^9 + -108*N^2*X^10 + 36*N^2*X^11 + 24*N^2*X^12 + 4*N^3 + -24*N^3*X^2 + 60*N^3*X^4 + -80*N^3*X^6 + 60*N^3*X^8 + -24*N^3*X^10 + 4*N^3*X^12)+X^n*(72*X + 360*X^2 + 456*X^3 + -504*X^4 + -1584*X^5 + -624*X^6 + 1296*X^7 + 1296*X^8 + -24*X^9 + -504*X^10 + -216*X^11 + -24*X^12 + 60*N*X + 156*N*X^2 + -108*N*X^3 + -588*N*X^4 + -168*N*X^5 + 792*N*X^6 + 552*N*X^7 + -408*N*X^8 + -468*N*X^9 + 12*N*X^10 + 132*N*X^11 + 36*N*X^12 + 12*N^2*X + 12*N^2*X^2 + -60*N^2*X^3 + -60*N^2*X^4 + 120*N^2*X^5 + 120*N^2*X^6 + -120*N^2*X^7 + -120*N^2*X^8 + 60*N^2*X^9 + 60*N^2*X^10 + -12*N^2*X^11 + -12*N^2*X^12)
theorem jet_closed_14N6604 (n : ℕ) :
 24*(1-X)^9*(runEntryBDEE 1 n).coeff 4=jetClosed14N6604 n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_1_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed14N6604] <;> ring
 | one =>
   rw [run_base_1_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed14N6604] <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 1 n 3
   have hp := jet_closed_13BDEE (n+1)
   have he : jetClosed14N6604 (n+2)=(1+X)*jetClosed14N6604 (n+1)-X*jetClosed14N6604 n+
       4*(1-X)^2*(1+X)^2*jetClosed13BDEE (n+1) := by
     simp only [jetClosed14N6604,jetClosed13BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 24*(1-X)^9*h+(1+X)*ih1-X*ih+4*(1-X)^2*(1+X)^2*hp
end
end MathGKM.Markov
