"""Machine-authored split certificates replacing a recorded 180s timeout."""
from pathlib import Path
from itertools import product
import rational_third_bdee as m
import generate_core_fdda as g
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovNormalCombineFDDA.lean').read_text()
prefix=s.split('theorem normal_combineFDDA')[0]
(R/'research/MarkovNormalBandsFDDA.lean').write_text(prefix+g.tail)
def zcoef(p,i):return m.P({ks[:1]+(0,)+ks[2:]:v for ks,v in p.items() if ks[1]==i})
moment=m.moment({a:m.local(*a) for a in product((0,1),repeat=3)})
assert moment.d==6
parts={}
for stem,p,d in [('First',g.f.p,1),('Second',g.sec.p,2),('Moment',moment.p,3)]:
 for i in range(d+1):parts[f'{stem}{i}']=zcoef(p,i)
s='import MarkovNormalBandsFDDA\n'+g.head
for name,p in parts.items():s+=f'def part{name}FDDA (N c r q t u x : RunFieldBDEE) : RunFieldBDEE :=\n {g.poly(p)}\n'
for stem,d,original,unfold in [('First',1,'normalFirstNumFDDA N Z c r x','normalFirstNumFDDA'),('Second',2,'normalSecondNumFDDA N Z c r q x','normalSecondNumFDDA'),('Moment',3,'boolMomentADB2 (normalLocalFDDA N Z x) c r q t u','boolMomentADB2 boolJetADB2 normalLocalFDDA '+ ' '.join('normalLocal'+''.join(map(str,a))+'FDDA' for a in product((0,1),repeat=3)))]:
 terms=[f'Z^{i}*part{stem}{i}FDDA N c r q t u x' for i in range(d+1)]
 s+=f'theorem part_{stem.lower()}FDDA (N Z c r q t u x : RunFieldBDEE) :\n {original}={"+".join(terms)} := by\n unfold {unfold} '+ ' '.join(f'part{stem}{i}FDDA' for i in range(d+1))+'\n ring\n'
s+=g.tail
(R/'research/MarkovNormalPartsFDDA.lean').write_text(s)
F0,F1=[f'partFirst{i}FDDA N c r q t u x' for i in range(2)]
S0,S1,S2=[f'partSecond{i}FDDA N c r q t u x' for i in range(3)]
exprs=[f'3*({F0})*({S0})-2*({F0})^3-2*(1-x)^6*(1+x)^3',f'3*({F0})*({S1})+3*({F1})*({S0})-6*({F0})^2*({F1})',f'3*({F0})*({S2})+3*({F1})*({S1})-6*({F0})*({F1})^2',f'3*({F1})*({S2})-2*({F1})^3']
for i,expr in enumerate(exprs):
 s='import MarkovNormalPartsFDDA\n'+g.head
 used=[k for k in parts if f'part{k}FDDA' in expr]+[f'Moment{i}']
 s+=f'theorem part_band_{i}FDDA (N c r q t u x : RunFieldBDEE) :\n {expr}+partMoment{i}FDDA N c r q t u x=normalBand{i}FDDA N c r q t u x := by\n unfold normalBand{i}FDDA '+' '.join(f'part{k}FDDA' for k in used)+'\n ring\n'+g.tail
 (R/f'research/MarkovNormalBandProof{i}FDDA.lean').write_text(s)
s=''.join(f'import MarkovNormalBandProof{i}FDDA\n' for i in range(4))+g.head
old=(R/'research/MarkovNormalCombineFDDA.lean').read_text()
statement=old.split('theorem normal_combineFDDA')[1].split(' := by')[0]
s+='theorem normal_combineFDDA'+statement+' := by\n rw [part_firstFDDA N Z c r q t u x,part_secondFDDA N Z c r q t u x,part_momentFDDA]\n'
for i in range(4):s+=f' rw [←part_band_{i}FDDA]\n'
s+=' ring\n'+g.tail
(R/'research/MarkovNormalCombineFDDA.lean').write_text(s)
print({k:len(p) for k,p in parts.items()})
