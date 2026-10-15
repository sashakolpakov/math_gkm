import MarkovTerminalCoefficientsE2
import MarkovTerminalChambersE2
import MarkovTailPolygon53D
/-! Machine-authored e2cd486c. Full third lower slice for long mixed runs
with predecessor denominator at least four. This is not Conjecture63. -/
namespace MathGKM.Markov
noncomputable section

theorem third_terminal0_lcE2 (n c r : ℕ) (hn : 3 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hpoly : c ≤ 3*r) :
 (thirdRunPolyADB2 n c r).coeff (3*n+2)*(thirdRunPolyADB2 n c r).coeff (3*n+4) ≤
 ((thirdRunPolyADB2 n c r).coeff (3*n+3))^2 := by
 by_cases hlo : 2*r ≤ c
 · have h := terminal_low_lcE2 (c:ℤ) r (by omega) (by omega) (by omega)
   rw [terminal_lo_coeff0E2 n c r hn (by omega) hlo hpoly,
     terminal_lo_coeff1E2 n c r hn (by omega) hlo hpoly,
     terminal_lo_coeff2E2 n c r hn (by omega) hlo hpoly] at h
   nlinarith only [h]
 · by_cases hmid : 3*r ≤ 2*c
   · have h := terminal_mid_lcE2 (c:ℤ) r (by omega) (by omega) (by omega)
     rw [terminal_mid_coeff0E2 n c r hn (by omega) (by omega) hmid,
       terminal_mid_coeff1E2 n c r hn (by omega) (by omega) hmid,
       terminal_mid_coeff2E2 n c r hn (by omega) (by omega) hmid] at h
     nlinarith only [h]
   · have h := terminal_high_lc0E2 (c:ℤ) r (by omega) (by omega)
     rw [terminal_hi_coeff0E2 n c r hn (by omega) (by omega) (by omega),
       terminal_hi_coeff1E2 n c r hn (by omega) (by omega) (by omega),
       terminal_hi_coeff2E2 n c r hn (by omega) (by omega) (by omega)] at h
     nlinarith only [h]

theorem third_terminal1_lcE2 (n c r : ℕ) (hn : 3 ≤ n) (hc : 4 ≤ c)
 (hrc : r+1 ≤ c) (hpoly : 2*c ≤ 3*r) :
 (thirdRunPolyADB2 n c r).coeff (3*n+3)*(thirdRunPolyADB2 n c r).coeff (3*n+5) ≤
 ((thirdRunPolyADB2 n c r).coeff (3*n+4))^2 := by
 have h := terminal_high_lc1E2 (c:ℤ) r (by omega) (by omega)
 rw [terminal_hi_coeff1E2 n c r hn (by omega) (by omega) hpoly,
   terminal_hi_coeff2E2 n c r hn (by omega) (by omega) hpoly,
   terminal_hi_coeff3E2 n c r hn (by omega) (by omega) hpoly] at h
 nlinarith only [h]

theorem third_polygon_terminal_chamberE2 (n c r i j : ℕ)
 (hs : i+j+2=c*n+r+3)
 (hp : InPolygon (c*n+r) (c*(n+1)+r) i (j+2)) :
 c*(j+2) ≤ 3*(c*(n+1)+r) := by
 have hm := congrArg (fun t : ℕ => (c*(n+1)+r)*t) hs
 have hh := hp.1
 nlinarith

theorem source_third_long_largeE2 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 5 ≤ n) (hc : 4 ≤ (frame rest).mid.b)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hj : j ≤ 3*n+1
 · exact source_third_three_bands53D n rest i j hn hc hj hs
 · have hterm := source_third_remaining_terminal53D n rest i j hs hp (by omega)
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hrc,_⟩ := frame_reduced rest
   have hpoly := hp
   rw [ha,hb] at hpoly
   have hs' := hs
   rw [ha] at hs'
   have hch := third_polygon_terminal_chamberE2 n (frame rest).mid.b
     (frame rest).mid.a i j hs' hpoly
   have hh : (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff j*
     (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+2) ≤
     ((thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+1))^2 := by
    rcases hterm with h | h <;> subst j
    · have hh := third_terminal0_lcE2 n (frame rest).mid.b (frame rest).mid.a
        (by omega) hc (by omega) (by omega) (by nlinarith [hch])
      convert hh using 1 <;> congr 2 <;> omega
    · have hh := third_terminal1_lcE2 n (frame rest).mid.b (frame rest).mid.a
        (by omega) hc (by omega) (by nlinarith [hch])
      convert hh using 1 <;> congr 2 <;> omega
   rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
     ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
     ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at hh
   nlinarith only [hh]

#print axioms source_third_long_largeE2
end
end MathGKM.Markov
