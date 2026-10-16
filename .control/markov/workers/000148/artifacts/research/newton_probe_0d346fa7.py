"""Machine-authored finite exact symbolic interpolation probes, not Lean proofs."""
from pathlib import Path
from math import comb
import json,time
O=Path('evidence/markov-0d346fa7')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def lower(j,d,i):return sum(C(2*d,h)*C(2*i-2-h,i)*(C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h)) for h in range(i-1))
def upper(N,d,i):return sum(C(2*d+h-1,h)*C(2*i-2-h,i-h)*(C(N+i-h+1,2*i-1-h)+C(N+i-h,2*i-1-h)) for h in range(i+1))
def diffs(v):
 a=[]
 while v:a.append(v[0]);v=[y-x for x,y in zip(v,v[1:])]
 return a
def newton(fn,dx,dy):
 rows=[diffs([fn(x,y) for y in range(dy+1)]) for x in range(dx+1)]
 cols=[diffs([rows[x][y] for x in range(dx+1)]) for y in range(dy+1)]
 return {(x,y):cols[y][x] for x in range(dx+1) for y in range(dy+1) if cols[y][x]}
def main():
 out={'status':'exact finite polynomial certificate search; not a universal theorem','cases':[]}
 for i in range(2,13):
  for region in ['lower','upper']:
   for shift in ([0,i-2,2*i] if region=='lower' else [0]):
    if region=='lower':
     def fn(x,y):
      j=x+shift;d=y+2
      return lower(j+1,d-1,i)**2-lower(j,d,i)*lower(j+2,d-2,i)
    else:
     def fn(x,y):
      N=x+i-2;d=y+1
      return upper(N+1,d+1,i)**2-upper(N+2,d,i)*upper(N,d+2,i)
    co=newton(fn,4*i+2,2*i+2)
    neg=[[*k,v] for k,v in co.items() if v<0]
    out['cases'].append({'i':i,'region':region,'shift':shift,'terms':len(co),'negative_count':len(neg),'negative_first':neg[:5],'nonzero_degrees':[max((k[t] for k in co),default=0) for t in range(2)]})
    if i<=5:(O/f'newton-{region}-i{i}-s{shift}.json').write_text(json.dumps([[*k,v] for k,v in co.items()],indent=2)+'\n')
  (O/'newton-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
