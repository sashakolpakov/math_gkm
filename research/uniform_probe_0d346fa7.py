"""Machine-authored exact finite Newton-coefficient probes in both directions.
This is not a proof for arbitrary i and creates no Lean assumption.
"""
from newton_probe_0d346fa7 import C,lower,upper,newton
from pathlib import Path
import json,time
O=Path('evidence/markov-0d346fa7')
def main():
 start=time.monotonic();out={'status':'finite exact interpolation probes only; uniform sign unproved','cases':[]}
 for dr in ['vertical','diagonal']:
  for i in range(2,25):
   for region in ['lower','upper','cross_one','cross_two']:
    def f(x,y):
     if region=='lower':
      j=x;d=y+2
      if dr=='vertical':return lower(j+1,d-1,i)**2-lower(j,d,i)*lower(j+2,d-2,i)
      return lower(j+1,d-1,i+1)**2-lower(j+2,d-2,i)*lower(j,d,i+2)
     if region=='upper':
      N=x+i-2;d=y+1
      if dr=='vertical':return upper(N+1,d+1,i)**2-upper(N+2,d,i)*upper(N,d+2,i)
      return upper(N+1,d+1,i+1)**2-upper(N,d+2,i)*upper(N+2,d,i+2)
     q=x+i-1 if region=='cross_one' else x+i
     if region=='cross_one':
      if dr=='vertical':return lower(q,0,i)**2-lower(q-1,1,i)*upper(q-1,1,i)
      return lower(q,0,i+1)**2-upper(q-1,1,i)*lower(q-1,1,i+2)
     if dr=='vertical':return upper(q-1,1,i)**2-lower(q,0,i)*upper(q-2,2,i)
     return upper(q-1,1,i+1)**2-upper(q-2,2,i)*lower(q,0,i+2)
    co=newton(f,4*i+6,2*i+4 if region in ['lower','upper'] else 0)
    neg=[[*k,v] for k,v in co.items() if v<0]
    case={'direction':dr,'i':i,'region':region,'nonzero_terms':len(co),'negative_count':len(neg),'negative_first':neg[:3]}
    out['cases'].append(case)
   out['seconds']=time.monotonic()-start
   (O/'uniform-probe-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['cases_with_negative_coefficients']=sum(bool(c['negative_count']) for c in out['cases'])
 (O/'uniform-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({'cases':len(out['cases']),'negative_cases':[c for c in out['cases'] if c['negative_count']],'seconds':out['seconds']}))
if __name__=='__main__':main()
