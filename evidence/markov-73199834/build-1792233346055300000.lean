import MarkovTopFirstCentralIdentityM731
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 14000000
set_option maxRecDepth 20000
theorem first_central_reduced_shift_positiveM731 (x y z : ℤ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < firstCentralReducedM731 (x+2) (y+5) (3*(x+2)+(y+5)+4+z) := by
 have he : firstCentralReducedM731 (x+2) (y+5) (3*(x+2)+(y+5)+4+z)=
(((193090176 + z * (27303840 + z * 909216)) + y * ((124422336 + z * (15805728 + z * 457632)) + y * ((30930624 + z * (3344256 + z * 76608)) + y * ((3609408 + z * (296064 + z * 4032)) + y * ((195264 + z * 9216) + y * 3840))))) + x * (((248679168 + z * (31768712 + z * 931912)) + y * ((148708432 + z * (17455400 + z * 456584)) + y * ((34118896 + z * (3516896 + z * 75632)) + y * ((3589744 + z * (291872 + z * 3920)) + y * ((169424 + z * 8384) + y * 2752))))) + x * (((134235096 + z * (14877480 + z * 362712)) + y * ((73362312 + z * (7672248 + z * 171816)) + y * ((15350032 + z * (1466272 + z * 28360)) + y * ((1432200 + z * (113312 + z * 1464)) + y * ((58248 + z * 2992) + y * 800))))) + x * (((39125808 + z * (3531200 + z * 64432)) + y * ((19059552 + z * (1671312 + z * 28864)) + y * ((3564560 + z * (300104 + z * 4776)) + y * ((285256 + z * (21144 + z * 248)) + y * ((9744 + z * 496) + y * 120))))) + x * (((6590760 + z * (434592 + z * 4704)) + y * ((2738952 + z * (179520 + z * 1824)) + y * ((442096 + z * (29688 + z * 304)) + y * ((28080 + z * (1800 + z * 16)) + y * ((744 + z * 32) + y * 8))))) + x * (((632496 + z * (24512 + z * 64)) + y * ((205376 + z * 7552) + y * ((26816 + z * 1104) + y * ((1072 + z * 48) + y * 16)))) + x * (((31200 + z * 384) + y * (6240 + y * 576)) + x * 576))))))) := by unfold firstCentralReducedM731; ring
 rw [he]
 positivity
theorem first_central_margin_positiveM731 (a r H : ℤ)
 (ha : 2 ≤ a) (hr : 5 ≤ r) (hH : 3*a+r+4 ≤ H) :
 0 < firstCentralMarginM731 a r H := by
 have hh := first_central_reduced_shift_positiveM731 (a-2) (r-5) (H-3*a-r-4)
  (by omega) (by omega) (by omega)
 have hred : 0 < firstCentralReducedM731 a r H := by
  rw [show a-2+2=a by ring,show r-5+5=r by ring,
    show 3*a+r+4+(H-3*a-r-4)=H by ring] at hh
  exact hh
 rw [first_central_margin_identityM731]
 have : 0 < r-1 := by omega
 positivity
end
end MathGKM.Markov
