"""Machine-authored exact fourth numerator bridge candidates; Lean checks required."""
from pathlib import Path
from itertools import product
from fractions import Fraction as F
import re,json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize,moment
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fa9eb434'
header='''/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
end='end\nend MathGKM.Markov\n'
names=['N','Z','C','R','Q','T','U','x']
def expr(p):
 out=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  factors=[str(v.numerator)]
  for a,k in zip(names,ks):
   if k:factors.append(a if k==1 else a+'^'+str(k))
  out.append('*'.join(factors))
 return ' + '.join(out) or '0'
def fact(p,ids=(1,0,7)):
 if not p:return '0'
 if not ids:return expr(p)
 i=ids[0];groups={}
 for ks,v in p.items():
  k=list(ks);e=k[i];k[i]=0;groups.setdefault(e,P())[tuple(k)]=v
 return ' + '.join(('' if e==0 else names[i]+('' if e==1 else '^'+str(e))+'*')+'('+fact(q,ids[1:])+')' for e,q in sorted(groups.items()))
def definition(name,p,args='N Z x'):
 return f'\ndef {name} {{A : Type*}} [CommRing A] ({args} : A) : A :=\n '+fact(p)+'\n'
def parse_defs(path):
 text=path.read_text();out={}
 for m in re.finditer(r'def (\w+).*?: A :=\n ([^\n]+)',text):
  out[m[1]]=eval(m[2].replace('^','**'),{'__builtins__':{}},dict(N=N,Z=Z,x=X,C=C,R=Rr,Q=Q))
 return out
gs={}
for p,q in product(range(2),repeat=2):gs.update(parse_defs(R/f'research/MarkovGaugeNorm{p}{q}BC.lean'))
def g(p,q,ek):return gs[f'gaugeNum{p}{q}{ek}BC']
def local3(p,q,r):
 d=g(p,q,'d1');c=g(p,q,'c1');D=1-X
 return 2*d**3-3*d*g(p,q,'d2')+g(p,q,'d3')+6*D*c*g(q,r,'b2')+6*D*g(p,q,'c2')-6*D*c*(d+g(q,r,'d1'))+6*D**3*c*g(q,r,'a1')
def local4(p,q,r,s):
 D=1-X;d=g(p,q,'d1');c=g(p,q,'c1')
 v2=g(q,r,'b2')+D**2*g(q,r,'a1')-g(q,r,'d1')
 v3=g(q,r,'b3')+2*g(q,r,'a1')*D**2*(g(r,s,'b2')+D**2*g(r,s,'a1')-g(r,s,'d1'))+2*D*g(q,r,'a2')-2*(g(q,r,'b2')+D**2*g(q,r,'a1'))*g(q,r,'d1')+2*g(q,r,'d1')**2-g(q,r,'d2')-2*D*g(q,r,'c1')
 g2=g(p,q,'d2')+2*D*c;g3=g(p,q,'d3')+6*D*c*v2+6*D*g(p,q,'c2');g4=g(p,q,'d4')+12*D*c*v3+24*D*g(p,q,'c2')*v2+4*D*g(p,q,'c3')
 return g4-4*d*g3-3*g2**2+12*d**2*g2-6*d**4
loc3={b:local3(*b) for b in product(range(2),repeat=3)}
loc4={b:local4(*b) for b in product(range(2),repeat=4)}
bools=lambda bits:' '.join('true' if b else 'false' for b in bits)
def nm(kind,b):return 'full'+kind+''.join(map(str,b))+'FA'
gdefs=','.join(gs)
generic=','.join('gauge'+a+'BC' for a in ['a1','a2','b2','b3','c1','c2','c3','d1','d2','d3','d4'])
modules=[]
for kind,loc in [('Third',loc3),('Four',loc4)]:
 for bits,p in loc.items():
  module='MarkovFull'+kind+''.join(map(str,bits))+'FA';modules.append(module)
  name=nm(kind,bits)
  text='import MarkovFourthBinomialBC\n'+header+definition(name,p)
  text+=f'''\ntheorem {name}_eq {{A : Type*}} [CommRing A] (N Z x : A) :
 local{kind}NumBC N Z x {bools(bits)}={name} N Z x := by
 simp only [local{kind}NumBC,{name},{generic},{gdefs}]
 ring
'''+end
  (R/f'research/{module}.lean').write_text(text)
(O/'full-local-candidates.json').write_text(json.dumps(dict(third={''.join(map(str,k)):serialize(v) for k,v in loc3.items()},fourth={''.join(map(str,k)):serialize(v) for k,v in loc4.items()}),indent=2)+'\n')
(O/'local-modules.json').write_text(json.dumps(modules,indent=2)+'\n')
print(dict(modules=len(modules),third_terms=[len(p) for p in loc3.values()],fourth_terms=[len(p) for p in loc4.values()]))
