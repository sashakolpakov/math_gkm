"""A machine-selected stronger conjecture; no published attribution."""
import json
from pathlib import Path
records=json.loads(Path('evidence/markov/coefficients.json').read_text())
divfail=[]; neg=[]; lcfail=[]; factor4fail=[]; checked=0; critical=0
details=[]
for row in records:
    a,b=row['a'],row['b']; d=a+b-1
    p={(i,j):c for i,j,c in row['terms']}
    for (i,j),c in p.items():
        if i<a and j<b and b*i+a*j>a*b:
            critical+=1
            if c%4: factor4fail.append([a,b,i,j,c])
    for r in range(d+1):
        n=max(d-2*r,0)
        seq=[p.get((k,d-r-k),0) for k in range(d-r+1)]
        original=seq[:]
        for step in range(n):
            q=[]; previous=0
            for c in seq[:-1]:
                previous=c-previous; q.append(previous)
            if not seq or seq[-1]!=previous:
                divfail.append([a,b,r,step,seq]); break
            seq=q
        checked+=1
        if any(c<0 for c in seq): neg.append([a,b,r,seq])
        if any(seq[k]**2<seq[k-1]*seq[k+1] for k in range(1,len(seq)-1)):
            lcfail.append([a,b,r,seq,original])
        details.append([a,b,r,n,seq])
report={'diagonals':checked,'division_failures':divfail[:10],'negative_residuals_first10':neg[:10],
        'residual_lc_failures_first10':lcfail[:10],'total_residual_lc_failures':len(lcfail),
        'factor4_critical_points':critical,'factor4_failures':factor4fail}
Path('evidence/markov/residual-result.json').write_text(json.dumps(report,indent=2)+'\n')
Path('evidence/markov/residual-coefficients.json').write_text(json.dumps(details)+'\n')
print(json.dumps(report,indent=2))
