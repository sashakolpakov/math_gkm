"""Machine-authored exhaustive cone certificates for the fourth-row seed."""
from horizontal_fourth_5110b3fa import *
X,Y=var(0),var(1)
# a=alpha*x+beta*y; b=gamma*x+delta*y; unimodular adjacent Farey cones.
cones=[('low',1,0,4,1),('quarter',1,1,4,3),('third',1,1,3,2),('half',2,1,3,2),('twothirds',2,3,3,4),('high',3,1,4,1)]
def valid(c,i,j):
 _,al,be,ga,de=c;A=al*i+be*j;B=ga*i+de*j
 return A>=3 and B>=9 and A<B
charts=[]
for cone in cones:
 name,al,be,ga,de=cone
 for i in range(12):
  for j in range(12):
   if not valid(cone,i,j) or (i and valid(cone,i-1,j)) or (j and valid(cone,i,j-1)):continue
   xx=X+i;yy=Y+j;A=al*xx+be*yy;B=ga*xx+de*yy
   Qq=poly(0) if name in ('low','quarter','third') else 2*A-B
   T=poly(0) if name in ('low','quarter') else 3*A-B if name=='third' else B-A
   U=poly(0) if name not in ('twothirds','high') else 3*A-2*B
   V=4*A-B if name=='quarter' else B-2*A if name=='third' else poly(0)
   W=2*A-B if name=='half' else B-A if name in ('twothirds','high') else poly(0)
   Z=4*A-3*B if name=='high' else poly(0)
   vals=[A,B,Qq,T,U,V,W,Z,poly(1),poly(1)]
   cc=[c.subst(vals) for c in cs];gg=[cc[k+1]**2-cc[k]*cc[k+2] for k in range(6)]
   neg=[(k,terms(P({e:c for e,c in pp.items() if c<0}))) for k,pp in enumerate(cc+gg) if any(c<0 for c in pp.values())]
   charts.append(dict(name=name,i=i,j=j,args=vals[:8],negative=neg,constants=[str(c.get((0,)*10,0)) for c in cc],terms=[len(pp) for pp in cc+gg]))
if __name__=='__main__':
 (O/'fourth-chart-candidates.json').write_text(json.dumps([{**d,'args':[terms(v) for v in d['args']]} for d in charts],indent=2)+'\n')
 print(json.dumps(dict(charts=len(charts),negative=[{k:v for k,v in d.items() if k!='args'} for d in charts if d['negative']],constants=[(d['name'],d['i'],d['j'],d['constants']) for d in charts])))
