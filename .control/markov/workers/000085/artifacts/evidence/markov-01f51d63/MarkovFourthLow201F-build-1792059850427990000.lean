import MarkovFourthMoment01F
/-! Machine-authored 01f51d63. Checked candidate-polynomial inequalities in
the strict predecessor-slope chamber 1/3 < r/c < 1/2.
No universal source identification is asserted by this module. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def fourthLowMoment201F (c r : ℤ) : ℤ[X] :=
 -6*(C r) + -144*(C r)*X + 384*(C r)*X^2 + -240*(C r)*X^3 + -2298*(C r)*X^4 + -1344*(C r)*X^5 + -6*(C c) + 72*(C c)*X + -108*(C c)*X^2 + 24*(C c)*X^3 + 768*(C c)*X^4 + 480*(C c)*X^5
def fourthLowSeq201F (c r : ℤ) : ℕ → ℤ
 | 0 => 24 + -50*r + 35*r^2 + -10*r^3 + 1*r^4 + -50*c + 70*c*r + -30*c*r^2 + 4*c*r^3 + 35*c^2 + -30*c^2*r + 6*c^2*r^2 + -10*c^3 + 4*c^3*r + 1*c^4
 | 1 => 96 + -536*r + 432*r^2 + -124*r^3 + 12*r^4 + 40*c + 384*c*r + -240*c*r^2 + 36*c*r^3 + -48*c^2 + -108*c^2*r + 36*c^2*r^2 + 8*c^3 + 12*c^3*r
 | 2 => 144 + -96*r + 1098*r^2 + -480*r^3 + 54*r^4 + -120*c + -150*c*r + -438*c*r^2 + 108*c*r^3 + 24*c^2 + 42*c^2*r + 54*c^2*r^2
 | 3 => 96 + -456*r + 144*r^2 + -612*r^3 + 108*r^4 + 96*c*r + 36*c*r^2 + 108*c*r^3
 | 4 => 24 + -2670*r + 435*r^2 + -54*r^3 + 81*r^4 + 864*c + 192*c*r + -96*c^2
 | 5 => -1632*r + 864*r^2 + 576*c + -288*c*r
 | 6 => 0
 | 7 => 0
 | _ => 0
theorem fourth_low_gap_2_001F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 0*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 2≤(fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 1)^2 := by
 have he : (fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 1)^2-fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 0*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 2=1609344 + 8770752*y + 20709576*y^2 + 27726192*y^3 + 23078142*y^4 + 12265668*y^5 + 4078512*y^6 + 778572*y^7 + 65610*y^8 + 11434560*x + 53794176*x*y + 107551620*x*y^2 + 118750662*x*y^3 + 78430842*x*y^4 + 31087638*x*y^5 + 6871554*x*y^6 + 656100*x*y^7 + 34918720*x^2 + 138987168*x^2*y + 228965412*x^2*y^2 + 200404530*x^2*y^3 + 98607618*x^2*y^4 + 25950942*x^2*y^5 + 2864970*x^2*y^6 + 59834688*x^3 + 196052544*x^3*y + 255764232*x^3*y^2 + 166589856*x^3*y^3 + 54357480*x^3*y^4 + 7134480*x^3*y^5 + 62898496*x^4 + 163026528*x^4*y + 158085312*x^4*y^2 + 68195520*x^4*y^3 + 11080800*x^4*y^4 + 41516928*x^5 + 79887360*x^5*y + 51238656*x^5*y^2 + 10990080*x^5*y^3 + 16794112*x^6 + 21345792*x^6*y + 6796800*x^6*y^2 + 3803136*x^7 + 2396160*x^7*y + 368640*x^8 := by simp only [fourthLowSeq201F]; ring
 have hp : 0≤1609344 + 8770752*y + 20709576*y^2 + 27726192*y^3 + 23078142*y^4 + 12265668*y^5 + 4078512*y^6 + 778572*y^7 + 65610*y^8 + 11434560*x + 53794176*x*y + 107551620*x*y^2 + 118750662*x*y^3 + 78430842*x*y^4 + 31087638*x*y^5 + 6871554*x*y^6 + 656100*x*y^7 + 34918720*x^2 + 138987168*x^2*y + 228965412*x^2*y^2 + 200404530*x^2*y^3 + 98607618*x^2*y^4 + 25950942*x^2*y^5 + 2864970*x^2*y^6 + 59834688*x^3 + 196052544*x^3*y + 255764232*x^3*y^2 + 166589856*x^3*y^3 + 54357480*x^3*y^4 + 7134480*x^3*y^5 + 62898496*x^4 + 163026528*x^4*y + 158085312*x^4*y^2 + 68195520*x^4*y^3 + 11080800*x^4*y^4 + 41516928*x^5 + 79887360*x^5*y + 51238656*x^5*y^2 + 10990080*x^5*y^3 + 16794112*x^6 + 21345792*x^6*y + 6796800*x^6*y^2 + 3803136*x^7 + 2396160*x^7*y + 368640*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_2_101F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 1*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 3≤(fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 2)^2 := by
 have he : (fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 2)^2-fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 1*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 3=4343040 + 22391424*y + 50319504*y^2 + 64583568*y^3 + 51901812*y^4 + 26779248*y^5 + 8668296*y^6 + 1609632*y^7 + 131220*y^8 + 28283904*x + 126060864*x*y + 240296784*x*y^2 + 254631384*x*y^3 + 162270648*x*y^4 + 62248824*x*y^5 + 13314456*x*y^6 + 1224720*x*y^7 + 78835008*x^2 + 297430944*x^2*y + 467315172*x^2*y^2 + 392224032*x^2*y^3 + 185707404*x^2*y^4 + 47058408*x^2*y^5 + 4986360*x^2*y^6 + 122454720*x^3 + 380183664*x^3*y + 472635336*x^3*y^2 + 294570288*x^3*y^3 + 92117736*x^3*y^4 + 11566800*x^3*y^5 + 115664640*x^4 + 283888560*x^4*y + 261991476*x^4*y^2 + 107855064*x^4*y^3 + 16720020*x^4*y^4 + 67985856*x^5 + 123867360*x^5*y + 75528288*x^5*y^2 + 15422400*x^5*y^3 + 24319296*x^6 + 29289600*x^6*y + 8864640*x^6*y^2 + 4852224*x^7 + 2903040*x^7*y + 414720*x^8 := by simp only [fourthLowSeq201F]; ring
 have hp : 0≤4343040 + 22391424*y + 50319504*y^2 + 64583568*y^3 + 51901812*y^4 + 26779248*y^5 + 8668296*y^6 + 1609632*y^7 + 131220*y^8 + 28283904*x + 126060864*x*y + 240296784*x*y^2 + 254631384*x*y^3 + 162270648*x*y^4 + 62248824*x*y^5 + 13314456*x*y^6 + 1224720*x*y^7 + 78835008*x^2 + 297430944*x^2*y + 467315172*x^2*y^2 + 392224032*x^2*y^3 + 185707404*x^2*y^4 + 47058408*x^2*y^5 + 4986360*x^2*y^6 + 122454720*x^3 + 380183664*x^3*y + 472635336*x^3*y^2 + 294570288*x^3*y^3 + 92117736*x^3*y^4 + 11566800*x^3*y^5 + 115664640*x^4 + 283888560*x^4*y + 261991476*x^4*y^2 + 107855064*x^4*y^3 + 16720020*x^4*y^4 + 67985856*x^5 + 123867360*x^5*y + 75528288*x^5*y^2 + 15422400*x^5*y^3 + 24319296*x^6 + 29289600*x^6*y + 8864640*x^6*y^2 + 4852224*x^7 + 2903040*x^7*y + 414720*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_2_201F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 2*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 4≤(fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 3)^2 := by
 have he : (fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 3)^2-fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 2*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 4=3415680 + 16740864*y + 35304984*y^2 + 42422040*y^3 + 32126814*y^4 + 15775236*y^5 + 4891104*y^6 + 866052*y^7 + 65610*y^8 + 19939104*x + 83494584*x*y + 148605696*x*y^2 + 147680370*x*y^3 + 89106858*x*y^4 + 32601042*x*y^5 + 6635358*x*y^6 + 568620*x*y^7 + 48988800*x^2 + 172668240*x^2*y + 253698282*x^2*y^2 + 200714310*x^2*y^3 + 90256680*x^2*y^4 + 21719826*x^2*y^5 + 2150550*x^2*y^6 + 66576744*x^3 + 193164534*x^3*y + 225459198*x^3*y^2 + 132879852*x^3*y^3 + 39380580*x^3*y^4 + 4636440*x^3*y^5 + 55050912*x^4 + 126351486*x^4*y + 109748520*x^4*y^2 + 42719400*x^4*y^3 + 6232950*x^4*y^4 + 28274976*x^5 + 48225618*x^5*y + 27729702*x^5*y^2 + 5350860*x^5*y^3 + 8810208*x^6 + 9974178*x^6*y + 2864970*x^6*y^2 + 1533816*x^7 + 874800*x^7*y + 116640*x^8 := by simp only [fourthLowSeq201F]; ring
 have hp : 0≤3415680 + 16740864*y + 35304984*y^2 + 42422040*y^3 + 32126814*y^4 + 15775236*y^5 + 4891104*y^6 + 866052*y^7 + 65610*y^8 + 19939104*x + 83494584*x*y + 148605696*x*y^2 + 147680370*x*y^3 + 89106858*x*y^4 + 32601042*x*y^5 + 6635358*x*y^6 + 568620*x*y^7 + 48988800*x^2 + 172668240*x^2*y + 253698282*x^2*y^2 + 200714310*x^2*y^3 + 90256680*x^2*y^4 + 21719826*x^2*y^5 + 2150550*x^2*y^6 + 66576744*x^3 + 193164534*x^3*y + 225459198*x^3*y^2 + 132879852*x^3*y^3 + 39380580*x^3*y^4 + 4636440*x^3*y^5 + 55050912*x^4 + 126351486*x^4*y + 109748520*x^4*y^2 + 42719400*x^4*y^3 + 6232950*x^4*y^4 + 28274976*x^5 + 48225618*x^5*y + 27729702*x^5*y^2 + 5350860*x^5*y^3 + 8810208*x^6 + 9974178*x^6*y + 2864970*x^6*y^2 + 1533816*x^7 + 874800*x^7*y + 116640*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_2_301F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 3*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 5≤(fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 4)^2 := by
 have he : (fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 4)^2-fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 3*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 5=774720 + 3545568*y + 6901524*y^2 + 7454484*y^3 + 4943385*y^4 + 2107944*y^5 + 592434*y^6 + 96228*y^7 + 6561*y^8 + 3964896*x + 14829480*x*y + 23319036*x*y^2 + 20200932*x*y^3 + 10741896*x*y^4 + 3585708*x*y^5 + 673596*x*y^6 + 52488*x*y^7 + 7794324*x^2 + 24020028*x^2*y + 31027158*x^2*y^2 + 21971088*x^2*y^3 + 9057582*x^2*y^4 + 2020788*x^2*y^5 + 183708*x^2*y^6 + 8100180*x^3 + 21261924*x^3*y + 22541328*x^3*y^2 + 12221928*x^3*y^3 + 3367980*x^3*y^4 + 367416*x^3*y^5 + 5501529*x^4 + 11597256*x^4*y + 9290862*x^4*y^2 + 3367980*x^4*y^3 + 459270*x^4*y^4 + 2393064*x^5 + 3772332*x^5*y + 2020788*x^5*y^2 + 367416*x^5*y^3 + 639090*x^6 + 673596*x^6*y + 183708*x^6*y^2 + 96228*x^7 + 52488*x^7*y + 6561*x^8 := by simp only [fourthLowSeq201F]; ring
 have hp : 0≤774720 + 3545568*y + 6901524*y^2 + 7454484*y^3 + 4943385*y^4 + 2107944*y^5 + 592434*y^6 + 96228*y^7 + 6561*y^8 + 3964896*x + 14829480*x*y + 23319036*x*y^2 + 20200932*x*y^3 + 10741896*x*y^4 + 3585708*x*y^5 + 673596*x*y^6 + 52488*x*y^7 + 7794324*x^2 + 24020028*x^2*y + 31027158*x^2*y^2 + 21971088*x^2*y^3 + 9057582*x^2*y^4 + 2020788*x^2*y^5 + 183708*x^2*y^6 + 8100180*x^3 + 21261924*x^3*y + 22541328*x^3*y^2 + 12221928*x^3*y^3 + 3367980*x^3*y^4 + 367416*x^3*y^5 + 5501529*x^4 + 11597256*x^4*y + 9290862*x^4*y^2 + 3367980*x^4*y^3 + 459270*x^4*y^4 + 2393064*x^5 + 3772332*x^5*y + 2020788*x^5*y^2 + 367416*x^5*y^3 + 639090*x^6 + 673596*x^6*y + 183708*x^6*y^2 + 96228*x^7 + 52488*x^7*y + 6561*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_2_401F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 4*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 6≤(fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 5)^2 := by
 have he : (fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 5)^2-fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 4*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 6=36864 + 147456*y + 258048*y^2 + 221184*y^3 + 82944*y^4 + 147456*x + 405504*x*y + 442368*x*y^2 + 165888*x*y^3 + 147456*x^2 + 221184*x^2*y + 82944*x^2*y^2 := by simp only [fourthLowSeq201F]; ring
 have hp : 0≤36864 + 147456*y + 258048*y^2 + 221184*y^3 + 82944*y^4 + 147456*x + 405504*x*y + 442368*x*y^2 + 165888*x*y^3 + 147456*x^2 + 221184*x^2*y + 82944*x^2*y^2 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_2_501F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 5*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 7≤(fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 6)^2 := by
 have he : (fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 6)^2-fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 5*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) 7=0 := by simp only [fourthLowSeq201F]; ring
 have hp : 0≤0 := by positivity
 linarith only [he,hp]
theorem fourth_low_lc_201F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) j*fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) (j+2)≤(fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) (j+1))^2 := by
 by_cases hj : j<6
 · interval_cases j
   · exact fourth_low_gap_2_001F x y hx hy
   · exact fourth_low_gap_2_101F x y hx hy
   · exact fourth_low_gap_2_201F x y hx hy
   · exact fourth_low_gap_2_301F x y hx hy
   · exact fourth_low_gap_2_401F x y hx hy
   · exact fourth_low_gap_2_501F x y hx hy
 · have hz : fourthLowSeq201F (3*(x+1)+2*(y+1)) (1*(x+1)+1*(y+1)) (j+2)=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j+2=k+8 := ⟨j-6,by omega⟩
     rw [hk]; rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem fourth_low_expand_201F (c r : ℤ) :
 fourthMomentPoly01F c r (0) (3*r-c) (0) (fourthLowMoment201F c r)=C (fourthLowSeq201F c r 0)*X^0+C (fourthLowSeq201F c r 1)*X^1+C (fourthLowSeq201F c r 2)*X^2+C (fourthLowSeq201F c r 3)*X^3+C (fourthLowSeq201F c r 4)*X^4+C (fourthLowSeq201F c r 5)*X^5+C (fourthLowSeq201F c r 6)*X^6+C (fourthLowSeq201F c r 7)*X^7 := by
 simp only [fourthMomentPoly01F,momentD6905,momentK6905,momentL6905,
   fourthLowMoment201F,fourthLowSeq201F,map_add,map_sub,map_mul,map_pow,map_ofNat]
 ring
theorem fourth_low_coeff_201F (c r : ℤ) (j : ℕ) :
 (fourthMomentPoly01F c r (0) (3*r-c) (0) (fourthLowMoment201F c r)).coeff j=fourthLowSeq201F c r j := by
 rw [fourth_low_expand_201F]
 by_cases hj : j<8
 · interval_cases j <;> simp [fourthLowSeq201F]
 · have hseq : fourthLowSeq201F c r j=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j=k+8 := ⟨j-8,by omega⟩
     rw [hk]; rfl
   have h0 : j≠0 := by omega
   have h1 : j≠1 := by omega
   have h2 : j≠2 := by omega
   have h3 : j≠3 := by omega
   have h4 : j≠4 := by omega
   have h5 : j≠5 := by omega
   have h6 : j≠6 := by omega
   have h7 : j≠7 := by omega
   simp [hseq,h0,h1,h2,h3,h4,h5,h6,h7,eq_comm]
end
end MathGKM.Markov
