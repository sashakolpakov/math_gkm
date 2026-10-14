"""Machine-authored exact symbolic discovery, request 863a7482; not proof."""
from lower_symbolic_26ca import *
from functools import reduce
def prod(*xs): return reduce(mul,xs,const(1))
def plus(p,n): return add(p,const(n))
s=scale(add(X,Y),F(1,2)); h=X
gap=add(prod(plus(s,1),plus(scale(s,2),2),plus(scale(s,2),1),plus(h,2),plus(Y,2)),
        scale(prod(s,plus(scale(s,2),4),plus(scale(s,2),3),plus(h,1),plus(Y,1)),-1))
record={'reverse_stride_certificate':lean(gap),'negative_terms':sum(v<0 for v in gap.values()),
        'status':'exact symbolic experiment; no Lean conclusion'}
pathlib.Path('evidence/markov-863a7482/distance-two-symbolic.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record))
