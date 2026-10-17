"""Machine-authored db238071. Foreground, bounded dependent build chain."""
from validate_db238071 import *
prefix,group,start,limit=sys.argv[1],int(sys.argv[2]),int(sys.argv[3]),int(sys.argv[4])
for k in range(start,22):
 if (R/'.control/markov/STOP.json').exists():raise SystemExit('stop file present')
 d=run([f'Markov{prefix}{group}S{k}MDB2'],'build',limit)
 if d.get('returncode')!=0:raise SystemExit(1)
