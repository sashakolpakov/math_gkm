# Degree and homogeneous coefficient bridge

Machine-authored worker 21afc5949a0649388be45f280b6747f2, 2026-10-13 UTC.
This is a local partial-result scope argument, not an independent root audit.

## Checked construction

`DegreeBound21a P d` says every literal integer coefficient with i+j>d is
zero. Coefficient convolution proves closure under multiplication, with
additive bounds. Addition and subtraction preserve a common bound. The exact
seed and both recurrence branches then yield `degree_frame_21a`: each of the
three labels of every finite path has bound a+b-1. The retained endpoint's
positive denominator and mediant equations justify all natural subtractions.
No coefficient nonnegativity is assumed in this proof.

`homogenize21a d P` is the finite three-variable polynomial whose u^i v^j
coefficient is the single w-monomial A_ij w^(d-i-j). Coefficient extraction
is proved exactly, without factorial factors. For the generated family,
the new bound ensures i+j+(d-i-j)=d whenever A_ij is nonzero.
`dehomogenize_homogenize_21a` proves that setting w=1 recovers P.
`homogeneous_reconstruction_21a` and
`homogeneous_specialization_injective_21a` prove that any homogeneous
three-variable polynomial of fixed degree is uniquely recovered this way.
These results include zero coefficients and the zero polynomial.

The signed Laurent exponent map is
(1-a+2i, 1-b+2j, a+b-1-2i-2j). Its injectivity and total degree one are
proved, including a=0. This arithmetic result is not yet an equality in a
formal Laurent polynomial ring.

## Correspondence obligations

* Coverage: inherited universal rational coverage and uniqueness remain
  applicable to the unchanged recurrence. The new induction covers all paths.
* Source family: inherited all-field three-variable evaluation transport is
  retained. To finish a formal coefficient-level source bridge, connect this
  homogeneous construction to the explicit source numerator recurrence or to
  a formal Laurent identity. The generic reconstruction theorem does not
  silently supply that connection.
* Homogeneity/coefficients: all-path degree bound, homogeneous reconstruction,
  raw coefficient preservation, and losslessness at w=1 are now locally checked.
  Homogeneous degree here means all nonzero monomials have that degree; no
  standalone nonzero or degree-attainment theorem is inferred.
* Polygon: only its upper degree inequality is established for support.
  The lower sloping support bound and convex-hull equality remain open formally.
* Directions/zeros/endpoints: no change to WeakLC; all three raw directions,
  zeros and endpoints are retained. The degree induction includes endpoint
  labels, but it asserts no new coefficient inequality in any direction.
* Assumptions: pinned Lean/Mathlib, ordinary allowed axiom closures; no added
  axioms, admissions, native evaluation, packages or root edits.
* Proof scope: full Conjecture63 and its negation remain unproved. Completion
  is null. Source recurrence, polygon and universal LC still require work.

## Positive-matrix experiment

The primary paper's equation (35) was retrieved live at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . Conjugating
its matrices by diag(x,1) and setting w=1 gives polynomial matrices

    A = [[v,1],[uv,u+1]],
    B = [[v(u+v+1),u+v],[uv(u+v+2),u(u+v+1)]].

Their upper-right entries are the candidate raw numerator. A finite independent
comparison with the pinned subtraction recurrence agreed for 71 Farey paths
with denominator at most 15. This is an experiment, not a formal bridge.

All 510 nonempty binary words of length at most 8 were tested in the three
directions with zero extension. The enlarged arbitrary-word family fails LC:
AAAABB has coefficients 4,6,10 at (1,3),(1,4),(1,5), so 36<40. There are
2,3,12 failing words at lengths 6,7,8 respectively. This is NOT a counterexample
to the pinned root: arbitrary words are not the Farey/Christoffel source family.
In particular AAAABB has count label (2,6), which is not reduced. A proof
strategy through positive matrices must retain source word restrictions or a
stronger invariant. Matrix positivity alone cannot justify arbitrary-word LC.

Evidence: research/cohn_words_21a.py and evidence/markov-21afc594/cohn-words.json.
No universal or kernel-checked matrix claim is made from this experiment.
