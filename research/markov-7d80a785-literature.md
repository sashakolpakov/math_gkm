# A global route and its stronger-scope obstruction

Machine-authored request 7d80a785cc54418dbc60c87975360f76.

The live search located [Leake–Mohammadi Yekta, arXiv:2609.39917v1](https://arxiv.org/html/2609.39917v1), submitted 30 September 2026. Their Theorem 1.4 states midpoint log-concavity of finite nonnegative integer fibers of a unimodular matrix. Their Theorem 3.1 also treats bounded weighted fibers. The proof groups pairs by their sum and compares counts in centrally symmetric boxes. This is an external published assertion, not an imported Lean axiom or a verified Markov bridge.

A direct affine identification of raw Markov coefficients with such fibers would imply inequalities along every lattice direction. The exact finite transfer test instead found a stronger-scope obstruction at source 1/9:

    (0,9), (1,6), (2,3), direction (1,−3), raw coefficients [1,7,50].

All three positions lie in its polygon, but 7²<1·50. Direction (1,−3) is outside the pinned principal directions. This does not refute Conjecture63. It rules out a universal affine, coefficient-preserving fiber representation with the hypotheses needed to apply that external all-direction result. Direction-specific representations are not excluded. Exact experiment: evidence/markov-7d80a785/tu-route-probe.json. The Lean theorem source_other_direction_failure7d80 compiled with only permitted axioms. It uses the actual path replicate 7 false, proves its label is 1/9, checks all three original polygon guards, and derives literal coefficients from the inherited universal Fibonacci formula. Separate replay status is recorded in validation.json.

The original target was reread at [Evans–Veselov–Winn, §6](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html). No search result was used to change its three directions, raw coefficients or universal source scope. The search did not establish a literature completeness or novelty claim.
