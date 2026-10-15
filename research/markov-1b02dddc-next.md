# Revisable next actions

The pinned Conjecture63 is unresolved. Use `evidence/markov-1b02dddc/validation.json`
as the source-bound inventory; exclude generated modules absent from it.

The exact two-block backwards source formula now covers 2n+6≤j≤4n+7,
for actual predecessor denominator c≥5. The generic full reflected
five-block decomposition is also checked if present in that inventory.
It confirms the previous run's proposed reflection identity, with every
padding exponent and degree bound explicit. The source coefficient adapters
for all six chambers and offsets k=1,...,8 are available and locally compiled.

The first attempted general onset proof used six complete staged gap
certificates in each combined chamber module. Three builds timed out at
240 seconds; those modules are not accepted. All candidate identities and
their positive polynomial gaps are retained in `onset-candidates.json`.
Do not confuse a failed bounded build with a mathematical counterexample.
The individual staged modules were also generated; most were never built.
Compiling large combined modules repeats substantial exact ring work.

A shorter proof works at k=6. The additional term is zero in chambers 0–3,
and in chambers 4–5 is

    30240 (3r-2c) (3-r+n(6-c)).

For c≥6 this is nonpositive. The inherited backShape log-concavity and
proved nonnegativity of the other endpoint raw coefficient then suffice.
The sole remaining high-chamber c=5 case is r=4, covered by a small
one-variable certificate. Consult the final inventory for the assembled
theorem and residual equivalences.

For k=1,...,5, consider exploiting the inherited gap rather than re-expanding
the entire degree-fourteen expression. `perturbation-probe.json` records
the exact difference between the corrected gap and the inherited base gap.
Some chamber differences have all nonnegative coefficients; others have
negative terms and cannot simply be discarded. These are candidate
identities, not checked inequality theorems. Retain all zero columns and
all correction terms.

The earlier part of the fourth-slice middle interval still needs attention.
For j=2n+k, k≥6, the two reflected convolution indices are 2n+7-k and
n+6-k; both can be converted to falling-factorial expressions. The
source formula is now available, but simplification and inequality bridges
remain. Starting offsets 2n+1,...,2n+5 require the reflected H2 block.
Small runs, c=2,3,4, higher slices and axial interiors remain separate.

Any completion requires the exact root or its exact negation, a fresh
whole-source rebuild, kernel and axiom checks, and a separate hash-bound
source/English audit discharging all seven obligations.

Final assembly compiled: source_fourth_final_sixM1B and
root_iff_core_sixM1B. For n>=7,c>=5, the exact fourth-slice residual is
2n<j<3n+6. For n=4,5,6, retain the older interval 2n<j<3n+7.
Final Lean sources and validation receipts are authoritative; initial
generators are retained with their subsequent manual repair history, and
should not be blindly rerun over existing evidence.
