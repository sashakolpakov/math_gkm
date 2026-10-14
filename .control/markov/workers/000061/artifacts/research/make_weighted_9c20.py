"""Machine-authored actual-source equal-degree reweighting obstruction."""
from pathlib import Path
from cuts_fe01 import cutterm
from degree_limited_9c20 import limited
import json
S=(0,1,20);T=(6,13,20);w=(1,)*21
def mask(S):return '['+','.join('(true,'+('true' if i in S else 'false')+')' for i in range(21))+']'
def poly(p):return '+'.join((str(c) if j==0 else ('' if c==1 else str(c)+'*')+'y'+('' if j==1 else '^'+str(j))) for j,c in enumerate(p) if c)
p=cutterm(w,S);q=cutterm(w,T)
source='''import MarkovSameDegreeObstruction9c20
/-! Machine-authored 9c20fccd. Arbitrary nonnegative reweighting fails even
among terms with equal degree and cut count in one actual source. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 15000
def flatMask9c20 : List (Bool × Bool) := MASKS
def curvedMask9c20 : List (Bool × Bool) := MASKT
theorem weighted_masks_source9c20 :
 flatMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 20 true)++[true]) 3 ∧
 curvedMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 20 true)++[true]) 3 ∧
 maskDegree07a7 1 flatMask9c20=24 ∧ maskDegree07a7 1 curvedMask9c20=24 := by
 decide
theorem weighted_mask_polys9c20 {R : Type*} [CommRing R] (y : R) :
 maskWeight340 y y 1 flatMask9c20=POLYP ∧
 maskWeight340 y y 1 curvedMask9c20=POLYQ := by
 simp only [flatMask9c20,curvedMask9c20,maskWeight340,cutFactorA27,cutChargeA27,
   if_true,if_false,Bool.false_eq_true]
 constructor <;> ring
theorem weighted_sameDegree_failure9c20 :
 let p := 26*maskWeight340 (X:ℤ[X]) X 1 flatMask9c20+
   maskWeight340 (X:ℤ[X]) X 1 curvedMask9c20
 p.coeff 6=2352 ∧ p.coeff 7=2669 ∧ p.coeff 8=3029 ∧
 p.coeff 7^2-p.coeff 6*p.coeff 8 = -647 := by
 obtain ⟨hp,hq⟩ := weighted_mask_polys9c20 (X:ℤ[X])
 dsimp only
 rw [hp,hq]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_X,Polynomial.coeff_one]
theorem weighted_source_raw_lc9c20 :
 let m := (frame (List.replicate 20 true)).mid
 m.a=21 ∧ m.b=22 ∧ InPolygon m.a m.b 18 6 ∧
 InPolygon m.a m.b 17 7 ∧ InPolygon m.a m.b 16 8 ∧
 coeff m.p 16 8*coeff m.p 18 6≤coeff m.p 17 7^2 := by
 have ha : (frame (List.replicate 20 true)).mid.a=21 := by rfl
 have hb : (frame (List.replicate 20 true)).mid.b=22 := by rfl
 refine ⟨ha,hb,?_,?_,?_,?_⟩
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · exact source_near_one_diagonal0618 (List.replicate 20 true) (by rw [ha,hb])
     16 6 (by norm_num [ha,hb,InPolygon]) (by norm_num [ha,hb,InPolygon])
     (by norm_num [ha,hb,InPolygon])
#print axioms weighted_masks_source9c20
#print axioms weighted_sameDegree_failure9c20
#print axioms weighted_source_raw_lc9c20
end
end MathGKM.Markov
'''.replace('MASKS',mask(S)).replace('MASKT',mask(T)).replace('POLYP',poly(p)).replace('POLYQ',poly(q))
Path('research/MarkovWeightedDegree9c20.lean').write_text(source)
F=limited(w);vals=[sum(v for (s,d,k),v in F.items() if s==3 and k==j) for j in (6,7,8)]
rec=dict(status='exact finite auxiliary/source comparison; formal certificate separate',source=[21,22],s=3,degree=24,S=S,T=T,p=p,q=q,weights=[26,1],weighted_triple=[2352,2669,3029],weighted_gap=-647,raw_triple_points=[[18,6],[17,7],[16,8]],raw_triple=vals,raw_gap=vals[1]**2-vals[0]*vals[2])
Path('evidence/markov-9c20fccd/weighted-degree-witness.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(source=[21,22],weighted_gap=-647,raw_triple=vals,raw_gap=rec['raw_gap'])))
