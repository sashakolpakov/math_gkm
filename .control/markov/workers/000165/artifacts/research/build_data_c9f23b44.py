"""Machine-authored c9f23b44. Bounded foreground data certificate builds."""
from validate_c9f23b44 import *
a=int(sys.argv[1])
for k in ([21] if a in [0,1] else [18,21]):
 if (R/'.control/markov/STOP.json').exists():sys.exit(2)
 d=run([f'MarkovDataBatch{a}S{k}MC9F'],timeout=150)
 if d.get('returncode')!=0:sys.exit(1)
