"""Machine-authored exact source-region assembly; Lean must check it."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovThirdAllLCM03.lean').read_text()
s=s.replace('import MarkovThirdAllSourceBoundsM03','import MarkovThirdAlllow_0_4M03\nimport MarkovThirdFirstRunsM115')
start=s.index('theorem vThird_seed_crossM115') if 'theorem vThird_seed_crossM115' in s else s.index('theorem vThird_seed_crossM03')
prefix=s[:start]
bound='''theorem vAllbounds_lowM03 (a b : ℕ) (ha : 1 ≤ a) (hb : 3*a+4 ≤ b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 let x := a-1
 let y := b-3*a-4
 have ea : a=1+x := by dsimp [x]; omega
 have eb : b=7+y+3*x := by dsimp [x,y]; omega
 have h := vAllchart_low_0_4M03 (x:ℤ) (y:ℤ) (by positivity) (by positivity)
 have h0 : 2*a-b=0 := by omega
 have h1 : min (b-a) (3*a-b)=0 := by omega
 have h2 : 3*a-2*b=0 := by omega
 rw [h0,h1,h2,ea,eb]
 push_cast
 exact h

'''
s=s[start:]
s=s.replace('vThird_seed_crossM03','vThird_seed_cross_lowM03').replace('vertical_third_all_runM03','vertical_third_all_run_lowM03')
s=s[:s.index('theorem vertical_third_largeM03')]
s=s.replace('(ha : 7 ≤ (frame rest).mid.b)', '(ha : 7 ≤ (frame rest).mid.b)\n (hc : 3*(frame rest).mid.a+4 ≤ (frame rest).mid.b)')
s=s.replace('have hb := vAllboundsM03 b a (frame_reduced rest).1 ha (frame_reduced rest).2.1','have hb := vAllbounds_lowM03 b a (frame_reduced rest).1 hc')
s=s.replace('(vThird_seed_cross_lowM03 n rest ha)', '(vThird_seed_cross_lowM03 n rest ha hc)')
s+='''theorem vertical_third_remainderM03 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a)
 (hr : 2*(frame path).mid.a+4 ≤ 3*((frame path).mid.b % (frame path).mid.a))
 (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have hi := (source_left_spine_indicesMDE6 n).1
   omega
 · obtain ⟨hi,hb⟩ := source_vertical_indicesMDE6 n rest
   have hp := frame_reduced rest
   have hm : (frame (List.replicate n false++true::rest)).mid.b %
       (frame (List.replicate n false++true::rest)).mid.a =
       (frame rest).mid.b-(frame rest).mid.a := by
     rw [hi,hb]
     simp only [Nat.add_mod,Nat.mul_mod_right,zero_add]
     exact Nat.mod_eq_of_lt (by omega)
   rw [hm,hi] at hr
   exact vertical_third_all_run_lowM03 n rest (by omega) (by omega) j

theorem vertical_third_regionM03 (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a)
 (hr : (frame path).mid.b < 5*(frame path).mid.a ∨
       2*(frame path).mid.a+4 ≤ 3*((frame path).mid.b % (frame path).mid.a))
 (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases hr with hr|hr
 · exact vertical_third_ratioM115 path ha hr j
 · exact vertical_third_remainderM03 path ha hr j
end
end MathGKM.Markov
'''
(R/'research/MarkovThirdLowSourceM03.lean').write_text(prefix+bound+s)
s=(R/'research/MarkovResidualM03.lean').read_text().replace('import MarkovThirdAllLCM03','import MarkovThirdLowSourceM03')
s=s.replace('InteriorCore63M03','InteriorCore63LowM03').replace('root_iff_interiorM03','root_iff_interiorLowM03')
s=s.replace('(i=3 → m.a ≤ 6)', '(i=3 → m.a ≤ 6 ∨ (5*m.a ≤ m.b ∧ 3*(m.b % m.a) < 2*m.a+4))')
s=s.replace('by_cases hx : i=3 ∧ 7 ≤ (frame path).mid.a','by_cases hx : i=3 ∧ 7 ≤ (frame path).mid.a ∧\n       ((frame path).mid.b < 5*(frame path).mid.a ∨\n        2*(frame path).mid.a+4 ≤ 3*((frame path).mid.b % (frame path).mid.a))')
s=s.replace('obtain ⟨rfl,hx⟩ := hx\n     exact vertical_third_largeM03 path hx j','obtain ⟨rfl,ha,hr⟩ := hx\n     exact vertical_third_regionM03 path ha hr j')
(R/'research/MarkovResidualLowM03.lean').write_text(s)
print('Created low-region source transport and exact residual candidates.')
