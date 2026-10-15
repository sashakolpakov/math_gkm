import MarkovSecondCoefficients07F1
/-! Machine-authored 53d5229e. Exact reversed third-band shapes. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
def tailLow53D (c r k : ℤ) : ℤ :=
 ((((((((8*k)*k+-40)*k)*k+32)*k)*c+(((((120*k+240)*k+-120)*k+-240)*k)*r+(((((-24*k)*k+360)*k)*k+-336)*k)))*c+(((((480*k+1440)*k+960)*k)*r+((((-360*k+-1200)*k+1080)*k+1920)*k))*r+(((((16*k)*k+-560)*k)*k+904)*k)))*c+(((((480*k+1440)*k+960)*r+(((-960*k+-4320)*k+-3360)*k))*r+((((240*k+1440)*k+-720)*k+-2880)*k+120))*r))
def tailHigh53D (c r k : ℤ) : ℤ :=
 ((((((((8*k)*k+-40)*k)*k+32)*k)*c+(((((120*k+240)*k+-120)*k+-240)*k)*r+(((((-24*k)*k+360)*k)*k+-1776)*k+-1440)))*c+(((((480*k+1440)*k+960)*k)*r+((((-360*k+-1200)*k+1080)*k+4800)*k+1440))*r+(((((16*k)*k+-560)*k)*k+6664)*k+8640)))*c+(((((480*k+1440)*k+960)*r+(((-960*k+-4320)*k+-3360)*k+2880))*r+((((240*k+1440)*k+-720)*k+-14400)*k+-17160))*r))
def thirdTailCoeff053D (n c r q : ℤ) : ℤ :=
 (((24*c+(-48*r+(24*q+-96)))*c+(192*r+(-96*q)))*n+((24*c+(-24*r+(24*q+-168)))*c+((-48*r+(24*q+336))*r+(-168*q))))
def thirdTailCoeff153D (n c r q : ℤ) : ℤ :=
 ((((48*c+(-96*r+-264))*c+((48*r+528)*r+(-72*q+288)))*c+((-192*r+-576)*r+(288*q)))*n+(((48*c+(-48*r+-576))*c+((-48*r+1080)*r+(-144*q+840)))*c+(((48*r+-288)*r+(-72*q+-1680))*r+(840*q))))
def thirdTailCoeff253D (n c r q : ℤ) : ℤ :=
 ((((48*c+-288)*c+((-48*r+96)*r+(24*q+384)))*c+((192*r+-384)*r+(-96*q)))*n+(((-96*c+(336*r))*c+((-192*r+-1248)*r+(264*q)))*c+(((-48*r+1008)*r+(24*q+1056))*r+(-1320*q))))
def thirdTailCoeff353D (n c r q : ℤ) : ℤ :=
 ((((-48*c+(192*r+288))*c+((-96*r+-1056)*r+(120*q+-384)))*c+((384*r+1152)*r+(-480*q)))*n+(((-144*c+(48*r+288))*c+((288*r+-768)*r+(-96*q+-384)))*c+(((-96*r+-384)*r+(120*q+1248))*r+(264*q))))
def thirdTailCoeff453D (n c r q : ℤ) : ℤ :=
 ((((-48*c+264)*c+((96*r+-48)*r+(-120*q+-288)))*c+((-384*r+192)*r+(480*q)))*n+(((-336*r+-312)*c+((192*r+1272)*r+(-216*q+552)))*c+(((96*r+-912)*r+(-120*q+-1392))*r+(1224*q))))
def thirdTailCoeff553D (n c r q : ℤ) : ℤ :=
 ((((-96*r+-24)*c+((48*r+528)*r+(-24*q+96)))*c+((-192*r+-576)*r+(96*q)))*n+(((-240*r+-312)*r+(240*q+-72))*c+(((48*r+672)*r+(-24*q+432))*r+(-1128*q))))
def thirdTailCoeff653D (n c r q : ℤ) : ℤ :=
 ((((-48*r)*r+(72*q))*c+((192*r)*r+(-288*q)))*n+((-72*q)*c+(((-48*r+-48)*r+(72*q))*r+(264*q))))
def thirdTailCoeff753D (n c r q : ℤ) : ℤ :=
 (((-24*q)*c+(96*q))*n+((-24*q)*r+(24*q)))
def thirdTailPoly53D (n c r q : ℤ) : ℤ[X] :=
 C (thirdTailCoeff053D n c r q)*X^0+C (thirdTailCoeff153D n c r q)*X^1+C (thirdTailCoeff253D n c r q)*X^2+C (thirdTailCoeff353D n c r q)*X^3+C (thirdTailCoeff453D n c r q)*X^4+C (thirdTailCoeff553D n c r q)*X^5+C (thirdTailCoeff653D n c r q)*X^6+C (thirdTailCoeff753D n c r q)*X^7
theorem third_tail_poly53D (n c r q t u : ℤ) :
 normalTail2FDDA (n:ℤ[X]) c r q t u X=thirdTailPoly53D n c r q := by
 unfold normalTail2FDDA thirdTailPoly53D thirdTailCoeff053D thirdTailCoeff153D thirdTailCoeff253D thirdTailCoeff353D thirdTailCoeff453D thirdTailCoeff553D thirdTailCoeff653D thirdTailCoeff753D
 have hn : (C n:ℤ[X])=n := Polynomial.C_eq_intCast n
 have hc : (C c:ℤ[X])=c := Polynomial.C_eq_intCast c
 have hr : (C r:ℤ[X])=r := Polynomial.C_eq_intCast r
 have hq : (C q:ℤ[X])=q := Polynomial.C_eq_intCast q
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,hn,hc,hr,hq]
 ring
theorem tail_low_falling53D (n c r j : ℤ) :
 8*tailLow53D c r (3*n+3-j)=8*secondShape07F1 n c r j+thirdTailCoeff053D n c r 0*fallingFiveBDEE (j-2*n+2-0)+thirdTailCoeff153D n c r 0*fallingFiveBDEE (j-2*n+2-1)+thirdTailCoeff253D n c r 0*fallingFiveBDEE (j-2*n+2-2)+thirdTailCoeff353D n c r 0*fallingFiveBDEE (j-2*n+2-3)+thirdTailCoeff453D n c r 0*fallingFiveBDEE (j-2*n+2-4)+thirdTailCoeff553D n c r 0*fallingFiveBDEE (j-2*n+2-5)+thirdTailCoeff653D n c r 0*fallingFiveBDEE (j-2*n+2-6)+thirdTailCoeff753D n c r 0*fallingFiveBDEE (j-2*n+2-7) := by
 unfold tailLow53D secondShape07F1 fallingFiveBDEE thirdTailCoeff053D thirdTailCoeff153D thirdTailCoeff253D thirdTailCoeff353D thirdTailCoeff453D thirdTailCoeff553D thirdTailCoeff653D thirdTailCoeff753D
 ring
theorem tail_high_falling53D (n c r j : ℤ) :
 8*tailHigh53D c r (3*n+3-j)=8*secondShape07F1 n c r j+thirdTailCoeff053D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-0)+thirdTailCoeff153D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-1)+thirdTailCoeff253D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-2)+thirdTailCoeff353D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-3)+thirdTailCoeff453D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-4)+thirdTailCoeff553D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-5)+thirdTailCoeff653D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-6)+thirdTailCoeff753D n c r (2*r-c)*fallingFiveBDEE (j-2*n+2-7) := by
 unfold tailHigh53D secondShape07F1 fallingFiveBDEE thirdTailCoeff053D thirdTailCoeff153D thirdTailCoeff253D thirdTailCoeff353D thirdTailCoeff453D thirdTailCoeff553D thirdTailCoeff653D thirdTailCoeff753D
 ring
end
end MathGKM.Markov
