-- Actual Codex/gpt-6-astra, 2026-10-13. Kernel-compiled statement/axiom audit.
import MathGKM.AgohConsequences
import Lean

open Lean Elab Command in
run_cmd do
  let names := [``MathGKM.Agoh.alternating_monomial,
    ``MathGKM.Agoh.alternating_dvd, ``MathGKM.Agoh.coprime_at_one,
    ``MathGKM.Agoh.power_dvd_comp, ``MathGKM.Agoh.main_regular,
    ``MathGKM.Agoh.main, ``MathGKM.Agoh.denominator_eval_one,
    ``MathGKM.Agoh.denominator_ne_zero, ``MathGKM.Agoh.rationalSum_eq_fraction,
    ``MathGKM.Agoh.reduced_numerator, ``MathGKM.Agoh.cleared_iff_reduced,
    ``MathGKM.Agoh.theorem_1_1, ``MathGKM.Agoh.paper_H, ``MathGKM.Agoh.paper_G,
    ``MathGKM.Agoh.theorem_3_1, ``MathGKM.Agoh.repeated_root_family,
    ``MathGKM.Agoh.simple_roots_iff_squarefree,
    ``MathGKM.Agoh.repeatedExample_regular, ``MathGKM.Agoh.repeatedExample_nonzero,
    ``MathGKM.Agoh.repeatedExample_splits, ``MathGKM.Agoh.repeatedExample_not_monomial,
    ``MathGKM.Agoh.repeatedExample_not_squarefree,
    ``MathGKM.Agoh.repeatedExample_not_alternatives,
    ``MathGKM.Agoh.repeatedExample_all_n,
    ``MathGKM.Agoh.refutes_per_n, ``MathGKM.Agoh.refutes_all_n,
    ``MathGKM.Agoh.all_n_iff_positive, ``MathGKM.Agoh.complex_root_example,
    ``MathGKM.Agoh.H_two, ``MathGKM.Agoh.H_three,
    ``MathGKM.Agoh.extra_factor_three, ``MathGKM.Agoh.extra_factor_radicals,
    ``MathGKM.Agoh.section_four_polynomial, ``MathGKM.Agoh.section_four_degree,
    ``MathGKM.Agoh.cancellation_without_regularity,
    ``MathGKM.Agoh.clears_denominators, ``MathGKM.Agoh.zero_order,
    ``MathGKM.Agoh.first_order_factor, ``MathGKM.Agoh.singular_counterexample,
    ``MathGKM.Agoh.missing_positive_n, ``MathGKM.Agoh.geometric_region_counterexample]
  for name in names do
    let info ← getConstInfo name
    let axs ← collectAxioms name
    for ax in axs do
      unless [``propext, ``Classical.choice, ``Quot.sound].contains ax do
        throwError "forbidden axiom {ax} in {name}"
    logInfo m!"DECLARATION {name}\nTYPE {info.type}\nAXIOMS {axs}"

#print axioms MathGKM.Agoh.main
#print axioms MathGKM.Agoh.theorem_1_1
#print axioms MathGKM.Agoh.theorem_3_1
#print axioms MathGKM.Agoh.cleared_iff_reduced
#print axioms MathGKM.Agoh.refutes_all_n
