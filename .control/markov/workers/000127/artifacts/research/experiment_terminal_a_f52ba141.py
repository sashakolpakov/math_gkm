"""Machine-authored exact check of a prospective terminal-A formula, not proof."""
from experiment_second_f52ba141 import *
def main():
 start=time.monotonic();ids=gaps=zeros=words=0
 cores=[w for n in range(3,11) for w in product([False,True],repeat=n)]
 rng=random.Random(52521421)
 cores += [tuple(rng.choice([False,True]) for _ in range(rng.randrange(11,65))) for _ in range(100)]
 for w in cores:
  n=len(w);m=sum(w);r=int(w[-1]);t=int(w[0])+2*sum(a and b for a,b in zip(w,w[1:]))
  assert 0<=t<=2*m-r
  q=[4*t,9*m*m+7*m+2-4*r,6*m*m+6*m*n+4*n,(m+n)*(m+n+1)]
  p=raw((False,)+w+(False,));words+=1
  for i in range(n+m+4):
   v=smooth(n,q,i-m+1)
   assert 2*p.get((i,2),0)==v,(w,i,v,p.get((i,2),0));ids+=1
   assert p.get((i+1,2),0)**2>=p.get((i,2),0)*p.get((i+2,2),0);gaps+=1
   zeros+=int(p.get((i+1,2),0)==0)
 out={'status':'Finite formula/LC tests only; terminal-A universal bridge not formalized','cores':words,'coefficient_identities':ids,'adjacent_comparisons':gaps,'zero_centers':zeros,'failures':[],'seconds':time.monotonic()-start}
 (O/'terminal-a-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
