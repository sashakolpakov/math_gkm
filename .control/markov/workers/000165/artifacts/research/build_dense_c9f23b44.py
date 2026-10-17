"""Machine-authored c9f23b44. Bounded sequential foreground certificate builds."""
from validate_c9f23b44 import *
group=int(sys.argv[1]); start=int(sys.argv[2]) if len(sys.argv)>2 else 1
for k in range(start,22):
 if (R/'.control/markov/STOP.json').exists():
  print('STOP observed');sys.exit(2)
 d=run([f'MarkovDenseProduct{group}S{k}MC9F'],timeout=180)
 if d.get('returncode')!=0:sys.exit(1)
