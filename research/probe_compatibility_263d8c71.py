"""Machine-authored equal-count whole-word compatibility probe; not a proof."""
from experiment_terminal_263d8c71 import pair
from itertools import product,combinations_with_replacement
from pathlib import Path
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-263d8c71')
st=time.monotonic();counts={};fails={};examples={};pairs=0;zeros=0
for n in range(1,9):
 groups={}
 for w in product([0,1],repeat=n):
  for end in [0,1]:
   key=(sum(w),end); ww=(0,)+w+(end,)
   groups.setdefault(key,[]).append((ww,pair(ww)[1]))
 for (m,end),vs in groups.items():
  for (w,p),(z,q) in combinations_with_replacement(vs,2):
   pairs+=1;deg=max(i+j for i,j in p.keys()|q.keys())
   for j in range(deg+2):
    for i in range(deg+2-j):
     a,b,c=[p.get((i+k,j),0) for k in range(3)];d,e,f=[q.get((i+k,j),0) for k in range(3)]
     kind='terminal_'+str(end);g=2*b*e-a*f-c*d
     counts[kind]=counts.get(kind,0)+1;zeros+=int(0 in [a,b,c,d,e,f])
     if g<0:
      fails[kind]=fails.get(kind,0)+1
      if kind not in examples:examples[kind]={'words':[w,z],'i':i,'j':j,'triples':[[a,b,c],[d,e,f]],'mixed':g}
 if time.monotonic()-st>60:break
out={'status':'Finite exact same-count same-terminal whole-word pair test','max_core_length_completed':n,'word_pairs':pairs,'counts':counts,'failures':fails,'examples':examples,'zero_comparisons':zeros,'seconds':time.monotonic()-st}
(O/'compatibility-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
