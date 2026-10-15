import MarkovSmallPoly3FD
import MarkovSmall3A1FD
import MarkovSmall3A2FD
import MarkovSmall3B20FD
import MarkovSmall3B11FD
import MarkovSmall3B02FD
import MarkovSmall3C20FD
import MarkovSmall3C11FD
import MarkovSmall3C02FD
import MarkovSmall3D1FD
import MarkovSmall3D2FD
namespace MathGKM.Markov
noncomputable section
theorem small_lc3FD (c r q t u : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (hq : q=max (2*r-c) 0) (ht : t=min (c-r) (max (3*r-c) 0))
 (hu : u=max (3*r-2*c) 0) (j : ℕ) (hj : j ≤ 12) :
 smallCoeff3FD c r q t u j*smallCoeff3FD c r q t u (j+2) ≤
 (smallCoeff3FD c r q t u (j+1))^2 := by
 by_cases hA : 3*r ≤ c
 · have hq' : q=0 := by omega
   have ht' : t=0 := by omega
   have hu' : u=0 := by omega
   rw [hq',ht',hu']
   by_cases h1 : r=1
   · subst r
     have hh := small_chamber3_A1FD 0 (c-4) (by omega) (by omega) j hj
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := small_chamber3_A2FD (r-2) (c-3*r) (by omega) (by omega) j hj
     convert hh using 1 <;> congr 2 <;> ring
 · by_cases hB : 2*r ≤ c
   · have hq' : q=0 := by omega
     have ht' : t=3*r-c := by omega
     have hu' : u=0 := by omega
     rw [hq',ht',hu']
     by_cases h2 : 2 ≤ c-2*r
     · have hh := small_chamber3_B20FD (c-2*r-2) (3*r-c) (by omega) (by omega) j hj
       convert hh using 1 <;> congr 2 <;> ring
     · by_cases h1 : 1 ≤ c-2*r
       · have hh := small_chamber3_B11FD (c-2*r-1) (3*r-c-1) (by omega) (by omega) j hj
         convert hh using 1 <;> congr 2 <;> ring
       · have hh := small_chamber3_B02FD (c-2*r) (3*r-c-2) (by omega) (by omega) j hj
         convert hh using 1 <;> congr 2 <;> ring
   · by_cases hC : 3*r ≤ 2*c
     · have hq' : q=2*r-c := by omega
       have ht' : t=c-r := by omega
       have hu' : u=0 := by omega
       rw [hq',ht',hu']
       by_cases h2 : 2 ≤ 2*r-c
       · have hh := small_chamber3_C20FD (2*r-c-2) (2*c-3*r) (by omega) (by omega) j hj
         convert hh using 1 <;> congr 2 <;> ring
       · by_cases h1 : 1 ≤ 2*r-c
         · have hh := small_chamber3_C11FD (2*r-c-1) (2*c-3*r-1) (by omega) (by omega) j hj
           convert hh using 1 <;> congr 2 <;> ring
         · have hh := small_chamber3_C02FD (2*r-c) (2*c-3*r-2) (by omega) (by omega) j hj
           convert hh using 1 <;> congr 2 <;> ring
     · have hq' : q=2*r-c := by omega
       have ht' : t=c-r := by omega
       have hu' : u=3*r-2*c := by omega
       rw [hq',ht',hu']
       by_cases h1 : c-r=1
       · have hh := small_chamber3_D1FD 0 (c-4) (by omega) (by omega) j hj
         have he : r=c-1 := by omega
         rw [he]
         convert hh using 1 <;> congr 2 <;> ring
       · have hh := small_chamber3_D2FD (c-r-2) (3*r-2*c) (by omega) (by omega) j hj
         convert hh using 1 <;> congr 2 <;> ring
theorem small_run_lc3FD (c r j : ℕ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (hj : j ≤ 12) :
 (thirdRunPolyADB2 3 c r).coeff j*(thirdRunPolyADB2 3 c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 3 c r).coeff (j+1))^2 := by
 have hq : ((2*r-c:ℕ):ℤ)=max (2*(r:ℤ)-c) 0 := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ)=min ((c:ℤ)-r) (max (3*(r:ℤ)-c) 0) := by omega
 have hu : ((3*r-2*c:ℕ):ℤ)=max (3*(r:ℤ)-2*c) 0 := by omega
 rw [small_coeff3FD c r (by omega) j (by omega),
   small_coeff3FD c r (by omega) (j+2) (by omega),
   small_coeff3FD c r (by omega) (j+1) (by omega)]
 exact small_lc3FD c r _ _ _ (by omega) (by omega) (by omega) hq ht hu j hj
end
end MathGKM.Markov
