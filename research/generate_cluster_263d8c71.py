"""Machine-authored finite enlarged-word certificate, checked by ordinary Lean."""
from experiment_terminal_263d8c71 import pair
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-263d8c71'
w=(0,)*10+(1,)*3;p=pair(w)[1]
def polyexpr(p):
 return '+\n   '.join('C ('+'+'.join(f'{c}*X^{j}' for (ii,j),c in sorted(p.items()) if ii==i)+f')*X^{i}' for i in sorted({i for i,j in p}))
prefixq,prefixp=pair((0,)*8)
terms=[]
for i in sorted({i for i,j in p}):
 inner='+'.join(f'{c}*X^{j}' for (ii,j),c in sorted(p.items()) if ii==i)
 terms.append(f'C ({inner})*X^{i}')
expression='+\n   '.join(terms)
s='''import MarkovRawPrefixM10D
import MarkovThirdAllMF8
/-! Machine-authored 263d8c71. Polygon-valid vertical failure in an enlarged
original-word family; excluded from every actual source numerator. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def clusteredWordM263 : List Bool := List.replicate 10 false++List.replicate 3 true
def clusteredPolyM263 : BiPoly := (rawPairM10D (expand80 clusteredWordM263)).2
'''
s+=f'''theorem clustered_prefixM263 : rawPairM10D (List.replicate 8 false)=
 ( {polyexpr(prefixq)}, {polyexpr(prefixp)} ) := by
 simp only [rawPairM10D,List.replicate_succ,List.replicate_zero,List.foldl_cons,
   List.foldl_nil,rawAtomicM10D,Bool.false_eq_true,ite_false,U,V,
   map_add,map_mul,map_pow,map_ofNat,map_one,map_zero]
 apply Prod.ext <;> dsimp only <;> ring

theorem clustered_expansionM263 : clusteredPolyM263=
   {expression} := by
 change (([false,false,false,true,false,true,false,true].foldl rawAtomicM10D
   (rawPairM10D (List.replicate 8 false))).2)=_
 rw [clustered_prefixM263]
 simp only [
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   U,V,map_add,map_mul,map_pow,map_ofNat,map_one,map_zero]
 ring
'''
s+='''
theorem clustered_tripleM263 : coeff clusteredPolyM263 3 0=1 ∧
 coeff clusteredPolyM263 3 1=8 ∧ coeff clusteredPolyM263 3 2=82 := by
 rw [clustered_expansionM263]
 simp only [coeff,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]

theorem clustered_countsM263 : clusteredWordM263.length=13 ∧
 clusteredWordM263.count true=3 := by decide

theorem clustered_polygon_failureM263 :
 InPolygon 3 13 3 0 ∧ InPolygon 3 13 3 1 ∧ InPolygon 3 13 3 2 ∧
 coeff clusteredPolyM263 3 1^2 < coeff clusteredPolyM263 3 0*coeff clusteredPolyM263 3 2 := by
 obtain ⟨h0,h1,h2⟩ := clustered_tripleM263
 norm_num [InPolygon,h0,h1,h2]

theorem clustered_not_source_wordM263 (path : List Bool) :
 sourceWord28 path ≠ clusteredWordM263 := by
 intro he
 obtain ⟨ha,hb⟩ := source_word_counts28 path
 rw [he,clustered_countsM263.1] at hb
 rw [he,clustered_countsM263.2] at ha
 have h := source_take_floor3eda path 5 (by omega)
 rw [he,←ha,←hb] at h
 norm_num [clusteredWordM263] at h

theorem clustered_not_source_polynomialM263 (path : List Bool) :
 clusteredPolyM263 ≠ (frame path).mid.p := by
 intro he
 have h := vertical_third_allMF8 path 0
 rw [←he] at h
 obtain ⟨h0,h1,h2⟩ := clustered_tripleM263
 norm_num [h0,h1,h2] at h

end
end MathGKM.Markov
'''
(R/'research/MarkovClusteredObstructionM263.lean').write_text(s)
(O/'clustered-certificate-data.json').write_text(json.dumps({'word':w,'counts':[3,13],'triple':[1,8,82],'gap':-18,'coefficients':[[i,j,c] for (i,j),c in sorted(p.items())],'status':'Certificate data; Lean check required'},indent=2)+'\n')
