"""Machine-authored exact candidate gap charts, universal parameters but not proofs."""
from small_cycle_cfcbaf30 import *
out=[]
for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
 p=numerator(c,r);blocks={b:(min(k for a,bb,k in p if bb==b),max(k for a,bb,k in p if bb==b)) for b in range(c+1)}
 intervals=[];windows=[]
 for b in range(c):
  L=blocks[b][1]-7;U=blocks[b+1][0]-3
  q=raw_formula(p,list(range(b+1)),X)
  shift=L-U;n=X+Z+shift;j=b*n+L+X
  vs=[subst(q,n,0,j+k) for k in range(3)];g=vs[1]**2-vs[0]*vs[2]
  intervals.append(dict(b=b,L=L,U=U,n_shift=shift,formula=serial(q),gap=serial(g),negative=sum(v<0 for v in g.values())))
 for b in range(c+1):
  start=0 if b==0 else blocks[b][0]-2
  end=4 if b==0 else blocks[b][1]-8 if b<c else r+2
  vals=[]
  for t in range(start,end+3):
   q=raw_formula(p,list(range(b)),b*N+t)
   for (a,bb,k),v in p.items():
    if bb==b and k<=t:q+=v*N**a*5040*comb(7+t-k,7)
   vals.append(q)
  gs=[]
  for t in range(start,end+1):
   v=[subst(q,N+7,0,0) for q in vals[t-start:t-start+3]];g=v[1]**2-v[0]*v[2]
   gs.append(dict(t=t,gap=serial(g),negative=sum(v<0 for v in g.values())))
  windows.append(dict(b=b,start=start,end=end,values=[serial(q) for q in vals],gaps=gs))
 print(c,r,'intervals',[(z['b'],z['L'],z['U'],z['negative']) for z in intervals],'windows',[(z['b'],[(g['t'],g['negative']) for g in z['gaps']]) for z in windows],flush=True)
 out.append(dict(c=c,r=r,blocks=blocks,intervals=intervals,windows=windows))
(O/'all-small-chart-candidates.json').write_text(json.dumps(dict(status='Symbolic candidates only. Source/binomial/positivity assembly requires Lean validation.',families=out),indent=2)+'\n')
