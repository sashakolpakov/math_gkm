"""Machine-authored specialization of exact source formulas; Lean checks all certificates."""
from pathlib import Path
from itertools import product
from experiment_be5676f9 import gauge
from fourth_probe_01f51d63 import P
R=Path('/Users/sasha/math_gkm')
def fmt(p):
 out=[]
 for (i,j,k),v in sorted(p.items()):
  assert not i and not j and v.denominator==1
  out.append(str(int(v))+('*X'+('^'+str(k) if k>1 else '') if k else ''))
 return ' + '.join(out) or '0'
for n,word in [(2,'Two'),(3,'Three')]:
 s='import MarkovFourthRunMomentBE\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 8000000\nset_option maxRecDepth 16384\n'
 for p,q in product(range(2),repeat=2):
  parts=[]
  for entry in gauge(n,p,q):
   terms=[]
   for d in sorted(set(k[0] for k in entry)):
    pol=P({(0,j,k):v for (i,j,k),v in entry.items() if i==d})
    terms.append((f'U^{d}*' if d else '')+'C ('+fmt(pol)+')')
   parts.append('+'.join(terms) or '0')
  s+=f'''theorem gauge{n}_{p}{q}K062 :
 runBooleanGaugeADB2 {n} {'true' if p else 'false'} {'true' if q else 'false'}=
 ⟨{','.join(parts)}⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
'''
 s+='end\nend MathGKM.Markov\n'
 (R/f'research/MarkovFourthGauge{n}K062.lean').write_text(s)
 # Reuse the recorded certificate generator with explicit source specializations.
 g=(R/'research/generate_one_be5676f9.py').read_text()
 g=g.replace("r['n']==1",f"r['n']=={n}")
 g=g.replace('BE','K062').replace('One',word).replace('one',word.lower())
 for name in ['MarkovFourthRunMoment','runLocalFour','fourMoment','fourTriple','fourQuad','fourCanonical','fourPotential','fourthExplicitRun']:
  g=g.replace(name+'K062',name+'BE')
 g=g.replace('import MarkovThird'+word+'Bridge8BBB\\nimport MarkovQuinticE273',f'import MarkovSmallPoly{n}FD\\nimport MarkovFourthGauge{n}K062')
 g=g.replace(f'{word.lower()}Gauge_formula_008BBB',f'gauge{n}_00K062').replace(f'{word.lower()}Gauge_formula_018BBB',f'gauge{n}_01K062').replace(f'{word.lower()}Gauge_formula_108BBB',f'gauge{n}_10K062').replace(f'{word.lower()}Gauge_formula_118BBB',f'gauge{n}_11K062')
 g=g.replace('runLocalFourBE 1',f'runLocalFourBE {n}').replace('fourthExplicitRunBE 1',f'fourthExplicitRunBE {n}')
 g=g.replace(f'rw [thirdRun_{word.lower()}_expand8BBB c r hc2,secondCompressed_{word.lower()}E273]',f'rw [small_poly{n}FD c r hc2]')
 a=g.index(' simp only [firstRunPolyADB2,lowerH487,')
 b=g.index(' norm_num [runSumA27,',a)
 defs=','.join(f'small{n}_{j}FD' for j in range(3*n+6))
 g=g[:a]+f''' simp only [firstRunPolyADB2,lowerH487,smallPoly{n}FD,{defs},
   secondCompressed446,runK_scalarBF,runDTwoBF,runCOneBF,runB446,runD446,
   if_neg hc2,hqi,hti,hui,{{moment}},{{pol}},{{seq}}]
'''+g[b:]
 # Names inside comments are provenance only; imports above retain original names.
 (R/f'research/generate_run{n}_062809ba.py').write_text(g)
 exec(compile(g,str(R/f'research/generate_run{n}_062809ba.py'),'exec'),{})
print('Generated runs two and three from retained exact symbolic certificates.')
