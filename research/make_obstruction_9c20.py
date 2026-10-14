"""Machine-authored exact-source same-degree mixed-gap certificate generator."""
from pathlib import Path
from cuts_fe01 import cutterm
from degree_limited_9c20 import limited
import json
S=(0,1,16);T=(3,9,16);w=(1,)*17
def mask(S):return '['+','.join('(true,'+('true' if i in S else 'false')+')' for i in range(17))+']'
def poly(p):return '+'.join((str(c) if j==0 else ('' if c==1 else str(c)+'*')+'y'+('' if j==1 else '^'+str(j))) for j,c in enumerate(p) if c)
p=cutterm(w,S);q=cutterm(w,T)
source='''import MarkovCutDegree07a7
import MarkovPellRawLC0618
/-! Machine-authored 9c20fccd. Equal cut count and degree do not guarantee
pairwise compatibility, even within an actual source. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000
def leftMask9c20 : List (Bool × Bool) := MASKS
def rightMask9c20 : List (Bool × Bool) := MASKT
theorem sameDegree_source9c20 :
 leftMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 16 true)++[true]) 3 ∧
 rightMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 16 true)++[true]) 3 ∧
 maskDegree07a7 1 leftMask9c20=20 ∧ maskDegree07a7 1 rightMask9c20=20 := by
 decide
theorem sameDegree_polys9c20 {R : Type*} [CommRing R] (y : R) :
 maskWeight340 y y 1 leftMask9c20=POLYP ∧
 maskWeight340 y y 1 rightMask9c20=POLYQ := by
 simp only [leftMask9c20,rightMask9c20,maskWeight340,cutFactorA27,cutChargeA27,
   if_true,if_false,Bool.false_eq_true]
 constructor <;> ring
theorem sameDegree_mixed_failure9c20 :
 let p := maskWeight340 (X:ℤ[X]) X 1 leftMask9c20
 let q := maskWeight340 (X:ℤ[X]) X 1 rightMask9c20
 2*p.coeff 6*q.coeff 6-p.coeff 5*q.coeff 7-q.coeff 5*p.coeff 7 = -9 := by
 obtain ⟨hp,hq⟩ := sameDegree_polys9c20 (X:ℤ[X])
 dsimp only
 rw [hp,hq]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_X,Polynomial.coeff_one]
theorem full_source_still_lc9c20 :
 let m := (frame (List.replicate 16 true)).mid
 m.a=17 ∧ m.b=18 ∧ InPolygon m.a m.b 15 5 ∧
 InPolygon m.a m.b 14 6 ∧ InPolygon m.a m.b 13 7 ∧
 coeff m.p 13 7*coeff m.p 15 5≤coeff m.p 14 6^2 := by
 have ha : (frame (List.replicate 16 true)).mid.a=17 := by rfl
 have hb : (frame (List.replicate 16 true)).mid.b=18 := by rfl
 refine ⟨ha,hb,?_,?_,?_,?_⟩
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · exact source_near_one_diagonal0618 (List.replicate 16 true) (by rw [ha,hb])
     13 5 (by norm_num [ha,hb,InPolygon]) (by norm_num [ha,hb,InPolygon])
     (by norm_num [ha,hb,InPolygon])
#print axioms sameDegree_source9c20
#print axioms sameDegree_mixed_failure9c20
#print axioms full_source_still_lc9c20
end
end MathGKM.Markov
'''.replace('MASKS',mask(S)).replace('MASKT',mask(T)).replace('POLYP',poly(p)).replace('POLYQ',poly(q))
Path('research/MarkovSameDegreeObstruction9c20.lean').write_text(source)
F=limited(w);vals=[sum(v for (s,d,k),v in F.items() if s==3 and k==j) for j in (5,6,7)]
rec=dict(status='exact finite auxiliary/source comparison; formal certificate separate',source=[17,18],s=3,degree=20,S=S,T=T,p=p,q=q,mixed_gap=-9,raw_triple_points=[[15,5],[14,6],[13,7]],raw_triple=vals,raw_gap=vals[1]**2-vals[0]*vals[2])
Path('evidence/markov-9c20fccd/same-degree-witness.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(source=[17,18],mixed_gap=-9,raw_triple=vals,raw_gap=rec['raw_gap'])))
