"""Machine-authored sequential numerator-two validation."""
from validate_8ae35b59 import run
for b in [1,2,3,4]:
 if run(f'MarkovMiddleTwoGap{b}M8AE','build',120).get('returncode')!=0:raise SystemExit(1)
raise SystemExit(run('MarkovFourthTwoCompleteM8AE','build',180).get('returncode',1))
