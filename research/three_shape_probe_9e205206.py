"""Machine-authored finite summation-shape tests, not mathematical proofs."""
from three_probe_9e205206 import *
def main():
 start=time.monotonic();F=[one,b]
 for n in range(15):F.append(add(mul(s,F[-1]),neg(mul(v,F[-2]))))
 out={'status':'finite exact experiments only','q_max':14,'checks':0,'first_failures':{}}
 for q in range(1,15):
  x,y=F[q+1],F[q]
  for r in [False,True]:
   terms=([power(x,3),mul(v,mul(x,power(y,2))),mul(mul(s,v),power(y,3))] if r else
          [mul(s,power(x,3)),mul(v,mul(power(x,2),y)),mul(power(v,2),power(y,3))])
   d=3*q+(3 if r else 4)
   for ax in range(3):
    for i in range(d+1):
     for j in range(d+1-i):
      pts=[(i,j),(i+1,j),(i+2,j)] if ax==0 else ([(i,j),(i,j+1),(i,j+2)] if ax==1 else [(i,j+2),(i+1,j+1),(i+2,j)])
      vals=[[p.get(pt,0) for pt in pts] for p in terms]
      for h in range(3):
       aa=vals[h];out['checks']+=1
       if aa[0]*aa[2]>aa[1]**2:
        key=f'individual/{r}/{ax}/{h}'
        out['first_failures'].setdefault(key,dict(q=q,points=pts,values=aa))
       for k in range(h+1,3):
        bb=vals[k];out['checks']+=1
        if aa[0]*bb[2]+bb[0]*aa[2]>2*aa[1]*bb[1]:
         key=f'mixed/{r}/{ax}/{h}/{k}'
         out['first_failures'].setdefault(key,dict(q=q,points=pts,values=[aa,bb]))
 out['seconds']=time.monotonic()-start
 (O/'three-shape-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
