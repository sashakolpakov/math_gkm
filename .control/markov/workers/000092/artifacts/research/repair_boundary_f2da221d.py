"""Machine-authored repair of unadmitted draft; prior bytes preserved."""
from pathlib import Path
import re
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovFourthBoundaryK0B.lean').read_text()
s=s.replace('request 0b212317','request f2da221d; adapted from excluded 0b212317 draft')
names=re.findall(r'^(?:def|theorem) (\w+)',s,re.M)
for name in sorted(names,key=len,reverse=True): s=s.replace(name,name.replace('K0B','F2'))
for i in range(7):
 old=' unfold lowCoeff'+str(i)+'F2 '+' '.join('fourthLow'+str(k)+'K0B' for k in range(13))+'\n ring'
 new=' simp only [lowCoeff'+str(i)+'F2,'+','.join('fourthLow'+str(k)+'K0B' for k in range(13))+']\n norm_num [Nat.choose]\n <;> ring'
 assert old in s
 s=s.replace(old,new)
(R/'MarkovFourthBoundaryF2.lean').write_text(s)
print('Wrote new boundary candidate; no inherited file changed.')
