import MarkovFourthMoment01F
/-! Machine-authored 01f51d63. Checked candidate-polynomial inequalities in
the strict predecessor-slope chamber 1/4 < r/c < 1/3.
No universal source identification is asserted by this module. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def fourthLowMoment101F (c r : ℤ) : ℤ[X] :=
 -6*(C r) + -144*(C r)*X + 384*(C r)*X^2 + -240*(C r)*X^3 + 6*(C r)*X^4 + 384*(C r)*X^5 + -6*(C c) + 72*(C c)*X + -108*(C c)*X^2 + 24*(C c)*X^3 + -96*(C c)*X^5
def fourthLowSeq101F (c r : ℤ) : ℕ → ℤ
 | 0 => 24 + -50*r + 35*r^2 + -10*r^3 + 1*r^4 + -50*c + 70*c*r + -30*c*r^2 + 4*c*r^3 + 35*c^2 + -30*c^2*r + 6*c^2*r^2 + -10*c^3 + 4*c^3*r + 1*c^4
 | 1 => 96 + -536*r + 432*r^2 + -124*r^3 + 12*r^4 + 40*c + 384*c*r + -240*c*r^2 + 36*c*r^3 + -48*c^2 + -108*c^2*r + 36*c^2*r^2 + 8*c^3 + 12*c^3*r
 | 2 => 144 + -96*r + 1098*r^2 + -480*r^3 + 54*r^4 + -120*c + -150*c*r + -438*c*r^2 + 108*c*r^3 + 24*c^2 + 42*c^2*r + 54*c^2*r^2
 | 3 => 96 + -456*r + 144*r^2 + -612*r^3 + 108*r^4 + 96*c*r + 36*c*r^2 + 108*c*r^3
 | 4 => 24 + -78*r + 147*r^2 + -54*r^3 + 81*r^4
 | 5 => 384*r + -96*c
 | 6 => 0
 | 7 => 0
 | _ => 0
theorem fourth_low_gap_1_001F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 0*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 2≤(fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 1)^2 := by
 have he : (fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 1)^2-fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 0*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 2=22412160 + 107968128*y + 226592800*y^2 + 270870624*y^3 + 201966208*y^4 + 96312192*y^5 + 28728832*y^6 + 4909056*y^7 + 368640*y^8 + 131843280*x + 551798536*x*y + 986249592*x*y^2 + 976997216*x*y^3 + 580098720*x*y^4 + 206751744*x*y^5 + 41021952*x*y^6 + 3502080*x*y^7 + 335799880*x^2 + 1196394288*x^2*y + 1771229592*x^2*y^2 + 1396574472*x^2*y^3 + 619428672*x^2*y^4 + 146762496*x^2*y^5 + 14538240*x^2*y^6 + 483522060*x^3 + 1426260530*x^3*y + 1679826270*x^3*y^2 + 988867360*x^3*y^3 + 291393600*x^3*y^4 + 34444800*x^3*y^5 + 430395550*x^4 + 1009458150*x^4*y + 887147550*x^4*y^2 + 346749000*x^4*y^3 + 50940000*x^4*y^4 + 242443500*x^5 + 424055250*x^5*y + 247286250*x^5*y^2 + 48150000*x^5*y^3 + 84370000*x^6 + 97856250*x^6*y + 28406250*x^6*y^2 + 16575000*x^7 + 9562500*x^7*y + 1406250*x^8 := by simp only [fourthLowSeq101F]; ring
 have hp : 0≤22412160 + 107968128*y + 226592800*y^2 + 270870624*y^3 + 201966208*y^4 + 96312192*y^5 + 28728832*y^6 + 4909056*y^7 + 368640*y^8 + 131843280*x + 551798536*x*y + 986249592*x*y^2 + 976997216*x*y^3 + 580098720*x*y^4 + 206751744*x*y^5 + 41021952*x*y^6 + 3502080*x*y^7 + 335799880*x^2 + 1196394288*x^2*y + 1771229592*x^2*y^2 + 1396574472*x^2*y^3 + 619428672*x^2*y^4 + 146762496*x^2*y^5 + 14538240*x^2*y^6 + 483522060*x^3 + 1426260530*x^3*y + 1679826270*x^3*y^2 + 988867360*x^3*y^3 + 291393600*x^3*y^4 + 34444800*x^3*y^5 + 430395550*x^4 + 1009458150*x^4*y + 887147550*x^4*y^2 + 346749000*x^4*y^3 + 50940000*x^4*y^4 + 242443500*x^5 + 424055250*x^5*y + 247286250*x^5*y^2 + 48150000*x^5*y^3 + 84370000*x^6 + 97856250*x^6*y + 28406250*x^6*y^2 + 16575000*x^7 + 9562500*x^7*y + 1406250*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_1_101F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 1*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 3≤(fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 2)^2 := by
 have he : (fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 2)^2-fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 1*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 3=35463744 + 161208768*y + 320362704*y^2 + 364285824*y^3 + 259710192*y^4 + 119039616*y^5 + 34293312*y^6 + 5681664*y^7 + 414720*y^8 + 190450176*x + 752125344*x*y + 1274268432*x*y^2 + 1202887920*x*y^3 + 684309696*x*y^4 + 234868896*x*y^5 + 45069696*x*y^6 + 3732480*x*y^7 + 440876064*x^2 + 1483604784*x^2*y + 2085879348*x^2*y^2 + 1570818696*x^2*y^3 + 669049092*x^2*y^4 + 152946144*x^2*y^5 + 14670720*x^2*y^6 + 574891776*x^3 + 1604871288*x^3*y + 1799693136*x^3*y^2 + 1014611184*x^3*y^3 + 287826696*x^3*y^4 + 32892480*x^3*y^5 + 462236244*x^4 + 1029074520*x^4*y + 863889516*x^4*y^2 + 324397224*x^4*y^3 + 46009620*x^4*y^4 + 234930000*x^5 + 391557240*x^5*y + 218962440*x^5*y^2 + 41115600*x^5*y^3 + 73805400*x^6 + 81955800*x^6*y + 22923000*x^6*y^2 + 13122000*x^7 + 7290000*x^7*y + 1012500*x^8 := by simp only [fourthLowSeq101F]; ring
 have hp : 0≤35463744 + 161208768*y + 320362704*y^2 + 364285824*y^3 + 259710192*y^4 + 119039616*y^5 + 34293312*y^6 + 5681664*y^7 + 414720*y^8 + 190450176*x + 752125344*x*y + 1274268432*x*y^2 + 1202887920*x*y^3 + 684309696*x*y^4 + 234868896*x*y^5 + 45069696*x*y^6 + 3732480*x*y^7 + 440876064*x^2 + 1483604784*x^2*y + 2085879348*x^2*y^2 + 1570818696*x^2*y^3 + 669049092*x^2*y^4 + 152946144*x^2*y^5 + 14670720*x^2*y^6 + 574891776*x^3 + 1604871288*x^3*y + 1799693136*x^3*y^2 + 1014611184*x^3*y^3 + 287826696*x^3*y^4 + 32892480*x^3*y^5 + 462236244*x^4 + 1029074520*x^4*y + 863889516*x^4*y^2 + 324397224*x^4*y^3 + 46009620*x^4*y^4 + 234930000*x^5 + 391557240*x^5*y + 218962440*x^5*y^2 + 41115600*x^5*y^3 + 73805400*x^6 + 81955800*x^6*y + 22923000*x^6*y^2 + 13122000*x^7 + 7290000*x^7*y + 1012500*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_1_201F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 2*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 4≤(fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 3)^2 := by
 have he : (fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 3)^2-fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 2*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 4=14243904 + 61603344*y + 116623728*y^2 + 126388116*y^3 + 85915548*y^4 + 37593540*y^5 + 10364436*y^6 + 1650456*y^7 + 116640*y^8 + 69323184*x + 259528968*x*y + 417641796*x*y^2 + 375148818*x*y^3 + 203560110*x*y^4 + 66869550*x*y^5 + 12344886*x*y^6 + 991440*x*y^7 + 143917560*x^2 + 458669988*x^2*y + 612677142*x^2*y^2 + 439884630*x^2*y^3 + 179405928*x^2*y^4 + 39504510*x^2*y^5 + 3681450*x^2*y^6 + 167416308*x^3 + 443570022*x^3*y + 474228630*x^3*y^2 + 256216932*x^3*y^3 + 70115220*x^3*y^4 + 7800300*x^3*y^5 + 120126150*x^4 + 255076110*x^4*y + 205444188*x^4*y^2 + 74547540*x^4*y^3 + 10315350*x^4*y^4 + 54765540*x^5 + 87700158*x^5*y + 47482686*x^5*y^2 + 8718840*x^5*y^3 + 15572088*x^6 + 16777206*x^6*y + 4599990*x^6*y^2 + 2536920*x^7 + 1385100*x^7*y + 182250*x^8 := by simp only [fourthLowSeq101F]; ring
 have hp : 0≤14243904 + 61603344*y + 116623728*y^2 + 126388116*y^3 + 85915548*y^4 + 37593540*y^5 + 10364436*y^6 + 1650456*y^7 + 116640*y^8 + 69323184*x + 259528968*x*y + 417641796*x*y^2 + 375148818*x*y^3 + 203560110*x*y^4 + 66869550*x*y^5 + 12344886*x*y^6 + 991440*x*y^7 + 143917560*x^2 + 458669988*x^2*y + 612677142*x^2*y^2 + 439884630*x^2*y^3 + 179405928*x^2*y^4 + 39504510*x^2*y^5 + 3681450*x^2*y^6 + 167416308*x^3 + 443570022*x^3*y + 474228630*x^3*y^2 + 256216932*x^3*y^3 + 70115220*x^3*y^4 + 7800300*x^3*y^5 + 120126150*x^4 + 255076110*x^4*y + 205444188*x^4*y^2 + 74547540*x^4*y^3 + 10315350*x^4*y^4 + 54765540*x^5 + 87700158*x^5*y + 47482686*x^5*y^2 + 8718840*x^5*y^3 + 15572088*x^6 + 16777206*x^6*y + 4599990*x^6*y^2 + 2536920*x^7 + 1385100*x^7*y + 182250*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_1_301F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 3*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 5≤(fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 4)^2 := by
 have he : (fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 4)^2-fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 3*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 5=1263168 + 4983264*y + 8858772*y^2 + 9134676*y^3 + 5916249*y^4 + 2455272*y^5 + 639090*y^6 + 96228*y^7 + 6561*y^8 + 5347296*x + 18470952*x*y + 28003068*x*y^2 + 23882724*x*y^3 + 12307464*x*y^4 + 3834540*x*y^5 + 673596*x*y^6 + 52488*x*y^7 + 9727380*x^2 + 28749564*x^2*y + 36216342*x^2*y^2 + 24687504*x^2*y^3 + 9586350*x^2*y^4 + 2020788*x^2*y^5 + 183708*x^2*y^6 + 9881172*x^3 + 24449508*x^3*y + 24770448*x^3*y^2 + 12781800*x^3*y^3 + 3367980*x^3*y^4 + 367416*x^3*y^5 + 6199641*x^4 + 12431880*x^4*y + 9586350*x^4*y^2 + 3367980*x^4*y^3 + 459270*x^4*y^4 + 2496744*x^5 + 3834540*x^5*y + 2020788*x^5*y^2 + 367416*x^5*y^3 + 639090*x^6 + 673596*x^6*y + 183708*x^6*y^2 + 96228*x^7 + 52488*x^7*y + 6561*x^8 := by simp only [fourthLowSeq101F]; ring
 have hp : 0≤1263168 + 4983264*y + 8858772*y^2 + 9134676*y^3 + 5916249*y^4 + 2455272*y^5 + 639090*y^6 + 96228*y^7 + 6561*y^8 + 5347296*x + 18470952*x*y + 28003068*x*y^2 + 23882724*x*y^3 + 12307464*x*y^4 + 3834540*x*y^5 + 673596*x*y^6 + 52488*x*y^7 + 9727380*x^2 + 28749564*x^2*y + 36216342*x^2*y^2 + 24687504*x^2*y^3 + 9586350*x^2*y^4 + 2020788*x^2*y^5 + 183708*x^2*y^6 + 9881172*x^3 + 24449508*x^3*y + 24770448*x^3*y^2 + 12781800*x^3*y^3 + 3367980*x^3*y^4 + 367416*x^3*y^5 + 6199641*x^4 + 12431880*x^4*y + 9586350*x^4*y^2 + 3367980*x^4*y^3 + 459270*x^4*y^4 + 2496744*x^5 + 3834540*x^5*y + 2020788*x^5*y^2 + 367416*x^5*y^3 + 639090*x^6 + 673596*x^6*y + 183708*x^6*y^2 + 96228*x^7 + 52488*x^7*y + 6561*x^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_1_401F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 4*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 6≤(fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 5)^2 := by
 have he : (fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 5)^2-fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 4*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 6=9216 + 18432*y + 9216*y^2 := by simp only [fourthLowSeq101F]; ring
 have hp : 0≤9216 + 18432*y + 9216*y^2 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_1_501F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 5*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 7≤(fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 6)^2 := by
 have he : (fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 6)^2-fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 5*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) 7=0 := by simp only [fourthLowSeq101F]; ring
 have hp : 0≤0 := by positivity
 linarith only [he,hp]
theorem fourth_low_lc_101F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) j*fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) (j+2)≤(fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) (j+1))^2 := by
 by_cases hj : j<6
 · interval_cases j
   · exact fourth_low_gap_1_001F x y hx hy
   · exact fourth_low_gap_1_101F x y hx hy
   · exact fourth_low_gap_1_201F x y hx hy
   · exact fourth_low_gap_1_301F x y hx hy
   · exact fourth_low_gap_1_401F x y hx hy
   · exact fourth_low_gap_1_501F x y hx hy
 · have hz : fourthLowSeq101F (4*(x+1)+3*(y+1)) (1*(x+1)+1*(y+1)) (j+2)=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j+2=k+8 := ⟨j-6,by omega⟩
     rw [hk]; rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem fourth_low_expand_101F (c r : ℤ) :
 fourthMomentPoly01F c r (0) (0) (0) (fourthLowMoment101F c r)=C (fourthLowSeq101F c r 0)*X^0+C (fourthLowSeq101F c r 1)*X^1+C (fourthLowSeq101F c r 2)*X^2+C (fourthLowSeq101F c r 3)*X^3+C (fourthLowSeq101F c r 4)*X^4+C (fourthLowSeq101F c r 5)*X^5+C (fourthLowSeq101F c r 6)*X^6+C (fourthLowSeq101F c r 7)*X^7 := by
 simp only [fourthMomentPoly01F,momentD6905,momentK6905,momentL6905,
   fourthLowMoment101F,fourthLowSeq101F,map_add,map_sub,map_mul,map_pow,map_ofNat]
 ring
theorem fourth_low_coeff_101F (c r : ℤ) (j : ℕ) :
 (fourthMomentPoly01F c r (0) (0) (0) (fourthLowMoment101F c r)).coeff j=fourthLowSeq101F c r j := by
 rw [fourth_low_expand_101F]
 by_cases hj : j<8
 · interval_cases j <;> simp [fourthLowSeq101F]
 · have hseq : fourthLowSeq101F c r j=0 := by
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
