import MarkovThirdCandidate75
/-! Machine-authored 75ad68f9. Universal algebraic candidate inequalities;
not an assertion of the outstanding source formula. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
theorem third_midlow_075 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 0*thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 2≤(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 1)^2 := by
 have he : (thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 1)^2-(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 0)*(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 2) =
   89424 + 406272*y + 759552*y^2 + 747648*y^3 + 408432*y^4 + 117312*y^5 + 13824*y^6 + 319176*x + 1203600*x*y + 1795152*x*y^2 + 1323096*x*y^3 + 481488*x*y^4 + 69120*x*y^5 + 476001*x^2 + 1433484*x^2*y + 1602567*x^2*y^2 + 787644*x^2*y^3 + 143424*x^2*y^4 + 380754*x^3 + 860355*x^3*y + 642087*x^3*y^2 + 158112*x^3*y^3 + 172773*x^4 + 260901*x^4*y + 97686*x^4*y^2 + 42282*x^5 + 32076*x^5*y + 4374*x^6 := by simp only [thirdSeq75]; ring
 have hp : 0≤89424 + 406272*y + 759552*y^2 + 747648*y^3 + 408432*y^4 + 117312*y^5 + 13824*y^6 + 319176*x + 1203600*x*y + 1795152*x*y^2 + 1323096*x*y^3 + 481488*x*y^4 + 69120*x*y^5 + 476001*x^2 + 1433484*x^2*y + 1602567*x^2*y^2 + 787644*x^2*y^3 + 143424*x^2*y^4 + 380754*x^3 + 860355*x^3*y + 642087*x^3*y^2 + 158112*x^3*y^3 + 172773*x^4 + 260901*x^4*y + 97686*x^4*y^2 + 42282*x^5 + 32076*x^5*y + 4374*x^6 := by positivity
 omega
theorem third_midlow_175 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 1*thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 3≤(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 2)^2 := by
 have he : (thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 2)^2-(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 1)*(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 3) =
   99504 + 413100*y + 693864*y^2 + 606240*y^3 + 292392*y^4 + 74196*y^5 + 7776*y^6 + 347040*x + 1192293*x*y + 1594845*x*y^2 + 1043595*x*y^3 + 335907*x*y^4 + 42768*x*y^5 + 509049*x^2 + 1390257*x^2*y + 1389753*x^2*y^2 + 605799*x^2*y^3 + 97686*x^2*y^4 + 401652*x^3 + 818289*x^3*y + 543915*x^3*y^2 + 118584*x^3*y^3 + 179739*x^4 + 243081*x^4*y + 80676*x^4*y^2 + 43254*x^5 + 29160*x^5*y + 4374*x^6 := by simp only [thirdSeq75]; ring
 have hp : 0≤99504 + 413100*y + 693864*y^2 + 606240*y^3 + 292392*y^4 + 74196*y^5 + 7776*y^6 + 347040*x + 1192293*x*y + 1594845*x*y^2 + 1043595*x*y^3 + 335907*x*y^4 + 42768*x*y^5 + 509049*x^2 + 1390257*x^2*y + 1389753*x^2*y^2 + 605799*x^2*y^3 + 97686*x^2*y^4 + 401652*x^3 + 818289*x^3*y + 543915*x^3*y^2 + 118584*x^3*y^3 + 179739*x^4 + 243081*x^4*y + 80676*x^4*y^2 + 43254*x^5 + 29160*x^5*y + 4374*x^6 := by positivity
 omega
theorem third_midlow_275 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 2*thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 4≤(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 3)^2 := by
 have he : (thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 3)^2-(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 2)*(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 4) =
   22608 + 78696*y + 113985*y^2 + 85752*y^3 + 35478*y^4 + 7776*y^5 + 729*y^6 + 71784*x + 211050*x*y + 245520*x*y^2 + 139320*x*y^3 + 38880*x*y^4 + 4374*x*y^5 + 99945*x^2 + 236448*x^2*y + 205740*x^2*y^2 + 77760*x^2*y^3 + 10935*x^2*y^4 + 76680*x^3 + 135432*x^3*y + 77760*x^3*y^2 + 14580*x^3*y^3 + 33534*x^4 + 38880*x^4*y + 10935*x^4*y^2 + 7776*x^5 + 4374*x^5*y + 729*x^6 := by simp only [thirdSeq75]; ring
 have hp : 0≤22608 + 78696*y + 113985*y^2 + 85752*y^3 + 35478*y^4 + 7776*y^5 + 729*y^6 + 71784*x + 211050*x*y + 245520*x*y^2 + 139320*x*y^3 + 38880*x*y^4 + 4374*x*y^5 + 99945*x^2 + 236448*x^2*y + 205740*x^2*y^2 + 77760*x^2*y^3 + 10935*x^2*y^4 + 76680*x^3 + 135432*x^3*y + 77760*x^3*y^2 + 14580*x^3*y^3 + 33534*x^4 + 38880*x^4*y + 10935*x^4*y^2 + 7776*x^5 + 4374*x^5*y + 729*x^6 := by positivity
 omega
theorem third_midlow_375 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 3*thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 5≤(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 4)^2 := by
 have he : (thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 4)^2-(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 3)*(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) 5) =
   576 + 1152*x + 576*x^2 := by simp only [thirdSeq75]; ring
 have hp : 0≤576 + 1152*x + 576*x^2 := by positivity
 omega
theorem third_midlow_lc75 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) j*thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) (j+2)≤(thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) (j+1))^2 := by
 by_cases hj : j<4
 · interval_cases j
   · exact third_midlow_075 x y hx hy
   · exact third_midlow_175 x y hx hy
   · exact third_midlow_275 x y hx hy
   · exact third_midlow_375 x y hx hy
 · have hz : thirdSeq75 (2*(x+1)+3*(y+1)) ((x+1)+(y+1)) (0) (x+1) (0) (j+2)=0 := by
     match j with
     | 0 | 1 | 2 | 3 => omega
     | n+4 => rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
#print axioms third_midlow_lc75
end
end MathGKM.Markov
