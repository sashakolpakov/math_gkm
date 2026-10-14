"""Machine-authored generator of explicit ring identities, checked by Lean."""
from palindrome_scan_3eda import poly
from pathlib import Path
w=tuple(c=='C' for c in 'ACAAAAACA');p=poly(w)
terms=[]
for i in range(max(i for i,j in p)+1):
 terms.append('C ('+'+'.join(f'{c}*X^{j}' for (ii,j),c in sorted(p.items()) if ii==i)+f')*X^{i}')
exp=' +\n    '.join(terms)
row='+'.join(f'{c}*X^{j}' for (i,j),c in sorted(p.items()) if i==1)
s='''import MarkovSquares28b1
import MarkovObstructionF80
import MarkovPolygon18
/-! Machine-authored 3edac4bf. A balanced palindrome obstruction to a
broadened sufficient condition. This is NOT a source counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
def badCore3eda : List Bool := [false,true,false,false,false,false,false,true,false]
def badPoly3eda : BiPoly := gasScalar80 U V 1 badCore3eda

theorem badCore_palindrome3eda : List.Palindrome badCore3eda := by decide
theorem badCore_balanced3eda : Balanced80 badCore3eda := by unfold Balanced80 badCore3eda; decide

theorem badCore_coeff3eda : coeff badPoly3eda 1 5=8 ∧
 coeff badPoly3eda 1 6=12 ∧ coeff badPoly3eda 1 7=20 := by
 have he : badPoly3eda =
    EXP := by
   simp only [badPoly3eda,badCore3eda,gasScalar80,gasWord80,gasT80,mm16,
     Bool.false_eq_true,if_false,if_true,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
   ring
 have hc : badPoly3eda.coeff 1=ROW := by
   rw [he]
   simp only [coeff_add,coeff_C_mul_X_pow]
   norm_num
 change (badPoly3eda.coeff 1).coeff 5=8 ∧ (badPoly3eda.coeff 1).coeff 6=12 ∧
   (badPoly3eda.coeff 1).coeff 7=20
 rw [hc]
 norm_num [coeff_add,coeff_ofNat_mul,coeff_X_pow]

theorem palindrome_balance_not_sufficient3eda :
 List.Palindrome badCore3eda ∧ Balanced80 badCore3eda ∧ ¬GlobalLC18 badPoly3eda := by
 refine ⟨badCore_palindrome3eda,badCore_balanced3eda,?_⟩
 intro h
 have hh := h.2.1 1 5
 obtain ⟨h0,h1,h2⟩ := badCore_coeff3eda
 norm_num [h0,h1,h2] at hh

theorem badCore_not_source_three_eighths3eda (path : List Bool)
 (ha : (frame path).mid.a=3) (hb : (frame path).mid.b=8) :
 (frame path).mid.p≠badPoly3eda := by
 intro he
 have hc : coeff (frame path).mid.p 1 5≠0 := by rw [he,badCore_coeff3eda.1]; decide
 have hs := raw_lower_support18 path 1 5 hc
 norm_num [ha,hb] at hs

#print axioms palindrome_balance_not_sufficient3eda
#print axioms badCore_not_source_three_eighths3eda
end
end MathGKM.Markov
'''.replace('EXP',exp).replace('ROW',row)
Path('research/MarkovPalindromeObstruction3eda.lean').write_text(s)
