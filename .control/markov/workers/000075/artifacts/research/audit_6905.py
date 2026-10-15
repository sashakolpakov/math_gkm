"""Machine-authored audit preparation. No controller/root writes."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6905e489'
mods=['MarkovTriplePatterns6905','MarkovCyclicPatterns6905','MarkovProjectionJet6905',
 'MarkovCubicClusters6905','MarkovCubicCycle6905','MarkovCubicSource6905',
 'MarkovBooleanJets6905','MarkovCyclicMoments6905','MarkovThirdMoments6905',
 'MarkovMomentSums6905','MarkovSourceMoments6905','MarkovPermutationMoments6905']
names=[]
for m in mods:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',re.sub(r'/\-.*?\-/','',s,flags=re.S)),m
 names.extend(re.findall(r'^theorem\s+(\w+)',s,re.M))
s='\n'.join('import '+m for m in mods)+'\n\n/-! Machine-authored audit of every newly named theorem. -/\n'
s+='\n'.join('#print axioms MathGKM.Markov.'+n for n in names)+'\n'
(R/'research/MarkovAudit6905.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=names),indent=2)+'\n')
print(json.dumps(dict(modules=len(mods),theorems=len(names))))
