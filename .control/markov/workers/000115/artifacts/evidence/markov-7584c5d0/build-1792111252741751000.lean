import MarkovVerticalLCM758
import MarkovVerticalSeedTransportMDE6
/-! Machine-authored 7584c5d0. Uniform second-column seed CrossLC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem vN_zeroM758 (a r s : ℕ) :
 vNseedMDE6 0 a r s=X*v2seedMDE6 (a:ℤ) r s := by
 obtain ⟨ha,ha',hb,hb',hf,_⟩ := vJet_initialMDE6
 simp only [vNseedMDE6,vNexprMDE6,ha,ha',hb,hb',hf]
 simp only [v2seedMDE6,v2c0MDE6,v2c1MDE6,v2c2MDE6,v2c3MDE6,v2c4MDE6,v2c5MDE6,
   map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,Int.cast_natCast]
 ring

theorem vN_crossM758 (n a r : ℕ) (hr : 1 ≤ r) (hra : r < a) :
 CrossLC (CoeffSeq ((vNseedMDE6 n a r (2*r-a)).map (Int.castRingHom ℝ))) := by
 by_cases hn : n=0
 · subst n
   rw [vN_zeroM758]
   have hm : (v2seedMDE6 (a:ℤ) r (2*r-a:ℕ)).map (Int.castRingHom ℝ)=
     v2seedMDE6 (a:ℝ) r (2*r-a:ℕ) := by
     simp [v2seedMDE6,v2c0MDE6,v2c1MDE6,v2c2MDE6,v2c3MDE6,v2c4MDE6,v2c5MDE6,map_ofNat]
   rw [Polynomial.map_mul,Polynomial.map_X,hm]
   exact crossLC_X_mul (v2seed_crossMDE6 a r hr hra)
 have hq : (2:ℤ) ≤ (n:ℤ)+1 := by omega
 have he := vE_crossM758 a r hr hra ((n:ℤ)+1) hq
 have hs (k : ℤ) :
   6*CoeffSeq ((vNseedMDE6 n a r (2*r-a)).map (Int.castRingHom ℝ)) k=
   (vEM758 a r (2*r-a:ℕ) ((n:ℤ)+1) k:ℝ) := by
   by_cases hk : k < 0
   · rw [vE_zeroM758 _ _ _ _ _ hq (by omega)]
     simp [CoeffSeq,hk]
   · lift k to ℕ using (show 0 ≤ k by omega)
     rw [coeffSeq_nat774,Polynomial.coeff_map]
     change 6*((vNseedMDE6 n a r (2*r-a)).coeff k:ℝ)=
       (vEM758 a r (2*r-a:ℕ) ((n:ℤ)+1) k:ℝ)
     exact_mod_cast vN_coeff_scaledM758 n a r (2*r-a) k
 intro i j hij
 have hh := he i j hij
 dsimp only at hh
 rw [←hs i,←hs (j+1),←hs (i+1),←hs j] at hh
 nlinarith only [hh]

theorem vertical_second_all_runM758 (n : ℕ) (rest : List Bool)
 (ha : 5 ≤ (frame rest).mid.b) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 apply vertical_second_of_seedMDE6 n rest ha
 dsimp only
 obtain ⟨h0,h1,_⟩ := frame_reduced rest
 have hi := (source_vertical_indicesMDE6 n rest).1
 apply vN_crossM758
 · omega
 · omega

theorem vertical_second_largeM758 (path : List Bool)
 (ha : 5 ≤ (frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩ | ⟨n,rest,rfl⟩
 · have hi := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   exact vertical_second_all_runM758 n rest (by omega) j
end
end MathGKM.Markov
