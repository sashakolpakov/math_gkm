"""Machine-authored staged full moment/source numerators, no numerical axioms."""
from generate_full_fa9eb434 import *
def pot(p,q,r):return loc4[p,q,r,0]+loc4[q,r,0,0]+loc4[r,0,0,0]
def canon(p,q,r,s):return loc4[p,q,r,s]-pot(p,q,r)+pot(q,r,s)
def quad(p,q,r,s):return canon(p,q,r,s)-canon(0,q,r,s)
tri={b:canon(0,*b)-loc4[0,0,0,0] for b in product(range(2),repeat=3)}
third=moment(loc3);base=C*loc4[0,0,0,0]+moment(tri)
quads={b:quad(*b) for b in [(1,0,0,1),(1,1,0,1),(1,0,1,1),(1,1,1,1)]}
text='\n'.join('import '+m for m in modules)+'\n'+header
for kind,loc in [('Third',loc3),('Four',loc4)]:
 args='p q r' if kind=='Third' else 'p q r s'
 text+=f'\ndef full{kind}FA {{A : Type*}} [CommRing A] (N Z x : A) ({args} : Bool) : A :=\n match '+','.join(args.split())+' with\n'
 for b in loc:text+=' | '+','.join(bools(b).split())+' => '+nm(kind,b)+' N Z x\n'
 text+=f'''\ntheorem full{kind}_eqFA {{A : Type*}} [CommRing A] (N Z x : A) :
 local{kind}NumBC N Z x=full{kind}FA N Z x := by
 funext {args}
'''
 text+=' '+ ' <;> '.join('cases '+a for a in args.split())+'\n'
 for b in loc:text+=' · exact '+nm(kind,b)+'_eq N Z x\n'
(R/'research/MarkovFullLocalsFA.lean').write_text(text+end)
momentmods=[]
for title,p,old,args in [('ThirdMoment',third,'boolMomentADB2 (localThirdNumBC N Z x) C R Q T U','N Z C R Q T U x'),('FourBase',base,'C*localFourNumBC N Z x false false false false+boolMomentADB2 (fourTripleBE (localFourNumBC N Z x)) C R Q T U','N Z C R Q T U x')]+[(('FourQuad'+''.join(map(str,b))),p,'fourQuadBE (localFourNumBC N Z x) '+bools(b),'N Z x') for b,p in quads.items()]:
 module='MarkovFull'+title+'FA';momentmods.append(module);name='full'+title+'FA'
 kind='Third' if title=='ThirdMoment' else 'Four'
 defs=','.join(nm(kind,b) for b in (loc3 if kind=='Third' else loc4))
 text='import MarkovFullLocalsFA\n'+header+definition(name,p,args)
 text+=f'''\ntheorem {name}_eq {{A : Type*}} [CommRing A] ({args} : A) :
 {old}={name} {args} := by
 rw [full{kind}_eqFA]
 simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,full{kind}FA,{defs},{name}]
 ring
'''+end
 (R/f'research/{module}.lean').write_text(text)
(O/'moment-modules.json').write_text(json.dumps(['MarkovFullLocalsFA']+momentmods,indent=2)+'\n')
(O/'full-moment-candidates.json').write_text(json.dumps(dict(third=serialize(third),base=serialize(base),quads={''.join(map(str,b)):serialize(p) for b,p in quads.items()}),indent=2)+'\n')
print(dict(third_terms=len(third),base_terms=len(base),quad_terms={str(b):len(p) for b,p in quads.items()}))
