# Checkpoint 2 — central comparison obstruction

The full cut q-free central comparison fails. Larger floating tests found three
failures after 486 initial passing cases. Exact integer sums at a=800,r=4000,
m=6400,H=6404 (i=799,d=4797) give a negative q-free cut sum and a positive
actual q-weighted sum. See evidence/markov-73199834/qfree-exact-obstruction.json
and research/qfree_obstruction_73199834.py. The actual sector constraint is
i+r=d+2. This is not a source triple and not a root refutation.

The exact q factor used for the experiment is
q(k)=binom(H+k-1,a+2)/binom(H-1,a+2), since H-Q=a+2.
Its formal bridge is a useful possible representation change, not yet proved.

A cut-interior generator was expanded exactly; its naive lower-moment
certificate has negative coefficients. No universal conclusion is drawn.
The first-central inherited margin timed out again after 240 seconds. Its
definitions alone compiled in 28.7 seconds; separate identity and positivity
builds will isolate the unresolved proof step. All predecessor files remain
unchanged. Process inspection via /bin/ps was denied; no workaround attempted.

Full Conjecture63 and all root residuals remain open.
