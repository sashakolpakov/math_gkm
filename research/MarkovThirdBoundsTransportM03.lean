import MarkovThirdAllBoundsDefM115
import MarkovThirdRun1LCM115
import MarkovThirdRun2LCM115
import MarkovThirdRun3LCM115
import MarkovThirdRun4LCM115
/-! Machine-authored 1152282d. All-run actual seed transport, no zero deletion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vThird_seed_cross_of_boundsM03 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b)
 (hb : vAllBoundsM115 (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ)) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))) := by
 by_cases hn : n < 4
 · interval_cases n
   · exact vThird_seed_run1M115 rest ha
   · exact vThird_seed_run2M115 rest ha
   · exact vThird_seed_run3M115 rest ha
   · exact vThird_seed_run4M115 rest ha
 let a := (frame rest).mid.b
 let b := (frame rest).mid.a
 let c := 2*b-a
 let d := min (a-b) (3*b-a)
 let e := 3*b-2*a
 let q : ℤ := n+1
 let f := CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))
 have hq : 5 ≤ q := by dsimp [q]; omega
 have hs (k : ℤ) : 120*f k=(vEM115 a b c d e q k:ℝ) := by
   by_cases hk : k < 0
   · rw [vE_zeroM115 _ _ _ _ _ _ _ (by omega) (by omega)]
     simp [f,CoeffSeq,hk]
   · lift k to ℕ using (show 0 ≤ k by omega)
     simp only [f,coeffSeq_nat774,Polynomial.coeff_map,Int.coe_castRingHom]
     simpa only [a,b,c,d,e,q,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast,Nat.cast_add,Nat.cast_one] using congrArg (fun z : ℤ => (z:ℝ)) (vThird_coeff_scaledM115 n rest k)
 obtain ⟨hg,hp⟩ := hb q hq
 change (∀ j, vEM115 a b c d e q (j-1)*vEM115 a b c d e q (j+1) ≤ vEM115 a b c d e q j^2) at hg
 change (∀ j, 3 ≤ j → j ≤ 3*q+6 → 0 < vEM115 a b c d e q j) at hp
 change CrossLC f
 apply crossLC_two_prefixM115 f (3*q+6) (by omega)
 · intro k hk
   have he : vEM115 a b c d e q k=0 := by
     rcases hk with hk|hk
     · exact vE_zeroM115 _ _ _ _ _ _ _ (by omega) (by omega)
     · rw [vE_pastM115 _ _ _ _ _ _ _ (by omega) (by omega),v3pastM115]
   have hh := hs k
   rw [he] at hh
   norm_num only [Int.cast_zero] at hh
   linarith
 · intro k
   by_cases hk : k < 0
   · simp [f,CoeffSeq,hk]
   · lift k to ℕ using (show 0 ≤ k by omega)
     simp only [f,coeffSeq_nat774,Polynomial.coeff_map,Int.coe_castRingHom]
     exact_mod_cast vThirdSeed_nonnegMEA n rest ha k
 · intro k hk hl
   have hh : (0:ℝ) < (vEM115 a b c d e q k:ℝ) := by exact_mod_cast hp k hk hl
   rw [←hs] at hh
   linarith
 · intro k
   have hh : (vEM115 a b c d e q (k-1):ℝ)*vEM115 a b c d e q (k+1) ≤
     (vEM115 a b c d e q k:ℝ)^2 := by exact_mod_cast hg k
   rw [←hs,←hs,←hs] at hh
   nlinarith only [hh]

theorem vertical_third_of_boundsM03 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b)
 (hb : vAllBoundsM115 (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ)) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA n rest ha (vThird_seed_cross_of_boundsM03 n rest ha hb) j

end
end MathGKM.Markov
