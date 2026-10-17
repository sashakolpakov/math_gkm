import MarkovTopFourthM55C
/-! Machine-authored 55cf20d2. Positive certificate for columns 2,3,4.
The generated identity is checked by ring normalization. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 10000
def weightedChooseQM55C (a m : ℚ) (k : ℕ) : ℚ :=
 choosePolyM0D3 (a+m+1) (k+2)-choosePolyM0D3 (a+1) (k+2)-m*choosePolyM0D3 a (k+1)
def topSecondQM55C (s d : ℚ) : ℚ := 4*(s+3)*choosePolyM0D3 (s+d+6) 2
def topThirdQM55C (s d : ℚ) : ℚ :=
 choosePolyM0D3 (2*s+d+10) 3+4*weightedChooseQM55C (s+d+8) (s+2) 3
def topFourthQM55C (s d : ℚ) : ℚ :=
 (s+2)*choosePolyM0D3 (2*s+d+11) 4+
 4*(5*weightedChooseQM55C (s+d+9) (s+2) 5+(-s-d-5)*weightedChooseQM55C (s+d+9) (s+2) 4)
theorem top_second_gap_positiveM55C (s d : ℚ) (hs : 0 ≤ s) (hd : 0 ≤ d) :
 topSecondQM55C s d*topFourthQM55C s d < topThirdQM55C s d^2 := by
 have he : 6300*(topThirdQM55C s d^2-topSecondQM55C s d*topFourthQM55C s d)=
  3447460800+
  2727576600*d^1+
  905961700*d^2+
  161677950*d^3+
  16341325*d^4+
  886200*d^5+
  20125*d^6+
  8741704320*s^1+
  6403465920*s^1*d^1+
  1959214610*s^1*d^2+
  320205235*s^1*d^3+
  29438465*s^1*d^4+
  1440425*s^1*d^5+
  29225*s^1*d^6+
  9901648932*s^2+
  6622251170*s^2*d^1+
  1834236755*s^2*d^2+
  268545515*s^2*d^3+
  21821380*s^2*d^4+
  926975*s^2*d^5+
  15925*s^2*d^6+
  6595077300*s^3+
  3957150360*s^3*d^1+
  969988180*s^3*d^2+
  123415460*s^3*d^3+
  8494850*s^3*d^4+
  294000*s^3*d^5+
  3850*s^3*d^6+
  2860463425*s^4+
  1505560980*s^4*d^1+
  316820910*s^4*d^2+
  33545400*s^4*d^3+
  1829275*s^4*d^4+
  45850*s^4*d^5+
  350*s^4*d^6+
  844310600*s^5+
  378281120*s^5*d^1+
  65452940*s^5*d^2+
  5391540*s^5*d^3+
  206360*s^5*d^4+
  2800*s^5*d^5+
  171801896*s^6+
  62785380*s^6*d^1+
  8354570*s^6*d^2+
  474460*s^6*d^3+
  9520*s^6*d^4+
  23804600*s^7+
  6640440*s^7*d^1+
  602620*s^7*d^2+
  17640*s^7*d^3+
  2150225*s^8+
  406270*s^8*d^1+
  18815*s^8*d^2+
  114380*s^9+
  10960*s^9*d^1+
  2722*s^10 := by
   unfold topSecondQM55C topThirdQM55C topFourthQM55C weightedChooseQM55C
   simp only [binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,
     binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295]
   ring
 have hp : (0:ℚ)<3447460800+
  2727576600*d^1+
  905961700*d^2+
  161677950*d^3+
  16341325*d^4+
  886200*d^5+
  20125*d^6+
  8741704320*s^1+
  6403465920*s^1*d^1+
  1959214610*s^1*d^2+
  320205235*s^1*d^3+
  29438465*s^1*d^4+
  1440425*s^1*d^5+
  29225*s^1*d^6+
  9901648932*s^2+
  6622251170*s^2*d^1+
  1834236755*s^2*d^2+
  268545515*s^2*d^3+
  21821380*s^2*d^4+
  926975*s^2*d^5+
  15925*s^2*d^6+
  6595077300*s^3+
  3957150360*s^3*d^1+
  969988180*s^3*d^2+
  123415460*s^3*d^3+
  8494850*s^3*d^4+
  294000*s^3*d^5+
  3850*s^3*d^6+
  2860463425*s^4+
  1505560980*s^4*d^1+
  316820910*s^4*d^2+
  33545400*s^4*d^3+
  1829275*s^4*d^4+
  45850*s^4*d^5+
  350*s^4*d^6+
  844310600*s^5+
  378281120*s^5*d^1+
  65452940*s^5*d^2+
  5391540*s^5*d^3+
  206360*s^5*d^4+
  2800*s^5*d^5+
  171801896*s^6+
  62785380*s^6*d^1+
  8354570*s^6*d^2+
  474460*s^6*d^3+
  9520*s^6*d^4+
  23804600*s^7+
  6640440*s^7*d^1+
  602620*s^7*d^2+
  17640*s^7*d^3+
  2150225*s^8+
  406270*s^8*d^1+
  18815*s^8*d^2+
  114380*s^9+
  10960*s^9*d^1+
  2722*s^10 := by positivity
 linarith
end
end MathGKM.Markov
