import MarkovRunJets0BDEE
/-! Machine-authored 6604cff8. Universal fourth run jet by recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def jetClosed04N6604 (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (-24*X + -408*X^2 + -1848*X^3 + -3288*X^4 + -1008*X^5 + 4752*X^6 + 6672*X^7 + 1872*X^8 + -2808*X^9 + -2808*X^10 + -984*X^11 + -120*X^12 + 52*N*X + 436*N*X^2 + 988*N*X^3 + 28*N*X^4 + -2552*N*X^5 + -2552*N*X^6 + 1208*N*X^7 + 3128*N*X^8 + 1028*N*X^9 + -892*N*X^10 + -724*N*X^11 + -148*N*X^12 + -36*N^2*X + -132*N^2*X^2 + -12*N^2*X^3 + 468*N^2*X^4 + 408*N^2*X^5 + -552*N^2*X^6 + -792*N^2*X^7 + 168*N^2*X^8 + 588*N^2*X^9 + 108*N^2*X^10 + -156*N^2*X^11 + -60*N^2*X^12 + 8*N^3*X + 8*N^3*X^2 + -40*N^3*X^3 + -40*N^3*X^4 + 80*N^3*X^5 + 80*N^3*X^6 + -80*N^3*X^7 + -80*N^3*X^8 + 40*N^3*X^9 + 40*N^3*X^10 + -8*N^3*X^11 + -8*N^3*X^12)+X^n*(24*X + 408*X^2 + 1848*X^3 + 3288*X^4 + 1008*X^5 + -4752*X^6 + -6672*X^7 + -1872*X^8 + 2808*X^9 + 2808*X^10 + 984*X^11 + 120*X^12 + 44*N*X + 388*N*X^2 + 940*N*X^3 + 172*N*X^4 + -2288*N*X^5 + -2648*N*X^6 + 792*N*X^7 + 3032*N*X^8 + 1292*N*X^9 + -748*N*X^10 + -772*N*X^11 + -196*N*X^12 + -8*N*X^13 + 24*N^2*X + 108*N^2*X^2 + 60*N^2*X^3 + -348*N^2*X^4 + -468*N^2*X^5 + 312*N^2*X^6 + 792*N^2*X^7 + 72*N^2*X^8 + -528*N^2*X^9 + -228*N^2*X^10 + 108*N^2*X^11 + 84*N^2*X^12 + 12*N^2*X^13 + 4*N^3*X + 8*N^3*X^2 + -16*N^3*X^3 + -40*N^3*X^4 + 20*N^3*X^5 + 80*N^3*X^6 + -80*N^3*X^8 + -20*N^3*X^9 + 40*N^3*X^10 + 16*N^3*X^11 + -8*N^3*X^12 + -4*N^3*X^13)
theorem jet_closed_04N6604 (n : ℕ) :
 24*(1-X)^9*(runEntryBDEE 0 n).coeff 4=jetClosed04N6604 n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_0_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed04N6604] <;> ring
 | one =>
   rw [run_base_0_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed04N6604] <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 0 n 3
   have hp := jet_closed_03BDEE (n+1)
   have he : jetClosed04N6604 (n+2)=(1+X)*jetClosed04N6604 (n+1)-X*jetClosed04N6604 n+
       4*(1-X)^2*(1+X)^2*jetClosed03BDEE (n+1) := by
     simp only [jetClosed04N6604,jetClosed03BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 24*(1-X)^9*h+(1+X)*ih1-X*ih+4*(1-X)^2*(1+X)^2*hp
end
end MathGKM.Markov
