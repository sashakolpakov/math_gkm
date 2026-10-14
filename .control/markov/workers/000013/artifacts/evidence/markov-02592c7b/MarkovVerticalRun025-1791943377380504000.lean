import MarkovVerticalBlocks025

/-! Machine-authored request 02592c7b. Exact jets of the two run blocks. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def plainSum025 (n : ℕ) : Polynomial ℤ := ∑ k ∈ Finset.range n, X^k
def weightedSum025 (n : ℕ) : Polynomial ℤ := ∑ k ∈ Finset.range n, (k:Polynomial ℤ)*X^k

theorem sum_relation025 (n : ℕ) :
    (1-X)*weightedSum025 n=X*plainSum025 n-(n:Polynomial ℤ)*X^n := by
  induction n with
  | zero => simp [weightedSum025,plainSum025]
  | succ n ih =>
    simp only [weightedSum025,plainSum025,Finset.sum_range_succ] at *
    push_cast
    rw [pow_succ]
    linear_combination ih

def runMatrix025 (n : ℕ) := rawWord80 (runBlock025 n)
def runC025 (n : ℕ) : Polynomial ℤ := X^(n+2)+2*X*plainSum025 (n+1)
def runK025 (n : ℕ) : Polynomial ℤ :=
  4*weightedSum025 (n+1)+3*(n+1:ℕ)*X^(n+1)+(n+2:ℕ)*X^(n+2)

theorem run_a_zero025 (n : ℕ) :
    (runMatrix025 n).a.coeff 0=X^(n+1)*(X+1) := by
  have h := (rawWord_zero46 (runBlock025 n)).1
  simpa [runMatrix025,runBlock025] using h

theorem run_step025 (n : ℕ) :
    runMatrix025 (n+1)=mm16 rawA18 (runMatrix025 n) := by
  simp [runMatrix025,runBlock025,List.replicate_succ,rawWord80]

theorem run_jet_step025 (n : ℕ) :
    (runMatrix025 (n+1)).c.coeff 1=
      X^(n+2)*(X+1)+(runMatrix025 n).c.coeff 1 ∧
    columnJet025 (runMatrix025 (n+1))=
      X*columnJet025 (runMatrix025 n)+2*(runMatrix025 n).c.coeff 1+
        X^(n+2)*(X+1) := by
  have hc := (rawWord_zero46 (runBlock025 n)).2
  change (runMatrix025 n).c.coeff 0=0 at hc
  rw [run_step025]
  simp only [columnJet025,mm16,rawA18,U,V,Polynomial.coeff_add,
    coeff_mul_one46,Polynomial.coeff_X,Polynomial.coeff_C,Polynomial.coeff_one,
    one_ne_zero,zero_ne_one,if_true,if_false,zero_add,add_zero,
    mul_zero,zero_mul,mul_one,one_mul,hc,run_a_zero025]
  constructor <;> rw [show n+2=n+1+1 by omega,pow_succ] <;> ring

theorem run_explicit_step025 (n : ℕ) :
    runC025 (n+1)=X^(n+2)*(X+1)+runC025 n ∧
    runK025 (n+1)=X*runK025 n+2*runC025 n+X^(n+2)*(X+1) := by
  have hs := sum_relation025 (n+1)
  have hp : plainSum025 (n+1+1)=plainSum025 (n+1)+X^(n+1) := by
    simp [plainSum025,Finset.sum_range_succ]
  have hw : weightedSum025 (n+1+1)=weightedSum025 (n+1)+(n+1:ℕ)*X^(n+1) := by
    simp [weightedSum025,Finset.sum_range_succ]
  constructor
  · unfold runC025
    rw [hp]
    simp only [show n+1+2=n+2+1 by omega,pow_succ]
    ring
  · unfold runK025 runC025
    rw [hw]
    push_cast at *
    simp only [show n+1+2=n+2+1 by omega,show n+2=n+1+1 by omega,pow_succ] at *
    linear_combination 4*hs

theorem run_jet025 (n : ℕ) :
    (runMatrix025 n).c.coeff 1=runC025 n ∧
      columnJet025 (runMatrix025 n)=runK025 n := by
  induction n with
  | zero =>
    simp [runMatrix025,runBlock025,rawWord80,mm16,rawB18,S,U,V,
      columnJet025,coeff_mul_one46,Polynomial.coeff_one,
      runC025,runK025,plainSum025,weightedSum025] <;> ring
  | succ n ih =>
    obtain ⟨hc,hk⟩ := run_jet_step025 n
    rw [ih.1] at hc
    rw [ih.1,ih.2] at hk
    exact ⟨hc.trans (run_explicit_step025 n).1.symm,
      hk.trans (run_explicit_step025 n).2.symm⟩

#print axioms run_jet025
end
end MathGKM.Markov
