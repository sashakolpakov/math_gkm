import MathGKM.Acceptedc3ac45bec0645e736aef7a13
import MathGKM.Round76RetilingA

/- Machine-authored round78. Actual objects and ordered pairs, with all degrees retained. -/
namespace PairConvolutionR78
open scoped BigOperators Finset
open LocalRetilingR76 MatchingSeparatorR63
noncomputable section

def U (N : ℕ) : Finset Obj :=
  (FiniteMatchingR61.matchings N).biUnion fun M =>
    (ColorFibersR66.uncovered N M).powerset.image fun S => (M,S)

theorem mem_matchings (N : ℕ) (M : Finset ℕ) :
    M ∈ FiniteMatchingR61.matchings N ↔ FiniteMatchingR61.Match N M := by
  classical
  simp only [FiniteMatchingR61.matchings, Finset.mem_filter, Finset.mem_powerset]
  constructor
  · exact And.right
  · intro h
    refine ⟨?_,h⟩
    intro e he
    have := h.1 e he
    simp only [Finset.mem_range]
    omega

theorem mem_U (N : ℕ) (o : Obj) : o ∈ U N ↔ valid N o := by
  classical
  rcases o with ⟨M,S⟩
  simp [U, valid, mem_matchings]

def P (N sigma j L a b r : ℕ) : Finset Pair := by
  classical
  exact ((U N) ×ˢ (U N)).filter fun z =>
    LocalRetilingR76.fiber N sigma j L a b z ∧ rank sigma z=r

def single (N sigma i j a b : ℕ) : Finset Obj :=
  (U N).filter fun o => p sigma o.1=a ∧ q sigma o.1=b ∧
    du sigma o=i ∧ dv N sigma o=j

def forget (o : (M : Finset ℕ) × Finset ℕ) : Obj := (o.1,o.2)
def extend (o : Obj) : (M : Finset ℕ) × Finset ℕ := ⟨o.1,o.2⟩
theorem forget_injective : Function.Injective forget := by
  intro x y h
  rcases x with ⟨M,S⟩
  rcases y with ⟨K,T⟩
  cases h
  rfl
theorem forget_extend (o : Obj) : forget (extend o)=o := rfl
theorem extend_forget (o : (M : Finset ℕ) × Finset ℕ) : extend (forget o)=o := by
  cases o
  rfl

theorem mem_single (N sigma i j a b : ℕ) (o : Obj) :
    o ∈ single N sigma i j a b ↔
    extend o ∈ ColorFibersR66.fiber N sigma i j a b := by
  classical
  rcases o with ⟨M,S⟩
  simp [single, mem_U, valid, ColorFibersR66.fiber, Finset.mem_sigma,
    mem_matchings, extend, du, dv, and_assoc]

theorem single_card (N sigma i j a b : ℕ) :
    (single N sigma i j a b).card = (ColorFibersR66.fiber N sigma i j a b).card := by
  classical
  apply Finset.card_bij (fun o _ => extend o)
  · intro o ho
    exact (mem_single N sigma i j a b o).mp ho
  · intro o ho t ht h
    exact congrArg forget h
  · intro o ho
    refine ⟨forget o,?_,extend_forget o⟩
    rw [mem_single,extend_forget]
    exact ho

theorem coefficient_single (N sigma i j a b : ℕ) :
    ((MatchingProjectionR64.B N sigma i j).coeff a).coeff b =
      ((single N sigma i j a b).card : ℤ) := by
  rw [single_card]
  exact Acceptedc3ac45bec0645e736aef7a13.obligation N sigma i j a b

theorem mem_P (N sigma i k j a b : ℕ) (z : Pair) :
    z ∈ P N sigma j (i+k) a b i ↔
      valid N z.1 ∧ valid N z.2 ∧ dv N sigma z.1=j ∧ dv N sigma z.2=j ∧
      du sigma z.1=i ∧ du sigma z.2=k ∧
      p sigma z.1.1+p sigma z.2.1=a ∧ q sigma z.1.1+q sigma z.2.1=b := by
  classical
  rcases z with ⟨o,t⟩
  simp only [P,Finset.mem_filter,Finset.mem_product,mem_U,
    LocalRetilingR76.fiber,rank]
  constructor
  · rintro ⟨_,⟨h1,h2,h3,h4,h5,h6,h7⟩,hr⟩
    exact ⟨h1,h2,h3,h4,hr,by omega,h6,h7⟩
  · rintro ⟨h1,h2,h3,h4,h5,h6,h7,h8⟩
    exact ⟨⟨h1,h2⟩,⟨h1,h2,h3,h4,by omega,h7,h8⟩,h5⟩

def colors (sigma : ℕ) (z : Pair) : (ℕ × ℕ) × (ℕ × ℕ) :=
  ((p sigma z.1.1,p sigma z.2.1),(q sigma z.1.1,q sigma z.2.1))

theorem partition_cell (N sigma i k j a b : ℕ) (x y : ℕ × ℕ)
    (hx : x ∈ Finset.HasAntidiagonal.antidiagonal a) (hy : y ∈ Finset.HasAntidiagonal.antidiagonal b) :
    ((P N sigma j (i+k) a b i).filter fun z => colors sigma z=(x,y)) =
      ((single N sigma i j x.1 y.1) ×ˢ (single N sigma k j x.2 y.2)) := by
  classical
  rcases x with ⟨a1,a2⟩
  rcases y with ⟨b1,b2⟩
  have hx' := Finset.HasAntidiagonal.mem_antidiagonal.mp hx
  have hy' := Finset.HasAntidiagonal.mem_antidiagonal.mp hy
  ext z
  simp only [Finset.mem_filter,mem_P,Finset.mem_product,single,mem_U,
    colors,Prod.mk.injEq]
  constructor
  · rintro ⟨⟨h1,h2,h3,h4,h5,h6,h7,h8⟩,⟨hp1,hp2⟩,⟨hq1,hq2⟩⟩
    exact ⟨⟨h1,hp1,hq1,h5,h3⟩,h2,hp2,hq2,h6,h4⟩
  · rintro ⟨⟨h1,hp1,hq1,h5,h3⟩,h2,hp2,hq2,h6,h4⟩
    exact ⟨⟨h1,h2,h3,h4,h5,h6,by omega,by omega⟩,⟨hp1,hp2⟩,hq1,hq2⟩

theorem pair_card (N sigma i k j a b : ℕ) :
    (P N sigma j (i+k) a b i).card =
      ∑ x ∈ Finset.HasAntidiagonal.antidiagonal a, ∑ y ∈ Finset.HasAntidiagonal.antidiagonal b,
        (single N sigma i j x.1 y.1).card * (single N sigma k j x.2 y.2).card := by
  classical
  have hm : ((P N sigma j (i+k) a b i : Finset Pair) : Set Pair).MapsTo
      (colors sigma) (((Finset.HasAntidiagonal.antidiagonal a) ×ˢ (Finset.HasAntidiagonal.antidiagonal b) : Finset ((ℕ × ℕ) × (ℕ × ℕ))) : Set _) := by
    intro z hz
    obtain ⟨_,_,_,_,_,_,ha,hb⟩ := (mem_P N sigma i k j a b z).mp hz
    exact Finset.mem_product.mpr ⟨Finset.HasAntidiagonal.mem_antidiagonal.mpr ha,Finset.HasAntidiagonal.mem_antidiagonal.mpr hb⟩
  rw [Finset.card_eq_sum_card_fiberwise hm,Finset.sum_product]
  apply Finset.sum_congr rfl
  intro x hx
  apply Finset.sum_congr rfl
  intro y hy
  rw [partition_cell N sigma i k j a b x y hx hy,Finset.card_product]

theorem pair_coefficient (N sigma i k j a b : ℕ) :
    (((MatchingProjectionR64.B N sigma i j * MatchingProjectionR64.B N sigma k j).coeff a).coeff b) =
      ((P N sigma j (i+k) a b i).card : ℤ) := by
  classical
  rw [Polynomial.coeff_mul,Polynomial.finsetSum_coeff,pair_card]
  simp only [Nat.cast_sum,Nat.cast_mul]
  apply Finset.sum_congr rfl
  intro x hx
  rw [Polynomial.coeff_mul]
  apply Finset.sum_congr rfl
  intro y hy
  rw [coefficient_single,coefficient_single]

end
end PairConvolutionR78
