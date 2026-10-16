"""Machine-authored exact symbolic sparse numerator, suggested next proof target.
This script is symbolic experimental evidence; the companion Lean jet identities
are separately validated. No interpolation is used to derive H0,H1,H2.
"""
from pathlib import Path
import json,time
import horizontal_third_13d40bd7 as sp
sp.N=6
a,r,s,q,v,t=[sp.var(i) for i in range(6)]
def AP(q):return -q+(-q-3)*v+(q-2)*v**2+(q+1)*v**3
def BL(q):return (8*q-8)*v+(8*q-32)*v**2+(-8*q-40)*v**3+(-8*q-16)*v**4
def BP(q):return q*q+q+(2*q*q+10*q+8)*v+(-q*q+15*q+32)*v**2+(-4*q*q-4*q+40)*v**3+(-q*q-17*q+16)*v**4+(2*q*q-6*q)*v**5+(q*q+q)*v**6
def terms(z):return [[list(e),str(c)] for e,c in sorted(z.items())]
def main():
 start=time.monotonic();h=1+v;z=1-v
 A=4*v+t*AP(q);A1=4*v+v*t*AP(q+1)
 B=BL(q)+t*BP(q);B1=BL(q+1)+v*t*BP(q+1)
 F=2-t-v*t;D=(a-r)*v*A+r*A1
 N=D*D-(a-r)*v*v*A*A-r*A1*A1+t*v*((a-r)*v*B+r*B1)
 N+=2*v*(a*v*v*F*F+4*r*v*F*z+4*s*z*z)*z*z
 N-=2*h*t*v*D*z*z
 N+=2*h*h*t*t*v*v*z**4
 blocks=[sp.P({e[:5]+(0,):c for e,c in N.items() if e[5]==i}) for i in range(3)]
 assert all(e[5]<=2 for e in N)
 out=dict(status='Exact symbolic candidate for sparse numerator; not a Lean sparse identity or LC proof',
 variables=['a','r','s','q','v','t'],substitution='q=n+1, t=v^q; (1-v)^4*Nseed = H0+t*H1+t^2*H2',
 blocks=[terms(z) for z in blocks],degrees=[max(e[4] for e in z) for z in blocks],
 next='Prove the sparse identity using vJet_closedMDE6, then coefficient extraction through (1-v)^-4 gives piecewise cubic expressions. Prove their LC retaining source s=max(2r-a,0), all natural q, and zeros.',seconds=time.monotonic()-start)
 p=Path('/Users/sasha/math_gkm/evidence/markov-de6168c6/sparse-candidate.json')
 p.write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['blocks']}))
if __name__=='__main__':main()
