from scan import generate,triples,polygon
from pathlib import Path
import json,time
start=time.monotonic()
counts={'fractions':0,'triples':0,'diagonals':0,'critical_points':0}
failures=[]; raw_equalities=[]; residual_examples=[]
for path,(a,b,p) in generate(28):
    counts['fractions']+=1
    d=a+b-1
    expected={(i,j) for i in range(d+1) for j in range(d+1-i) if polygon(a,b,i,j)}
    if set(p)!=expected or min(p.values())<=0: failures.append(['support',a,b])
    for direction,pts in triples(a,b):
        counts['triples']+=1
        x,y,z=[p.get(t,0) for t in pts]
        if y*y<x*z: failures.append(['raw',a,b,direction,pts,[x,y,z]])
        if y*y==x*z and len(raw_equalities)<10: raw_equalities.append([a,b,direction,pts,[x,y,z]])
    for (i,j),c in p.items():
        if i<a and j<b and b*i+a*j>a*b:
            counts['critical_points']+=1
            if c%4: failures.append(['factor4',a,b,i,j,c])
    for r in range(d+1):
        seq=[p.get((k,d-r-k),0) for k in range(d-r+1)]
        for step in range(max(d-2*r,0)):
            q=[]; previous=0
            for c in seq[:-1]:
                previous=c-previous;q.append(previous)
            if not seq or seq[-1]!=previous:
                failures.append(['division',a,b,r,step]);break
            seq=q
        counts['diagonals']+=1
        if min(seq,default=0)<0: failures.append(['negative_residual',a,b,r,seq])
        if any(seq[k]**2<seq[k-1]*seq[k+1] for k in range(1,len(seq)-1)):
            failures.append(['residual_LC',a,b,r,seq])
        if (a,b)==(17,28) and r<=5: residual_examples.append([r,seq])
report={'denominator_bound':28,'counts':counts,'failures':failures,'raw_equalities_first10':raw_equalities,'residuals_17_28_first6':residual_examples,'seconds':time.monotonic()-start,'status':'finite exact computation only'}
Path('evidence/markov/stress-result.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
