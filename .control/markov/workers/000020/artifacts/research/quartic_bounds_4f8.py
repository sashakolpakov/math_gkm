"""Exact polynomial certificate probes; no universal conclusion without Lean."""
import json,pathlib
from residual_16cb import add,mul,one,x,y
c=lambda n:{(0,0):n} if n else {}
def scale(p,n):return mul(p,c(n))
def sub(p,q):return add(p,q,-1)
def pw(p,n):
 r=one
 for _ in range(n):r=mul(r,p)
 return r
def B(n,m,s,t):
 return add(scale(add(add(add(mul(pw(m,3),add(n,c(-8))),scale(pw(m,2),18)),mul(m,add(scale(n,5),c(-22)))),add(scale(n,-6),c(12))),4),add(scale(mul(sub(one,m),s),48),scale(t,48)))
def C(n,m,s):
 z=add(add(add(mul(pw(n,2),add(add(pw(m,2),scale(m,3)),c(6))),mul(n,add(add(scale(pw(m,2),-11),scale(m,-9)),c(-18)))),scale(pw(m,2),26)),add(scale(m,-10),c(12)))
 return add(scale(z,6),mul(add(c(144),scale(n,-48)),s))
m=add(x,c(4));n=add(m,y)
a=mul(m,mul(add(m,c(-1)),mul(add(m,c(-2)),add(m,c(-3)))))
d=scale(mul(add(n,c(-1)),mul(add(n,c(-2)),add(scale(n,3),mul(m,add(n,c(-6)))))),4)
e=mul(add(n,one),mul(n,mul(add(n,c(-1)),add(n,c(-2)))))
bl=B(n,m,scale(y,2),{});bu=B(n,m,{},y);cl=C(n,m,scale(y,2));cu=C(n,m,{})
ps={'bl':bl,'cl':cl,'gap1':sub(pw(bl,2),mul(a,cu)),'gap2':sub(pw(cl,2),mul(bu,d)),'gap3':sub(pw(d,2),mul(cu,e))}
res={k:{'negative':[(str(a),b) for a,b in v.items() if b<0],'terms':[(str(a),b) for a,b in sorted(v.items())]} for k,v in ps.items()}
pathlib.Path('evidence/markov-4f8ceeeb/quartic-bounds.json').write_text(json.dumps(res,indent=2)+'\n')
print({k:v['negative'] for k,v in res.items()})
