"""Machine-authored certificate factoring; preserves original evidence expressions."""
from pathlib import Path
import json,re
def parse(expr,names):
 out={}
 for term in expr.split(' + '):
  parts=term.split('*');coef=int(parts[0]);powers=[0]*len(names)
  for factor in parts[1:]:
   x,*e=factor.split('^');powers[names.index(x)]=int(e[0]) if e else 1
  out[tuple(powers)]=coef
 return out
def horner(p,names):
 if not names:return str(p.get((),0))
 if not p:return '0'
 deg=max(k[0] for k in p)
 cs=[horner({k[1:]:v for k,v in p.items() if k[0]==i},names[1:]) for i in range(deg+1)]
 h=cs[-1]
 for a in reversed(cs[:-1]):
  h='('+h+')*'+names[0]
  if a!='0':h='('+h+'+('+a+'))'
 return h
for kind,names in [('upper',['u','v','w']),('lower',['t','s','u','v'])]:
 rec=json.loads(Path('evidence/markov-446bbcdc/'+('upper-cubic.json' if kind=='upper' else 'lower-shape.json')).read_text())
 expr=rec['expression'];fact=horner(parse(expr,names),names)
 p=Path('research/Markov'+kind.title()+'Shape446.lean')
 old=p.read_text();assert old.count(expr)==2
 Path('evidence/markov-446bbcdc/'+p.name+'.expanded').write_text(old)
 p.write_text(old.replace(expr,fact))
 print(kind,len(expr),len(fact))
