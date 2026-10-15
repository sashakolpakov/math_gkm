import MarkovFourthMoment01F
/-! Machine-authored 01f51d63. Checked candidate-polynomial inequalities in
the strict predecessor-slope chamber 0/1 < r/c < 1/4.
No universal source identification is asserted by this module. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def fourthLowMoment001F (c r : ℤ) : ℤ[X] :=
 -6*(C r) + -144*(C r)*X + 384*(C r)*X^2 + -240*(C r)*X^3 + 6*(C r)*X^4 + -6*(C c) + 72*(C c)*X + -108*(C c)*X^2 + 24*(C c)*X^3
def fourthLowSeq001F (c r : ℤ) : ℕ → ℤ
 | 0 => 24 + -50*r + 35*r^2 + -10*r^3 + 1*r^4 + -50*c + 70*c*r + -30*c*r^2 + 4*c*r^3 + 35*c^2 + -30*c^2*r + 6*c^2*r^2 + -10*c^3 + 4*c^3*r + 1*c^4
 | 1 => 96 + -536*r + 432*r^2 + -124*r^3 + 12*r^4 + 40*c + 384*c*r + -240*c*r^2 + 36*c*r^3 + -48*c^2 + -108*c^2*r + 36*c^2*r^2 + 8*c^3 + 12*c^3*r
 | 2 => 144 + -96*r + 1098*r^2 + -480*r^3 + 54*r^4 + -120*c + -150*c*r + -438*c*r^2 + 108*c*r^3 + 24*c^2 + 42*c^2*r + 54*c^2*r^2
 | 3 => 96 + -456*r + 144*r^2 + -612*r^3 + 108*r^4 + 96*c*r + 36*c*r^2 + 108*c*r^3
 | 4 => 24 + -78*r + 147*r^2 + -54*r^3 + 81*r^4
 | 5 => 0
 | 6 => 0
 | 7 => 0
 | _ => 0
theorem fourth_low_gap_0_001F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 0*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 2≤(fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 1)^2 := by
 have he : (fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 1)^2-fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 0*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 2=144000 + 1657920*y + 8080936*y^2 + 21831000*y^3 + 35932450*y^4 + 37173000*y^5 + 23807500*y^6 + 8700000*y^7 + 1406250*y^8 + 316320*x + 3040456*x*y + 12086160*x*y^2 + 25858430*x*y^3 + 32381550*x*y^4 + 23934750*x*y^5 + 9731250*x*y^6 + 1687500*x*y^7 + 285280*x^2 + 2220192*x^2*y + 6920478*x^2*y^2 + 11122410*x^2*y^3 + 9799800*x^2*y^4 + 4511250*x^2*y^5 + 843750*x^2*y^6 + 135240*x^3 + 815018*x^3*y + 1875714*x^3*y^2 + 2075140*x^3*y^3 + 1108500*x^3*y^4 + 225000*x^3*y^5 + 35560*x^4 + 154422*x^4*y + 236532*x^4*y^2 + 152100*x^4*y^3 + 33750*x^4*y^4 + 4920*x^5 + 13422*x^5*y + 11034*x^5*y^2 + 2700*x^5*y^3 + 280*x^6 + 330*x^6*y + 90*x^6*y^2 := by simp only [fourthLowSeq001F]; ring
 have hp : 0≤144000 + 1657920*y + 8080936*y^2 + 21831000*y^3 + 35932450*y^4 + 37173000*y^5 + 23807500*y^6 + 8700000*y^7 + 1406250*y^8 + 316320*x + 3040456*x*y + 12086160*x*y^2 + 25858430*x*y^3 + 32381550*x*y^4 + 23934750*x*y^5 + 9731250*x*y^6 + 1687500*x*y^7 + 285280*x^2 + 2220192*x^2*y + 6920478*x^2*y^2 + 11122410*x^2*y^3 + 9799800*x^2*y^4 + 4511250*x^2*y^5 + 843750*x^2*y^6 + 135240*x^3 + 815018*x^3*y + 1875714*x^3*y^2 + 2075140*x^3*y^3 + 1108500*x^3*y^4 + 225000*x^3*y^5 + 35560*x^4 + 154422*x^4*y + 236532*x^4*y^2 + 152100*x^4*y^3 + 33750*x^4*y^4 + 4920*x^5 + 13422*x^5*y + 11034*x^5*y^2 + 2700*x^5*y^3 + 280*x^6 + 330*x^6*y + 90*x^6*y^2 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_0_101F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 1*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 3≤(fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 2)^2 := by
 have he : (fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 2)^2-fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 1*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 3=288000 + 2858880*y + 11821584*y^2 + 26976432*y^3 + 37955796*y^4 + 34337280*y^5 + 19729800*y^6 + 6642000*y^7 + 1012500*y^8 + 499200*x + 3938880*x*y + 12698352*x*y^2 + 22172088*x*y^3 + 23130696*x*y^4 + 14611320*x*y^5 + 5200200*x*y^6 + 810000*x*y^7 + 321600*x^2 + 1918560*x^2*y + 4568868*x^2*y^2 + 5714928*x^2*y^3 + 4035852*x^2*y^4 + 1526040*x^2*y^5 + 243000*x^2*y^6 + 91200*x^3 + 378480*x^3*y + 608856*x^3*y^2 + 492336*x^3*y^3 + 198936*x^3*y^4 + 32400*x^3*y^5 + 9600*x^4 + 23280*x^4*y + 22356*x^4*y^2 + 9720*x^4*y^3 + 1620*x^4*y^4 := by simp only [fourthLowSeq001F]; ring
 have hp : 0≤288000 + 2858880*y + 11821584*y^2 + 26976432*y^3 + 37955796*y^4 + 34337280*y^5 + 19729800*y^6 + 6642000*y^7 + 1012500*y^8 + 499200*x + 3938880*x*y + 12698352*x*y^2 + 22172088*x*y^3 + 23130696*x*y^4 + 14611320*x*y^5 + 5200200*x*y^6 + 810000*x*y^7 + 321600*x^2 + 1918560*x^2*y + 4568868*x^2*y^2 + 5714928*x^2*y^3 + 4035852*x^2*y^4 + 1526040*x^2*y^5 + 243000*x^2*y^6 + 91200*x^3 + 378480*x^3*y + 608856*x^3*y^2 + 492336*x^3*y^3 + 198936*x^3*y^4 + 32400*x^3*y^5 + 9600*x^4 + 23280*x^4*y + 22356*x^4*y^2 + 9720*x^4*y^3 + 1620*x^4*y^4 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_0_201F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 2*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 4≤(fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 3)^2 := by
 have he : (fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 3)^2-fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 2*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 4=144000 + 1080000*y + 3657096*y^2 + 7199496*y^3 + 8999442*y^4 + 7358184*y^5 + 3887676*y^6 + 1224720*y^7 + 182250*y^8 + 158400*x + 921600*x*y + 2329308*x*y^2 + 3309210*x*y^3 + 2897622*x*y^4 + 1579986*x*y^5 + 500094*x*y^6 + 72900*x*y^7 + 43200*x^2 + 172800*x^2*y + 295164*x^2*y^2 + 282618*x^2*y^3 + 160218*x^2*y^4 + 51030*x^2*y^5 + 7290*x^2*y^6 := by simp only [fourthLowSeq001F]; ring
 have hp : 0≤144000 + 1080000*y + 3657096*y^2 + 7199496*y^3 + 8999442*y^4 + 7358184*y^5 + 3887676*y^6 + 1224720*y^7 + 182250*y^8 + 158400*x + 921600*x*y + 2329308*x*y^2 + 3309210*x*y^3 + 2897622*x*y^4 + 1579986*x*y^5 + 500094*x*y^6 + 72900*x*y^7 + 43200*x^2 + 172800*x^2*y + 295164*x^2*y^2 + 282618*x^2*y^3 + 160218*x^2*y^4 + 51030*x^2*y^5 + 7290*x^2*y^6 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_0_301F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 3*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 5≤(fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 4)^2 := by
 have he : (fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 4)^2-fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 3*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 5=14400 + 90720*y + 255924*y^2 + 420876*y^3 + 445401*y^4 + 315576*y^5 + 149202*y^6 + 43740*y^7 + 6561*y^8 := by simp only [fourthLowSeq001F]; ring
 have hp : 0≤14400 + 90720*y + 255924*y^2 + 420876*y^3 + 445401*y^4 + 315576*y^5 + 149202*y^6 + 43740*y^7 + 6561*y^8 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_0_401F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 4*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 6≤(fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 5)^2 := by
 have he : (fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 5)^2-fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 4*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 6=0 := by simp only [fourthLowSeq001F]; ring
 have hp : 0≤0 := by positivity
 linarith only [he,hp]
theorem fourth_low_gap_0_501F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 5*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 7≤(fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 6)^2 := by
 have he : (fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 6)^2-fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 5*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) 7=0 := by simp only [fourthLowSeq001F]; ring
 have hp : 0≤0 := by positivity
 linarith only [he,hp]
theorem fourth_low_lc_001F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) j*fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) (j+2)≤(fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) (j+1))^2 := by
 by_cases hj : j<6
 · interval_cases j
   · exact fourth_low_gap_0_001F x y hx hy
   · exact fourth_low_gap_0_101F x y hx hy
   · exact fourth_low_gap_0_201F x y hx hy
   · exact fourth_low_gap_0_301F x y hx hy
   · exact fourth_low_gap_0_401F x y hx hy
   · exact fourth_low_gap_0_501F x y hx hy
 · have hz : fourthLowSeq001F (1*(x+1)+4*(y+1)) (0*(x+1)+1*(y+1)) (j+2)=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j+2=k+8 := ⟨j-6,by omega⟩
     rw [hk]; rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem fourth_low_expand_001F (c r : ℤ) :
 fourthMomentPoly01F c r (0) (0) (0) (fourthLowMoment001F c r)=C (fourthLowSeq001F c r 0)*X^0+C (fourthLowSeq001F c r 1)*X^1+C (fourthLowSeq001F c r 2)*X^2+C (fourthLowSeq001F c r 3)*X^3+C (fourthLowSeq001F c r 4)*X^4+C (fourthLowSeq001F c r 5)*X^5+C (fourthLowSeq001F c r 6)*X^6+C (fourthLowSeq001F c r 7)*X^7 := by
 simp only [fourthMomentPoly01F,momentD6905,momentK6905,momentL6905,
   fourthLowMoment001F,fourthLowSeq001F,map_add,map_sub,map_mul,map_pow,map_ofNat]
 ring
theorem fourth_low_coeff_001F (c r : ℤ) (j : ℕ) :
 (fourthMomentPoly01F c r (0) (0) (0) (fourthLowMoment001F c r)).coeff j=fourthLowSeq001F c r j := by
 rw [fourth_low_expand_001F]
 by_cases hj : j<8
 · interval_cases j <;> simp [fourthLowSeq001F]
 · have hseq : fourthLowSeq001F c r j=0 := by
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
