"""Machine-authored c9f23b44. Bounded foreground Boolean certificate builds."""
from validate_c9f23b44 import *
a=int(sys.argv[1])
for k in ([21] if a==1 else [18,21]):
 if (R/'.control/markov/STOP.json').exists():sys.exit(2)
 d=run([f'MarkovBooleanBatch{a}S{k}MC9F'],timeout=180)
 if d.get('returncode')!=0:sys.exit(1)
