"""Machine-authored staged matrix expansions after bounded-build timeouts."""
from pathlib import Path
from experiment_be5676f9 import mm
from fourth_probe_01f51d63 import C,Y,P
R=Path('/Users/sasha/math_gkm')
def mat(m):
 parts=[]
 for entry in m:
  terms=[]
  for d in sorted(set(k[0] for k in entry)):
   inn=[]
   for (i,j,k),v in sorted(entry.items()):
    if i!=d:continue
    assert not j and v.denominator==1
    inn.append(str(int(v))+('*X'+('^'+str(k) if k>1 else '') if k else ''))
   terms.append((f'U^{d}*' if d else '')+'C ('+' + '.join(inn)+')')
  parts.append('+'.join(terms) or '0')
 return '⟨'+','.join(parts)+'⟩'
s='''import MarkovFourthRunMomentBE
/-! Machine-authored 062809ba. Staged block expansion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
'''
m=(C*Y,C,C*Y,1+C);b=(Y+C*Y*(1+Y),C*(1+Y),2*Y+C*Y*(1+Y),1+C*(1+Y))
for n in range(5):
 s+=f'theorem lower{n}K062 : lowerMatrix487 {n}={mat(m)} := by\n'
 if n:s+=f' rw [lowerMatrix_step487 {n-1},lower{n-1}K062]\n'
 s+=' apply Mat16.ext <;> norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V] <;> ring\n'
 m=mm(m,b)
s+='end\nend MathGKM.Markov\n'
(R/'research/MarkovFourthLowerK062.lean').write_text(s)
p=R/'research/MarkovFourthGauge3K062.lean';s=p.read_text().replace('import MarkovFourthRunMomentBE','import MarkovFourthLowerK062')
s=s.replace('lowerMatrix487,lowerRun487,','lower3K062,lower4K062,')
p.write_text(s)
# Each expansion must transport the natural truncated pair count into the polynomial ring.
for w in ['Two','Three']:
 for z in range(6):
  p=R/f'research/MarkovFourth{w}{z}K062.lean'
  # Chamber 1 run two is currently compiling; defer that one to the next repair call.
  if w=='Two' and z==1:continue
  s=p.read_text();start=s.index('theorem fourth_'+w.lower()+'_expand_')
  a=s[:start];b=s[start:]
  expr='0' if z<3 else '2*(r:ℤ)-(c:ℤ)'
  b=b.replace(' unfold fourthExplicitRunBE',f' have hqp : ((2*r-c:ℕ):ℤ[X])=C ({expr}) := by\n   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi\n unfold fourthExplicitRunBE')
  b=b.replace('if_neg hc2,hqi,hti,hui','if_neg hc2,hqp,hqi,hti,hui')
  p.write_text(a+b)
print('Staged matrix proof and truncated-count cast transport written.')
