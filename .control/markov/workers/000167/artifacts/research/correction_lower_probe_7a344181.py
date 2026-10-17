"""Machine-authored 7a344181. Test the inherited LOWER-cut convention on the revised correction kernel, not proof."""
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-7a344181')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(j,t):
 return [C(2*t-k+3,t-k)*(C(t+j+3,2*t-k+3)+4*C(t+j+4,2*t-k+5)) for k in range(t+1)]
def mul(a,b):
 out=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for k,y in enumerate(b):out[i+k]+=x*y
 return out
def main():
 t0=time.monotonic();out={'status':'finite auxiliary experiment, not a source refutation','ranges':{'j':[3,30],'t':[0,35],'c':[4,8]},'cut_coefficients':0,'failures':[]}
 for c in [4,8]:
  for j in range(3,31):
   for t in range(36):
    seqs=[[c] if k==0 else L(j,k-1)+[c] for k in [t,t+1,t+2]]
    for h in range(t+4):
     a,b,d=[[a if k>=h else 0 for k,a in enumerate(v)] for v in seqs];aa=mul(a,d);bb=mul(b,b)
     for k in range(max(len(aa),len(bb))):
      gap=(bb[k] if k<len(bb) else 0)-(aa[k] if k<len(aa) else 0)
      out['cut_coefficients']+=1
      if gap<0 and len(out['failures'])<30:out['failures'].append({'j':j,'t':t,'c':c,'h':h,'k':k,'gap':gap,'seqs':seqs})
 out['seconds']=time.monotonic()-t0
 (O/'correction-lower-kernel-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({**out,'failures':out['failures'][:3]}))
if __name__=='__main__':main()
