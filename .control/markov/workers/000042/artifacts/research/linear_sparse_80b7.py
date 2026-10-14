"""Exact sparse algebra after unavailable SymPy; finite symbolic experiment."""
import layer_symbolic_6a40862b as p
import json,pathlib
from fractions import Fraction as F
p.N=3
j,r,m=[p.var(i) for i in range(3)]
k=p.scale(p.add(j,r),F(1,2));ak=p.add(m,p.const(2))
T=p.sub(p.sub(
 p.prod(p.const(2),ak,p.add(p.scale(k,2),p.const(1)),p.add(k,p.const(1)),p.add(r,p.const(4)),p.add(r,p.const(5))),
 p.prod(k,ak,p.add(p.scale(k,2),p.const(3)),p.add(r,p.const(2)),p.add(r,p.const(5)))),
 p.prod(p.add(k,p.const(2)),m,p.add(p.scale(k,2),p.const(3)),p.add(r,p.const(1)),p.add(r,p.const(2))))
out={'variables':['j','r','m'],'substitution':'r=2k-j>=0, m=a-k-2>=0',
 'certificate':'T=2(a-k)(2k+1)(k+1)(r+4)(r+5)-k(a-k)(2k+3)(r+2)(r+5)-(k+2)(a-k-2)(2k+3)(r+1)(r+2)',
 'normalized_gap':'G1/A0(k)^2=4j(a-k)(a-k-1)(2k+1)T/[a(r+1)^2(r+2)^2(r+3)(r+4)(r+5)]',
 'terms':[[list(e),str(c)] for e,c in sorted(T.items())],
 'nonnegative_coefficients':all(c>=0 for c in T.values()),'status':'symbolic experiment; rational identity and coefficient bridge not yet Lean-checked; excludes r<0 boundary'}
pathlib.Path('evidence/markov-80b7912a/linear-gap.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
