"""Machine-authored exact residual reduction for the proved numerator-one subfamily."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovFourthUpperM722.lean').read_text().replace('import MarkovMiddleSourceM722','import MarkovMiddleOneM5DC').replace('source_fourth_upperM722','source_fourth_upper_oneM5DC').replace('(hc : 5≤(frame rest).mid.b) (i j : ℕ)','(hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=1) (i j : ℕ)').replace('source_fourth_middleM722 n rest hc i j','source_fourth_middle_oneM5DC n rest hc hr i j')
p=R/'MarkovFourthUpperOneM5DC.lean';assert not p.exists();p.write_text(s)
s=(R/'MarkovFourthFiveM722.lean').read_text().replace('MarkovFourthUpperM722','MarkovFourthUpperOneM5DC').replace('RunFourthFiveM722','RunFourthFiveOneM5DC').replace('run_fourth_iff_fiveM722','run_fourth_iff_five_oneM5DC').replace('(hc : 5≤(frame rest).mid.b) :','(hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=1) :').replace('source_fourth_upperM722 n rest hn hc i j','source_fourth_upper_oneM5DC n rest hn hc hr i j')
p=R/'MarkovFourthFiveOneM5DC.lean';assert not p.exists();p.write_text(s)
s=(R/'MarkovResidualM722.lean').read_text()
s=s.replace('import MarkovResidualM94','import MarkovResidualM94\nimport MarkovResidualM722\nimport MarkovMiddleOneM5DC')
start=s.index('def FinalFourthRegionM722');end=s.index('\ndef InteriorCore63M722',start)
s=s[:start]+'''def MiddleFourthOneRegionM5DC (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧
  5≤(frame rest).mid.b ∧ (frame rest).mid.a=1 ∧ 2*n+6≤j ∧ j≤3*n ∧
  i+j+2=(frame path).mid.a+4
''' + s[end:]
s=s.replace('InteriorCore63M722','InteriorCore63OneM5DC').replace('theorem root_iff_coreM722','theorem root_iff_core_oneM5DC').replace('rw [root_iff_coreM94]','rw [root_iff_coreM722]')
s=s.replace('¬FinalFourthRegionM722 path i j →','¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j →')
s=s.replace('intro i j h0 h1 h2 ht hs hb hx hi hf _','intro i j h0 h1 h2 ht hs hb hx hi hf hfm _').replace('exact hd i j h0 h1 h2 ht hs hb hx hi hf\n','exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm\n')
s=s.replace('intro i j h0 h1 h2 ht hs hb hx hi hf\n','intro i j h0 h1 h2 ht hs hb hx hi hf hfm\n').replace('by_cases he : FinalFourthRegionM722 path i j','by_cases he : MiddleFourthOneRegionM5DC path i j').replace('⟨n,rest,hpath,hn,hc,hj,hju,hdiag⟩','⟨n,rest,hpath,hc,hr,hj,hju,hdiag⟩').replace('source_fourth_after_middleM722 n rest hn hc i j','source_fourth_middle_oneM5DC n rest hc hr i j').replace('exact hd i j h0 h1 h2 ht hs hb hx hi hf he','exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm he')
p=R/'MarkovResidualOneM5DC.lean';assert not p.exists();p.write_text(s)
# One build amortizes imports; internal module names are removed.
names=['MarkovFourthUpperOneM5DC','MarkovFourthFiveOneM5DC','MarkovResidualOneM5DC']
import re
imports=[];bodies=[]
for name in names:
 s=(R/f'{name}.lean').read_text()
 for imp in re.findall(r'^import (\S+)',s,re.M):
  if imp not in names and imp not in imports:imports.append(imp)
 bodies.append(re.sub(r'^import [^\n]+\n','',s,flags=re.M))
p=R/'MarkovResidualAssemblyM5DC.lean';assert not p.exists();p.write_text(''.join(f'import {imp}\n' for imp in imports)+'\n'.join(bodies))
