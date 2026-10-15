import MarkovCrossTail53D
/-! Machine-authored 8833a0fb. Exact unbounded three-cycle gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
theorem three_cross_1_18833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail153D (x+4) 3 1 0*crossTail353D (x+4) 3 1 0 ≤ (crossTail253D (x+4) 3 1 0)^2 := by
 have he : (crossTail253D (x+4) 3 1 0)^2-(crossTail153D (x+4) 3 1 0*crossTail353D (x+4) 3 1 0)=28092873600 + 32042718720*x + 16023265920*x^2 + 4705482240*x^3 + 912746880*x^4 + 121409280*x^5 + 10730880*x^6 + 552960*x^7 + 11520*x^8 := by
  simp only [crossTail153D,crossTail253D,crossTail353D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 28092873600 + 32042718720*x + 16023265920*x^2 + 4705482240*x^3 + 912746880*x^4 + 121409280*x^5 + 10730880*x^6 + 552960*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_cross_1_28833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail253D (x+4) 3 1 0*crossTail453D (x+4) 3 1 0 ≤ (crossTail353D (x+4) 3 1 0)^2 := by
 have he : (crossTail353D (x+4) 3 1 0)^2-(crossTail253D (x+4) 3 1 0*crossTail453D (x+4) 3 1 0)=5813467200 + 8326177920*x + 5347010880*x^2 + 2016345600*x^3 + 488378880*x^4 + 77633280*x^5 + 7873920*x^6 + 460800*x^7 + 11520*x^8 := by
  simp only [crossTail253D,crossTail353D,crossTail453D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 5813467200 + 8326177920*x + 5347010880*x^2 + 2016345600*x^3 + 488378880*x^4 + 77633280*x^5 + 7873920*x^6 + 460800*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_cross_1_38833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail353D (x+4) 3 1 0*crossTail553D (x+4) 3 1 0 ≤ (crossTail453D (x+4) 3 1 0)^2 := by
 have he : (crossTail453D (x+4) 3 1 0)^2-(crossTail353D (x+4) 3 1 0*crossTail553D (x+4) 3 1 0)=1107950400 + 1979026560*x + 1580618880*x^2 + 736911360*x^3 + 218983680*x^4 + 42359040*x^5 + 5195520*x^6 + 368640*x^7 + 11520*x^8 := by
  simp only [crossTail353D,crossTail453D,crossTail553D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 1107950400 + 1979026560*x + 1580618880*x^2 + 736911360*x^3 + 218983680*x^4 + 42359040*x^5 + 5195520*x^6 + 368640*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_cross_1_48833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail453D (x+4) 3 1 0*crossTail653D (x+4) 3 1 0 ≤ (crossTail553D (x+4) 3 1 0)^2 := by
 have he : (crossTail553D (x+4) 3 1 0)^2-(crossTail453D (x+4) 3 1 0*crossTail653D (x+4) 3 1 0)=158760000 + 347673600*x + 342858240*x^2 + 199480320*x^3 + 75098880*x^4 + 18662400*x^5 + 2972160*x^6 + 276480*x^7 + 11520*x^8 := by
  simp only [crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 158760000 + 347673600*x + 342858240*x^2 + 199480320*x^3 + 75098880*x^4 + 18662400*x^5 + 2972160*x^6 + 276480*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_tail_18833 (x : ℤ) (hx : 0 ≤ x) :
 tailLow53D 3 1 x*tailLow53D 3 1 (x+2) ≤ (tailLow53D 3 1 (x+1))^2 := by
 have he : (tailLow53D 3 1 (x+1))^2-tailLow53D 3 1 x*tailLow53D 3 1 (x+2)=13608000 + 37324800*x + 47485440*x^2 + 35297280*x^3 + 17498880*x^4 + 5990400*x^5 + 1359360*x^6 + 184320*x^7 + 11520*x^8 := by
  unfold tailLow53D; ring
 have hp : 0 ≤ 13608000 + 37324800*x + 47485440*x^2 + 35297280*x^3 + 17498880*x^4 + 5990400*x^5 + 1359360*x^6 + 184320*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_cross_2_18833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail153D (x+4) 3 2 1*crossTail353D (x+4) 3 2 1 ≤ (crossTail253D (x+4) 3 2 1)^2 := by
 have he : (crossTail253D (x+4) 3 2 1)^2-(crossTail153D (x+4) 3 2 1*crossTail353D (x+4) 3 2 1)=106523424000 + 103227609600*x + 42618389760*x^2 + 10117601280*x^3 + 1602593280*x^4 + 180633600*x^5 + 14077440*x^6 + 645120*x^7 + 11520*x^8 := by
  simp only [crossTail153D,crossTail253D,crossTail353D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 106523424000 + 103227609600*x + 42618389760*x^2 + 10117601280*x^3 + 1602593280*x^4 + 180633600*x^5 + 14077440*x^6 + 645120*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_cross_2_28833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail253D (x+4) 3 2 1*crossTail453D (x+4) 3 2 1 ≤ (crossTail353D (x+4) 3 2 1)^2 := by
 have he : (crossTail353D (x+4) 3 2 1)^2-(crossTail253D (x+4) 3 2 1*crossTail453D (x+4) 3 2 1)=25366867200 + 29600951040*x + 15392079360*x^2 + 4724490240*x^3 + 946183680*x^4 + 126869760*x^5 + 11024640*x^6 + 552960*x^7 + 11520*x^8 := by
  simp only [crossTail253D,crossTail353D,crossTail453D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 25366867200 + 29600951040*x + 15392079360*x^2 + 4724490240*x^3 + 946183680*x^4 + 126869760*x^5 + 11024640*x^6 + 552960*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_cross_2_38833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail353D (x+4) 3 2 1*crossTail553D (x+4) 3 2 1 ≤ (crossTail453D (x+4) 3 2 1)^2 := by
 have he : (crossTail453D (x+4) 3 2 1)^2-(crossTail353D (x+4) 3 2 1*crossTail553D (x+4) 3 2 1)=5659372800 + 8273767680*x + 5408812800*x^2 + 2064038400*x^3 + 502030080*x^4 + 79499520*x^5 + 7977600*x^6 + 460800*x^7 + 11520*x^8 := by
  simp only [crossTail353D,crossTail453D,crossTail553D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 5659372800 + 8273767680*x + 5408812800*x^2 + 2064038400*x^3 + 502030080*x^4 + 79499520*x^5 + 7977600*x^6 + 460800*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_cross_2_48833 (x : ℤ) (hx : 0 ≤ x) :
 crossTail453D (x+4) 3 2 1*crossTail653D (x+4) 3 2 1 ≤ (crossTail553D (x+4) 3 2 1)^2 := by
 have he : (crossTail553D (x+4) 3 2 1)^2-(crossTail453D (x+4) 3 2 1*crossTail653D (x+4) 3 2 1)=1117411200 + 2000350080*x + 1598702400*x^2 + 744860160*x^3 + 220970880*x^4 + 42635520*x^5 + 5212800*x^6 + 368640*x^7 + 11520*x^8 := by
  simp only [crossTail453D,crossTail553D,crossTail653D,secondShape07F1,thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring
 have hp : 0 ≤ 1117411200 + 2000350080*x + 1598702400*x^2 + 744860160*x^3 + 220970880*x^4 + 42635520*x^5 + 5212800*x^6 + 368640*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
theorem three_tail_28833 (x : ℤ) (hx : 0 ≤ x) :
 tailHigh53D 3 2 x*tailHigh53D 3 2 (x+2) ≤ (tailHigh53D 3 2 (x+1))^2 := by
 have he : (tailHigh53D 3 2 (x+1))^2-tailHigh53D 3 2 x*tailHigh53D 3 2 (x+2)=158760000 + 347673600*x + 342858240*x^2 + 199480320*x^3 + 75098880*x^4 + 18662400*x^5 + 2972160*x^6 + 276480*x^7 + 11520*x^8 := by
  unfold tailHigh53D; ring
 have hp : 0 ≤ 158760000 + 347673600*x + 342858240*x^2 + 199480320*x^3 + 75098880*x^4 + 18662400*x^5 + 2972160*x^6 + 276480*x^7 + 11520*x^8 := by positivity
 linarith only [he,hp]
end
end MathGKM.Markov
