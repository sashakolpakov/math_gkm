"""Machine-authored generator. Generated identities require Lean checking."""
from horizontal_fourth_5110b3fa import *
names=['a','b','q','t','u','v','w','z','x','h'];params='a b q t u v w z'
head='''/-! Machine-authored request 5110b3fa. Exact fourth-row polynomial data. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
'''
s='import MarkovHorizontalScaledM13D\n'+head
for k,c in enumerate(cs):s+=f'\ndef h4c{k}M511 {{R : Type*}} [CommRing R] ({params} : R) : R :=\n '+lean(c,names)+'\n'
s+=f'\ndef h4seedM511 {{R : Type*}} [CommRing R] ({params} : R) : R[X] :=\n '+'+\n '.join(f'C (h4c{k}M511 {params})'+(f'*X^{k}' if k else '') for k in range(8))+'\n'
s+='\ndef h4vM511 (a b : ℕ) : ℕ := if 2*a≤b then min (b-2*a) (4*a-b) else 0\n'
s+='\ndef h4wM511 (a b : ℕ) : ℕ := if 2*a≤b then 0 else if 3*a≤2*b then 2*a-b else b-a\n'
s+='\ndef h4zM511 (a b : ℕ) : ℕ := 4*a-3*b\n'
s+='\ndef H4BoundsM511 (a b q t u v w z : ℝ) : Prop :=\n '+' ∧\n '.join([f'0 ≤ h4c{k}M511 {params}' for k in range(3)]+[f'0 < h4c{k}M511 {params}' for k in range(3,8)]+[f'h4c{k}M511 {params}*h4c{k+2}M511 {params} ≤ (h4c{k+1}M511 {params})^2' for k in range(6)])+'\n'
s+='end\nend MathGKM.Markov\n';(R/'research/MarkovHorizontalFourthSeedM511.lean').write_text(s)
s='import MarkovFourthGenericM511\nimport MarkovHorizontalFourthSeedM511\n'+head
s+='\ndef h4localNumM511 (x : ℝ) (p q r s : Bool) : ℝ :=\n'
def tree(prefix):
 if len(prefix)==4:
  n=x**3*h**8*loc[tuple(prefix)]
  assert all(min(e)>=0 for e in n)
  n=n.subst([a,b,q,t,u,v,w,z,x,1+x])
  return '('+lean(n,names)+')'
 return '(if '+['p','q','r','s'][len(prefix)]+' then '+tree(prefix+[1])+' else '+tree(prefix+[0])+')'
s+=' '+tree([])+'\n'
s+='''
theorem h4local_closedM511 (x : ℝ) (hx : x≠0) (hh : x+1≠0) (p q r s : Bool) :
 hlocalFourM511 (hprojM13D x) p q r s=h4localNumM511 x p q r s/(x^3*(x+1)^8) := by
 cases p <;> cases q <;> cases r <;> cases s <;>
 norm_num only [hlocalFourM511,localFour01F,headRatioOne01F,headRatioTwo01F,
   headRatioThree01F,hprojM13D,h4localNumM511,Bool.false_eq_true,if_false,if_true,
   Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,
   Polynomial.coeff_X_pow,Polynomial.coeff_one] <;>
 field_simp <;> ring

def h4valM511 (x a b q t u v w z : ℝ) : ℝ :=
 let f := hlocalFourM511 (hprojM13D x)
 b*f false false false false+boolMomentADB2 (fourTripleBE f) b a q t u+
 v*fourQuadBE f true false false true+
 w*(fourQuadBE f true true false true+fourQuadBE f true false true true)+
 z*fourQuadBE f true true true true
'''
s+=f'\ndef h4numM511 (x {params} : ℝ) : ℝ :=\n '+lean(Mn,names)+'\n'
s+='''
theorem h4val_closedM511 (x a b q t u v w z : ℝ) (hx : x≠0) (hh : x+1≠0) :
 h4valM511 x a b q t u v w z=h4numM511 x a b q t u v w z/(x^3*(x+1)^8) := by
 simp only [h4valM511,boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,
   fourCanonicalBE,fourPotentialBE,h4local_closedM511 x hx hh,h4localNumM511,h4numM511,
   Bool.false_eq_true,if_false,if_true]
 field_simp
 <;> ring

theorem h4source_valM511 (x : ℝ) (path : List Bool) :
 fourMomentBE (hlocalFourM511 (hprojM13D x)) (frame path).mid.b (frame path).mid.a=
 h4valM511 x (frame path).mid.a (frame path).mid.b
   (2*(frame path).mid.a-(frame path).mid.b:ℕ)
   (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ)
   (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)
   (h4vM511 (frame path).mid.a (frame path).mid.b)
   (h4wM511 (frame path).mid.a (frame path).mid.b)
   (h4zM511 (frame path).mid.a (frame path).mid.b) := by
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 change fourMomentBE _ b a=h4valM511 x a b _ _ _ _ _ _
 unfold fourMomentBE fourSourceMoment897 h4valM511 h4vM511 h4wM511 h4zM511
 split_ifs <;> try omega
 all_goals first
 | (have hz : 4*a-3*b=0 := by omega; rw [hz]; simp)
 | simp
end
end MathGKM.Markov
'''
(R/'research/MarkovHorizontalFourthScaledM511.lean').write_text(s)
print('Generated seed and exact scalar identities')
