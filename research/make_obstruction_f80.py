"""Machine-authored source generator; emitted equalities require Lean checking."""
from balanced_f80 import A,B,I,mm
from pathlib import Path
word='ABAAAAB';m=I
for c in word:m=mm(m,B if c=='B' else A)
p=m[1]
def upoly(row):
 return '+'.join(f'{c}*X^{j}' for j,c in sorted(row.items())) or '0'
rows={}
for (i,j),c in p.items():rows.setdefault(i,{})[j]=c
poly=' +\n    '.join(f'C ({upoly(row)})*X^{i}' for i,row in sorted(rows.items()))
src='''import MarkovGasF80
import MarkovReduction18

/-! Machine-authored worker f80fb8bc. Balanced-word obstruction, NOT a
source-family counterexample or a refutation of Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def Balanced80 (w : List Bool) : Prop :=
  ∀ n i j : Fin (w.length+1), i.val+n.val≤w.length → j.val+n.val≤w.length →
    Nat.dist (((w.drop i.val).take n.val).count true)
      (((w.drop j.val).take n.val).count true) ≤ 1

def badWord80 : List Bool := [false,true,false,false,false,false,true]

theorem badWord_balanced80 : Balanced80 badWord80 := by
  unfold Balanced80 badWord80
  decide

theorem badWord_reduced80 : Nat.Coprime (badWord80.count true) badWord80.length := by decide

theorem badWord_coeff80 :
    coeff (rawWord80 badWord80).b 1 4=6 ∧
    coeff (rawWord80 badWord80).b 1 5=8 ∧
    coeff (rawWord80 badWord80).b 1 6=12 := by
  have he : (rawWord80 badWord80).b =
    POLY := by
    simp only [badWord80,rawWord80,rawA18,rawB18,mm16,Bool.false_eq_true,
      if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
    ring
  have hc : ((rawWord80 badWord80).b).coeff 1 = ROW := by
    rw [he]
    simp only [coeff_add,coeff_C_mul_X_pow]
    norm_num
  change (((rawWord80 badWord80).b).coeff 1).coeff 4=6 ∧
    (((rawWord80 badWord80).b).coeff 1).coeff 5=8 ∧
    (((rawWord80 badWord80).b).coeff 1).coeff 6=12
  rw [hc]
  norm_num [coeff_add,coeff_ofNat_mul,coeff_X_pow]

theorem balanced_reduced_not_sufficient80 :
    Balanced80 badWord80 ∧ Nat.Coprime (badWord80.count true) badWord80.length ∧
      ¬ GlobalLC18 (rawWord80 badWord80).b := by
  refine ⟨badWord_balanced80,badWord_reduced80,?_⟩
  intro h
  have hv := h.2.1 1 4
  obtain ⟨h0,h1,h2⟩ := badWord_coeff80
  norm_num [h0,h1,h2] at hv

/-- The actual source word at 2/7 differs from this balanced witness. -/
theorem actual_two_sevenths_word80 :
    let xy := [false,false,true].foldl wordPairStep774 ([false],[true])
    xy.1++xy.2=[false,false,false,true,false,false,true] := by rfl

#print axioms balanced_reduced_not_sufficient80
end
end MathGKM.Markov
'''.replace('POLY',poly).replace('ROW',upoly(rows[1]))
Path('research/MarkovObstructionF80.lean').write_text(src)
