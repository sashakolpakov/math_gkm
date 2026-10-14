"""Machine-authored exact tests; finite observations, never root proof."""
import pathlib,sys,json,math,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
out=pathlib.Path('evidence/markov-f6506bc6');out.mkdir(exist_ok=True)
u={(1,0):1};v={(0,1):1};one={(0,0):1};s=add(add(u,v),one)
A=(v,one,mul(u,v),add(u,one))
B=(mul(v,s),add(u,v),mul(mul(u,v),add(s,one)),mul(u,s))
def mm(x,y):
 a,b,c,d=x;e,f,g,h=y
 return add(mul(a,e),mul(b,g)),add(mul(a,f),mul(b,h)),add(mul(c,e),mul(d,g)),add(mul(c,f),mul(d,h))
def source(a,b):
 # Original A/B Christoffel word has a B's and b-a A's.
 w=[(k*a)//b>((k-1)*a)//b for k in range(1,b+1)]
 m=(one,{}, {},one)
 for r in w:m=mm(m,B if r else A)
 return m[1],w
fail={};count=0
for b in range(2,32):
 for a in range(1,b):
  if math.gcd(a,b)!=1:continue
  p,w=source(a,b);d=a+b-1;count+=1
  for j in range(d+1):
   n=d-j
   for i in range(n-1):
    l,c,r=(p.get((i+k,j),0) for k in range(3))
    # Raw row divided by choose(n,i); cleared positive factors.
    if c*c*(i+1)*(n-i-1)<l*r*(i+2)*(n-i) and 'horizontal_ulc' not in fail:
     fail['horizontal_ulc']=dict(a=a,b=b,i=i,j=j,n=n,coeff=[l,c,r])
  for i in range(d):
   for j in range(d-i):
    c=lambda x,y:p.get((x,y),0)
    tests={'TP2':c(i,j)*c(i+1,j+1)>=c(i+1,j)*c(i,j+1),
     'reverse_TP2':c(i,j)*c(i+1,j+1)<=c(i+1,j)*c(i,j+1),
     'positive_diagonal_lc':c(i+1,j+1)**2>=c(i,j)*c(i+2,j+2)}
    for name,ok in tests.items():
     if not ok and name not in fail:fail[name]=dict(a=a,b=b,i=i,j=j,coeff=[c(i,j),c(i+1,j),c(i,j+1),c(i+1,j+1),c(i+2,j+2)])
res=dict(status='exact finite evidence only',fractions=count,denominator_bound=31,first_failures=fail)
(out/'strengthened.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res),flush=True)
