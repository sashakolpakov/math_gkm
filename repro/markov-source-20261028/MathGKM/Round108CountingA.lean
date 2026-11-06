import MathGKM.Round108CoarseA

/- Machine-authored r108. All colors are forgotten by actual finite-object
counting. These identities imply no sign or rank domination. -/
namespace ColorForgettingR108
open LocalRetilingR76 MatchingSeparatorR63 MatchingProjectionR64
open scoped BigOperators
noncomputable section
def single (N sigma i t : ℕ) : Finset Obj := by
  classical
  exact (PairConvolutionR78.U N).filter fun o => du sigma o=i ∧ dv N sigma o=t
def singleSigma (N sigma i t : ℕ) : Finset ((M : Finset ℕ) × Finset ℕ) := by
  classical
  exact (FiniteMatchingR61.matchings N).sigma fun M =>
    ((ColorFibersR66.uncovered N M).powerset).filter fun S =>
      p sigma M+S.card=i ∧ q sigma M+((ColorFibersR66.uncovered N M).card-S.card)=t
theorem single_card (N sigma i t : ℕ) :
    (single N sigma i t).card = (singleSigma N sigma i t).card := by
  classical
  apply Finset.card_bij (fun o _ => PairConvolutionR78.extend o)
  · intro o ho
    rcases o with ⟨M,S⟩
    simpa [single,singleSigma,PairConvolutionR78.extend,PairConvolutionR78.mem_U,
      PairConvolutionR78.mem_matchings,valid,du,dv,Finset.mem_sigma,and_assoc] using ho
  · intro o ho v hv he
    exact congrArg PairConvolutionR78.forget he
  · intro o ho
    refine ⟨PairConvolutionR78.forget o,?_,PairConvolutionR78.extend_forget o⟩
    rcases o with ⟨M,S⟩
    simpa [single,singleSigma,PairConvolutionR78.forget,PairConvolutionR78.mem_U,
      PairConvolutionR78.mem_matchings,valid,du,dv,Finset.mem_sigma,and_assoc] using ho

theorem unit_single (N sigma i t : ℕ) :
    unit (B N sigma i t) = ((single N sigma i t).card : ℤ) := by
  classical
  have hc (z : ℤ) : unit (pi sigma (MvPolynomial.C z))=z := by
    simp [unit,pi]
  rw [projected_C]
  unfold C
  simp only [map_sum,map_mul,ColorFibersR76.pi_product,map_pow,unit_alpha,unit_beta,
    one_pow,mul_one,hc]
  rw [single_card,singleSigma,Finset.card_sigma,Nat.cast_sum]
  apply Finset.sum_congr rfl
  intro M hM
  exact ColorFibersR76.monomer_count N sigma i t M
    ((PairConvolutionR78.mem_matchings N M).mp hM)

def vertices (N sigma t L : ℕ) : Finset Pair := by
  classical
  exact ((PairConvolutionR78.U N) ×ˢ (PairConvolutionR78.U N)).filter (fiber N sigma t L)
def rankFiber (N sigma t L r : ℕ) : Finset Pair := by
  classical
  exact (vertices N sigma t L).filter fun z => rank sigma z=r

theorem rank_product (N sigma i k t : ℕ) :
    rankFiber N sigma t (i+k) i = (single N sigma i t) ×ˢ (single N sigma k t) := by
  classical
  ext z
  simp only [rankFiber,vertices,single,Finset.mem_filter,Finset.mem_product,
    PairConvolutionR78.mem_U,fiber,rank]
  constructor
  · rintro ⟨⟨⟨h1,h2⟩,_,_,h3,h4,h5⟩,hr⟩
    exact ⟨⟨h1,hr,h3⟩,h2,by omega,h4⟩
  · rintro ⟨⟨h1,h3,h4⟩,h2,h5,h6⟩
    exact ⟨⟨⟨h1,h2⟩,h1,h2,h4,h6,by omega⟩,h3⟩

theorem unit_pair (N sigma i k t : ℕ) :
    unit (B N sigma i t)*unit (B N sigma k t) =
      ((rankFiber N sigma t (i+k) i).card : ℤ) := by
  rw [rank_product,Finset.card_product,Nat.cast_mul,unit_single,unit_single]

theorem unit_margin (N sigma i t : ℕ) :
    unit (defect N sigma i t) =
      ((rankFiber N sigma t (2*i+2) (i+1)).card : ℤ) -
      ((rankFiber N sigma t (2*i+2) i).card : ℤ) := by
  simp only [defect,map_sub,map_pow,map_mul,pow_two]
  rw [unit_pair,unit_pair]
  rw [show i+1+(i+1)=2*i+2 by omega,show i+(i+2)=2*i+2 by omega]
end
end ColorForgettingR108
#print axioms ColorForgettingR108.unit_single
#print axioms ColorForgettingR108.unit_pair
#print axioms ColorForgettingR108.unit_margin
