"""Machine-authored full small-run assembly and exact residual, subject to validation."""
from generate_small_38ebef17 import R,D,O,head,end,save
for n in range(4):
 s=''.join(f'import MarkovSmallLC{n}_{ch}M38E\n' for ch in range(6))+'import MarkovFourthFourCompleteM8B8\n'+head+'attribute [local irreducible] frame coeff\n'
 s+=f'''theorem source_fourth_run{n}M38E (rest : List Bool) (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate {n} true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate {n} true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate {n} true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate {n} true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_small_lc{n}_0M38E rest hc (by omega) (by omega) i j hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_small_lc{n}_1M38E rest hc (by omega) (by omega) i j hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_small_lc{n}_2M38E rest hc (by omega) (by omega) i j hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_small_lc{n}_3M38E rest hc (by omega) (by omega) i j hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_small_lc{n}_4M38E rest hc (by omega) (by omega) i j hs
 · exact source_small_lc{n}_5M38E rest hc (by omega) (by omega) i j hs

theorem run_fourth_{n}M38E (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 {n} rest := by
 intro i j _ _ _ hs
 exact source_fourth_run{n}M38E rest hc i j hs
'''
 save(f'MarkovSmallRun{n}M38E',s+end)
s=''.join(f'import MarkovSmallRun{n}M38E\n' for n in range(4))+head+'''theorem run_fourth_allM38E (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 by_cases hn : 4≤n
 · exact run_fourth_ge_fourM8B8 n rest hn hc
 · have hnu : n≤3 := by omega
   interval_cases n
   · exact run_fourth_0M38E rest hc
   · exact run_fourth_1M38E rest hc
   · exact run_fourth_2M38E rest hc
   · exact run_fourth_3M38E rest hc
'''+end
save('MarkovFourthAllM38E',s)
s=(D/'MarkovResidualFourM38E.lean').read_text().replace('import MarkovFourthFourCompleteM8B8','import MarkovFourthAllM38E').replace('import MarkovOnsetWindowLCM8B8\n','')
s=s.replace('SolvedFourthRegionFourM38E','SolvedFourthRegionAllM38E').replace('InteriorCore63FourM38E','InteriorCore63AllM38E').replace('root_iff_coreFourM38E','root_iff_coreAllM38E')
a=s.index(' (∃ n rest,');b=s.index('\ndef InteriorCore',a)
s=s[:a]+''' ∃ n rest, path=List.replicate n true++false::rest ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4
'''+s[b:]
a=s.index('   · rcases he with he | he');b=s.index('   · exact hd',a)
s=s[:a]+'''   · obtain ⟨n,rest,hpath,hc,hdiag⟩ := he
     subst path
     exact run_fourth_allM38E n rest hc i j h0 h1 h2 hdiag
'''+s[b:]
save('MarkovResidualAllM38E',s)
print('Generated four small-run assemblies, all-run assembly, and exact residual.')
