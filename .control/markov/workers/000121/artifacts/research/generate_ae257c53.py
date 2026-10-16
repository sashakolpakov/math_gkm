"""Machine-authored fresh cubic certificates. Existing artifacts are read only."""
from pathlib import Path
import json,re,sys
from generate_all_lc_1152282d import charts
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ae257c53'

def make_separator():
 s=(R/'research/separate_03d5764d.py').read_text()
 s=s.replace('M03','MAE2').replace('cubicMAE2','cubicM03').replace('cubic_lcMAE2','cubic_lcM03').replace('MarkovCubicCertificateMAE2','MarkovCubicCertificateM03')
 s=s.replace("oldmod=f'MarkovThirdAll{cname}_{ci}_{cj}Part{i}MAE2'","oldmod=f'MarkovThirdAll{cname}_{ci}_{cj}Part{i}M03'")
 s=s.replace("import re\n","import re\nO=R/'evidence/markov-ae257c53'\n")
 # The mathematical theorem header is inherited; rename its tag too.
 s=s.replace("old=(R/f'research/{oldmod}.lean').read_text()","old=(R/f'research/{oldmod}.lean').read_text().replace('M03','MAE2')")
 (R/'research/separate_ae257c53.py').write_text(s)

def generate(ns):
 from separate_ae257c53 import separate
 plan={}
 for n in ns:
  cname,ci,cj,_=charts[n];base=f'MarkovThirdAll{cname}_{ci}_{cj}'
  levels=[[],[],[],[]]
  for i in range(20):
   mod=f'{base}Part{i}MAE2'
   src=(R/f'research/{base}Part{i}M03.lean').read_text().replace('M03','MAE2')
   if i in (9,14):
    separate(n,i)
    sep=f'MarkovThirdSep{n}I{i}MAE2'
    levels[0].append(sep+'Defs')
    levels[1]+=[sep+f'E{j}' for j in range(3)]+[sep+f'G{j}' for j in range(4)]
    levels[2].append(sep+'Final')
    header=src[src.index('namespace '):src.index(' := by')]
    src=f'import {sep}Final\n'+header+' := by\n exact sSep'+str(n)+'I'+str(i)+'FinalMAE2 x y u v hx hy hu hv\nend\nend MathGKM.Markov\n'
    levels[3].append(mod)
   else:levels[0].append(mod)
   (R/f'research/{mod}.lean').write_text(src)
  mod=base+'MAE2'
  (R/f'research/{mod}.lean').write_text((R/f'research/{base}M03.lean').read_text().replace('M03','MAE2'))
  levels.append([mod]);plan[str(n)]=levels
 (O/'generated-plan.json').write_text(json.dumps(plan,indent=2)+'\n')
 print('Generated charts',ns,flush=True)

if __name__=='__main__':
 make_separator()
 generate([int(n) for n in sys.argv[1:]])
