"""Machine-authored exploratory scope tests. Deformations are not source witnesses."""
import math,itertools,json,pathlib,time,random
from type_refinement_a3c5 import refined,conv
from aggregate_a3c5 import core,poly
out=pathlib.Path('evidence/markov-77c26ca3')
def check(w,a,b,weights):
 pp=refined(w);rows={}
 for (i,j,q),v in pp.items():rows.setdefault((i,j),{})[q]=v
 count=0
 for i,j in rows:
  if (i+2,j) not in rows:continue
  s=i+j-a;N=b-1
  if not 0<=s or s+2>N:continue
  cs=[rows.get((i+h,j),{}) for h in range(3)]
  for t in weights:
   L,M,R=[sum(v*t**q for q,v in p.items()) for p in cs];count+=1
   gap=(s+1)*(N-s-1)*M*M-(s+2)*(N-s)*L*R
   if gap<0:return dict(word=w,a=a,b=b,i=i,j=j,s=s,N=N,t=t,coefficients=[L,M,R],gap=gap,refined=cs),count
 return None,count
def main():
 st=time.monotonic();count=0;fail={};objects=0
 for b in range(2,36):
  for a in range(1,b):
   if math.gcd(a,b)!=1:continue
   z,c=check(core(a,b),a,b,[0,1,2,5,10,100,1000]);count+=c;objects+=1
   if z:fail['common_weight']=z;break
  if fail:break
 rec=dict(status='finite exact only; weight one alone is source',objects=objects,tests=count,failures=fail,seconds=time.monotonic()-st)
 (out/'ambient-weights.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
if __name__=='__main__':main()
