"""Machine-authored exact certificate data. Ordinary Lean ring proves the expansions."""
from experiment_terminal_263d8c71 import pair
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-263d8c71'
words=[[0,0,0,0,1,1,1,1],[0,0,1,0,1,0,1,1]]
def lean_word(w):return '['+','.join('true' if x else 'false' for x in w)+']'
def expr(p):
 terms=[]
 for i in sorted({i for i,j in p}):
  inner=[]
  for (ii,j),c in sorted(p.items()):
   if ii==i:inner.append(f'{c}*X^{j}')
  terms.append('C ('+'+'.join(inner)+f')*X^{i}')
 return '+\n   '.join(terms)
s='''import MarkovRawPrefixM10D
import MathGKM.MarkovBoundary
/-! Machine-authored 263d8c71. Same-count positive-mixture obstruction.
The mixture is formally excluded from all source numerators. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
'''
for t,w in enumerate(words):
 p=pair(w)[1]
 s+=f'''
def mixtureWord{t}M263 : List Bool := {lean_word(w)}
def mixturePoly{t}M263 : BiPoly := (rawPairM10D (expand80 mixtureWord{t}M263)).2
theorem mixture_expansion{t}M263 : mixturePoly{t}M263=
   {expr(p)} := by
 simp only [mixturePoly{t}M263,mixtureWord{t}M263,rawPairM10D,expand80,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   U,V,map_add,map_mul,map_pow,map_ofNat,map_one,map_zero]
 ring
theorem mixture_triple{t}M263 :
 coeff mixturePoly{t}M263 1 4={p.get((1,4),0)} ∧
 coeff mixturePoly{t}M263 2 4={p.get((2,4),0)} ∧
 coeff mixturePoly{t}M263 3 4={p.get((3,4),0)} := by
 rw [mixture_expansion{t}M263]
 simp only [coeff,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]
theorem mixture_edge{t}M263 : edgeEval mixturePoly{t}M263=X^4*(X+1)^7 := by
 simp only [mixturePoly{t}M263,mixtureWord{t}M263,rawPairM10D,expand80,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   map_add,map_mul,map_pow,map_ofNat,map_one,map_zero,edgeEval_U,edgeEval_V]
 ring
'''
s+='''
def badMixtureM263 : BiPoly := 2*mixturePoly0M263+31*mixturePoly1M263

theorem mixture_equal_countsM263 :
 mixtureWord0M263.length=8 ∧ mixtureWord1M263.length=8 ∧
 mixtureWord0M263.count true=4 ∧ mixtureWord1M263.count true=4 := by decide

theorem mixture_components_LCM263 :
 coeff mixturePoly0M263 1 4*coeff mixturePoly0M263 3 4 ≤ coeff mixturePoly0M263 2 4^2 ∧
 coeff mixturePoly1M263 1 4*coeff mixturePoly1M263 3 4 ≤ coeff mixturePoly1M263 2 4^2 := by
 obtain ⟨h0,h1,h2⟩ := mixture_triple0M263
 obtain ⟨g0,g1,g2⟩ := mixture_triple1M263
 norm_num [h0,h1,h2,g0,g1,g2]

theorem mixture_raw_failureM263 :
 coeff badMixtureM263 1 4=4 ∧ coeff badMixtureM263 2 4=138 ∧
 coeff badMixtureM263 3 4=4782 ∧
 coeff badMixtureM263 2 4^2 < coeff badMixtureM263 1 4*coeff badMixtureM263 3 4 := by
 obtain ⟨h0,h1,h2⟩ := mixture_triple0M263
 obtain ⟨g0,g1,g2⟩ := mixture_triple1M263
 have hc (i : ℕ) : coeff badMixtureM263 i 4=
     2*coeff mixturePoly0M263 i 4+31*coeff mixturePoly1M263 i 4 := by
   simp [badMixtureM263,coeff,Polynomial.coeff_ofNat_mul]
 norm_num [hc,h0,h1,h2,g0,g1,g2]

theorem mixture_not_source_polynomialM263 (path : List Bool) :
 badMixtureM263 ≠ (frame path).mid.p := by
 intro he
 have hx : (X+1 : ℝ[X]).Monic := by simpa using monic_X_add_C (1:ℝ)
 have hm : (edgeEval (frame path).mid.p).Monic := by
   rw [boundary_formula]
   exact (monic_X.pow _).mul (hx.pow _)
 have hf : edgeEval badMixtureM263=C 33*(X^4*(X+1)^7) := by
   simp only [badMixtureM263,map_add,map_mul,map_ofNat,mixture_edge0M263,mixture_edge1M263]
   norm_num
   ring
 rw [←he,hf] at hm
 have hh : (X^4*(X+1)^7 : ℝ[X]).Monic :=
   (monic_X.pow _).mul (hx.pow _)
 have hlead := hh.leadingCoeff_C_mul (33:ℝ)
 have hone := hm.leadingCoeff
 rw [hlead] at hone
 norm_num at hone

end
end MathGKM.Markov
'''
(R/'research/MarkovMixtureObstructionM263.lean').write_text(s)
(O/'mixture-certificate-data.json').write_text(json.dumps({'words':words,'coefficients':[[[i,j,c] for (i,j),c in sorted(pair(w)[1].items())] for w in words],'mixture_weights':[2,31],'mixed_triple':[4,138,4782],'gap':-84,'status':'Generated data; Lean ring/coeff proofs are required'},indent=2)+'\n')
