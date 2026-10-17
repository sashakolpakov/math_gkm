"""Machine-authored foreground rebuild of retained interrupted sources."""
from validate_eb6a9001 import *
mods=['MarkovTopFourthM55C','MarkovTopSecondGapM55C','MarkovTopSecondSourceM55C','MarkovTopKernelM55C','MarkovTopMomentsM55C','MarkovTopSectorM55C','MarkovTopObstructionsM55C','MarkovTopRegionM55C','MarkovTopParameterPolyM55C','MarkovTopLeadingM55C']
for m in mods:
 d=run([m],timeout=120)
 if d.get('returncode')!=0:sys.exit(1)
(O/'recovered-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
