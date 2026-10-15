"""Machine-authored exact inventory and axiom audit source; no goal admission."""
from pathlib import Path
import json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-e2cd486c'
mods=['MarkovTerminalAlgebraE2','MarkovFourthPolyE2','MarkovTerminalExtractE2',
 'MarkovTerminalGapsE2','MarkovTerminalChambersE2','MarkovTerminalCoefficientsE2',
 'MarkovTerminalSourceE2','MarkovRun4LowOneE2','MarkovRun4LowLargeE2',
 'MarkovRun4HighOneE2','MarkovRun4HighLargeE2','MarkovCrossCoefficientsE2',
 'MarkovRun4CombineE2','MarkovLongSourceE2','MarkovResidualE2']
ths=[(m,n) for m in mods for n in re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M)]
out='\n'.join('import '+m for m in mods)+'\n/-! Machine-authored explicit theorem closure audit. -/\n'
out+='\n'.join('#print axioms MathGKM.Markov.'+n for _,n in ths)+'\n'
(R/'research/MarkovAuditE2.lean').write_text(out)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=ths,excluded=[]),indent=2)+'\n')
print(json.dumps(dict(modules=len(mods),theorems=len(ths))))
