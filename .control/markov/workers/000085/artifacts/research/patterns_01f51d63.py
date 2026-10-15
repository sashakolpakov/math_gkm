"""Machine-authored reproduction of the exact cyclic-pattern experiment."""
from fourth_probe_01f51d63 import *
def counts(c,r):
 w=[(i+1)*r//c-i*r//c for i in range(c)]
 return [sum(all(w[(i+j)%c] for j in S) for i in range(c))
         for S in [(0,3),(0,1,3),(0,2,3),(0,1,2,3)]]
def main():
 data=json.loads((OUT/'fourth-low-probe.json').read_text());out=[]
 for z,ch in enumerate(data['chambers']):
  (c1,r1),(c2,r2)=ch['samples'];v1=counts(c1,r1);v2=counts(c2,r2);det=c1*r2-c2*r1
  co=[[(r2*a-r1*b)//det,(c1*b-c2*a)//det] for a,b in zip(v1,v2)]
  failures=[];n=0
  for c in range(5,121):
   for r in range(1,c):
    if gcd(c,r)>1:continue
    p,q=ch['left'];s,t=ch['right']
    if not (p*c<q*r and t*r<s*c):continue
    n+=1
    if counts(c,r)!=[a*c+b*r for a,b in co]:failures.append([c,r])
  out.append(dict(chamber=z,coefficients_c_r=co,checks=n,failures=failures))
 return dict(status='Finite exact inference only, not a universal source-count theorem',
  patterns=[[0,3],[0,1,3],[0,2,3],[0,1,2,3]],results=out)
if __name__=='__main__':
 actual=main();saved=json.loads((OUT/'fourth-new-patterns.json').read_text())
 assert actual==saved
 print(json.dumps(dict(reproduced=True,checks=sum(x['checks'] for x in actual['results']))))
