"""Machine-authored shifted moment proof candidates. Every output requires Lean checking."""
from pathlib import Path
import re
R=Path('/Users/sasha/math_gkm/research')
def block(file,name):
 s=(R/(file+'.lean')).read_text(); start=re.search(r'^(?:def|theorem) '+name+r'\b',s,re.M).start()
 tail=s[start:]; m=re.search(r'\n(?:def|theorem|end)\b',tail)
 return tail[:m.start()]+'\n\n'
names=['topKernelM55C','topMassM55C','topEigenM55C','top_kernel_stepM55C','top_kernel_nonnegM55C','top_mass_nonnegM55C','topMomentM55C','topExcessM55C','topVarianceNumerM55C','top_moment_stepM55C','top_moment_zeroM55C','top_mass_stepM55C','top_mass_two_stepM55C','topDeficitM41B','deficit_covarianceM41B','actual_deficit_secondM41B','topCenteredM41B','top_centered_identityM41B','top_centered_boundM41B','top_variance_centeredME87','weakDriftM673','weak_gap_identityM673','weak_gap_iffM673']
mapping={n:re.sub(r'M(?:55C|41B|E87|673)$','ME10',n) for n in names}
mapping['top_mass_nonnegM55C']='top_shift_nonnegME10'
def shift(s):
 for a,b in mapping.items():s=s.replace(a,b)
 return s.replace('+8','+4').replace('+9','+5').replace('+10','+6')
def write(name,imports,s):
 (R/(name+'.lean')).write_text('\n'.join('import '+i for i in imports)+'\n/-! Machine-authored e108e0e2. Shifted actual-weight identities. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Finset\nset_option maxHeartbeats 8000000\n'+shift(s)+'\nend\nend MathGKM.Markov\n')
s=block('MarkovTopKernelM55C','topEigenM55C')+block('MarkovTopKernelM55C','top_kernel_nonnegM55C')+block('MarkovTopKernelM55C','top_kernel_stepM55C')
for n in ['topMomentM55C','topExcessM55C','topVarianceNumerM55C','top_moment_stepM55C','top_moment_zeroM55C','top_mass_stepM55C','top_mass_two_stepM55C']:
 s+=block('MarkovTopMomentsM55C',n)
write('MarkovShiftMomentsME10',['MarkovTopShiftME10','MarkovCenteredAttachmentME87'],s)
s=''
for n in ['topDeficitM41B','deficit_covarianceM41B','actual_deficit_secondM41B']:
 s+=block('MarkovWeightedDeficitM41B',n)
# The existing base_deficit identity is independent of the shifted kernel.
for n in ['topCenteredM41B','top_centered_identityM41B','top_centered_boundM41B']:
 s+=block('MarkovDeficitAttachmentM41B',n)
s+=block('MarkovCenteredVarianceME87','top_variance_centeredME87')
write('MarkovShiftDeficitME10',['MarkovShiftMomentsME10'],s)
s=''
for n in ['weakDriftM673','weak_gap_identityM673','weak_gap_iffM673']:
 s+=block('MarkovWeakMarginM673',n)
write('MarkovShiftMarginME10',['MarkovShiftDeficitME10'],s)
