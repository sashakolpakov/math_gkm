"""Machine-authored exact numerator-two recurrence exploration. Finite evidence."""
import sys,pathlib,json,time,math,shutil,importlib.util
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
out=pathlib.Path('evidence/markov-3af43e69');out.mkdir(exist_ok=True)
u={(1,0):1};v={(0,1):1};one={(0,0):1};s=add(add(u,v),one)
scale=lambda p,c:{k:c*x for k,x in p.items() if c*x}
power=lambda p,n:one if not n else mul(p,power(p,n-1))
f=[one,add(u,v)]
for n in range(2,24):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
p=[add(mul(f[n+1],f[n+1]),mul(v,mul(f[n],f[n]))) for n in range(22)]
c=add(mul(s,s),v,-1)
numer=[p[0],add(p[1],mul(c,p[0]),-1),
 add(add(p[2],mul(c,p[1]),-1),mul(mul(v,c),p[0]))]
fail=[]
for n in range(19):
 rhs=add(add(mul(c,p[n+2]),mul(mul(v,c),p[n+1]),-1),mul(power(v,3),p[n]))
 if rhs!=p[n+3]:fail.append(n)
def serial(p):return [[i,j,c] for (i,j),c in sorted(p.items())]
rec=dict(status='finite exact experiment only',q_bound=21,recurrence_failures=fail,
 denominator='1-(S^2-v)t+v(S^2-v)t^2-v^3 t^3',numerator=[serial(z) for z in numer],
 capabilities=dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None))
(out/'family-recurrence.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
