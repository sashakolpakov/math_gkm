import MarkovFourthSource01F
/-! Machine-authored 01f51d63. Exact low-slope moment-to-raw transport.
The fourth local-moment premise below remains explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def fourthMomentPoly01F (c r q t u : ℤ) (M : ℤ[X]) : ℤ[X] :=
 let D := momentD6905 X (C c) (C r)-(1+X)
 let K := momentK6905 X (C c) (C r) (C q)+(1+X)^2
 let L := momentL6905 X (C c) (C r) (C q) (C t) (C u)-2*(1+X)^3
 D^4+6*D^2*K+3*K^2+4*D*L+M+6*(1+X)^4

theorem fourth_newton01F {R : Type*} [CommRing R] (p2 p3 p4 D K L M : R)
 (h2 : 2*p2=D^2+K) (h3 : 6*p3=D^3+3*D*K+L)
 (h4 : 24*p4-24*D*p3-12*p2^2+24*D^2*p2-6*D^4=M) :
 24*p4=D^4+6*D^2*K+3*K^2+4*D*L+M := by
 linear_combination h4+4*D*h3+(6*p2+3*(D^2+K)-12*D^2)*h2

theorem source_low_fourth_moment01F (rest : List Bool) (hc : 4≤(frame rest).mid.b)
 (M : ℤ[X])
 (h4 : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=M) :
 24*cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4=
 fourthMomentPoly01F (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) M := by
 have h1 := source_first_moment6905 rest
 have h2 := source_second_moment6905 rest (by omega)
 have h3 := source_cubic_momentADB2 rest hc
 unfold logFour01F at h4
 rw [h1] at h4
 have hn := fourth_newton01F _ _ _ _ _ _ _ h2 h3 h4
 have t1 := source_first_cut_trace487 (false::rest)
 have t2 := source_cut_trace75 (false::rest) 1
 have t3 := source_cut_trace75 (false::rest) 2
 have t4 := source_cut_trace75 (false::rest) 3
 rw [t2] at h2
 rw [t3] at h3
 rw [t4] at hn
 rw [t1] at h1
 unfold fourthMomentPoly01F
 dsimp only
 linear_combination hn-4*(1+X)*h3+12*(1+X)^2*h2-24*(1+X)^3*h1

end
end MathGKM.Markov
