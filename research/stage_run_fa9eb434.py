"""Machine-authored second staging variable to keep ring certificates small."""
from pathlib import Path
from fractions import Fraction as F
import json,re
from rational_third_bdee import P
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fa9eb434'
header='''/-! Machine-authored fa9eb434. Run-degree staging of exact identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
''';end='end\nend MathGKM.Markov\n'
names=['N','Z','C','R','Q','T','U','x']
def expr(p):
 ts=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  ts.append('*'.join([str(v.numerator)]+[a if k==1 else a+'^'+str(k) for a,k in zip(names,ks) if k]))
 return ' + '.join(ts) or '0'
def fact(p,ids=(0,7)):
 if not p:return '0'
 if not ids:return expr(p)
 i=ids[0];groups={}
 for ks,v in p.items():
  k=list(ks);e=k[i];k[i]=0;groups.setdefault(e,P())[tuple(k)]=v
 return ' + '.join(('' if e==0 else names[i]+('' if e==1 else '^'+str(e))+'*')+'('+fact(q,ids[1:])+')' for e,q in sorted(groups.items()))
def splitN(p,k):return P({(0,)+ks[1:]:v for ks,v in p.items() if ks[0]==k})
def decl(name,p,args):return f'\ndef {name} {{A : Type*}} [CommRing A] ({args} : A) : A :=\n '+fact(p)+'\n'
class S(dict):
 def __add__(a,b):
  b=lift(b);d=S(a)
  for k,v in b.items():d[k]='('+d[k]+' + '+v+')' if k in d else v
  return d
 __radd__=__add__
 def __neg__(a):return S({k:'(-'+v+')' for k,v in a.items()})
 def __sub__(a,b):return a+-lift(b)
 def __rsub__(a,b):return lift(b)+-a
 def __mul__(a,b):
  b=lift(b);d=S()
  for k,v in a.items():
   for l,w in b.items():
    s='('+v+'*'+w+')';d[k+l]='('+d[k+l]+' + '+s+')' if k+l in d else s
  return d
 __rmul__=__mul__
 def __pow__(a,n):
  d=lift(1)
  for _ in range(n):d=d*a
  return d
def lift(x):return x if isinstance(x,S) else S({0:str(x)})
text=(R/'research/MarkovFullPartsFA.lean').read_text();parts={};ss={};defs=[]
run='import MarkovFullPartsFA\n'+header
for m in re.finditer(r'def part(\w+)FA .*?: A :=\n ([^\n]+)',text):
 tag=m[1];p=eval(m[2].replace('^','**'),{'__builtins__':{}},dict(zip(names,[__import__('rational_third_bdee').var(i) for i in range(8)])))
 parts[tag]=p;ss[tag]=S();nms=[]
 for i in range(max(k[0] for k in p)+1):
  q=splitN(p,i)
  if not q:continue
  nm=f'run{tag}n{i}FA';defs.append(nm);nms.append(nm);run+=decl(nm,q,'C R Q T U x');ss[tag][i]='('+nm+' C R Q T U x)'
 rhs=' + '.join(('' if i==0 else 'N'+('' if i==1 else '^'+str(i))+'*')+v for i,v in ss[tag].items())
 run+=f'''theorem run{tag}FA_eq {{A : Type*}} [CommRing A] (N C R Q T U x : A) :
 part{tag}FA N C R Q T U x={rhs} := by
 unfold part{tag}FA {' '.join(nms)}
 ring
'''
(R/'research/MarkovFullRunPartsFA.lean').write_text(run+end)
forms=[
 'M0 + B + 4*F0*T0 - 8*F0*D + 3*S0**2 - 2*F0**4',
 'M1 + 4*(F0*T1+F1*T0) - 8*F1*D + 6*S0*S1 - 8*F0**3*F1',
 'M2 + 4*(F0*T2+F1*T1) + 3*S1**2 + 6*S0*S2 - 12*F0**2*F1**2',
 'M3 + 4*(F0*T3+F1*T2) + 6*S1*S2 - 8*F0*F1**3',
 'M4 + 4*F1*T3 + 3*S2**2 - 2*F1**4']
hs=[P({tuple(k):F(v) for k,v in p}) for p in json.loads((O/'universal-numerator-candidates.json').read_text())['coefficients']]
stages=[]
for h in range(4):
 vals=eval(forms[h],{'__builtins__':{}},dict(ss,B=lift('(6*(1+x)^4*(1-x)^8)'),D=lift('((1+x)^3*(1-x)^6)')))
 stage='import MarkovFullRunPartsFA\n'+header
 for j,v in vals.items():
  p=splitN(hs[h],j);nm=f'runH{h}n{j}FA';stage+=decl(nm,p,'C R Q T U x')
  used=sorted(set(re.findall(r'run\w+FA',v)))
  stage+=f'''theorem {nm}_eq {{A : Type*}} [CommRing A] (C R Q T U x : A) :
 {v}={nm} C R Q T U x := by
 unfold {' '.join(used)} {nm}
 ring
'''
 module=f'MarkovFullRunCoeff{h}FA';stages.append(module);(R/f'research/{module}.lean').write_text(stage+end)
 target=R/f'research/MarkovFullCoeff{h}FA.lean';old=target.read_text();prefix=old[:old.index('theorem fullH')]
 prefix=prefix.replace('import MarkovFullPartsFA','import '+module)
 lhs=re.search(r':\n (.*?)=fullH',old,re.S)[1] if False else old[old.index(' :\n ',old.index('theorem fullH'))+4:old.index(f'=fullH{h}FA N')]
 usedtags=sorted(set(re.findall(r'part(\w+)FA',lhs)))
 rhs=' + '.join(('' if i==0 else 'N'+('' if i==1 else '^'+str(i))+'*')+f'(runH{h}n{i}FA C R Q T U x)' for i in vals)
 proof=f'''theorem fullH{h}FA_eq {{A : Type*}} [CommRing A] (N C R Q T U x : A) :
 {lhs}=fullH{h}FA N C R Q T U x := by
 have hout : fullH{h}FA N C R Q T U x={rhs} := by
   unfold fullH{h}FA {' '.join(f'runH{h}n{i}FA' for i in vals)}
   ring
 rw [hout]
 simp only [{','.join('run'+t+'FA_eq' for t in usedtags)}]
 rw [{','.join('←runH'+str(h)+'n'+str(i)+'FA_eq' for i in vals)}]
 ring
'''
 target.write_text(prefix+proof+end)
(O/'run-stage-modules.json').write_text(json.dumps(stages,indent=2)+'\n')
print(dict(stages=stages,parts=len(parts),run_components=len(defs)))
