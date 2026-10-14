import MarkovTopSource58d2
/-! Machine-authored b5dbe087. Vertical raw top-crossing gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000
def verticalGapB5 (i j b : ℝ) : ℝ :=
 let d := i+j
 let n := d+1-b
 let c := b*n+n-3*b-1
 2*d*(d-1)*(j+2)*(b*(j+1)+n*i)^2 -
 (j+1)*(d+2)*(d+1)*(n*(n-1)*i*(i-1)+2*c*i*j+b*(b-1)*j*(j-1))

theorem verticalGap_certificate_largeB5 (x y b c : ℝ)
 (he : c=x+2+(y)-2*b) :
 (2*(x+2+(y)))^2*verticalGapB5 (x+2) (y) b =
    576*c^2 +
    1248*(2*b)*c +
    608*(2*b)^2 +
    1296*y*c^2 +
    3224*y*(2*b)*c +
    1952*y*(2*b)^2 +
    1064*y^2*c^2 +
    3288*y^2*(2*b)*c +
    2508*y^2*(2*b)^2 +
    424*y^3*c^2 +
    1798*y^3*(2*b)*c +
    1676*y^3*(2*b)^2 +
    88*y^4*c^2 +
    590*y^4*(2*b)*c +
    635*y^4*(2*b)^2 +
    8*y^5*c^2 +
    114*y^5*(2*b)*c +
    139*y^5*(2*b)^2 +
    10*y^6*(2*b)*c +
    17*y^6*(2*b)^2 +
    y^7*(2*b)^2 +
    1968*x*c^2 +
    3896*x*(2*b)*c +
    1776*x*(2*b)^2 +
    3672*x*y*c^2 +
    8216*x*y*(2*b)*c +
    4472*x*y*(2*b)^2 +
    2588*x*y^2*c^2 +
    6874*x*y^2*(2*b)*c +
    4576*x*y^2*(2*b)^2 +
    908*x*y^3*c^2 +
    3014*x*y^3*(2*b)*c +
    2382*x*y^3*(2*b)^2 +
    164*x*y^4*c^2 +
    742*x*y^4*(2*b)*c +
    664*x*y^4*(2*b)^2 +
    12*x*y^5*c^2 +
    94*x*y^5*(2*b)*c +
    96*x*y^5*(2*b)^2 +
    4*x*y^6*(2*b)*c +
    6*x*y^6*(2*b)^2 +
    2704*x^2*c^2 +
    4832*x^2*(2*b)*c +
    2028*x^2*(2*b)^2 +
    4128*x^2*y*c^2 +
    8226*x^2*y*(2*b)*c +
    3980*x^2*y*(2*b)^2 +
    2404*x^2*y^2*c^2 +
    5470*x^2*y^2*(2*b)*c +
    3128*x^2*y^2*(2*b)^2 +
    684*x^2*y^3*c^2 +
    1816*x^2*y^3*(2*b)*c +
    1182*x^2*y^3*(2*b)^2 +
    92*x^2*y^4*c^2 +
    304*x^2*y^4*(2*b)*c +
    213*x^2*y^4*(2*b)^2 +
    4*x^2*y^5*c^2 +
    20*x^2*y^5*(2*b)*c +
    15*x^2*y^5*(2*b)^2 +
    1916*x^3*c^2 +
    3054*x^3*(2*b)*c +
    1160*x^3*(2*b)^2 +
    2324*x^3*y*c^2 +
    4082*x^3*y*(2*b)*c +
    1730*x^3*y*(2*b)^2 +
    1056*x^3*y^2*c^2 +
    2040*x^3*y^2*(2*b)*c +
    980*x^3*y^2*(2*b)^2 +
    216*x^3*y^3*c^2 +
    460*x^3*y^3*(2*b)*c +
    236*x^3*y^3*(2*b)^2 +
    16*x^3*y^4*c^2 +
    40*x^3*y^4*(2*b)*c +
    20*x^3*y^4*(2*b)^2 +
    740*x^4*c^2 +
    1036*x^4*(2*b)*c +
    349*x^4*(2*b)^2 +
    676*x^4*y*c^2 +
    1030*x^4*y*(2*b)*c +
    375*x^4*y*(2*b)^2 +
    216*x^4*y^2*c^2 +
    346*x^4*y^2*(2*b)*c +
    135*x^4*y^2*(2*b)^2 +
    24*x^4*y^3*c^2 +
    40*x^4*y^3*(2*b)*c +
    15*x^4*y^3*(2*b)^2 +
    148*x^5*c^2 +
    178*x^5*(2*b)*c +
    52*x^5*(2*b)^2 +
    92*x^5*y*c^2 +
    118*x^5*y*(2*b)*c +
    36*x^5*y*(2*b)^2 +
    16*x^5*y^2*c^2 +
    20*x^5*y^2*(2*b)*c +
    6*x^5*y^2*(2*b)^2 +
    12*x^6*c^2 +
    12*x^6*(2*b)*c +
    3*x^6*(2*b)^2 +
    4*x^6*y*c^2 +
    4*x^6*y*(2*b)*c +
    x^6*y*(2*b)^2 := by
 rw [he]
 unfold verticalGapB5
 ring

theorem verticalGap_nonneg_largeB5 (x y b : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hb : 0 ≤ b) (hc : 0 ≤ x+2+(y)-2*b) :
 0 ≤ verticalGapB5 (x+2) (y) b := by
 have h := verticalGap_certificate_largeB5 x y b (x+2+(y)-2*b) rfl
 have hp : 0 ≤ 576*(x+2+(y)-2*b)^2 +
    1248*(2*b)*(x+2+(y)-2*b) +
    608*(2*b)^2 +
    1296*y*(x+2+(y)-2*b)^2 +
    3224*y*(2*b)*(x+2+(y)-2*b) +
    1952*y*(2*b)^2 +
    1064*y^2*(x+2+(y)-2*b)^2 +
    3288*y^2*(2*b)*(x+2+(y)-2*b) +
    2508*y^2*(2*b)^2 +
    424*y^3*(x+2+(y)-2*b)^2 +
    1798*y^3*(2*b)*(x+2+(y)-2*b) +
    1676*y^3*(2*b)^2 +
    88*y^4*(x+2+(y)-2*b)^2 +
    590*y^4*(2*b)*(x+2+(y)-2*b) +
    635*y^4*(2*b)^2 +
    8*y^5*(x+2+(y)-2*b)^2 +
    114*y^5*(2*b)*(x+2+(y)-2*b) +
    139*y^5*(2*b)^2 +
    10*y^6*(2*b)*(x+2+(y)-2*b) +
    17*y^6*(2*b)^2 +
    y^7*(2*b)^2 +
    1968*x*(x+2+(y)-2*b)^2 +
    3896*x*(2*b)*(x+2+(y)-2*b) +
    1776*x*(2*b)^2 +
    3672*x*y*(x+2+(y)-2*b)^2 +
    8216*x*y*(2*b)*(x+2+(y)-2*b) +
    4472*x*y*(2*b)^2 +
    2588*x*y^2*(x+2+(y)-2*b)^2 +
    6874*x*y^2*(2*b)*(x+2+(y)-2*b) +
    4576*x*y^2*(2*b)^2 +
    908*x*y^3*(x+2+(y)-2*b)^2 +
    3014*x*y^3*(2*b)*(x+2+(y)-2*b) +
    2382*x*y^3*(2*b)^2 +
    164*x*y^4*(x+2+(y)-2*b)^2 +
    742*x*y^4*(2*b)*(x+2+(y)-2*b) +
    664*x*y^4*(2*b)^2 +
    12*x*y^5*(x+2+(y)-2*b)^2 +
    94*x*y^5*(2*b)*(x+2+(y)-2*b) +
    96*x*y^5*(2*b)^2 +
    4*x*y^6*(2*b)*(x+2+(y)-2*b) +
    6*x*y^6*(2*b)^2 +
    2704*x^2*(x+2+(y)-2*b)^2 +
    4832*x^2*(2*b)*(x+2+(y)-2*b) +
    2028*x^2*(2*b)^2 +
    4128*x^2*y*(x+2+(y)-2*b)^2 +
    8226*x^2*y*(2*b)*(x+2+(y)-2*b) +
    3980*x^2*y*(2*b)^2 +
    2404*x^2*y^2*(x+2+(y)-2*b)^2 +
    5470*x^2*y^2*(2*b)*(x+2+(y)-2*b) +
    3128*x^2*y^2*(2*b)^2 +
    684*x^2*y^3*(x+2+(y)-2*b)^2 +
    1816*x^2*y^3*(2*b)*(x+2+(y)-2*b) +
    1182*x^2*y^3*(2*b)^2 +
    92*x^2*y^4*(x+2+(y)-2*b)^2 +
    304*x^2*y^4*(2*b)*(x+2+(y)-2*b) +
    213*x^2*y^4*(2*b)^2 +
    4*x^2*y^5*(x+2+(y)-2*b)^2 +
    20*x^2*y^5*(2*b)*(x+2+(y)-2*b) +
    15*x^2*y^5*(2*b)^2 +
    1916*x^3*(x+2+(y)-2*b)^2 +
    3054*x^3*(2*b)*(x+2+(y)-2*b) +
    1160*x^3*(2*b)^2 +
    2324*x^3*y*(x+2+(y)-2*b)^2 +
    4082*x^3*y*(2*b)*(x+2+(y)-2*b) +
    1730*x^3*y*(2*b)^2 +
    1056*x^3*y^2*(x+2+(y)-2*b)^2 +
    2040*x^3*y^2*(2*b)*(x+2+(y)-2*b) +
    980*x^3*y^2*(2*b)^2 +
    216*x^3*y^3*(x+2+(y)-2*b)^2 +
    460*x^3*y^3*(2*b)*(x+2+(y)-2*b) +
    236*x^3*y^3*(2*b)^2 +
    16*x^3*y^4*(x+2+(y)-2*b)^2 +
    40*x^3*y^4*(2*b)*(x+2+(y)-2*b) +
    20*x^3*y^4*(2*b)^2 +
    740*x^4*(x+2+(y)-2*b)^2 +
    1036*x^4*(2*b)*(x+2+(y)-2*b) +
    349*x^4*(2*b)^2 +
    676*x^4*y*(x+2+(y)-2*b)^2 +
    1030*x^4*y*(2*b)*(x+2+(y)-2*b) +
    375*x^4*y*(2*b)^2 +
    216*x^4*y^2*(x+2+(y)-2*b)^2 +
    346*x^4*y^2*(2*b)*(x+2+(y)-2*b) +
    135*x^4*y^2*(2*b)^2 +
    24*x^4*y^3*(x+2+(y)-2*b)^2 +
    40*x^4*y^3*(2*b)*(x+2+(y)-2*b) +
    15*x^4*y^3*(2*b)^2 +
    148*x^5*(x+2+(y)-2*b)^2 +
    178*x^5*(2*b)*(x+2+(y)-2*b) +
    52*x^5*(2*b)^2 +
    92*x^5*y*(x+2+(y)-2*b)^2 +
    118*x^5*y*(2*b)*(x+2+(y)-2*b) +
    36*x^5*y*(2*b)^2 +
    16*x^5*y^2*(x+2+(y)-2*b)^2 +
    20*x^5*y^2*(2*b)*(x+2+(y)-2*b) +
    6*x^5*y^2*(2*b)^2 +
    12*x^6*(x+2+(y)-2*b)^2 +
    12*x^6*(2*b)*(x+2+(y)-2*b) +
    3*x^6*(2*b)^2 +
    4*x^6*y*(x+2+(y)-2*b)^2 +
    4*x^6*y*(2*b)*(x+2+(y)-2*b) +
    x^6*y*(2*b)^2 := by positivity
 have ht : 0 < (2*(x+2+(y)))^2 := by positivity
 rw [← h] at hp
 exact (mul_nonneg_iff_of_pos_left ht).mp hp

theorem verticalGap_certificate_oneB5 (x y b c : ℝ)
 (he : c=1+(y+1)-2*b) :
 (2*(1+(y+1)))^2*verticalGapB5 (1) (y+1) b =
    48*c^2 +
    576*(2*b)*c +
    768*(2*b)^2 +
    88*y*c^2 +
    1632*y*(2*b)*c +
    2272*y*(2*b)^2 +
    48*y^2*c^2 +
    1872*y^2*(2*b)*c +
    2724*y^2*(2*b)^2 +
    8*y^3*c^2 +
    1148*y^3*(2*b)*c +
    1746*y^3*(2*b)^2 +
    402*y^4*(2*b)*c +
    654*y^4*(2*b)^2 +
    76*y^5*(2*b)*c +
    145*y^5*(2*b)^2 +
    6*y^6*(2*b)*c +
    18*y^6*(2*b)^2 +
    y^7*(2*b)^2 := by
 rw [he]
 unfold verticalGapB5
 ring

theorem verticalGap_nonneg_oneB5 (x y b : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hb : 0 ≤ b) (hc : 0 ≤ 1+(y+1)-2*b) :
 0 ≤ verticalGapB5 (1) (y+1) b := by
 have h := verticalGap_certificate_oneB5 x y b (1+(y+1)-2*b) rfl
 have hp : 0 ≤ 48*(1+(y+1)-2*b)^2 +
    576*(2*b)*(1+(y+1)-2*b) +
    768*(2*b)^2 +
    88*y*(1+(y+1)-2*b)^2 +
    1632*y*(2*b)*(1+(y+1)-2*b) +
    2272*y*(2*b)^2 +
    48*y^2*(1+(y+1)-2*b)^2 +
    1872*y^2*(2*b)*(1+(y+1)-2*b) +
    2724*y^2*(2*b)^2 +
    8*y^3*(1+(y+1)-2*b)^2 +
    1148*y^3*(2*b)*(1+(y+1)-2*b) +
    1746*y^3*(2*b)^2 +
    402*y^4*(2*b)*(1+(y+1)-2*b) +
    654*y^4*(2*b)^2 +
    76*y^5*(2*b)*(1+(y+1)-2*b) +
    145*y^5*(2*b)^2 +
    6*y^6*(2*b)*(1+(y+1)-2*b) +
    18*y^6*(2*b)^2 +
    y^7*(2*b)^2 := by positivity
 have ht : 0 < (2*(1+(y+1)))^2 := by positivity
 rw [← h] at hp
 exact (mul_nonneg_iff_of_pos_left ht).mp hp

theorem verticalGap_certificate_zeroB5 (x y b c : ℝ)
 (he : c=0+(y+2)-2*b) :
 (2*(0+(y+2)))^2*verticalGapB5 (0) (y+2) b =
    288*(2*b)*c +
    576*(2*b)^2 +
    840*y*(2*b)*c +
    1824*y*(2*b)^2 +
    968*y^2*(2*b)*c +
    2356*y^2*(2*b)^2 +
    570*y^3*(2*b)*c +
    1624*y^3*(2*b)^2 +
    182*y^4*(2*b)*c +
    649*y^4*(2*b)^2 +
    30*y^5*(2*b)*c +
    151*y^5*(2*b)^2 +
    2*y^6*(2*b)*c +
    19*y^6*(2*b)^2 +
    y^7*(2*b)^2 := by
 rw [he]
 unfold verticalGapB5
 ring

theorem verticalGap_nonneg_zeroB5 (x y b : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hb : 0 ≤ b) (hc : 0 ≤ 0+(y+2)-2*b) :
 0 ≤ verticalGapB5 (0) (y+2) b := by
 have h := verticalGap_certificate_zeroB5 x y b (0+(y+2)-2*b) rfl
 have hp : 0 ≤ 288*(2*b)*(0+(y+2)-2*b) +
    576*(2*b)^2 +
    840*y*(2*b)*(0+(y+2)-2*b) +
    1824*y*(2*b)^2 +
    968*y^2*(2*b)*(0+(y+2)-2*b) +
    2356*y^2*(2*b)^2 +
    570*y^3*(2*b)*(0+(y+2)-2*b) +
    1624*y^3*(2*b)^2 +
    182*y^4*(2*b)*(0+(y+2)-2*b) +
    649*y^4*(2*b)^2 +
    30*y^5*(2*b)*(0+(y+2)-2*b) +
    151*y^5*(2*b)^2 +
    2*y^6*(2*b)*(0+(y+2)-2*b) +
    19*y^6*(2*b)^2 +
    y^7*(2*b)^2 := by positivity
 have ht : 0 < (2*(0+(y+2)))^2 := by positivity
 rw [← h] at hp
 exact (mul_nonneg_iff_of_pos_left ht).mp hp

theorem verticalGap_nonnegB5 (i j : ℕ) (b : ℝ) (hb : 0 ≤ b)
 (hc : 2*b ≤ (i:ℝ)+j) (hd : 2 ≤ i+j) : 0 ≤ verticalGapB5 i j b := by
 rcases i with _ | (_ | i)
 · have hj : 2 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   have h := verticalGap_nonneg_zeroB5 0 k b (by norm_num) (by positivity) hb (by push_cast at *; linarith)
   simpa [Nat.cast_add,add_comm] using h
 · have hj : 1 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   have h := verticalGap_nonneg_oneB5 0 k b (by norm_num) (by positivity) hb (by push_cast at *; linarith)
   simpa [Nat.cast_add,add_comm] using h
 · simpa [Nat.cast_add,add_comm,add_left_comm,add_assoc] using
     verticalGap_nonneg_largeB5 i j b (by positivity) (by positivity) hb (by push_cast at *; linarith)

#print axioms verticalGap_nonnegB5
end
end MathGKM.Markov
