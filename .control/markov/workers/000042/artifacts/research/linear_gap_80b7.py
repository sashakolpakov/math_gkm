"""Symbolic candidate certificate for first common-weight gap coefficient."""
import sympy as s,json,pathlib
k,a,j,r,m=s.symbols('k a j r m')
R=lambda x:j*x*(a-x)/(a*(2*x-j+1))
ratio=lambda x:(a-x)*(2*x+2)*(2*x+1)/((x+1)*(2*x+2-j)*(2*x+1-j))
g=s.factor(2*ratio(k)**2*R(k+1)-ratio(k)*ratio(k+1)*(R(k)+R(k+2)))
num,den=s.fraction(g)
shift=s.factor(g.subs(a,k+m+2).subs(k,(j+r)/2))
n,d=s.fraction(shift)
p=s.Poly(s.expand(n),j,r,m)
out={'ratio_gap':str(g),'shifted':str(shift),'numerator_terms':[[list(ex),str(c)] for ex,c in p.terms()],'all_numerator_coefficients_nonnegative':all(c>=0 for c in p.coeffs()),'denominator':str(d),'status':'symbolic algebra experiment, not Lean proof or universal source result'}
pathlib.Path('evidence/markov-80b7912a/linear-gap.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
