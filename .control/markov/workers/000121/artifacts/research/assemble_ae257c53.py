"""Machine-authored candidate assemblies. Compilation status is recorded separately."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovThirdAllSourceBoundsM03.lean').read_text().replace('M03','MAE2')
s=s.replace('MarkovThirdAlllow_0_4MAE2','MarkovThirdAlllow_0_4M03').replace('vAllchart_low_0_4MAE2','vAllchart_low_0_4M03')
(R/'research/MarkovThirdAllSourceBoundsMAE2.lean').write_text(s)
low=s[:s.index('theorem vAllnat_midlow_0_4')]
low='\n'.join(z for z in low.splitlines() if not z.startswith('import MarkovThirdAllmid') and not z.startswith('import MarkovThirdAllhigh'))+'\n'
low+='''theorem vAllbounds_lowMAE2 (a b : ℕ) (ha : 1≤a) (hb : 7≤b) (hc : 3*a≤b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 let x := a-1
 let y := b-3*a
 have ea : a=x+1 := by dsimp [x]; omega
 have eb : b=3*(x+1)+y := by dsimp [x,y]; omega
 have eq : 2*a-b=0 := by omega
 have et : min (b-a) (3*a-b)=0 := by omega
 have eu : 3*a-2*b=0 := by omega
 have h := vAllnat_lowMAE2 x y (by omega)
 rw [eq,et,eu,ea,eb]
 push_cast
 exact h
end
end MathGKM.Markov
'''
(R/'research/MarkovThirdLowBoundsMAE2.lean').write_text(low)
s=(R/'research/MarkovThirdLowSourceM03.lean').read_text()
s=s.replace('import MarkovThirdAlllow_0_4M03','import MarkovThirdLowBoundsMAE2')
s=s[:s.index('theorem vAllbounds_lowM03')]+s[s.index('theorem vThird_seed_cross_lowM03'):]
for n in ['vThird_seed_cross_low','vertical_third_all_run_low','vertical_third_remainder','vertical_third_region','vAllbounds_low']:
 s=s.replace(n+'M03',n+'MAE2')
s=s.replace('3*(frame rest).mid.a+4','3*(frame rest).mid.a').replace('2*(frame path).mid.a+4','2*(frame path).mid.a')
s=s.replace('(frame_reduced rest).1 hc','(frame_reduced rest).1 ha hc')
(R/'research/MarkovThirdLowSourceMAE2.lean').write_text(s)
s=(R/'research/MarkovResidualLowM03.lean').read_text().replace('LowM03','LowMAE2').replace('LowSourceM03','LowSourceMAE2').replace('vertical_third_regionM03','vertical_third_regionMAE2')
s=s.replace('2*m.a+4','2*m.a').replace('2*(frame path).mid.a+4','2*(frame path).mid.a')
(R/'research/MarkovResidualLowMAE2.lean').write_text(s)
s='''import MarkovThirdAllSourceBoundsMAE2
import MarkovThirdBoundsTransportM03
/-! Machine-authored ae257c53. Universal third-column result for a>=7. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
attribute [local irreducible] frame

theorem vThird_seed_crossMAE2 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))) := by
 exact vThird_seed_cross_of_boundsM03 n rest ha
   (vAllboundsMAE2 _ _ (frame_reduced rest).1 ha (frame_reduced rest).2.1)

theorem vertical_third_all_runMAE2 (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA n rest ha (vThird_seed_crossMAE2 n rest ha) j

theorem vertical_third_largeMAE2 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have hi := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   exact vertical_third_all_runMAE2 n rest (by omega) j
end
end MathGKM.Markov
'''
(R/'research/MarkovThirdAllLCMAE2.lean').write_text(s)
(R/'research/MarkovResidualMAE2.lean').write_text((R/'research/MarkovResidualM03.lean').read_text().replace('M03','MAE2'))
print('Generated source and residual candidates; not claimed proved.')
