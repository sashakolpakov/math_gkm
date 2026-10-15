"""Machine-authored source transports and exact residual equivalence."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
for n,w in [(2,'Two'),(3,'Three')]:
 s=(R/'research/MarkovFourthOneSourceBE.lean').read_text().split('theorem source_fourth_oneBE')[0]
 s=s.replace('import MarkovFourthOneSmallPolyBE','\n'.join(f'import MarkovFourthShort{n}{c}{r}K062' for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]))
 for k in range(6):s=s.replace(f'import MarkovFourthOne{k}BE',f'import MarkovFourth{w}{k}K062')
 s=s.replace('Machine-authored be5676f9. Entire fourth lower diagonal through slope 2/3.',f'Machine-authored 062809ba. Entire fourth lower diagonal for run {n}.')
 for old,new in [('source_fourth_one',f'source_fourth_{w.lower()}'),('fourth_one',f'fourth_{w.lower()}'),('fourthOneSeq',f'fourth{w}Seq')]:
  import re
  s=re.sub(old+r'(\w*?)BE',lambda m:new+m[1]+'K062',s)
 s=s.replace('true::false::rest',f'List.replicate {n} true++false::rest')
 s=s.replace('fourthExplicitRunBE 1',f'fourthExplicitRunBE {n}').replace('source_fourth_explicit_rawBE 1',f'source_fourth_explicit_rawBE {n}').replace('List.replicate 1 true',f'List.replicate {n} true')
 s+=f'''theorem source_fourth_{w.lower()}K062 (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate {n} true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate {n} true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate {n} true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate {n} true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hc : 5≤(frame rest).mid.b
 · exact source_fourth_{w.lower()}_largeK062 rest hc i j hs
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have hn : ¬((frame rest).mid.a=2 ∧ (frame rest).mid.b=4) := by
   rintro ⟨ha,hb⟩
   rw [ha,hb] at hcop
   norm_num at hcop
 have hcases : ((frame rest).mid.b=2 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=3 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=3 ∧ (frame rest).mid.a=2) ∨
   ((frame rest).mid.b=4 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=4 ∧ (frame rest).mid.a=3) := by omega
 rcases hcases with ⟨hb,ha⟩|⟨hb,ha⟩|⟨hb,ha⟩|⟨hb,ha⟩|⟨hb,ha⟩
'''
 for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:s+=f' · exact source_fourth_short{n}{c}{r}K062 rest hb ha i j hs\n'
 s+='end\nend MathGKM.Markov\n'
 (R/f'research/MarkovFourth{w}SourceK062.lean').write_text(s)
s='''import MarkovFourthTwoSourceK062
import MarkovFourthThreeSourceK062
import MarkovResidualBE
/-! Machine-authored 062809ba. Fourth lower diagonal through slope 4/5. -/
namespace MathGKM.Markov
noncomputable section
theorem source_fourth_lower_four_fifthsK062 (path : List Bool) (i j : ℕ)
 (hratio : 5*(frame path).mid.a≤4*(frame path).mid.b)
 (hs : i+j+2=(frame path).mid.a+4)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   rw [(right_labels650 n).1,(right_labels650 n).2] at h0 h1 h2
   exact right_raw_diagonal0618 n i j h0 h1 h2
 · subst path
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hc,_⟩ := frame_reduced rest
   have hn : n≤3 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 4≤n by omega)
     simp only [Nat.mul_add,Nat.mul_one] at ha hb hm
     omega
   interval_cases n
   · simpa using source_false_fourth897 rest i j hs h0
   · simpa using source_fourth_oneBE rest i j hs h0
   · exact source_fourth_twoK062 rest i j hs
   · exact source_fourth_threeK062 rest i j hs
'''
old=(R/'research/MarkovResidualBE.lean').read_text()
rest=old[old.index('def InteriorCore63BE'):]
rest=rest.replace('InteriorCore63BE','InteriorCore63K062').replace('root_iff_coreBE','root_iff_coreK062').replace('root_iff_core897','root_iff_coreBE').replace('2*m.b < 3*m.a','4*m.b < 5*m.a').replace('3*(frame path).mid.a≤2*(frame path).mid.b','5*(frame path).mid.a≤4*(frame path).mid.b').replace('source_fourth_lower_two_thirdsBE','source_fourth_lower_four_fifthsK062')
s+=rest
(R/'research/MarkovResidualK062.lean').write_text(s)
print('Generated run-two/run-three source transports, slope-4/5 theorem and root equivalence.')
