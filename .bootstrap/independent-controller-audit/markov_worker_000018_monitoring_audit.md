# Independent monitoring audit: worker 000018

Request `f6506bc615574382b93e600ac6a368f9`. Read-only inspection of the completed
snapshot `/Users/sasha/math_gkm/.control/markov/workers/000018/artifacts`.
No project edits, mathematical suggestions or proposer contact occurred.
Worker 000019 was left undisturbed.

## Finding

The new theorem establishes the actual raw vertical log-concavity inequality
at **fixed i = 2 for every source with b = a+1**, including all small cases and
zeros. It is unbounded in the denominator. It does not establish the other
columns, other directions or arbitrary fractions. The normalization example
refutes a strictly stronger auxiliary assertion, not the published raw claim.
No English/Lean scope discrepancy was found.

## Source coverage and polynomial identity

`rightP650 n` is defined directly as the pinned source polynomial of n right
steps; its labels are a=n+1, b=n+2. `source_near_one_path650` proves that every
source path satisfying b=a+1 is such a path. Coverage therefore does not rely
on a finite enumeration or an unproved classification.

Writing P_a for this actual a/(a+1) numerator (a≥1), the checked recurrence is

    P_(a+2) = (u+v+1)(u+v) P_(a+1) - uv P_a.

The simultaneous low-column recurrences and a two-step induction prove, for
a≥5, the exact raw column formula

    2[u^2]P_a = v^(a-1)(1+v)^(a-5) R_a(v),
    R_a(v) = 16 + (32a-16)v + (9a^2+29a-26)v^2
                   + (12a^2+2a-6)v^3 + (4a^2-2a)v^4.

In Lean the parameter is a=n+5, n natural. Thus neither exponent uses a
truncated subtraction to conceal a missing small-parameter hypothesis.

The five residual coefficients are strictly positive for every n≥0. The
three adjacent LC gaps are proved nonnegative by their explicit polynomial
expressions with nonnegative coefficients in n. The five-term sequence is
zero outside indices 0 through 4, and the proof explicitly establishes its
interval-support hypothesis before invoking the inherited adjacent-to-CrossLC
bridge. Pascal smoothing and the monomial shift consequently apply with all
required hypotheses discharged. The common factor 2 is canceled in the final
inequality; no coefficient-dependent normalization occurs.

For a=1,2,3,4, the exact i=2 columns are, respectively,

    1;
    1+5v+6v^2;
    8v^2+24v^3+15v^4;
    8v^3+48v^4+69v^5+28v^6.

The finite relevant positions are checked exactly, and the source polygon-zero
theorem handles all larger natural indices. The final theorem
`source_near_one_vertical_two650` assumes only a source path, b=a+1, and j natural,
and concludes

    A_(2,j) A_(2,j+2) ≤ A_(2,j+1)^2.

No cutoff on j, denominator bound, remaining formula premise, or deletion of
zero coefficients survives. The separate endpoint clauses of the full root
are unchanged; the family under discussion is a≥1.

## Precisely stronger assertion that fails

`right_twelve_valid650` proves that eleven right steps give labels 12 and 13
and verifies polygon membership for all three points (0,14), (1,14), (2,14).
The exact jets give raw coefficients 11, 510, 10680 at those points.

The homogeneous degree is 12+13-1=24. On row j=14, dividing coefficient i by
choose(24-14,i)=choose(10,i) gives 11, 51, 712/3. The checked rational inequality
is

    51^2 = 2601 < 7832/3 = 11*(712/3).

This is an actual-source obstruction to the stronger horizontal binomial
normalization. The separate theorem `source_horizontal_raw_holds650` proves

    11*10680 = 117480 ≤ 260100 = 510^2.

It is therefore not a source counterexample to raw LC. The finite strengthened
scans and matrix-minor observations are not additional universal theorems.
This audit makes no historical novelty claim.

## Recorded verification checked

Manifest: `evidence/markov-f6506bc6/validation-1791949372800338000.json`.
The four final source hashes match that manifest, the host archive, and live
source bytes at audit time:

| Module | SHA-256 |
|---|---|
| MarkovRightJetsF650 | d3241338f7db4d8f836184767c16a80e8eab7441bcc3e00d3643db354e7ad710 |
| MarkovQuarticLCF650 | 96605d925c04b017fc8998d885cd0b1e8a73e3a3e15d14cf2237ec11891be4f8 |
| MarkovRightSourceF650 | 8a7736ab678a29edddd5559ca6e8ed3b22c1d0655b1ce927aa96d4df3fe050b3 |
| MarkovHorizontalObstructionF650 | a0b670ab5a1f52498712af58fea6bcfe400c6d3bdd37860cf5453019f5137cbe |

All four final compilation receipts and all four `leanchecker` receipts have
return code 0 and the matching source hash. All eight receipt byte hashes match
the archived host record. The eleven printed theorem axiom closures contain
only `propext`, `Classical.choice`, and `Quot.sound`. The eleven rejected
attempts separately have return code 1; none was counted as accepted evidence.
Every listed direct-import binary hash matched at audit time.

The root remains at SHA-256
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host records completion after 1184.27 seconds, mathematical resolution false,
and no completion certificate.

These are inspected matching recorded checks with inherited compiled imports,
not a fresh independent rebuild. No discrepancy requiring a full rebuild was
found. The full published conjecture remains unresolved.
