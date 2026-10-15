import MarkovThirdCandidate75
/-! Machine-authored 75ad68f9. Universal algebraic candidate inequalities;
not an assertion of the outstanding source formula. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
theorem third_low_075 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 0*thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 2≤(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 1)^2 := by
 have he : (thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 1)^2-(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 0)*(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 2) =
   360 + 1116*y + 1260*y^2 + 612*y^3 + 108*y^4 + 4626*x + 10659*x*y + 8247*x*y^2 + 2373*x*y^3 + 159*x*y^4 + 22566*x^2 + 36717*x^2*y + 18198*x^2*y^2 + 2661*x^2*y^3 + 54*x^2*y^4 + 54084*x^3 + 59328*x^3*y + 16668*x^3*y^2 + 864*x^3*y^3 + 70368*x^4 + 46320*x^4*y + 5184*x^4*y^2 + 48192*x^5 + 13824*x^5*y + 13824*x^6 := by simp only [thirdSeq75]; ring
 have hp : 0≤360 + 1116*y + 1260*y^2 + 612*y^3 + 108*y^4 + 4626*x + 10659*x*y + 8247*x*y^2 + 2373*x*y^3 + 159*x*y^4 + 22566*x^2 + 36717*x^2*y + 18198*x^2*y^2 + 2661*x^2*y^3 + 54*x^2*y^4 + 54084*x^3 + 59328*x^3*y + 16668*x^3*y^2 + 864*x^3*y^3 + 70368*x^4 + 46320*x^4*y + 5184*x^4*y^2 + 48192*x^5 + 13824*x^5*y + 13824*x^6 := by positivity
 omega
theorem third_low_175 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 1*thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 3≤(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 2)^2 := by
 have he : (thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 2)^2-(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 1)*(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 3) =
   720 + 1728*y + 1008*y^2 + 6696*x + 10944*x*y + 3096*x*y^2 + 25533*x^2 + 25200*x^2*y + 3843*x^2*y^2 + 49860*x^3 + 28935*x^3*y + 2187*x^3*y^2 + 54171*x^4 + 16605*x^4*y + 486*x^4*y^2 + 31428*x^5 + 3888*x^5*y + 7776*x^6 := by simp only [thirdSeq75]; ring
 have hp : 0≤720 + 1728*y + 1008*y^2 + 6696*x + 10944*x*y + 3096*x*y^2 + 25533*x^2 + 25200*x^2*y + 3843*x^2*y^2 + 49860*x^3 + 28935*x^3*y + 2187*x^3*y^2 + 54171*x^4 + 16605*x^4*y + 486*x^4*y^2 + 31428*x^5 + 3888*x^5*y + 7776*x^6 := by positivity
 omega
theorem third_low_275 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 2*thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 4≤(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 3)^2 := by
 have he : (thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 3)^2-(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 2)*(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 4) =
   576 + 3168*x + 7380*x^2 + 9612*x^3 + 7533*x^4 + 3402*x^5 + 729*x^6 := by simp only [thirdSeq75]; ring
 have hp : 0≤576 + 3168*x + 7380*x^2 + 9612*x^3 + 7533*x^4 + 3402*x^5 + 729*x^6 := by positivity
 omega
theorem third_low_375 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 3*thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 5≤(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 4)^2 := by
 have he : (thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 4)^2-(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 3)*(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) 5) =
   0 := by simp only [thirdSeq75]; ring
 have hp : 0≤0 := by positivity
 omega
theorem third_low_lc75 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) j*thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) (j+2)≤(thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) (j+1))^2 := by
 by_cases hj : j<4
 · interval_cases j
   · exact third_low_075 x y hx hy
   · exact third_low_175 x y hx hy
   · exact third_low_275 x y hx hy
   · exact third_low_375 x y hx hy
 · have hz : thirdSeq75 (3*(x+1)+y) (x+1) (0) (0) (0) (j+2)=0 := by
     match j with
     | 0 | 1 | 2 | 3 => omega
     | n+4 => rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
#print axioms third_low_lc75
end
end MathGKM.Markov
