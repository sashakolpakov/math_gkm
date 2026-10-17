"""Machine-authored exact symbolic correction jets; conjectures until checked in Lean."""
from weighted_beta_symbolic_ca9709f2 import P,var,expr,co
from fractions import Fraction as F
from math import lcm
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-80fb7777'
q,k=var(0),var(1)
def choose(p,n):
 out=P(1)
 for i in range(n):out=out*(p-i)*F(1,i+1)
 return out
def fib(n,t,c):
 if c==0:return P(int(t==0))
 if t==0:return P()
 return choose(P(t-1),c-1)*choose(n-t+c,c)
def gain(q,k,r,c):
 if k==0:return P((2 if r else 1) if c==0 else 0)
 if r:return (fib(q,k-1,c-1) if c else P())+fib(q,k-1,c)+fib(q,k,c)+fib(q+1,k,c)
 return fib(q,k-1,c)+(fib(q+1,k-1,c-1) if c else P())+fib(q+1,k-1,c)+fib(q+1,k,c)
def interpolate(values):
 out=P();level=values[:];i=0
 while level:
  out=out+choose(k,i)*level[0]
  level=[b-a for a,b in zip(level,level[1:])];i+=1
 return out
def rat_expr(p):
 den=lcm(*(v.denominator for v in p.d.values())) if p.d else 1
 e=expr(p*den,['q','k','z','w'])
 return f'({e})/{den}' if den!=1 else '('+e+')'
def weighted(a,m,c):return choose(a+m+1,c+2)-choose(a+1,c+2)-m*choose(a,c+1)
jets={}
out={}
for r in [False,True]:
 rows=[]
 for j in range(14):
  prev=rows[-1] if j else [P()]*5;prev2=rows[-2] if j>=2 else [P()]*5
  rows.append([P()]+[4*gain(q,j,r,c-1)+2*prev[c]-2*prev[c-1]-prev2[c]-2*prev2[c-1]-(prev2[c-2] if c>=2 else P()) for c in range(1,5)])
 js=[interpolate([v[c] for v in rows[:10]]) for c in range(5)]
 for j in range(14):
  assert all(co(js[c].ev([q,P(j),P(),P()])).d==rows[j][c].d for c in range(5))
 jets[r]=js
 b=3*q+(1 if r else 2);t=q+3+k
 A=4*(t-2)*choose(b-2*t+6,2)+js[2]
 B=choose(b+5-t,3)+4*weighted(b-2*t+8,t-3,3)+js[3]
 C=(t-3)*choose(b+6-t,4)+4*(5*weighted(b-2*t+9,t-3,5)+(4-(b-2*t+9))*weighted(b-2*t+9,t-3,4))+js[4]
 # q >= 2k+5 for true, >= 2k+4 for false, exactly n >= 2t.
 gap=(B*B-A*C).ev([q+2*k+(5 if r else 4),k,P(),P()])
 out[str(r)]=dict(jets=[rat_expr(p) for p in js],raw=[rat_expr(p) for p in [A,B,C]],gap_terms=len(gap.d),negative=[(ex,str(v)) for ex,v in gap.d.items() if v<0])
 print(r,'gap terms',len(gap.d),'negative',len(out[str(r)]['negative']))
 (O/f'gap-{r}.txt').write_text(rat_expr(gap))
(O/'correction-jets-probe.json').write_text(json.dumps(out,indent=2))
src='''import MarkovMiddlePositiveM99A
/-! Machine-authored 80fb7777. Rational polynomial expressions for raw correction jets. -/
namespace MathGKM.Markov
noncomputable section
'''
for c in range(1,5):
 src+=f'def correctionJet{c}M80F (q k : ℚ) (r : Bool) : ℚ :=\n if r then {rat_expr(jets[True][c])} else {rat_expr(jets[False][c])}\n\n'
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovCorrectionJetDefsM80F.lean').write_text(src)

# Emit a universal rational certificate for the total gap, not only its correction.
src="""import MarkovCorrectionJetDefsM80F
/-! Machine-authored 80fb7777. Total middle gap certificate, with cross terms. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 30000
"""
for c,name in [(2,"Second"),(3,"Third"),(4,"Fourth")]:
 src+=f"def sourceJet{c}M80F (q k : ℚ) (r : Bool) : ℚ :=\n top{name}QM55C (q+k-2) ((if r then 1 else 2)-4-3*k)+correctionJet{c}M80F q k r\n\n"
for r in [False,True]:
 b=3*q+(1 if r else 2);t=q+3+k
 A=4*(t-2)*choose(b-2*t+6,2)+jets[r][2]
 B=choose(b+5-t,3)+4*weighted(b-2*t+8,t-3,3)+jets[r][3]
 C=(t-3)*choose(b+6-t,4)+4*(5*weighted(b-2*t+9,t-3,5)+(4-(b-2*t+9))*weighted(b-2*t+9,t-3,4))+jets[r][4]
 gap=(B*B-A*C).ev([q+2*k+(5 if r else 4),k,P(),P()])
 den=lcm(*(v.denominator for v in gap.d.values()));e=expr(gap*den,["x","k","z","w"])
 rv=str(r).lower();base=5 if r else 4
 src+=f"""theorem source_gap_{rv}M80F (x k : ℚ) (hx : 0 ≤ x) (hk : 0 ≤ k) :
 sourceJet2M80F (x+2*k+{base}) k {rv}*sourceJet4M80F (x+2*k+{base}) k {rv}<
 sourceJet3M80F (x+2*k+{base}) k {rv}^2 := by
 have he : {den}*(sourceJet3M80F (x+2*k+{base}) k {rv}^2-
   sourceJet2M80F (x+2*k+{base}) k {rv}*sourceJet4M80F (x+2*k+{base}) k {rv})={e} := by
   unfold sourceJet2M80F sourceJet3M80F sourceJet4M80F
   unfold correctionJet2M80F correctionJet3M80F correctionJet4M80F
   unfold topSecondQM55C topThirdQM55C topFourthQM55C weightedChooseQM55C
   norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<{e} := by positivity
 linarith only [he,hp]

"""
src+="end\nend MathGKM.Markov\n"
(R/"research/MarkovMiddleGapM80F.lean").write_text(src)
