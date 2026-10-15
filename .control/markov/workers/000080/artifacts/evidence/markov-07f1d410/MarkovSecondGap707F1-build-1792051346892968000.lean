import MarkovSecondParts07F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem second_gap_7_nonneg07F1 (t u v : ℤ) (ht : 0 ≤ t) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 0 ≤ secondGap707F1 t u v := by
 have he : secondGap707F1 t u v=(((((((343040*u+(2058240*v+4362240))*u+((5145600*v+21811200)*v+22784000))*u+(((6860800*v+43622400)*v+91136000)*v+62791680))*u+((((5145600*v+43622400)*v+136704000)*v+188375040)*v+96865280))*u+(((((2058240*v+21811200)*v+91136000)*v+188375040)*v+193730560)*v+79933440))*u+((((((343040*v+4362240)*v+22784000)*v+62791680)*v+96865280)*v+79933440)*v+27832320))*t+((((((2737920*u+(15598080*v+34775040))*u+((36921600*v+165365760)*v+182515200))*u+(((46464000*v+313712640)*v+695255040)*v+508492800))*u+((((32774400*v+296693760)*v+990673920)*v+1453992960)*v+796942080))*u+(((((12280320*v+139837440)*v+625643520)*v+1382507520)*v+1519664640)*v+670018560))*u+((((((1908480*v+26265600)*v+147709440)*v+437007360)*v+722722560)*v+638684160)*v+237542400))) := by
   unfold secondGap707F1 secondL207F1 secondL307F1 secondL407F1 secondL507F1 secondC207F1 secondC307F1 secondC407F1 secondC507F1 secondR207F1 secondR307F1 secondR407F1 secondR507F1
   ring
 rw [he]
 positivity
end
end MathGKM.Markov
