# Developing third-diagonal result: mathematical scope audit

Date: 13 October 2026. This is a read-only source-correspondence review. No project edits, proof recipes or corrections were supplied to the machine. Its files were evolving during the review; conclusions below are tied to snapshots.

Reviewed snapshots include:

- `MathGKM/MarkovLogConcavity.lean`: initial abstract-smoothing version SHA256 `06ccf2b3c703260580e73284c598e7d7101b0195d8f4d5ff73d297ed1b385b4e`; expanded expression-theorem version SHA256 `16226513d6a241528767fb46916b48abb6a43bbc25d594412af50d6af37b6d69`. A later proof-repair snapshot, SHA256 `19e8a1df19d7f9dbf0dd0c369336486eb480ef7e8ff09f8d6ab9cf5500d07396`, retains the same mathematical conclusion and restrictions.
- `evidence/markov/response-0003.json`: SHA256 `9892722d38a00c9e54cebb6aefc5e0190cd55b99889705ce0a961f8df9d1239e`.
- `evidence/markov/diagonal.py`: SHA256 `6af9d0cec119673b60d0bffd713186e93b3b16d83fa613c7e2ff25b0ab06838e`.

## Source formula and normalization

For reduced positive a/b in [0,1], write D=a+b−3. The third upper diagonal has i+j=D, equivalently w-exponent 2 in the homogeneous numerator. It is a single direction on one line, not all the triples in Conjecture 6.3.

In the source's ordinary-polynomial range a+b≥5, its generating polynomial is

\[
p(t)=\sum_{k=0}^{D}A_{k,D-k}t^k
     =(1+t)^{a+b-5}q(t),
\]

\[
q(t)=\frac{(a-1)(a-2)}2 +(ab-4a+2)t
             +\frac{(b-1)(b-2)}2t^2.
\]

The source proves log-concavity on this line under a/b≤3/5 (Theorem 6.7). Its coefficient formula is in Theorem 4.2; the factorization and q are in the proof of Theorem 6.7. [Published primary source](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).

The experiment's triple `(A,B,C)=((a−1)(a−2), 2(ab−4a+2), (b−1)(b−2))` is therefore the coefficient triple of **2q**, in constant/linear/quadratic order. The new Lean `ThirdA`, `ThirdB`, `ThirdC` use q itself. Uniform multiplication by 2 preserves these inequalities; this is unrelated to the earlier failed coefficient-dependent factorial normalization.

The relevant quadratic coefficient inequality is B²≥AC. Real-rootedness of a genuine quadratic requires B²≥4AC. These are distinct conditions. The machine's recorded example a=3,b=4 has q=1+2t+3t²: its coefficient inequality holds, but its discriminant is −8. Its whole displayed diagonal expression is `(1+t)^2 q`, with coefficient list `[1,4,8,8,3]`. This example supports the stated distinction; it does not prove a universal Markov assertion.

## Small-parameter and exponent audit

The formula with `(1+t)^(a+b−5)` must not be interpreted using truncated natural subtraction outside a+b≥5. Negative exponents in a printed factored expression are not ordinary polynomial exponents.

Among reduced positive 0<a≤b, the cases with a+b<5 are exactly:

| Parameter | Geometric third diagonal | Actual numerator contribution |
| --- | --- | --- |
| 1/1 | i+j=−1, no nonnegative indices | absent |
| 1/2 | i+j=0, outside the Newton polygon | zero |
| 1/3 | i+j=1, only (1,0) in the polygon | t |

The separate 0/1 endpoint also has no w² contribution.

At 1/3, q=t+t². The formal-looking rational product `(1+t)^(-1)q` reduces to t, whereas replacing the negative exponent by zero gives t+t² and is wrong. At 1/1 the printed factored formula is outside its polynomial domain entirely. These are formula-domain issues; all the actual small-case log-concavity obligations above are vacuous.

At a+b=5 the exponent is genuinely zero: the reduced cases are 1/4 and 2/3. No negative-power interpretation is needed. Source binomial expressions must likewise distinguish an out-of-range lower index, which denotes zero, from a negative upper index, which needs an explicit convention or a separate small case.

The developing theorem assumes **3≤a<b**, so its exponent is safely nonnegative (indeed a+b≥7). Its use of natural subtraction is therefore correct on its stated domain. This theorem does not include the a=1 or a=2 families. An all-fractions statement needs those cases recorded separately; it should not silently remove the current lower bound.

## What the new Lean statements actually establish in meaning

The expanded snapshot introduces `CrossLC f`, requiring

\[
f(i)f(j+1)\le f(i+1)f(j)\quad(i\le j),
\]

for integer indices. This is an explicit stronger invariant than adjacent log-concavity. The code does not assume that every arbitrary adjacent-log-concave sequence automatically satisfies it. It constructs the invariant for a nonnegative three-term sequence satisfying AC≤B² and transports that invariant through the stated operations.

`CoeffSeq` extends ordinary real-polynomial coefficients by zero at negative integer indices, with the negativity test before `toNat`. This avoids accidentally treating every negative index as the constant coefficient.

The file supplies statements linking its abstract `Pascal` iterations with coefficients of `(1+X)^n * Quadratic A B C`. It also supplies an exact polynomial identity named `third_gap_certificate` and parameter bounds for real 3≤a, a+1≤b. These are universal algebraic statements, not merely the sampled inequalities from the preceding experiment.

The final `third_diagonal_expression_logConcave` quantifies over all natural 3≤a<b and all integer coefficient indices. It concerns the explicit polynomial displayed above. Its comment expressly states that the recurrence-to-expression identity remains a separate formal obligation. This is an appropriate scope description and does not assert full Conjecture 6.3.

This review checked mathematical meanings, not compilation. The recorded source was being edited; only a successful Lean check and dependency audit for the final bytes can turn its submitted proofs into accepted formal results. No compilation success for these hashes is asserted here.

## Bridge required for a claim about actual Markov coefficients

The remaining identification must relate the generated numerator at a given path to the entire third-diagonal polynomial p(t), with the same raw coefficients and orientation. The finite comparisons in `diagonal.py` are evidence for that identification but do not establish it for every path.

The bridge must also connect integer coefficient indices of p with the triples on i+j=D inside `InPolygon`. The sum defining p includes zero coefficients at any excluded lattice positions; a claim about actual polygon triples should retain those positions and then restrict appropriately, not renumber only the nonzero terms.

For a fully internal formalization, the source coefficient identity and family/index correspondence need Lean proofs. If the campaign instead explicitly accepts the published coefficient formula as external input, the output must state that contract and keep the end-to-end formalization boundary visible. Either choice is distinct from assuming log-concavity itself.

With that identification and the omitted parameter cases supplied, the result would remove the source's ratio restriction **for the third upper diagonal**. It would still leave all other interior lines and the other principal directions of full Conjecture 6.3 unresolved.

## Experimental claims

The recorded raw scan covers 79 reduced interior fractions with denominator at most 16 and 22,339 valid triples. It is correctly labelled a finite exact computation. The separate quadratic scan checks 1,275 integer pairs 1≤a≤50, a<b≤51, including unreduced pairs; those pairs are not 1,275 distinct source fractions.

The quadratic scan's absence of failures and its negative discriminants are diagnostic observations. The normalization counterexample refutes that stronger normalized predicate, and the subtraction example refutes closure for arbitrary input sequences. Neither is a counterexample to raw Markov log-concavity. The reviewed machine decisions maintain these distinctions.
