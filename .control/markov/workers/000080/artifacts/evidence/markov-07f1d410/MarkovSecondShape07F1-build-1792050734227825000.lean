import MarkovInteriorSourceFDDA
/-! Machine-authored 07f1d410. Exact second-band coefficient shape. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
def secondShape07F1 (n c r j : ℤ) : ℤ :=
 ((((((((-744*c+1464)*c+-720)*c)*n+((((2520*j+-5640)*c+(-3720*r+(-3720*j+9240)))*c+(7320*r+(1200*j+-3600)))*c+(-3600*r)))*n+(((((-2640*j+12960)*j+-15240)*c+((10080*j+-25680)*r+((2160*j+-13920)*j+12840)))*c+((-4320*r+(-14880*j+46800))*r+((480*j+960)*j+2640)))*c+((4800*r+(4800*j+-21600))*r)))*n+((((((1200*j+-9360)*j+22920)*j+-18120)*c+(((-7920*j+43920)*j+-59640)*r+(((240*j+2160)*j+600)*j+-15000)))*c+(((10080*j+-25920)*r+((6480*j+-55440)*j+81240))*r+(((-1440*j+7200)*j+-22800)*j+32400)))*c+(((-1440*r+(-8640*j+27360))*r+((1440*j+10080)*j+-20880))*r)))*n+(((((((-240*j+2640)*j+-9960)*j+15720)*j+-8976)*c+((((2400*j+-20880)*j+58800)*j+-54240)*r+((((-480*j+3120)*j+-14280)*j+40680)*j+-41304)))*c+((((-5760*j+33120)*j+-46800)*r+(((480*j+7920)*j+-29520)*j+12960))*r+((((720*j+-5760)*j+22800)*j+-51360)*j+42120)))*c+((((2880*j+-7200)*r+((2880*j+-25920)*j+39840))*r+(((-2880*j+15840)*j+-37920)*j+54720))*r)))*n+((((((((16*j+-240)*j+1240)*j+-2880)*j+3064)*j+-1200)*c+(((((-240*j+2880)*j+-12360)*j+22680)*j+-15120)*r+(((((96*j+-960)*j+5160)*j+-17400)*j+30744)*j+-20880)))*c+(((((960*j+-8640)*j+25680)*j+-25200)*r+((((-480*j+3360)*j+-12840)*j+35160)*j+-41400))*r+(((((-112*j+1200)*j+-5920)*j+17400)*j+-25648)*j+12720)))*c+(((((-960*j+5760)*j+-8400)*r+((2880*j+-11520)*j+8640))*r+((((720*j+-7200)*j+30480)*j+-72000)*j+72840))*r)))
def tailCoeff007F1 (n c r : ℤ) : ℤ :=
 (((((12*c+(-12*r+-48))*c+(48*r+48))*c+(-48*r))*n+(((24*c+-180)*c+((-24*r+132)*r+264))*c+((48*r+-264)*r)))*n+(((12*c+(12*r+-132))*c+((-12*r)*r+360))*c+(((-12*r+132)*r+-360)*r)))
def tailCoeff107F1 (n c r : ℤ) : ℤ :=
 (((((24*c+(-12*r+-96))*c+(48*r+96))*c+(-48*r))*n+(((-24*c+(96*r+-144))*c+((-24*r+-180)*r+384))*c+((48*r+-24)*r)))*n+(((-48*c+(36*r+288))*c+((72*r+-660)*r+192))*c+(((-12*r+12)*r+480)*r)))
def tailCoeff207F1 (n c r : ℤ) : ℤ :=
 (((((-12*c+(36*r+48))*c+(-144*r+-48))*c+(144*r))*n+(((-144*c+(96*r+348))*c+((72*r+-540)*r+-120))*c+((-144*r+696)*r)))*n+(((-24*c+(-168*r+648))*c+((108*r+-252)*r+192))*c+(((36*r+-348)*r+480)*r)))
def tailCoeff307F1 (n c r : ℤ) : ℤ :=
 (((((-48*c+(36*r+192))*c+(-144*r+-192))*c+(144*r))*n+(((-48*c+(-192*r+192))*c+((72*r+396)*r+-192))*c+((-144*r+-24)*r)))*n+(((144*c+(-216*r+240))*c+((-144*r+792)*r+864))*c+(((36*r+12)*r+-840)*r)))
def tailCoeff407F1 (n c r : ℤ) : ℤ :=
 (((((-12*c+(-36*r+48))*c+(144*r+-48))*c+(-144*r))*n+(((120*c+(-192*r+-252))*c+((-72*r+684)*r+24))*c+((144*r+-600)*r)))*n+(((108*c+(156*r+348))*c+((-180*r+-24)*r+264))*c+(((-36*r+300)*r+216)*r)))
def tailCoeff507F1 (n c r : ℤ) : ℤ :=
 (((((24*c+(-36*r+-96))*c+(144*r+96))*c+(-144*r))*n+(((72*c+(96*r+-48))*c+((-72*r+-252)*r+-192))*c+((144*r+120)*r)))*n+(((180*r+336)*c+((72*r+-132)*r+-96))*c+(((-36*r+-60)*r+336)*r)))
def tailCoeff607F1 (n c r : ℤ) : ℤ :=
 (((((12*c+(12*r+-48))*c+(-48*r+48))*c+(48*r))*n+(((96*r+84)*c+((24*r+-276)*r+-168))*c+((-48*r+168)*r)))*n+(((84*r+276)*r+144)*c+(((12*r+-84)*r+-336)*r)))
def tailCoeff707F1 (n c r : ℤ) : ℤ :=
 (((((12*r)*c+(-48*r))*c+(48*r))*n+(((24*r+36)*r)*c+((-48*r+-72)*r)))*n+(((12*r+36)*r+24)*r))
def tailPoly07F1 (n c r : ℤ) : ℤ[X] :=
 C (tailCoeff007F1 n c r)*X^0+C (tailCoeff107F1 n c r)*X^1+C (tailCoeff207F1 n c r)*X^2+C (tailCoeff307F1 n c r)*X^3+C (tailCoeff407F1 n c r)*X^4+C (tailCoeff507F1 n c r)*X^5+C (tailCoeff607F1 n c r)*X^6+C (tailCoeff707F1 n c r)*X^7
theorem tail_poly07F1 (n c r q t u : ℤ) :
 normalTail1FDDA (n:ℤ[X]) c r q t u X=tailPoly07F1 n c r := by
 unfold normalTail1FDDA tailPoly07F1 tailCoeff007F1 tailCoeff107F1 tailCoeff207F1 tailCoeff307F1 tailCoeff407F1 tailCoeff507F1 tailCoeff607F1 tailCoeff707F1
 have hn : (C n:ℤ[X])=n := Polynomial.C_eq_intCast n
 have hc : (C c:ℤ[X])=c := Polynomial.C_eq_intCast c
 have hr : (C r:ℤ[X])=r := Polynomial.C_eq_intCast r
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,hn,hc,hr]
 ring
theorem second_shape_falling07F1 (n c r j : ℤ) :
 8*secondShape07F1 n c r j=8*thirdShapeBDEE n c r j+tailCoeff007F1 n c r*fallingFiveBDEE (j-n+3-0)+tailCoeff107F1 n c r*fallingFiveBDEE (j-n+3-1)+tailCoeff207F1 n c r*fallingFiveBDEE (j-n+3-2)+tailCoeff307F1 n c r*fallingFiveBDEE (j-n+3-3)+tailCoeff407F1 n c r*fallingFiveBDEE (j-n+3-4)+tailCoeff507F1 n c r*fallingFiveBDEE (j-n+3-5)+tailCoeff607F1 n c r*fallingFiveBDEE (j-n+3-6)+tailCoeff707F1 n c r*fallingFiveBDEE (j-n+3-7) := by
 unfold secondShape07F1 thirdShapeBDEE fallingFiveBDEE tailCoeff007F1 tailCoeff107F1 tailCoeff207F1 tailCoeff307F1 tailCoeff407F1 tailCoeff507F1 tailCoeff607F1 tailCoeff707F1
 ring
end
end MathGKM.Markov
