"""Machine-authored transports from the actual recurrence family, with exact hypotheses."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
head='/-! Machine-authored request 722898f8. Exact middle source bridge; original coefficients retained. -/\nnamespace MathGKM.Markov\nnoncomputable section\nattribute [local irreducible] frame coeff middleShape0M722 middleShape3M722\nset_option maxHeartbeats 4000000\n'
end='end\nend MathGKM.Markov\n'
s='import MarkovMiddleLCM722\n'+''.join(f'import MarkovMiddleShapeEq{ch}M722\n' for ch in range(6))+head
s+='''
theorem source_fourth_middle_canonicalM722 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleRawValueM722 n (frame rest).mid.b (frame rest).mid.a j := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
'''
conds=['4*(frame rest).mid.a<(frame rest).mid.b','3*(frame rest).mid.a<(frame rest).mid.b','2*(frame rest).mid.a<(frame rest).mid.b','3*(frame rest).mid.a<2*(frame rest).mid.b','4*(frame rest).mid.a<3*(frame rest).mid.b']
for ch in range(6):
 if ch<5:s+=f' by_cases h{ch} : {conds[ch]}\n'
 s+=f' · have h := source_fourth_middle_value{ch}M00 n rest hc (by omega) (by omega) i j hj hju hs\n   rw [middle_shape{ch}M722] at h\n   unfold middleRawValueM722\n'
 s+=('   rw [if_pos (by omega)]\n' if ch<3 else '   rw [if_neg (by omega)]\n')+'   exact h\n'
s+='''
theorem source_fourth_middleM722 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h := middleRawValue_lcM722 (n:ℤ) ((frame rest).mid.b:ℤ)
   ((frame rest).mid.a:ℤ) (j:ℤ) (by omega) (by omega) (by omega) (by omega)
   (by omega) (by omega)
 have h0 := source_fourth_middle_canonicalM722 n rest hc (i+2) j hj (by omega) (by omega)
 have h1 := source_fourth_middle_canonicalM722 n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_middle_canonicalM722 n rest hc i (j+2) (by omega) (by omega) (by omega)
 norm_num only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
'''
(R/'MarkovMiddleSourceM722.lean').write_text(s+end)
