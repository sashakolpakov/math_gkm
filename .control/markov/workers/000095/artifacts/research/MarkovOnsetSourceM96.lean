import MarkovOnsetM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem source_fourth_onsetM96 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hn : 4≤n) (i k : ℕ)
 (hk : 1≤k) (hk4 : k≤4)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have h0 := source_fourth_early_shapeM042 n rest hc (i+2) k (by omega) (by omega) (by omega)
 have h1 := source_fourth_early_shapeM042 n rest hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_early_shapeM042 n rest hc i (k+2) (by omega) (by omega) (by omega)
 simp only [←Nat.add_assoc] at h0 h1 h2
 have hr := frame_reduced rest
 have hg := onset_early_lcM96 n (frame rest).mid.b (frame rest).mid.a k
   (by exact_mod_cast hn) (by exact_mod_cast hc) (by exact_mod_cast hr.1)
   (by exact_mod_cast hr.2.1) hk hk4
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]
end
end MathGKM.Markov
