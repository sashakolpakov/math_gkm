import MarkovCrossTail53D
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
def crossLow153D (n c r : ℤ) : ℤ :=
 ((((((((8*c+-24)*c+16)*c)*n+(((80*c+(120*r+-240))*c+(-360*r+160))*c+(240*r)))*n+(((280*c+(1200*r+-600))*c+((480*r+-4080)*r+80))*c+((-960*r+3360)*r)))*n+(((400*c+(4200*r+240))*c+((4320*r+-14760)*r+-2080))*c+(((480*r+-10080)*r+13680)*r)))*n+(((-528*c+(-2640*r+3864))*c+((3120*r+27120)*r+-216))*c+(((3360*r+5280)*r+-29760)*r)))*n+(((-2160*r+-3240)*c+((-7200*r+-16200)*r+-360))*c+(((-3600*r)*r+24840)*r)))
theorem cross_low_expand153D (n c r : ℤ) :
 crossTail153D n c r 0=crossLow153D n c r := by
 unfold crossTail153D crossLow153D secondShape07F1
 simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
 ring
def crossLow253D (n c r : ℤ) : ℤ :=
 ((((((((8*c+-24)*c+16)*c)*n+(((40*c+(120*r+-120))*c+(-360*r+80))*c+(240*r)))*n+(((40*c+(720*r+120))*c+((480*r+-2640)*r+-400))*c+((-960*r+2400)*r)))*n+(((-40*c+(1320*r+840))*c+((2880*r+-4680)*r+-1520))*c+(((480*r+-7200)*r+5040)*r)))*n+(((-48*c+(-720*r+264))*c+((1680*r+6960)*r+744))*c+(((2400*r+-480)*r+-7680)*r)))*n+(((-720*r+-3240)*r+-720)*c+(((-720*r+-2880)*r+4680)*r)))
theorem cross_low_expand253D (n c r : ℤ) :
 crossTail253D n c r 0=crossLow253D n c r := by
 unfold crossTail253D crossLow253D secondShape07F1
 simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
 ring
def crossLow353D (n c r : ℤ) : ℤ :=
 ((((((((8*c+-24)*c+16)*c)*n+(((120*r)*c+(-360*r))*c+(240*r)))*n+(((-40*c+(240*r+360))*c+((480*r+-1200)*r+-560))*c+((-960*r+1440)*r)))*n+(((-120*r)*c+((1440*r+1080)*r))*c+(((480*r+-4320)*r+-720)*r)))*n+(((32*c+(-240*r+-336))*c+((240*r+1920)*r+904))*c+(((1440*r+-480)*r+-2880)*r)))*n+(((240*r+-720)*r+120)*r))
theorem cross_low_expand353D (n c r : ℤ) :
 crossTail353D n c r 0=crossLow353D n c r := by
 unfold crossTail353D crossLow353D secondShape07F1
 simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
 ring
def crossLow453D (n c r : ℤ) : ℤ :=
 ((((((((8*c+-24)*c+16)*c)*n+(((-40*c+(120*r+120))*c+(-360*r+-80))*c+(240*r)))*n+(((40*c+(-240*r+120))*c+((480*r+240)*r+-400))*c+((-960*r+480)*r)))*n+(((40*c+(-120*r+-840))*c+(2520*r+1520))*c+(((480*r+-1440)*r+-3600)*r)))*n+(((-48*c+(240*r+624))*c+((-480*r+-2400)*r+-696))*c+(((480*r+2400)*r+1920)*r)))*n+(-360*c+(1080*r)))
theorem cross_low_expand453D (n c r : ℤ) :
 crossTail453D n c r 0=crossLow453D n c r := by
 unfold crossTail453D crossLow453D secondShape07F1
 simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
 ring
def crossLow553D (n c r : ℤ) : ℤ :=
 ((((((((8*c+-24)*c+16)*c)*n+(((-80*c+(120*r+240))*c+(-360*r+-160))*c+(240*r)))*n+(((280*c+(-720*r+-600))*c+((480*r+1680)*r+80))*c+((-960*r+-480)*r)))*n+(((-400*c+(1320*r+-240))*c+((-1440*r+-360)*r+2080))*c+(((480*r+1440)*r+-3600)*r)))*n+(((192*c+(-720*r+2064))*c+((960*r+-5280)*r+-4536))*c+(((-480*r+2400)*r+9600)*r)))*n+((-1440*c+(4320*r+2160))*c+((-2880*r+-4680)*r)))
theorem cross_low_expand553D (n c r : ℤ) :
 crossTail553D n c r 0=crossLow553D n c r := by
 unfold crossTail553D crossLow553D secondShape07F1
 simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
 ring
def crossLow653D (n c r : ℤ) : ℤ :=
 ((((((((8*c+-24)*c+16)*c)*n+(((-120*c+(120*r+360))*c+(-360*r+-240))*c+(240*r)))*n+(((680*c+(-1200*r+-1800))*c+((480*r+3120)*r+880))*c+((-960*r+-1440)*r)))*n+(((-1800*c+(4200*r+3240))*c+((-2880*r+-7560)*r+720))*c+(((480*r+4320)*r+-720)*r)))*n+(((2192*c+(-6000*r+-336))*c+((5280*r+1920)*r+-7736))*c+(((-1440*r+-3360)*r+14400)*r)))*n+(((-960*c+(2880*r+-2880))*c+((-2880*r+7200)*r+8520))*c+(((960*r+-2880)*r+-17160)*r)))
theorem cross_low_expand653D (n c r : ℤ) :
 crossTail653D n c r 0=crossLow653D n c r := by
 unfold crossTail653D crossLow653D secondShape07F1
 simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
 ring
end
end MathGKM.Markov
