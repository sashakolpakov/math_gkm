import MarkovGasF80
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
    C (1*X^7+1*X^8)*X^0 +
    C (2*X^2+4*X^3+6*X^4+8*X^5+12*X^6+8*X^7)*X^1 +
    C (1*X^0+5*X^1+18*X^2+34*X^3+47*X^4+51*X^5+28*X^6)*X^2 +
    C (6*X^0+28*X^1+70*X^2+108*X^3+110*X^4+56*X^5)*X^3 +
    C (15*X^0+62*X^1+122*X^2+135*X^3+70*X^4)*X^4 +
    C (20*X^0+68*X^1+96*X^2+56*X^3)*X^5 +
    C (15*X^0+37*X^1+28*X^2)*X^6 +
    C (6*X^0+8*X^1)*X^7 +
    C (1*X^0)*X^8 := by
    simp only [badWord80,rawWord80,rawA18,rawB18,mm16,Bool.false_eq_true,
      if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
    ring
  have hc : ((rawWord80 badWord80).b).coeff 1 = 2*X^2+4*X^3+6*X^4+8*X^5+12*X^6+8*X^7 := by
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
