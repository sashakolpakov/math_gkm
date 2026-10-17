"""Machine-authored quantitative gap exploration; exact finite evidence only."""
import sys
sys.dont_write_bytecode=True
from check_source_9c28b628 import L,A,S
from fractions import Fraction
from pathlib import Path
import json,time

start=time.monotonic()
out={'status':'Exact finite experiment, not proof','diagonal_checks':0,'vertical_checks':0,'failures':{},'worst':{}}
def test(key,lhs,rhs,point):
    if lhs<rhs:
        z=out['failures'].setdefault(key,{'count':0,'first':point})
        z['count']+=1
    if rhs>0:
        ratio=Fraction(lhs,rhs)
        if key not in out['worst'] or ratio<Fraction(out['worst'][key]['ratio']):
            out['worst'][key]={'ratio':str(ratio),'point':point}
for c in list(range(21))+[30,50,100]:
    for x in [0,1,2,5,10,30,100]:
        for h in [0,1,3,10,50,200]:
            for delta,e in [(1,2),(2,1)]:
                for upper in [False,True]:
                    if not upper:
                        j=3*x+h+c+8-delta
                        D=[L(c+h+2*t,j+2-t,c+t) for t in range(3)]
                        E=[4*A(e,c+t+2,c+t+1,x+2-t,c+h+2*t) for t in range(3)]
                    else:
                        k=3*x+h+c+8-delta
                        D=[S(c+h+4,k+c+t,c+t) for t in range(3)]
                        E=[4*A(e,c+t+1,c+t+2,x,c+h+4) for t in range(3)]
                    pt=[c,x,h,delta,upper];gap=D[1]**2-D[0]*D[2]
                    test('diagonal_curvature',(c+2)*gap,D[0]*D[2],pt)
                    test('diagonal_small_correction',D[0],16*(c+2)*E[0],pt)
                    test('diagonal_unsigned_absorption',gap,D[0]*E[2]+D[2]*E[0],pt)
                    out['diagonal_checks']+=1
                    if not upper:
                        j=3*x+h+c+8-delta
                        D=[L(c+h+4-2*t,j+t,c+1) for t in range(3)]
                        E=[4*A(e,c+3,c+2,x+t,c+h+4-2*t) for t in range(3)]
                    else:
                        k=3*x+h+c+12-delta
                        D=[S(c+h+2+2*t,k+c+1-t,c+1) for t in range(3)]
                        E=[4*A(e,c+2,c+3,x+2-t,c+h+2+2*t) for t in range(3)]
                    gap=D[1]**2-D[0]*D[2]
                    test('vertical_unsigned_absorption',gap,D[0]*E[2]+D[2]*E[0],pt)
                    test('vertical_signed_absorption',gap, D[0]*E[2]+D[2]*E[0]-2*D[1]*E[1],pt)
                    out['vertical_checks']+=1
    Path('evidence/markov-9c28b628/quantitative-probe.json').write_text(json.dumps(out,indent=2))
    print(c,'done',flush=True)
out['seconds']=time.monotonic()-start
Path('evidence/markov-9c28b628/quantitative-probe.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out))
