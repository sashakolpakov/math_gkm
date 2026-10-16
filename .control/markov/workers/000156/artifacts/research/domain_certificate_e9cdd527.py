"""Machine-authored finite table certificate generator; Lean checks every entry."""
from pathlib import Path
from alternate_shape_e9cdd527 import lower
p=Path('/Users/sasha/math_gkm/research/MarkovLowerDomainME9C.lean')
s=p.read_text();a=lower(5,4,3)
head=s[:s.index('theorem lower_kernel_outside_negativeME9C')]
tail=s[s.index('theorem lower_kernel_outside_sourceME9C'):]
proof='theorem lower_kernel_outside_negativeME9C : lowerKernelME9C 4 3 0= -29 := by\n'
names=[]
for i in range(5):
 for j in range(4):
  name=f'h{i}_{j}'
  proof+=f' have {name} : lowerRawME9C 5 {i} {j}=({a[i,j]}:ℤ) := by\n'
  proof+=f'   have h := lower_raw_equationME9C 5 {i} {j}\n'
  proof+='   norm_num [discriminantActionM96A,shiftRawM9E2,lowerForceME9C,addSRawM9E2,fibDeltaME9C,fibRawM9E2,Nat.choose'+(' ,'+','.join(names) if names else '')+'] at h\n'
  proof+='   linarith only [h]\n';names.append(name)
proof+=' exact h4_3\n\n'
p.write_text(head+proof+tail)
print('Generated 20 local arithmetic equations; not yet validated')
