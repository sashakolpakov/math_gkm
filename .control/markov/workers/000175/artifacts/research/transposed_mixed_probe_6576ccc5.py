"""Machine-authored 6576ccc5. Challenge termwise proofs of the new tail kernel."""
from transposed_kernel_probe_6576ccc5 import *
start=time.monotonic()
out=dict(status='finite auxiliary mixed-gap experiment',triplets=0,checks=0,negative_mixed=0,negative_correction=0,mixed_examples=[],correction_examples=[])
for d in [0,1,3,8,20,50]:
 for k in [0,1,2,3,5,10,20,36]:
  for r in [False,True]:
   j=d+3*k+(3 if r else 2)
   for s in range(3,16):
    full=[kernel(d,k,r,s+t) for t in range(3)]
    lower=[[F(C(s+t+(s+t-h)+3,s+t-h)*(C(j+s+t+3,s+t+(s+t-h)+3)+4*C(j+s+t+4,s+t+(s+t-h)+5))) for h in range(s+t+1)] for t in range(3)]
    corr=[[a-b for a,b in zip(A,B)] for A,B in zip(full,lower)]
    out['triplets']+=1
    for cut in range(s+4):
     A,B,D=[[v if h>=cut else F(0) for h,v in enumerate(P)] for P in lower]
     E,F1,G=[[v if h>=cut else F(0) for h,v in enumerate(P)] for P in corr]
     products=[conv(B,F1),conv(A,G),conv(E,D),conv(F1,F1),conv(E,G)]
     for i in range(max(map(len,products))):
      v=lambda p:p[i] if i<len(p) else 0
      mix=2*v(products[0])-v(products[1])-v(products[2]);cg=v(products[3])-v(products[4]);out['checks']+=1
      if mix<0:
       out['negative_mixed']+=1
       if len(out['mixed_examples'])<6:out['mixed_examples'].append([d,k,r,s,cut,i,str(mix)])
      if cg<0:
       out['negative_correction']+=1
       if len(out['correction_examples'])<6:out['correction_examples'].append([d,k,r,s,cut,i,str(cg)])
out['seconds']=time.monotonic()-start
(O/'transposed-mixed-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
