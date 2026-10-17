"""Machine-authored 6576ccc5. Correct tail cuts for cutPolyMFEE.
The earlier prefix-cut probe tests a different predicate and cannot be used
as evidence for the existing Lean weighted-value transport.
"""
from transposed_kernel_probe_6576ccc5 import *
start=time.monotonic()
out=dict(status='finite tail-cut experiment, not a proof',cut_meaning='retain indices h >= cut, exactly cutPolyMFEE',prior_prefix_probe='Different predicate; not evidence for weighted_value_lcMFEE',d_values=list(range(13))+[25,50],k_values=list(range(13))+[20,36],s_values=list(range(3,13)),triplets=0,cut_coefficient_checks=0,negative_cut_coefficients=0,negative_examples=[])
for d in out['d_values']:
 for k in out['k_values']:
  for r in [False,True]:
   for s in out['s_values']:
    A,B,D=[kernel(d,k,r,s+t) for t in range(3)];out['triplets']+=1
    for cut in range(s+4):
     aa,bb,cc=[[v if h>=cut else F(0) for h,v in enumerate(P)] for P in [A,B,D]]
     lhs=conv(bb,bb);rhs=conv(aa,cc)
     for i in range(max(len(lhs),len(rhs))):
      z=(lhs[i] if i<len(lhs) else 0)-(rhs[i] if i<len(rhs) else 0)
      out['cut_coefficient_checks']+=1
      if z<0:
       out['negative_cut_coefficients']+=1
       if len(out['negative_examples'])<12:out['negative_examples'].append([d,k,r,s,cut,i,str(z)])
out['seconds']=time.monotonic()-start
(O/'transposed-tail-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
