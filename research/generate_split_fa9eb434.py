"""Machine-authored split shift-degree expansion and exact universal numerator."""
from generate_moments_fa9eb434 import *
f=parse_defs(R/'research/MarkovFirstNormBC.lean')['firstNumBC'];s=parse_defs(R/'research/MarkovSecondNormBC.lean')['secondNumBC']
parts={}
def split(p,k):return P({tuple(0 if i==1 else v for i,v in enumerate(ks)):a for ks,a in p.items() if ks[1]==k})
text='import MarkovFourthBinomialBC\n'+header
for tag,p,deg in [('F',f,1),('S',s,2),('T',third,3),('M',base,4)]:
 for i in range(deg+1):
  parts[tag+str(i)]=split(p,i);text+=definition('part'+tag+str(i)+'FA',parts[tag+str(i)],'N C R Q T U x')
(R/'research/MarkovFullPartsFA.lean').write_text(text+end)
polys=[('First','firstNumBC N Z C R Q x',f,'F',1),('Second','secondNumBC N Z C R Q x',s,'S',2),('Third','fullThirdMomentFA N Z C R Q T U x',third,'T',3),('Moment','fullFourBaseFA N Z C R Q T U x',base,'M',4)]
splitmods=[]
for name,old,p,tag,deg in polys:
 module='MarkovFullSplit'+name+'FA';splitmods.append(module)
 imports='import MarkovFullPartsFA\n'+('import MarkovFullThirdMomentFA\n' if name=='Third' else 'import MarkovFullFourBaseFA\n' if name=='Moment' else '')
 terms=['part'+tag+str(i)+'FA N C R Q T U x' for i in range(deg+1)]
 rhs=' + '.join(('' if i==0 else 'Z'+('' if i==1 else '^'+str(i))+'*')+'('+a+')' for i,a in enumerate(terms))
 defs=','.join([old.split()[0]]+['part'+tag+str(i)+'FA' for i in range(deg+1)])
 text=imports+header+f'''theorem fullSplit{name}FA {{A : Type*}} [CommRing A] (N Z C R Q T U x : A) :
 {old}={rhs} := by
 unfold {defs.replace(',', ' ')}
 ring
'''+end
 (R/f'research/{module}.lean').write_text(text)
H=base+6*(1+X)**4*(1-X)**8+4*f*third-8*f*(1+X)**3*(1-X)**6+3*s**2-2*f**4
hs=[split(H,i) for i in range(5)]
def atom(t):return '(part'+t+'FA N C R Q T U x)'
formulas=[
 'M0 + 6*(1+x)^4*(1-x)^8 + 4*F0*T0 - 8*F0*(1+x)^3*(1-x)^6 + 3*S0^2 - 2*F0^4',
 'M1 + 4*(F0*T1+F1*T0) - 8*F1*(1+x)^3*(1-x)^6 + 6*S0*S1 - 8*F0^3*F1',
 'M2 + 4*(F0*T2+F1*T1) + 3*S1^2 + 6*S0*S2 - 12*F0^2*F1^2',
 'M3 + 4*(F0*T3+F1*T2) + 6*S1*S2 - 8*F0*F1^3',
 'M4 + 4*F1*T3 + 3*S2^2 - 2*F1^4']
coeffmods=[]
for i,p in enumerate(hs):
 module='MarkovFullCoeff'+str(i)+'FA';coeffmods.append(module)
 form=re.sub(r'\b[FSTM][0-4]\b',lambda m:atom(m[0]),formulas[i])
 text='import MarkovFullPartsFA\n'+header+definition('fullH'+str(i)+'FA',p,'N C R Q T U x')
 defs=sorted(set(re.findall(r'part\w+FA',form)))
 text+=f'''theorem fullH{i}FA_eq {{A : Type*}} [CommRing A] (N C R Q T U x : A) :
 {form}=fullH{i}FA N C R Q T U x := by
 unfold {' '.join(defs)} fullH{i}FA
 ring
'''+end
 (R/f'research/{module}.lean').write_text(text)
(O/'split-modules.json').write_text(json.dumps(['MarkovFullPartsFA']+splitmods+coeffmods,indent=2)+'\n')
(O/'coefficient-modules.json').write_text(json.dumps(coeffmods,indent=2)+'\n')
(O/'universal-numerator-candidates.json').write_text(json.dumps(dict(coefficients=[serialize(p) for p in hs],meaning='Full base normalized numerator; add fourth source correction Z^4*96*(1-x)^8*(m*x^5+2*l*x^6+v*x^7). Natural counts retained.'),indent=2)+'\n')
print(dict(H_terms=[len(p) for p in hs]))
