"""Machine-authored polynomial certificates for the candidate third horizontal seed."""
from horizontal_third_13d40bd7 import *
X,Y=var(0),var(1)
cs=[P({tuple(0 if k==5 else z for k,z in enumerate(e)):v for e,v in Q.items() if e[5]==j}) for j in range(6)]
charts=[]
for i,j in [(0,1),(1,0)]:
 A=2+X+i;B=3*A+Y+j;charts.append(('low',i,j,A,B,poly(0),poly(0),poly(0)))
for i,j in [(0,4),(1,2),(2,1),(3,0)]:
 xx=X+i;yy=Y+j
 charts.append(('midlow',i,j,xx+yy,3*xx+2*yy,poly(0),yy,poly(0)))
 charts.append(('midhigh',i,j,2*xx+yy,3*xx+2*yy,xx,xx+yy,poly(0)))
for i,j in [(1,4),(2,1),(3,0)]:
 xx=X+i;yy=Y+j;charts.append(('high',i,j,2*xx+yy,3*xx+yy,xx+yy,xx,yy))
out=[]
for name,i,j,A,B,qq,tt,uu in charts:
 vals=[A,B,qq,tt,uu,poly(1),poly(1)]
 cc=[c.subst(vals) for c in cs]
 gaps=[cc[k+1]**2-cc[k]*cc[k+2] for k in range(4)]
 out.append(dict(chart=[name,i,j],coefficients=[terms(c) for c in cc],gaps=[terms(g) for g in gaps],negative=[(k,terms(P({e:v for e,v in g.items() if v<0}))) for k,g in enumerate(cc+gaps) if any(v<0 for v in g.values())]))
(O/'horizontal-third-certificates.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(charts=len(out),negative=[d['chart']+d['negative'] for d in out if d['negative']])))
