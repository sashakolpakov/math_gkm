"""New copies of unfinished adapters; no inherited output is overwritten."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-722898f8'
p=O/'reconciliation.json'; d=json.loads(p.read_text());d['conclusion']='Worker 101 finished its final receipts before timeout. Worker 102 ended on model-capacity transport error; adapter5 compiled, adapter4 rejected because redundant simp made no progress (not a timeout). High certificates have no completed replay receipts. New copies repair only the redundant simp; no prior effects are replayed or overwritten.';p.write_text(json.dumps(d,indent=2)+'\n')
names=['MarkovOnsetAdapter4','MarkovOnsetAll','MarkovFourthAfterMiddle','MarkovResidual']
for name in names:
 text=(R/f'research/{name}MAE.lean').read_text().replace('ae37847f','722898f8')
 for x in names:text=text.replace(x+'MAE',x+'M722')
 import re
 for stem in ['source_fourth_onset4_','source_fourth_onset_chamber4','source_fourth_onset','source_fourth_after_middle','FinalFourthRegion','InteriorCore63','root_iff_core']:
  text=re.sub(r'\b('+re.escape(stem)+r'\d*)MAE\b',r'\1M722',text)
 if name=='MarkovOnsetAdapter4':text=text.replace(' simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr\n','')
 if name=='MarkovResidual':text=text.replace('noncomputable section','noncomputable section\nattribute [local irreducible] frame coeff\nset_option maxHeartbeats 4000000')
 (R/f'research/{name}M722.lean').write_text(text)
text=(R/'research/replays_ae37847f.py').read_text().replace('ae37847f','722898f8')
(R/'research/replays_722898f8.py').write_text(text)
