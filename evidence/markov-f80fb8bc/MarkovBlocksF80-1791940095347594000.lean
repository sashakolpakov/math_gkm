import MarkovCutsF80
import MarkovTop1998

/-! Machine-authored worker f80fb8bc. Collapse ordered mask gaps to shifted
binomial terms. Zero masks remain present. This proves no LC closure for sums. -/
namespace MathGKM.Markov
noncomputable section

inductive BlockTerm80 where
  | zero
  | term (p q e : ℕ)

def blockEval80 {R : Type*} [CommRing R] (u v : R) : BlockTerm80 → R
  | .zero => 0
  | .term p q e => u^p*v^q*(u+v)^e

def blockMul80 : BlockTerm80 → BlockTerm80 → BlockTerm80
  | .term p q e, .term p' q' e' => .term (p+p') (q+q') (e+e')
  | _, _ => .zero

def gapTerm80 (w : List Bool) : BlockTerm80 :=
  if false ∈ w then
    if true ∈ w then .zero else .term 1 0 0
  else if true ∈ w then .term 0 1 0 else .term 0 0 1

def blocksTerm80 : List (List Bool) → BlockTerm80
  | [] => .term 0 0 0
  | g::gs => blockMul80 (gapTerm80 g) (blocksTerm80 gs)

theorem blockEval_mul80 {R : Type*} [CommRing R] (u v : R) (a b : BlockTerm80) :
    blockEval80 u v (blockMul80 a b)=blockEval80 u v a*blockEval80 u v b := by
  cases a <;> cases b <;> simp [blockEval80,blockMul80,pow_add] <;> ring

theorem gapTerm_eval80 {R : Type*} [CommRing R] (u v : R) (w : List Bool) :
    blockEval80 u v (gapTerm80 w)=gap80 u v 1 w := by
  by_cases hf : false ∈ w <;> by_cases ht : true ∈ w <;>
    simp [gapTerm80,blockEval80,gap80,hf,ht]

theorem blocksTerm_eval80 {R : Type*} [CommRing R] (u v : R) (gs : List (List Bool)) :
    blockEval80 u v (blocksTerm80 gs)=(gs.map (gap80 u v 1)).prod := by
  induction gs with
  | nil => simp [blocksTerm80,blockEval80]
  | cons g gs ih => simp [blocksTerm80,blockEval_mul80,gapTerm_eval80,ih]

theorem cut_term80 {R : Type*} [CommRing R] (u v : R) (g : GasCut80) :
    gasWeight80 u v 1 v 1 g=blockEval80 u v (blocksTerm80 (g.1::g.2)) := by
  simp [blocksTerm_eval80,gasWeight80]

theorem coeff_list_sum80 (ps : List BiPoly) (i j : ℕ) :
    coeff ps.sum i j=(ps.map (fun p => coeff p i j)).sum := by
  induction ps with
  | nil => simp [coeff]
  | cons p ps ih => simp [coeff,Polynomial.coeff_add] at *; exact ih

/-- Universal raw coefficient expansion, with no cutoff or normalization.
The terms and all their zero coefficients are kept in the finite sum. -/
theorem source_block_coeff80 (path : List Bool) :
    ∃ ts : List BlockTerm80, ∀ i j,
      coeff (frame path).mid.p i j =
        (ts.map (fun t => coeff (blockEval80 U V t) i j)).sum := by
  obtain ⟨w,_,he⟩ := source_cuts80 path
  refine ⟨(gasCuts80 w).map (fun g => blocksTerm80 (g.1::g.2)),?_⟩
  intro i j
  rw [he,coeff_list_sum80]
  simp only [List.map_map,Function.comp_def]
  simp_rw [cut_term80]

/-- The raw coefficient of a nonzero mask term on its shifted diagonal. -/
theorem block_binomial_coeff80 (p q e i j : ℕ) (h : i+j=e) :
    coeff (blockEval80 U V (.term p q e)) (i+p) (j+q)=(e.choose i : ℤ) := by
  unfold blockEval80 coeff U V
  rw [mul_assoc,Polynomial.coeff_X_pow_mul,← map_pow,Polynomial.coeff_C_mul,
    Polynomial.coeff_X_pow_mul]
  exact binomial_raw1998 e i j h

#print axioms source_block_coeff80
#print axioms block_binomial_coeff80
end
end MathGKM.Markov
