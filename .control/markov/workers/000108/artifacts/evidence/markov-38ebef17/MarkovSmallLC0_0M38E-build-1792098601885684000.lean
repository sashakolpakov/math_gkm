import MarkovSmallQuot0_0M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap0_0_0M38E (c r : ℤ) : ℤ := ((((((((90*r + 330)*r + 280)*c + (((2700*r + 11034)*r + 13422)*r + 4920))*c + ((((33750*r + 152100)*r + 236532)*r + 154422)*r + 35560))*c + (((((225000*r + 1108500)*r + 2075140)*r + 1875714)*r + 815018)*r + 135240))*c + ((((((843750*r + 4511250)*r + 9799800)*r + 11122410)*r + 6920478)*r + 2220192)*r + 285280))*c + (((((((1687500*r + 9731250)*r + 23934750)*r + 32381550)*r + 25858430)*r + 12086160)*r + 3040456)*r + 316320))*c + ((((((((1406250*r + 8700000)*r + 23807500)*r + 37173000)*r + 35932450)*r + 21831000)*r + 8080936)*r + 1657920)*r + 144000))

theorem small_gap0_0_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 0*smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 2≤(smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 1)^2-smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 0*smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 2=smallGap0_0_0M38E c r := by
  unfold smallValue0_0M38E smallGap0_0_0M38E
  ring
 rw [he]
 unfold smallGap0_0_0M38E
 positivity

def smallGap0_0_1M38E (c r : ℤ) : ℤ := ((((((((1620*r + 9720)*r + 22356)*r + 23280)*r + 9600)*c + (((((32400*r + 198936)*r + 492336)*r + 608856)*r + 378480)*r + 91200))*c + ((((((243000*r + 1526040)*r + 4035852)*r + 5714928)*r + 4568868)*r + 1918560)*r + 321600))*c + (((((((810000*r + 5200200)*r + 14611320)*r + 23130696)*r + 22172088)*r + 12698352)*r + 3938880)*r + 499200))*c + ((((((((1012500*r + 6642000)*r + 19729800)*r + 34337280)*r + 37955796)*r + 26976432)*r + 11821584)*r + 2858880)*r + 288000))

theorem small_gap0_0_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 1*smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 3≤(smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 2)^2-smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 1*smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 3=smallGap0_0_1M38E c r := by
  unfold smallValue0_0M38E smallGap0_0_1M38E
  ring
 rw [he]
 unfold smallGap0_0_1M38E
 positivity

def smallGap0_0_2M38E (c r : ℤ) : ℤ := ((((((((7290*r + 51030)*r + 160218)*r + 282618)*r + 295164)*r + 172800)*r + 43200)*c + (((((((72900*r + 500094)*r + 1579986)*r + 2897622)*r + 3309210)*r + 2329308)*r + 921600)*r + 158400))*c + ((((((((182250*r + 1224720)*r + 3887676)*r + 7358184)*r + 8999442)*r + 7199496)*r + 3657096)*r + 1080000)*r + 144000))

theorem small_gap0_0_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 2*smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 4≤(smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 3)^2-smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 2*smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) 4=smallGap0_0_2M38E c r := by
  unfold smallValue0_0M38E smallGap0_0_2M38E
  ring
 rw [he]
 unfold smallGap0_0_2M38E
 positivity

theorem small_lc0_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) j*smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+2)≤(smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+1))^2 := by
 by_cases hj : j≤2
 · interval_cases j
   · exact small_gap0_0_0M38E c r hc hr
   · exact small_gap0_0_1M38E c r hc hr
   · exact small_gap0_0_2M38E c r hc hr
 · have hv : smallValue0_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+2)=0 := by
    unfold smallValue0_0M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc0_0M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 0 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 0 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 1*((frame rest).mid.a:ℤ)-0*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+1*x+4*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 1+0*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc0_0M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff0_0M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff0_0M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff0_0M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
