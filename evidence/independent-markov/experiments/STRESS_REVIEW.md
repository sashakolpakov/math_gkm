# Extended finite stress-scan review

The unchanged stress.py was copied alongside the independently reproduced
scan.py and executed entirely in this temporary directory. It completed
successfully with:

- 241 proper reduced fractions with denominator at most 28;
- 229,476 valid raw-coefficient triples;
- 6,822 diagonal sequences;
- 20,781 lattice points satisfying i<a, j<b, and bi+aj>ab;
- no recorded support, raw-inequality, divisibility-by-four, exact-division,
  negative-residual, or residual-log-concavity failures.

Independent direct gcd enumeration confirms exact fraction coverage without
duplicates. Independent polygon-center enumeration confirms every displayed
triple, diagonal, and critical-point count. The reproduced report matches the
active report exactly after removing only elapsed runtime.

The diagonal loop includes every position k on i+j=d-r and inserts zero when
the coefficient is absent. It divides its ascending coefficient list by
1+t exactly max(d-2r,0) times using q_k=c_k-q_(k-1), explicitly checking the
last coefficient at every step. Thus its residual tests concern genuine
polynomial quotients whenever the division checks pass. They use raw exact
integer arithmetic, not the earlier failed factorial normalization.

The conclusions are finite evidence only. In particular this test does not
prove a universal factorization, nonnegative quotient, residual log-concavity,
divisibility-by-four theorem, saturation, or full Markov log-concavity.

Artifacts: stress-reproduction.json, stress-independent-checks.json, and the
copied stress.py/stress-result.json under evidence/markov.
