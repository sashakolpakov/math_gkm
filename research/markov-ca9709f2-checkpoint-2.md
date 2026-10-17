# Checkpoint 2 — exact beta comparison connected

Machine-authored ca9709f2. Five new modules now compile: BetaMean,
RadialCompare, BetaComparison, BetaGrouping, BetaTransport, all suffixed MCA9.
The final transport proves the unbounded raw kernel inequality

    M_i(d,i+r) M_(i+2)(d,i+r) < M_(i+1)(d,i+r)^2

for all natural d,i,r with i+4r<=d+1 and r>=1. The denominator-free
tailGap is strictly positive on this domain. All four bridges listed as
missing in the predecessor's beta proof are now connected through the
raw-kernel stage: scalar expectation, inward covariance, antidiagonal sum,
and actual density scaling. Source-row attachment is being compiled.

No kernel replay or axiom closure audit yet; compilation receipts are retained.
Full pinned root still open, including upper depths outside the bound, middle
horizontal strip, vertical/diagonal conditions, and OtherFourM9E2.

New finite exact source experiment passed 34,402 coefficient comparisons,
retaining 6,940 zeros; 9,722 linear-bound row triples; 10,342 strict column
checks; 655,603 polygon-valid triples across all three directions for 93
distinct labels including both endpoints. Evidence is experimental only:
evidence/markov-ca9709f2/source-experiment.json.

Hosted primary source opened and Definitions 6.1–6.2 and Conjecture 6.3 checked
at https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . No external
theorem was introduced into Lean. Earlier target/source audits remain inputs,
not a fresh independent completion audit of these new bytes.
