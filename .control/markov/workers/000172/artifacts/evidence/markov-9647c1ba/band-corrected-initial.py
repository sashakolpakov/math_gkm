"""Machine-authored 9647c1ba. Wider correction-band representation experiment.
No divisibility, positivity, budget, or source transport is asserted universally.
"""
from source_experiment_9647c1ba import C,L,lift,frame,F,O
import json,time
def trim(a):
 while a and a[-1]==0:a.pop()
 return a
def divide_one(a):
 if not a:return [],0
 b=[];prev=0
 for v in a[:-1]:prev=v-prev;b.append(prev)
 return trim(b),a[-1]-prev
def run():
 start=time.monotonic();out={'status':'finite exact experiment only','q_values':[8,10,12,16,20,24,32,40],
 'rows':0,'coefficient_comparisons':0,'budget_checks':0,'scalar_pass':0,'scalar_fail':0,
 'division_failures':[],'negative_coefficients':[],'degree_failures':[],'constant_failures':[],
 'budget_failures':[],'first_scalar_failures':[],'samples':[]}
 for q in out['q_values']:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);N=3*q+(1 if r else 2)
   for k in range(1,(N-1)//2-q+1):
    j=q+k;d=N-2*j-1
    residual=trim([p.get((i,j),0)-L(d,j,i-3) for i in range(N+4)])
    assert all(v==0 for v in residual[:2]);h=residual[2:]
    for z in range(d):
     h,rem=divide_one(h)
     if rem:out['division_failures'].append([q,r,k,z,rem]);break
    out['rows']+=1;out['coefficient_comparisons']+=len(residual)
    if any(v<0 for v in h):out['negative_coefficients'].append([q,r,k,h])
    if len(h)>k:out['degree_failures'].append([q,r,k,len(h)])
    c0=2*k*(k+1)**2 if r else 2*k*k*(k+1)
    if not h or h[0]!=c0:out['constant_failures'].append([q,r,k,h[:1],c0])
    if k<=6:out['samples'].append({'q':q,'r':r,'k':k,'d':d,'coefficients':h})
    if len(h)<2:continue
    for m in range(1,len(h)):
     out['budget_checks']+=1
     if h[m]>h[1]*C(j,m-1):out['budget_failures'].append([q,r,k,m,h[m],h[1]*C(j,m-1)])
    for s in range(max(1,k-1),d+k-1):
     U=F(h[0]*d,s+1)+h[1];B=C(s+j+3,j)
     M=lift(j,s+1,0)**2;N0=C(s+1+j+3,j)**2-B*C(s+2+j+3,j)
     if (2*B*U+U**2)*M<=B**2*N0:out['scalar_pass']+=1
     else:
      out['scalar_fail']+=1
      if len(out['first_scalar_failures'])<20:out['first_scalar_failures'].append([q,r,k,s])
  (O/'band-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'band-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='samples'}))
if __name__=='__main__':run()
