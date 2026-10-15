import MarkovThirdOneSeq8BBB
/-! Machine-authored universal nonnegative polynomial certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
theorem thirdOne_low_08BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 0*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 2≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 1)^2 := by
 have he : (thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 1)^2-(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 0)*(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 2) =
   237456 + 571728*y + 567924*y^2 + 297888*y^3 + 87060*y^4 + 13464*y^5 + 864*y^6 + 2044680*x + 4070532*x*y + 3208560*x*y^2 + 1252032*x*y^3 + 242148*x*y^4 + 18624*x*y^5 + 7291989*x^2 + 11517360*x^2*y + 6751485*x^2*y^2 + 1742262*x^2*y^3 + 167376*x^2*y^4 + 13777848*x^3 + 16179009*x^3*y + 6268563*x^3*y^2 + 802704*x^3*y^3 + 14537271*x^4 + 11277987*x^4*y + 2166486*x^4*y^2 + 8116752*x^5 + 3119928*x^5*y + 1872780*x^6 := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤237456 + 571728*y + 567924*y^2 + 297888*y^3 + 87060*y^4 + 13464*y^5 + 864*y^6 + 2044680*x + 4070532*x*y + 3208560*x*y^2 + 1252032*x*y^3 + 242148*x*y^4 + 18624*x*y^5 + 7291989*x^2 + 11517360*x^2*y + 6751485*x^2*y^2 + 1742262*x^2*y^3 + 167376*x^2*y^4 + 13777848*x^3 + 16179009*x^3*y + 6268563*x^3*y^2 + 802704*x^3*y^3 + 14537271*x^4 + 11277987*x^4*y + 2166486*x^4*y^2 + 8116752*x^5 + 3119928*x^5*y + 1872780*x^6 := by positivity
 omega
theorem thirdOne_low_18BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 1*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 3≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 2)^2 := by
 have he : (thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 2)^2-(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 1)*(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 3) =
   911160 + 2116296*y + 1994994*y^2 + 969570*y^3 + 254646*y^4 + 34398*y^5 + 1944*y^6 + 7794234*x + 14809005*x*y + 10915011*x*y^2 + 3875211*x*y^3 + 662499*x*y^4 + 44712*x*y^5 + 27453726*x^2 + 40888035*x^2*y + 22063158*x^2*y^2 + 5095539*x^2*y^3 + 430470*x^2*y^4 + 50973660*x^3 + 55707264*x^3*y + 19562148*x^3*y^2 + 2217312*x^3*y^3 + 52638696*x^4 + 37483560*x^4*y + 6436800*x^4*y^2 + 28677600*x^5 + 9975168*x^5*y + 6442128*x^6 := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤911160 + 2116296*y + 1994994*y^2 + 969570*y^3 + 254646*y^4 + 34398*y^5 + 1944*y^6 + 7794234*x + 14809005*x*y + 10915011*x*y^2 + 3875211*x*y^3 + 662499*x*y^4 + 44712*x*y^5 + 27453726*x^2 + 40888035*x^2*y + 22063158*x^2*y^2 + 5095539*x^2*y^3 + 430470*x^2*y^4 + 50973660*x^3 + 55707264*x^3*y + 19562148*x^3*y^2 + 2217312*x^3*y^3 + 52638696*x^4 + 37483560*x^4*y + 6436800*x^4*y^2 + 28677600*x^5 + 9975168*x^5*y + 6442128*x^6 := by positivity
 omega
theorem thirdOne_low_28BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 2*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 4≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 3)^2 := by
 have he : (thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 3)^2-(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 2)*(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 4) =
   1135044 + 2496492*y + 2153745*y^2 + 905184*y^3 + 186930*y^4 + 17172*y^5 + 729*y^6 + 9597456*x + 16900272*x*y + 11026404*x*y^2 + 3215520*x*y^3 + 402732*x*y^4 + 19440*x*y^5 + 33030576*x^2 + 44449704*x^2*y + 20421468*x^2*y^2 + 3664584*x^2*y^3 + 223236*x^2*y^4 + 59335776*x^3 + 56914704*x^3*y + 16296912*x^3*y^2 + 1379520*x^3*y^3 + 58853088*x^4 + 35594784*x^4*y + 4775328*x^4*y^2 + 30647808*x^5 + 8726400*x^5*y + 6562368*x^6 := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤1135044 + 2496492*y + 2153745*y^2 + 905184*y^3 + 186930*y^4 + 17172*y^5 + 729*y^6 + 9597456*x + 16900272*x*y + 11026404*x*y^2 + 3215520*x*y^3 + 402732*x*y^4 + 19440*x*y^5 + 33030576*x^2 + 44449704*x^2*y + 20421468*x^2*y^2 + 3664584*x^2*y^3 + 223236*x^2*y^4 + 59335776*x^3 + 56914704*x^3*y + 16296912*x^3*y^2 + 1379520*x^3*y^3 + 58853088*x^4 + 35594784*x^4*y + 4775328*x^4*y^2 + 30647808*x^5 + 8726400*x^5*y + 6562368*x^6 := by positivity
 omega
theorem thirdOne_low_38BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 3*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 5≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 4)^2 := by
 have he : (thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 4)^2-(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 3)*(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 5) =
   495360 + 1015056*y + 725544*y^2 + 216720*y^3 + 25272*y^4 + 4089312*x + 6369264*x*y + 3227328*x*y^2 + 610128*x*y^3 + 28512*x*y^4 + 13563936*x^2 + 15274224*x^2*y + 5070816*x^2*y^2 + 499824*x^2*y^3 + 7776*x^2*y^4 + 23200704*x^3 + 17556480*x^3*y + 3306816*x^3*y^2 + 124416*x^3*y^3 + 21693312*x^4 + 9691776*x^4*y + 755712*x^4*y^2 + 10566144*x^5 + 2055168*x^5*y + 2103552*x^6 := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤495360 + 1015056*y + 725544*y^2 + 216720*y^3 + 25272*y^4 + 4089312*x + 6369264*x*y + 3227328*x*y^2 + 610128*x*y^3 + 28512*x*y^4 + 13563936*x^2 + 15274224*x^2*y + 5070816*x^2*y^2 + 499824*x^2*y^3 + 7776*x^2*y^4 + 23200704*x^3 + 17556480*x^3*y + 3306816*x^3*y^2 + 124416*x^3*y^3 + 21693312*x^4 + 9691776*x^4*y + 755712*x^4*y^2 + 10566144*x^5 + 2055168*x^5*y + 2103552*x^6 := by positivity
 omega
theorem thirdOne_low_48BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 4*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 6≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 5)^2 := by
 have he : (thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 5)^2-(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 4)*(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 6) =
   71424 + 131040*y + 56736*y^2 + 553728*x + 681216*x*y + 158976*x*y^2 + 1729920*x^2 + 1340448*x^2*y + 167328*x^2*y^2 + 2778624*x^3 + 1267200*x^3*y + 78336*x^3*y^2 + 2424960*x^4 + 581376*x^4*y + 13824*x^4*y^2 + 1093632*x^5 + 104448*x^5*y + 199680*x^6 := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤71424 + 131040*y + 56736*y^2 + 553728*x + 681216*x*y + 158976*x*y^2 + 1729920*x^2 + 1340448*x^2*y + 167328*x^2*y^2 + 2778624*x^3 + 1267200*x^3*y + 78336*x^3*y^2 + 2424960*x^4 + 581376*x^4*y + 13824*x^4*y^2 + 1093632*x^5 + 104448*x^5*y + 199680*x^6 := by positivity
 omega
theorem thirdOne_low_58BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 5*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 7≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 6)^2 := by
 have he : (thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 6)^2-(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 5)*(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 7) =
   5184 + 28800*x + 67648*x^2 + 86016*x^3 + 62464*x^4 + 24576*x^5 + 4096*x^6 := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤5184 + 28800*x + 67648*x^2 + 86016*x^3 + 62464*x^4 + 24576*x^5 + 4096*x^6 := by positivity
 omega
theorem thirdOne_low_68BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 6*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 8≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 7)^2 := by
 have he : (thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 7)^2-(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 6)*(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) 8) =
   0 := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤0 := by positivity
 omega
theorem thirdOne_low_lc8BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) j*thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) (j+2)≤(thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) (j+1))^2 := by
 by_cases hj : j<7
 · interval_cases j
   · exact thirdOne_low_08BBB x y hx hy
   · exact thirdOne_low_18BBB x y hx hy
   · exact thirdOne_low_28BBB x y hx hy
   · exact thirdOne_low_38BBB x y hx hy
   · exact thirdOne_low_48BBB x y hx hy
   · exact thirdOne_low_58BBB x y hx hy
   · exact thirdOne_low_68BBB x y hx hy
 · have hz : thirdOneSeq8BBB (3*(x+1)+y) (x+1) (0) (0) (0) (j+2)=0 := by
     match j with
     | 0 | 1 | 2 | 3 | 4 | 5 | 6 => omega
     | n+7 => rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
#print axioms thirdOne_low_lc8BBB
end
end MathGKM.Markov
