"""Machine-authored exact next-top-layer algebra experiment; no proof claim."""
from vertical_gap_b5db import P,coerce,i,j,b,record
import json,pathlib
out=pathlib.Path('evidence/markov-7955df0c')
def terms(i,j,b,s=0):
 d=i+j;n=d+2-b;c=b*n+n-3*b-1
 t3=n*(n-1)*(n-2)*i*(i-1)*(i-2)+3*(2*(n-1)*(n-2)+b*(n-2)*(n-5))*i*(i-1)*j+3*(2*(n-2)+3*b-5*b*b+(n-1)*b+(n-1)*b*b-4*s)*i*j*(j-1)+b*(b-1)*(b-2)*j*(j-1)*(j-2)
 th=n*(n-1)*(i+1)*i+2*c*(i+1)*j+b*(b-1)*j*(j-1)
 tv=n*(n-1)*i*(i-1)+2*c*i*(j+1)+b*(b-1)*(j+1)*j
 gh=3*(d-1)*(d-2)*(i+2)*th**2-2*d*(d+1)*(i+1)*t3*(n*(i+2)+b*j)
 gv=3*(d-1)*(d-2)*(j+2)*tv**2-2*d*(d+1)*(j+1)*t3*(b*(j+2)+n*i)
 return gh,gv
def interval(p):
 k=max(e[2] for e in p);q=P()
 for (u,v,w),c in p.items():q=q+c*2**(k-w)*i**u*j**v*(i+j+1)**w*b**w*(1+b)**(k-w)
 return q,k
fail={};count=0
for D in range(3,90):
 for B in range((D+1)//2+1):
  for I in range(D+1):
   vals=terms(I,D-I,B)
   for name,g in zip(['h','v'],vals):
    count+=1
    if g<0:fail.setdefault(name,dict(D=D,B=B,i=I,j=D-I,gap=g))
rs={}
for name,p in zip(['h','v'],terms(i,j,b)):
 q,k=interval(p)
 rs[name]=dict(degree_b=k,cases={nm:record(q.sub(vs)) for nm,vs in [('large',[i+3,j,b]),('two',[2,j+1,b]),('one',[1,j+2,b]),('zero',[0,j+3,b])]})
rec=dict(tests=count,failures=fail,symbolic=rs,status='Exact experiments only; s=0 upper envelope of fourth-layer coefficient')
(out/'topnext-algebra.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(tests=count,failures=fail,symbolic={k:{nm:(v['terms'],len(v['negative_terms'])) for nm,v in z['cases'].items()} for k,z in rs.items()})))
