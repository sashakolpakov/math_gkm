"""Machine-authored final local validation orchestration, foreground only."""
from validate_ce882be3 import *
mods=['MarkovStripGapMCE8','MarkovStripSourceMCE8','MarkovStripChooseMCE8','MarkovStripLCMCE8','MarkovStripCoefficientsMCE8','MarkovStripAllMCE8','MarkovResidualMCE8','MarkovStripGeneralGapMCE8','MarkovStripHalfGapMCE8','MarkovStripHighGapMCE8','MarkovStripGeneralSourceMCE8','MarkovStripGeneralChooseMCE8','MarkovStripGeneralCoefficientsMCE8','MarkovStripGeneralLCMCE8','MarkovStripSmallMCE8','MarkovStripFullMCE8','MarkovResidualFullMCE8']
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
if __name__=='__main__':
 d=run(mods,'replay',240)
 sys.exit(d.get('returncode',1))
