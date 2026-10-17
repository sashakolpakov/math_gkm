"""Machine-authored unshifted-ratio experiment, no universal conclusion."""
from convolution_probe_09fffb56 import C,conv,O
from fractions import Fraction as F
import json,random,time
def run():
 start=time.monotonic();out=dict(status='finite exact experiment, not proof',q_ratio_checks=0,q_ratio_failures=[],generic_counterexample=None)
 for j in list(range(1,101))+[150,200]:
  for s in list(range(21))+[50,100,1000]:
   a,b,c=[[(1 if i==j else 4*(j-i))*C(s+t+i+3,i) for i in range(j+1)] for t in range(3)]
   ac=conv(a,c);bb=conv(b,b)
   for n in range(2*j):
    out['q_ratio_checks']+=1
    if bb[n+1]*ac[n]<bb[n]*ac[n+1]:out['q_ratio_failures'].append([j,s,n])
 w=list(map(F,['1','19/2','323/4','323/3','323/3','323/3','1615/18','190/3','950/27','475/27','1900/351','475/351','25/117']))
 assert all(w[i]**2>=w[i-1]*w[i+1] for i in range(1,len(w)-1))
 s=3;n=6
 a,b,c=[[w[i]*C(s+t+i+3,i) for i in range(len(w))] for t in range(3)]
 ac=conv(a,c);bb=conv(b,b);gap=bb[n+1]*ac[n]-bb[n]*ac[n+1]
 assert gap<0
 out['generic_counterexample']=dict(weights=list(map(str,w)),s=s,n=n,weights_log_concave=True,ratio_step_gap=str(gap),scope='Auxiliary generalization only; these weights are not identified with the source family.')
 out['seconds']=time.monotonic()-start
 (O/'q-ratio-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
