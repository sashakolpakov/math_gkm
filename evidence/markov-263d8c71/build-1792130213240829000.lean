import MarkovRawPrefixM10D
import MathGKM.MarkovBoundary
/-! Machine-authored 263d8c71. Same-count positive-mixture obstruction.
The mixture is formally excluded from all source numerators. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def mixtureWord0M263 : List Bool := [false,false,false,false,true,true,true,true]
def mixturePoly0M263 : BiPoly := (rawPairM10D (expand80 mixtureWord0M263)).2
theorem mixture_expansion0M263 : mixturePoly0M263=
   C (1*X^8+3*X^9+3*X^10+1*X^11)*X^0+
   C (2*X^4+8*X^5+16*X^6+26*X^7+39*X^8+34*X^9+11*X^10)*X^1+
   C (6*X^3+38*X^4+96*X^5+160*X^6+210*X^7+171*X^8+55*X^9)*X^2+
   C (10*X^2+78*X^3+252*X^4+480*X^5+630*X^6+504*X^7+165*X^8)*X^3+
   C (1*X^0+11*X^1+93*X^2+375*X^3+840*X^4+1176*X^5+966*X^6+330*X^7)*X^4+
   C (7*X^0+66*X^1+333*X^2+906*X^3+1428*X^4+1260*X^5+462*X^6)*X^5+
   C (21*X^0+165*X^1+596*X^2+1134*X^3+1134*X^4+462*X^5)*X^6+
   C (35*X^0+220*X^1+570*X^2+696*X^3+330*X^4)*X^7+
   C (35*X^0+165*X^1+279*X^2+165*X^3)*X^8+
   C (21*X^0+66*X^1+55*X^2)*X^9+
   C (7*X^0+11*X^1)*X^10+
   C (1*X^0)*X^11 := by
 simp only [mixturePoly0M263,mixtureWord0M263,rawPairM10D,expand80,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   U,V,map_add,map_mul,map_pow,map_ofNat,map_one,map_zero]
 ring
theorem mixture_triple0M263 :
 coeff mixturePoly0M263 1 4=2 ∧
 coeff mixturePoly0M263 2 4=38 ∧
 coeff mixturePoly0M263 3 4=252 := by
 rw [mixture_expansion0M263]
 norm_num [coeff,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]
theorem mixture_edge0M263 : edgeEval mixturePoly0M263=X^4*(X+1)^7 := by
 simp only [mixturePoly0M263,mixtureWord0M263,rawPairM10D,expand80,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   map_add,map_mul,map_pow,map_ofNat,map_one,map_zero,edgeEval_U,edgeEval_V]
 ring

def mixtureWord1M263 : List Bool := [false,false,true,false,true,false,true,true]
def mixturePoly1M263 : BiPoly := (rawPairM10D (expand80 mixtureWord1M263)).2
theorem mixture_expansion1M263 : mixturePoly1M263=
   C (1*X^8+3*X^9+3*X^10+1*X^11)*X^0+
   C (2*X^6+18*X^7+39*X^8+34*X^9+11*X^10)*X^1+
   C (2*X^4+30*X^5+120*X^6+210*X^7+171*X^8+55*X^9)*X^2+
   C (2*X^2+26*X^3+138*X^4+400*X^5+630*X^6+504*X^7+165*X^8)*X^3+
   C (1*X^0+11*X^1+69*X^2+289*X^3+760*X^4+1176*X^5+966*X^6+330*X^7)*X^4+
   C (7*X^0+66*X^1+309*X^2+866*X^3+1428*X^4+1260*X^5+462*X^6)*X^5+
   C (21*X^0+165*X^1+588*X^2+1134*X^3+1134*X^4+462*X^5)*X^6+
   C (35*X^0+220*X^1+570*X^2+696*X^3+330*X^4)*X^7+
   C (35*X^0+165*X^1+279*X^2+165*X^3)*X^8+
   C (21*X^0+66*X^1+55*X^2)*X^9+
   C (7*X^0+11*X^1)*X^10+
   C (1*X^0)*X^11 := by
 simp only [mixturePoly1M263,mixtureWord1M263,rawPairM10D,expand80,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   U,V,map_add,map_mul,map_pow,map_ofNat,map_one,map_zero]
 ring
theorem mixture_triple1M263 :
 coeff mixturePoly1M263 1 4=0 ∧
 coeff mixturePoly1M263 2 4=2 ∧
 coeff mixturePoly1M263 3 4=138 := by
 rw [mixture_expansion1M263]
 norm_num [coeff,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]
theorem mixture_edge1M263 : edgeEval mixturePoly1M263=X^4*(X+1)^7 := by
 simp only [mixturePoly1M263,mixtureWord1M263,rawPairM10D,expand80,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   map_add,map_mul,map_pow,map_ofNat,map_one,map_zero,edgeEval_U,edgeEval_V]
 ring

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
 have hm : (edgeEval (frame path).mid.p).Monic := by
   rw [boundary_formula]
   exact (monic_X.pow _).mul ((by simpa using monic_X_add_C (1:ℝ)).pow _)
 have hf : edgeEval badMixtureM263=C 33*(X^4*(X+1)^7) := by
   simp only [badMixtureM263,map_add,map_mul,map_ofNat,mixture_edge0M263,mixture_edge1M263]
   norm_num
   ring
 rw [←he,hf] at hm
 have hh : (X^4*(X+1)^7 : ℝ[X]).Monic :=
   (monic_X.pow _).mul ((by simpa using monic_X_add_C (1:ℝ)).pow _)
 have hlead := hh.leadingCoeff_C_mul (33:ℝ)
 have hone := hm.leadingCoeff
 rw [hlead] at hone
 norm_num at hone

end
end MathGKM.Markov
