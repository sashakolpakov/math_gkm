"""Machine-authored c3e5369f. Third-row exact source diagnostic; not a proof."""
from pathlib import Path
from source_experiment_c3e5369f import C,L
from three_probe_9e205206 import frame
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-c3e5369f')
def run():
 start=time.monotonic();out={'status':'finite experiment only','q_values':[5,6,7,10,16,24],
  'coefficients':0,'triples':0,'zeros':0,'edge_checks':0,'failures':[],'edges':[]}
 for q in out['q_values']:
  for r in [False,True]:
   d=q-(6 if r else 5)
   if d<0:continue
   a,n,p=frame([False]*(q-1)+[True,r]);j=q+3
   c0=96 if r else 72;c1=44*q-108 if r else 28*q-44;c2=4*(q-1)*(q-2) if r else 2*q*(q-1)
   vals=[]
   for i in range(n+7):
    v=p.get((i,j),0);vals.append(v);out['coefficients']+=1;out['zeros']+=v==0
    pred=L(d,j,i-3)+c0*C(d,i-2)+c1*C(d,i-3)+c2*C(d,i-4)
    if pred!=v:out['failures'].append(['formula',q,r,i,pred,v])
   for i in range(len(vals)-2):
    out['triples']+=1
    if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['lc',q,r,i,vals[i:i+3]])
   out['edge_checks']+=1
   e={'q':q,'residue':r,'d':d,'j':j,'i':d+4,'actual':p.get((d+4,j),0),
    'lower':L(d,j,d+1),'extra':c2,'single_slot_weight':C(d,d+1)}
   out['edges'].append(e)
   assert e['actual']-e['lower']==c2>0 and e['single_slot_weight']==0
 out['seconds']=time.monotonic()-start
 (O/'third-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='edges'}))
if __name__=='__main__':run()
