import MarkovMiddlePositiveM99A
/-! Machine-authored 80fb7777. Rational polynomial expressions for raw correction jets. -/
namespace MathGKM.Markov
noncomputable section
def correctionJet1M80F (q k : ℚ) (r : Bool) : ℚ :=
 if r then (8
  +12*k) else (4
  +12*k)

def correctionJet2M80F (q k : ℚ) (r : Bool) : ℚ :=
 if r then (2*k
  -10*k^3
  +2*q*k
  +6*q*k^2) else (-2*k
  +12*k^2
  -10*k^3
  -2*q*k
  +6*q*k^2)

def correctionJet3M80F (q k : ℚ) (r : Bool) : ℚ :=
 if r then (-24*k
  +10*k^2
  +135*k^3
  -190*k^4
  +69*k^5
  -20*q*k
  -60*q*k^2
  +170*q*k^3
  -90*q*k^4
  -30*q^2*k^2
  +30*q^2*k^3)/30 else (86*k
  -385*k^2
  +565*k^3
  -335*k^4
  +69*k^5
  +110*q*k
  -330*q*k^2
  +310*q*k^3
  -90*q*k^4
  +30*q^2*k
  -60*q^2*k^2
  +30*q^2*k^3)/30

def correctionJet4M80F (q k : ℚ) (r : Bool) : ℚ :=
 if r then (600*k
  -420*k^2
  -3864*k^3
  +8190*k^4
  -6510*k^5
  +2310*k^6
  -306*k^7
  +490*q*k
  +1785*q*k^2
  -7525*q*k^3
  +8505*q*k^4
  -3885*q*k^5
  +630*q*k^6
  -84*q^2*k
  +1680*q^2*k^2
  -3255*q^2*k^3
  +2100*q^2*k^4
  -441*q^2*k^5
  -70*q^3*k
  +315*q^3*k^2
  -350*q^3*k^3
  +105*q^3*k^4)/1260 else (-3852*k
  +18186*k^2
  -32634*k^3
  +28980*k^4
  -13608*k^5
  +3234*k^6
  -306*k^7
  -5866*q*k
  +20895*q*k^2
  -28175*q*k^3
  +17955*q*k^4
  -5439*q*k^5
  +630*q*k^6
  -2604*q^2*k
  +7140*q^2*k^2
  -7035*q^2*k^3
  +2940*q^2*k^4
  -441*q^2*k^5
  -350*q^3*k
  +735*q^3*k^2
  -490*q^3*k^3
  +105*q^3*k^4)/1260

end
end MathGKM.Markov
