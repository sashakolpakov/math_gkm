# Revisable next mathematical actions

Machine-authored e9cdd527ea604fdcb514caecc8cc9944. Full pinned root unresolved.

The missing lower fourth-column source bridge from worker 155 is now proved,
including j=q. Do not repeat it. The admitted theorem gives strict vertical
LC at column 4 for starts j+2<=q. Higher starts remain in ThreeRemainingME9C.

Two possible continuations, neither prescribed:

* Investigate the corrected lower kernel K_i(j,k)=L(i+j+k-2,i,j). Its source
  bridge covers every column at j<=q. LowerShapeME9C records positivity,
  coordinate LC and adjacent minors with the exact wedge domains. The
  conditional transfer to all lower vertical inequalities is formal, but
  every uniform shape premise remains unproved. The naive coordinates q=j+d
  are definitively unsuitable: the boundary minor is -42 for all d>=1.
* Extend the fourth-column source formula across j=q+1. Exact experiments
  support corrections to the displayed lower expressions:

      column 2: 8 (true branch), 4 (false branch);
      column 3: 8(q-2),          4(q-1);
      column 4: 4(q-2)(q-3),     2(q-1)(q-2).

  These identities are not yet Lean theorems. A paper derivation uses the
  discriminant equation at the first omitted row: the difference between
  source and lower auxiliary solutions vanishes through j=q, so its next
  row satisfies (1+u)^2 DeltaRow=4u G(u,0). The forcing has
  G(u,0)=2u(1+u)^q in the true branch and u(1+u)^(q+1) in the false branch.
  Thus the corrections are the first coefficients of 8u^2(1+u)^(q-2) and
  4u^2(1+u)^(q-1). The exceptional q=1 true branch must be treated as a
  formal inverse series or separately; do not truncate its negative exponent.
  Both first-tail source identification and the crossing LC proof remain
  formal obligations. first-tail-experiments.json contains 1200 coefficient
  checks and 400 strict crossing-triple checks, not proofs.

The lower-row factorization probe is another possible representation, not an
established source theorem or complete direction. No claims of real-rootedness
or universal adjacent-to-CrossLC transport have been made.

Keep ThreeRemainingME9C AND OtherFourM9E2, or the exact lower-region residual,
in full. Preserve all directions, reverse-factor ranges, zeros, endpoints and
universal rational scope. Root closure still needs every correspondence
obligation, a fresh whole-source rebuild, replay, axiom audit and the separate
independent hash-bound English/source audit.
