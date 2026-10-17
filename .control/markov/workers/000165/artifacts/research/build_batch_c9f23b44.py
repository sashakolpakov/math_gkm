"""Machine-authored c9f23b44. Bounded foreground batched certificates."""
from validate_c9f23b44 import *
group=int(sys.argv[1]);start=int(sys.argv[2]) if len(sys.argv)>2 else 5
for k in [9,14,18,21]:
 if k<start:continue
 if (R/'.control/markov/STOP.json').exists():sys.exit(2)
 d=run([f'MarkovDenseBatch{group}S{k}MC9F'],timeout=240)
 if d.get('returncode')!=0:sys.exit(1)
