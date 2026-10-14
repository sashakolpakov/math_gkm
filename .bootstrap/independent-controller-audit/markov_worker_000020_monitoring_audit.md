# Independent monitoring audit: worker 000020

Request `4f8ceeeb08e4428892713ab6457705dd`. Read-only audit of
`/Users/sasha/math_gkm/.control/markov/workers/000020/artifacts`.
No project edits, proof suggestions or proposer contact occurred; active worker
000021 was left undisturbed.

## Finding

`fifth_raw_logConcave4f8` proves the actual raw fifth-upper-diagonal LC inequality
for **every source path with numerator a≥7**, at all natural indices on that
line, including zero coefficients. The exact source formula and every statistic,
LC and transfer condition are discharged; there is no denominator cutoff.

The general fifth-diagonal result for numerators 2 through 6 is not established
by this work. Numerator one was already completely covered in earlier checked
work. Other diagonal levels and the remaining coordinate-direction inequalities
remain obligations of the full conjecture. No substantive English/Lean mismatch
was found in the new claimed result.

## Exact fourth-coefficient formula

For a Boolean core word of length n≥2, the formal statement tracks:

- m = count of true/B letters;
- s = count of adjacent unequal letters;
- t = count of length-three blocks with equal outer letters and a false/A
  center, namely AAA or BAB.

`word_quartic4f8` proves the denominator-cleared identity

    24 [z^4] wordQuotient(x,w) = A + Bx + Cx^2 + Dx^3 + Ex^4,

where

    A = m(m-1)(m-2)(m-3),
    B = 4((n-8)m^3+18m^2+(5n-22)m-6n+12)+48(1-m)s+48t,
    C = 6(n^2(m^2+3m+6)+n(-11m^2-9m-18)+26m^2-10m+12)
        +(144-48n)s,
    D = 4(n-1)(n-2)(3n+m(n-6)),
    E = (n+1)n(n-1)(n-2).

The Lean identity holds over an arbitrary commutative ring in this multiplied
form; it does not posit division by 24 in rings where 24 is not invertible.
The actual application is over integer polynomials, then real coefficients,
where the common factor can be canceled in the inequality.

The proof establishes the two-letter initial cases and maintains a simultaneous
row-state invariant under all Boolean transitions. The statistics are updated
from the actual ordered word. Experimental interpolation is not an assumption
of the formal theorem. Empty and one-letter cores are excluded from this generic
formula, and the source application explicitly rules them out.

## Source and inequality hypotheses are discharged

`quartic_source_formula4f8` quantifies over every source path with a≥7 and
constructs natural n,m,s,t with

    n+2=b, m+1=a, 6≤m≤n, s≤2(n-m), t≤n-m,
    24*quotientSlice774(path,4) = quarticExpr4f8(X,n,m,s,t).

The length and count identifications come from the exact inherited source-word
bridge. The switch bound is the inherited proved count bound, and the triple
bound is separately proved by induction. Natural subtraction is converted to
real subtraction only with m≤n established. There is no unproved admissibility
condition or finite-word bound hidden in the source theorem.

`quartic_cert4f8` and `quartic_inequalities4f8` prove AC≤B², BD≤C², CE≤D² under
these real parameter bounds. Lower and upper coefficient estimates, their
nonnegativity, and the three polynomial gap certificates are all checked.
The substitutions m=x+6, n=x+6+y have x,y≥0; the proof does not assume that a
finite coefficient scan establishes positivity.

`fifth_quotient_adjacent4f8` then proves every natural-index adjacent inequality
of the actual r=4 quotient slice. Indices beyond the quartic degree are handled
by exact zero coefficients. The uniform factor 24 is canceled rather than
introduced as a coefficient-dependent normalization.

The final result is

    A_(i,j+2) A_(i+2,j) ≤ A_(i+1,j+1)^2,
    for all natural i,j with i+j+6=a+b-1, whenever a≥7.

Each point therefore has total raw degree a+b-5, with omitted homogeneous
exponent r=4. This is the fifth upper diagonal when the top level is r=0.
The theorem has no polygon guard: it covers every nonnegative triple on that
line, retaining zeros outside support, and thus in particular the polygon
triples required by the root.

The exact upper-slice factorization and previously proved quotient interval
support are invoked through the inherited transfer. The condition 2r≤a+b-1
follows from a≥7 and the actual source inequality a<b. Thus no residual LC,
no-gap or smoothing hypothesis survives in `fifth_raw_logConcave4f8`.

## Duplicate and experimental content

`MarkovCubicJet4f8` gives a checked cubic formula with an alternate adjacency
statistic. The report explicitly identifies it as duplicating earlier cubic
work. It is not counted as a new diagonal result. The quartic proof imports
the earlier cubic invariant rather than relying on an unverified rediscovery.

The 32,764 word checks and 8,550 source-triple checks are finite experiments,
separate from the universal theorem. They do not discharge the omitted small-a
family cases. No historical novelty assertion is made in this audit.

## Recorded verification inspected

Manifest: `evidence/markov-4f8ceeeb/validation-1791951589039539000.json`.
The four final source hashes match the manifest, host snapshot and live bytes:

| Module | SHA-256 |
|---|---|
| MarkovCubicJet4f8 | 451a03ae57ff866dfb5166501972f2ad84697dd47dd4bd43fe693844000cfe02 |
| MarkovQuarticJet4f8 | b4e62f89bcf7fe44592a25f18c0a230baeac2924b040fbfdbc2446632636f874 |
| MarkovQuarticBounds4f8 | f8e09af161a21ba90c0f03edbc6426607d66a46e450bd571e06a9141d90d759c |
| MarkovQuarticSource4f8 | 5cbebf55165e487f20324816c703be12089aceb2646c42d973352c2a0474c88b |

All four named compilations and four `leanchecker` replays have return code 0
and matching final source hashes. All eight receipt byte hashes match the host
archive. The six printed theorem axiom closures contain only `propext`,
`Classical.choice`, and `Quot.sound`. Six rejected compilation attempts have
return code 1 and remain separate from accepted evidence. Listed project-local
direct-import binary hashes match; the external shared Mathlib binary was not
independently rehashed in this monitoring check.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host reports completion after 1100.84 seconds, mathematical resolution false,
and no completion certificate.

This audit inspected source meaning and matching recorded checks, which use
inherited compiled imports. It did not perform a fresh independent rebuild.
No discrepancy requiring a full rebuild was found. Conjecture 6.3 remains open.
