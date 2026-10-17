"""Machine-authored db238071. Bounded foreground certificate compilation."""
from validate_db238071 import *
group=int(sys.argv[1]); start=int(sys.argv[2]) if len(sys.argv)>2 else [19,19,15,15][group]
for k in range(start,22):
 if (R/'.control/markov/STOP.json').exists():raise SystemExit('stop file present')
 d=run([f'MarkovProduct{group}S{k}MDB2'],'build',180)
 if d.get('returncode')!=0:raise SystemExit(1)
