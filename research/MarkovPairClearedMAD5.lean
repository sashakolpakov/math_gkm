import MarkovPairCoeff0MAD5
import MarkovPairCoeff1MAD5
import MarkovPairCoeff2MAD5
import MarkovPairCoeff3MAD5
import MarkovPairCoeff4MAD5
import MarkovPairCoeff5MAD5
import MarkovPairCoeff6MAD5
import MarkovPairCoeff7MAD5
import MarkovPairCoeff8MAD5
import MarkovPairCoeff9MAD5
import MarkovPairCoeff10MAD5
import MarkovPairCoeff11MAD5
import MarkovPairCoeff12MAD5
import MarkovPairCoeff13MAD5
import MarkovPairCoeff14MAD5
import MarkovPairCoeff15MAD5
import MarkovPairCoeff16MAD5
import MarkovPairCoeff17MAD5
import MarkovPairCoeff18MAD5
import MarkovPairCoeff19MAD5
import MarkovPairCoeff20MAD5
import MarkovPairCoeff21MAD5
import MarkovPairCoeff22MAD5/-! Machine-authored ad504da6. Generated algebra; all identities checked by Lean ring. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false
def pairClearedMAD5 (T x g z : ℚ) : ℚ :=
 (((((2+g*1)+x*1))*((((8+T*1)+g*1)+x*1))*(((((54+T*(15+T*1))+z*((28+T*4)+z*4))+g*(((15+T*2)+z*4)+g*1))+x*((((15+T*2)+z*4)+g*2)+x*1)))*(((2+z*1)+g*1))*(((5+T*1)+x*1))*(((((88+T*(19+T*1))+z*((36+T*4)+z*4))+g*(((36+T*4)+z*8)+g*4))+x*((((19+T*2)+z*4)+g*4)+x*1)))*(((3+g*1)+x*1))*((((10+T*1)+g*1)+x*1))*(((3+z*1)+g*1))*(((3+T*1)+x*1))*((2+z*1)))*(((((4+T*1)+g*1)+x*1))*(((2+g*1)+x*1))*((((8+T*1)+g*1)+x*1))*((((9+T*1)+g*1)+x*1))*(((((70+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((17+T*2)+z*4)+g*1))+x*((((17+T*2)+z*4)+g*2)+x*1)))*(((2+z*1)+g*1))*(((4+T*1)+x*1))*(((5+T*1)+x*1))*((2+x*1))*(((9+T*1)+x*1))*(((((70+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((32+T*4)+z*8)+g*4))+x*((((17+T*2)+z*4)+g*4)+x*1)))))+((((0+x*1))*(((5+T*1)+x*1))*(((((84+T*(19+T*1))+z*((36+T*4)+z*4))+g*(((36+T*4)+z*8)+g*4))+x*((((19+T*2)+z*4)+g*4)+x*1)))*((0+z*1))*((((8+T*1)+g*1)+x*1))*(((((58+T*(15+T*1))+z*((28+T*4)+z*4))+g*(((15+T*2)+z*4)+g*1))+x*((((15+T*2)+z*4)+g*2)+x*1)))*((1+z*1))*((((6+T*1)+g*1)+x*1))*((1+x*1))*(((7+T*1)+x*1))*((2+z*1)))*(((((4+T*1)+g*1)+x*1))*((((5+T*1)+g*1)+x*1))*(((2+g*1)+x*1))*((((8+T*1)+g*1)+x*1))*(((((70+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((17+T*2)+z*4)+g*1))+x*((((17+T*2)+z*4)+g*2)+x*1)))*(((2+z*1)+g*1))*(((5+T*1)+x*1))*((2+x*1))*(((8+T*1)+x*1))*(((9+T*1)+x*1))*(((((70+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((32+T*4)+z*8)+g*4))+x*((((17+T*2)+z*4)+g*4)+x*1)))))-(((((1+g*1)+x*1))*((((6+T*1)+g*1)+x*1))*(((((68+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((17+T*2)+z*4)+g*1))+x*((((17+T*2)+z*4)+g*2)+x*1)))*(((1+z*1)+g*1))*(((7+T*1)+x*1))*(((((72+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((32+T*4)+z*8)+g*4))+x*((((17+T*2)+z*4)+g*4)+x*1)))*((1+z*1))*((((6+T*1)+g*1)+x*1))*(((3+g*1)+x*1))*((((10+T*1)+g*1)+x*1))*(((((56+T*(15+T*1))+z*((28+T*4)+z*4))+g*(((15+T*2)+z*4)+g*1))+x*((((15+T*2)+z*4)+g*2)+x*1))))*((((3+z*1)+g*1))*(((3+T*1)+x*1))*((1+x*1))*(((7+T*1)+x*1))*(((((86+T*(19+T*1))+z*((36+T*4)+z*4))+g*(((36+T*4)+z*8)+g*4))+x*((((19+T*2)+z*4)+g*4)+x*1)))*(((2+g*1)+x*1))*((((8+T*1)+g*1)+x*1))*((((9+T*1)+g*1)+x*1))*(((2+z*1)+g*1))*(((4+T*1)+x*1))*(((5+T*1)+x*1))))-((((1+x*1))*(((7+T*1)+x*1))*(((((68+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((32+T*4)+z*8)+g*4))+x*((((17+T*2)+z*4)+g*4)+x*1)))*((1+z*1))*((((6+T*1)+g*1)+x*1))*(((((72+T*(17+T*1))+z*((32+T*4)+z*4))+g*(((17+T*2)+z*4)+g*1))+x*((((17+T*2)+z*4)+g*2)+x*1)))*((1+z*1))*((((6+T*1)+g*1)+x*1))*(((3+g*1)+x*1))*((((10+T*1)+g*1)+x*1))*(((((56+T*(15+T*1))+z*((28+T*4)+z*4))+g*(((15+T*2)+z*4)+g*1))+x*((((15+T*2)+z*4)+g*2)+x*1))))*((((3+z*1)+g*1))*(((3+T*1)+x*1))*((1+x*1))*(((7+T*1)+x*1))*(((((86+T*(19+T*1))+z*((36+T*4)+z*4))+g*(((36+T*4)+z*8)+g*4))+x*((((19+T*2)+z*4)+g*4)+x*1)))*((2+z*1))*((((4+T*1)+g*1)+x*1))*((((5+T*1)+g*1)+x*1))*((2+x*1))*(((8+T*1)+x*1))*(((9+T*1)+x*1))))
theorem pair_cleared_expansionMAD5 (T x g z : ℚ) : pairClearedMAD5 T x g z =
 pc0MAD5 g z T*x^0+pc1MAD5 g z T*x^1+pc2MAD5 g z T*x^2+pc3MAD5 g z T*x^3+pc4MAD5 g z T*x^4+pc5MAD5 g z T*x^5+pc6MAD5 g z T*x^6+pc7MAD5 g z T*x^7+pc8MAD5 g z T*x^8+pc9MAD5 g z T*x^9+pc10MAD5 g z T*x^10+pc11MAD5 g z T*x^11+pc12MAD5 g z T*x^12+pc13MAD5 g z T*x^13+pc14MAD5 g z T*x^14+pc15MAD5 g z T*x^15+pc16MAD5 g z T*x^16+pc17MAD5 g z T*x^17+pc18MAD5 g z T*x^18+pc19MAD5 g z T*x^19+pc20MAD5 g z T*x^20+pc21MAD5 g z T*x^21+pc22MAD5 g z T*x^22 := by
 unfold pairClearedMAD5
 rw [ph00_expandMAD5,ph01_expandMAD5,ph10_expandMAD5,ph11_expandMAD5,ph20_expandMAD5,ph21_expandMAD5,ph30_expandMAD5,ph31_expandMAD5]
 unfold pc0MAD5 pc1MAD5 pc2MAD5 pc3MAD5 pc4MAD5 pc5MAD5 pc6MAD5 pc7MAD5 pc8MAD5 pc9MAD5 pc10MAD5 pc11MAD5 pc12MAD5 pc13MAD5 pc14MAD5 pc15MAD5 pc16MAD5 pc17MAD5 pc18MAD5 pc19MAD5 pc20MAD5 pc21MAD5 pc22MAD5
 ring
theorem pair_cleared_nonnegMAD5 (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ pairClearedMAD5 T x g z := by
 rw [pair_cleared_expansionMAD5]
 have h0 := pc0_nonnegMAD5 g z T hg hz hT
 have h1 := pc1_nonnegMAD5 g z T hg hz hT
 have h2 := pc2_nonnegMAD5 g z T hg hz hT
 have h3 := pc3_nonnegMAD5 g z T hg hz hT
 have h4 := pc4_nonnegMAD5 g z T hg hz hT
 have h5 := pc5_nonnegMAD5 g z T hg hz hT
 have h6 := pc6_nonnegMAD5 g z T hg hz hT
 have h7 := pc7_nonnegMAD5 g z T hg hz hT
 have h8 := pc8_nonnegMAD5 g z T hg hz hT
 have h9 := pc9_nonnegMAD5 g z T hg hz hT
 have h10 := pc10_nonnegMAD5 g z T hg hz hT
 have h11 := pc11_nonnegMAD5 g z T hg hz hT
 have h12 := pc12_nonnegMAD5 g z T hg hz hT
 have h13 := pc13_nonnegMAD5 g z T hg hz hT
 have h14 := pc14_nonnegMAD5 g z T hg hz hT
 have h15 := pc15_nonnegMAD5 g z T hg hz hT
 have h16 := pc16_nonnegMAD5 g z T hg hz hT
 have h17 := pc17_nonnegMAD5 g z T hg hz hT
 have h18 := pc18_nonnegMAD5 g z T hg hz hT
 have h19 := pc19_nonnegMAD5 g z T hg hz hT
 have h20 := pc20_nonnegMAD5 g z T hg hz hT
 have h21 := pc21_nonnegMAD5 g z T hg hz hT
 have h22 := pc22_nonnegMAD5 g z T hg hz hT
 positivity
end
end MathGKM.Markov
