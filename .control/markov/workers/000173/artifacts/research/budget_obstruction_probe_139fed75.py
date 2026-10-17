"""Machine-authored 139fed75. Exact finite budget and source diagnostics."""
from band_experiment_139fed75 import Q,C,O,frame,L
import json,time
def run():
 start=time.monotonic();failures=[]
 for k in range(1,101):
  for r in [False,True]:
   q=2*k+(2 if r else 1);j=q+k+1;h=Q(q,r,k)
   for m in range(1,k):
    if h[m+1]>h[1]*C(j,m):
     failures.append({'q':q,'r':r,'k':k,'m':m,'Q0':h[0],'Q1':h[1],
       'Qnext':h[m+1],'bound':h[1]*C(j,m)})
 out={'status':'finite exact experiment only','failure_count':len(failures),
   'first':failures[0] if failures else None,'first_ten':failures[:10]}
 (O/'budget-obstruction-reproduced.json').write_text(json.dumps(out,indent=2)+'\n')
 q=73;r=False;k=36;j=q+k+1;a,b,p=frame([False]*(q-1)+[True,r]);h=Q(q,r,k)
 vals=[p.get((i,j),0) for i in [2,3,4]]
 pred=[L(0,j,i-3)+h[i-2] for i in [2,3,4]]
 assert pred==vals
 source={'status':'exact finite source check; not a universal proof','q':q,'r':r,'k':k,'row':j,
 'fraction':[a,b],'path':[False]*(q-1)+[True,r],'Q0_Q1_Q2':h[:3],
 'source_triple_columns':[2,3,4],'raw_values':vals,'predicted_values':pred,
 'polygon_valid':all(a*b<=b*i+a*j and i+j<=a+b-1 for i in [2,3,4]),
 'raw_gap':vals[1]**2-vals[0]*vals[2],'budget_excess':h[2]-h[1]*j,'seconds':time.monotonic()-start}
 (O/'budget-source-witness.json').write_text(json.dumps(source,indent=2)+'\n')
 print(json.dumps(source))
if __name__=='__main__':run()
