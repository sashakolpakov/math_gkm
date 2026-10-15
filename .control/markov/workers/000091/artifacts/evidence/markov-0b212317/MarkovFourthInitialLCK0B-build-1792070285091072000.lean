import MarkovFourthGapStrongK0B
/-! Machine-authored request 0b212317. Raw fourth-slice inequalities in an unbounded initial interval. -/
namespace MathGKM.Markov
noncomputable section

theorem source_fourth_initial_lcK0B (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : 5≤j) (hn : j+2<n) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_fourth_shapeK0B n rest hc (i+2) j (by omega) hj (by omega)
 have h1 := source_fourth_shapeK0B n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_shapeK0B n rest hc i (j+2) (by omega) (by omega) hn
 have hC : (2:ℤ)≤(frame rest).mid.b := by exact_mod_cast (by omega : 2≤(frame rest).mid.b)
 have hJ : (6:ℤ)≤(j:ℤ)+1 := by exact_mod_cast (by omega : 6≤j+1)
 have hN : (j:ℤ)+2≤n := by exact_mod_cast (by omega : j+2≤n)
 have hH : ((frame rest).mid.b:ℤ)*((j:ℤ)+1+1) ≤
     (n:ℤ)*(frame rest).mid.b+(frame rest).mid.a := by
   have h := mul_le_mul_of_nonneg_left hN (show (0:ℤ)≤(frame rest).mid.b by positivity)
   have ha : (0:ℤ)≤(frame rest).mid.a := by positivity
   nlinarith only [h,ha]
 have hg := fourthShape_logConcaveK0B (frame rest).mid.b
   ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) ((j:ℤ)+1) hC hJ hH
 have e0 : (j:ℤ)+1-1=j := by ring
 have e2 : (j:ℤ)+1+1=j+2 := by ring
 rw [e0,e2] at hg
 push_cast at h1 h2
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]

end
end MathGKM.Markov
