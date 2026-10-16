"""Machine-authored candidate generation. Lean checks closed forms by induction."""
from explore_1152282d import *
from fractions import Fraction
def lean(p,names=['a','b','c','d','e','X']):
 if not p:return '0'
 out=[]
 for k,v in sorted(p.items()):
  assert v.denominator==1
  term='*'.join(([str(abs(v))] if abs(v)!=1 or not any(k) else [])+[names[i]+(f'^{t}' if t>1 else '') for i,t in enumerate(k) if t])
  out.append(('-' if v<0 else '+')+term)
 s=''.join(out)
 return s[1:] if s.startswith('+') else s
def raw(q):
 g=z.block(q)
 return [[v*z.x**q for v in g[k]] for k in [3,2,1,0]]
def fit(vals):
 out=[Fraction(0)]*len(vals)
 for i,y0 in enumerate(vals):
  pp=[Fraction(y0)];den=1
  for j in range(len(vals)):
   if i==j:continue
   rr=[Fraction(0)]*(len(pp)+1)
   for k,c0 in enumerate(pp):rr[k]-=c0*(16+j);rr[k+1]+=c0
   pp=rr;den*=i-j
  for k,c0 in enumerate(pp):out[k]+=c0/den
 return out
def candidate(entry,jet,denom,scale):
 rows=[]
 for q in range(16,20):
  p=scale*(1-z.x)**denom*raw(q)[entry][jet]
  row={}
  for k,v in p.items():
   band,off=divmod(k[5],q);assert band<2
   row[band,off]=v
  rows.append(row)
 out=[sp.poly(0),sp.poly(0)]
 for band,off in set().union(*(set(row) for row in rows)):
  for j,v in enumerate(fit([row.get((band,off),0) for row in rows])):
   if v:out[band]+=sp.P({(j,0,0,0,0,off):v})
 for q in range(1,16):
  actual=scale*(1-z.x)**denom*raw(q)[entry][jet]
  assert actual==out[0].subst([q,0,0,0,0,z.x])+z.x**q*out[1].subst([q,0,0,0,0,z.x])
 return out
def main():
 cs=candidate(0,3,6,6);gs=candidate(1,2,3,1)
 s='''import MarkovVerticalJetClosedMDE6
/-! Machine-authored 1152282d. Third-order and off-diagonal run jets. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option linter.unusedSimpArgs false

def vCJM115 (n : ℕ) : ℤ[X] :=
 (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).a.coeff 3
def vGJM115 (n : ℕ) : ℤ[X] :=
 (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).b.coeff 2

theorem vJet3_recurrencesM115 (n : ℕ) :
 vCJM115 (n+2)=(X+1)*vCJM115 (n+1)+(X+1)^2*vBJMDE6 (n+1)-X*vCJM115 n ∧
 vGJM115 (n+2)=(X+1)*vGJM115 (n+1)+(X+1)^2*vFJMDE6 (n+1)-X*vGJM115 n := by
 have h := vKa_cayleyMDE6 (X:ℤ[X]) (vKwordM9E1 X (runBlock025 n))
 rw [←vPolyRun_stepMDE6,←vPolyRun_stepMDE6] at h
 have hc := congrArg (fun p : BiPoly => p.coeff 3) h.1
 have hg := congrArg (fun p : BiPoly => p.coeff 2) h.2
 simp only [Polynomial.coeff_sub,add_mul,mul_assoc,Polynomial.coeff_add,
   Polynomial.coeff_C_mul,Polynomial.coeff_X_mul] at hc hg
 constructor
 · simpa only [vCJM115,vBJMDE6,add_mul,one_mul,Nat.add_assoc] using hc
 · simpa only [vGJM115,vFJMDE6,add_mul,one_mul,Nat.add_assoc] using hg
'''
 for name,p in [('vCLM115',cs[0]),('vCPM115',cs[1]),('vGLM115',gs[0]),('vGPM115',gs[1])]:s+=f'\ndef {name} (q : ℤ[X]) : ℤ[X] :=\n {lean(p,["q","b","c","d","e","X"])}\n'
 for name,entry,jet in [('vCJM115',0,3),('vGJM115',1,2)]:
  for n in range(2):
   rhs=lean(raw(n+1)[entry][jet])
   s+=f'''\ntheorem {name}_initial{n} : {name} {n}={rhs} := by
 norm_num [{name},runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
   vKaM9E1,vKcM9E1,mm16,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   Polynomial.coeff_one,Polynomial.coeff_X]
 <;> ring
'''
 s+='''
theorem vJet3_closedM115 (n : ℕ) :
 6*(1-X)^6*vCJM115 n=vCLM115 (n+1)+X^(n+1)*vCPM115 (n+1) ∧
 (1-X)^3*vGJM115 n=vGLM115 (n+1)+X^(n+1)*vGPM115 (n+1) := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [vCJM115_initial0,vGJM115_initial0]
   constructor <;> norm_num [vCLM115,vCPM115,vGLM115,vGPM115] <;> ring
 | one =>
   rw [vCJM115_initial1,vGJM115_initial1]
   constructor <;> norm_num [vCLM115,vCPM115,vGLM115,vGPM115] <;> ring
 | more n h0 h1 =>
   obtain ⟨hc,hg⟩ := vJet3_recurrencesM115 n
   obtain ⟨_,hb,hf⟩ := vJet_closedMDE6 (n+1)
   obtain ⟨c0,g0⟩ := h0
   obtain ⟨c1,g1⟩ := h1
   simp only [vCLM115,vCPM115,vGLM115,vGPM115,vBLMDE6,vBPMDE6,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_add,pow_succ] at c0 g0 c1 g1 hb hf hc hg ⊢
   constructor
   · linear_combination 6*(1-X)^6*hc+(X+1)*c1-X*c0+3*(X+1)^2*(1-X)^2*hb
   · linear_combination (1-X)^3*hg+(X+1)*g1-X*g0+(X+1)^2*(1-X)^2*hf
end
end MathGKM.Markov
'''
 (R/'research/MarkovThirdJetsM115.lean').write_text(s)
 print('Generated third jets',[(len(p),lean(p,['q','b','c','d','e','X'])) for p in cs+gs])
if __name__=='__main__':main()
