import MarkovOffsetStepMAF6
/-! Machine-authored af6200bf. Nonnegative exact scalar certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
def horizontalGapMAF6 (j i h k : ℤ) : ℤ :=
 horizontalNumMAF6 j i h*horizontalDenMAF6 (i+1) k-
 horizontalNumMAF6 j (i+1) k*horizontalDenMAF6 i h
def diagonalGapMAF6 (j i h k : ℤ) : ℤ :=
 diagonalNumMAF6 j i h*diagonalDenMAF6 j (i+1) k-
 diagonalNumMAF6 j (i+1) k*diagonalDenMAF6 j i h

theorem horizontal_gapMAF6 (k p r t : ℤ) (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ horizontalGapMAF6 (r+p+2+t) (r+k+p+2) (k+p) k := by
 have he : horizontalGapMAF6 (r+p+2+t) (r+k+p+2) (k+p) k=
  1230+651*t+93*t^2+2422*r+1068*r*t+126*r*t^2+1852*r^2+644*r^2*t+56*r^2*t^2+682*r^3+168*r^3*t+8*r^3*t^2+120*r^4+16*r^4*t+8*r^5+3242*p+1474*p*t+160*p*t^2+5512*p*r+2013*p*r*t+165*p*r*t^2+3553*p*r^2+965*p*r^2*t+50*p*r^2*t^2+1076*p*r^3+188*p*r^3*t+4*p*r^3*t^2+152*p*r^4+12*p*r^4*t+8*p*r^5+3290*p^2+1208*p^2*t+94*p^2*t^2+4562*p^2*r+1261*p^2*r*t+65*p^2*r*t^2+2263*p^2*r^2+413*p^2*r^2*t+10*p^2*r^2*t^2+476*p^2*r^3+42*p^2*r^3*t+36*p^2*r^4+1691*p^3+464*p^3*t+23*p^3*t^2+1778*p^3*r+326*p^3*r*t+8*p^3*r*t^2+596*p^3*r^2+54*p^3*r^2*t+64*p^3*r^3+471*p^4+85*p^4*t+2*p^4*t^2+332*p^4*r+30*p^4*r*t+56*p^4*r^2+68*p^5+6*p^5*t+24*p^5*r+4*p^6+1151*k+562*k*t+67*k*t^2+1738*k*r+652*k*r*t+56*k*r*t^2+967*k*r^2+252*k*r^2*t+12*k*r^2*t^2+232*k*r^3+32*k*r^3*t+20*k*r^4+2652*k*p+1095*k*p*t+97*k*p*t^2+3410*k*p*r+1044*k*p*r*t+60*k*p*r*t^2+1566*k*p*r^2+312*k*p*r^2*t+8*k*p*r^2*t^2+300*k*p*r^3+28*k*p*r^3*t+20*k*p*r^4+2214*k*p^2+699*k*p^2*t+40*k*p^2*t^2+2204*k*p^2*r+463*k*p^2*r*t+13*k*p^2*r*t^2+704*k*p^2*r^2+73*k*p^2*r^2*t+72*k*p^2*r^3+870*k*p^3+183*k*p^3*t+5*k*p^3*t^2+588*k*p^3*r+62*k*p^3*r*t+96*k*p^3*r^2+164*k*p^4+17*k*p^4*t+56*k*p^4*r+12*k*p^5+391*k^2+172*k^2*t+15*k^2*t^2+427*k^2*r+128*k^2*r*t+6*k^2*r*t^2+154*k^2*r^2+24*k^2*r^2*t+18*k^2*r^3+772*k^2*p+281*k^2*p*t+18*k^2*p*t^2+702*k^2*p*r+167*k^2*p*r*t+5*k^2*p*r*t^2+202*k^2*p*r^2+23*k^2*p*r^2*t+18*k^2*p*r^3+502*k^2*p^2+126*k^2*p^2*t+4*k^2*p^2*t^2+319*k^2*p^2*r+40*k^2*p^2*r*t+49*k^2*p^2*r^2+135*k^2*p^3+17*k^2*p^3*t+44*k^2*p^3*r+13*k^2*p^4+57*k^3+22*k^3*t+1*k^3*t^2+40*k^3*r+8*k^3*r*t+7*k^3*r^2+94*k^3*p+29*k^3*p*t+1*k^3*p*t^2+53*k^3*p*r+8*k^3*p*r*t+7*k^3*p*r^2+43*k^3*p^2+7*k^3*p^2*t+13*k^3*p^2*r+6*k^3*p^3+3*k^4+1*k^4*t+1*k^4*r+4*k^4*p+1*k^4*p*t+1*k^4*p*r+1*k^4*p^2 := by
   simp only [horizontalGapMAF6,diagonalGapMAF6,horizontalNumMAF6,horizontalDenMAF6,diagonalNumMAF6,diagonalDenMAF6]
   ring
 rw [he]
 positivity

theorem diagonal_gapMAF6 (k p r t : ℤ) (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ diagonalGapMAF6 (p+r+t) (k+p+r+2) k (k+p+1) := by
 have he : diagonalGapMAF6 (p+r+t) (k+p+r+2) k (k+p+1)=
  48*t+144*t^2+48*t^3+240*r+480*r*t+356*r*t^2+60*r*t^3+496*r^2+644*r^2*t+240*r^2*t^2+16*r^2*t^3+380*r^3+304*r^3*t+48*r^3*t^2+128*r^4+48*r^4*t+16*r^5+528*p+732*p*t+428*p*t^2+60*p*t^3+1580*p*r+1628*p*r*t+522*p*r*t^2+28*p*r*t^3+1578*p*r^2+1052*p*r^2*t+144*p*r^2*t^2+652*p*r^3+208*p*r^3*t+96*p*r^4+1084*p^2+996*p^2*t+282*p^2*t^2+12*p^2*t^3+2004*p^2*r+1192*p^2*r*t+142*p^2*r*t^2+1174*p^2*r^2+332*p^2*r^2*t+220*p^2*r^3+806*p^3+444*p^3*t+46*p^3*t^2+904*p^3*r+232*p^3*r*t+244*p^3*r^2+254*p^4+60*p^4*t+132*p^4*r+28*p^5+88*k*t+132*k*t^2+28*k*t^3+248*k*r+424*k*r*t+200*k*r*t^2+16*k*r*t^3+380*k*r^2+352*k*r^2*t+64*k*r^2*t^2+192*k*r^3+80*k*r^3*t+32*k*r^4+584*k*p+643*k*p*t+242*k*p*t^2+16*k*p*t^3+1271*k*p*r+900*k*p*r*t+140*k*p*r*t^2+828*k*p*r^2+280*k*p*r^2*t+168*k*p*r^3+891*k*p^2+555*k*p^2*t+76*k*p^2*t^2+1073*k*p^2*r+320*k*p^2*r*t+308*k*p^2*r^2+437*k*p^3+120*k*p^3*t+240*k*p^3*r+68*k*p^4+51*k^2*t+40*k^2*t^2+4*k^2*t^3+95*k^2*r+124*k^2*r*t+28*k^2*r*t^2+96*k^2*r^2+48*k^2*r^2*t+24*k^2*r^3+241*k^2*p+187*k^2*p*t+34*k^2*p*t^2+339*k^2*p*r+124*k^2*p*r*t+108*k^2*p*r^2+243*k^2*p^2+77*k^2*p^2*t+143*k^2*p^2*r+59*k^2*p^3+12*k^3*t+4*k^3*t^2+16*k^3*r+12*k^3*r*t+8*k^3*r^2+44*k^3*p+18*k^3*p*t+30*k^3*p*r+22*k^3*p^2+1*k^4*t+1*k^4*r+3*k^4*p := by
   simp only [horizontalGapMAF6,diagonalGapMAF6,horizontalNumMAF6,horizontalDenMAF6,diagonalNumMAF6,diagonalDenMAF6]
   ring
 rw [he]
 positivity

end
end MathGKM.Markov
