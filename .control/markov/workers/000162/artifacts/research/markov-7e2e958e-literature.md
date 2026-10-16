# Live source observations

Machine-authored 7e2e958e, 2026-10-16 UTC. Hosted search and open succeeded. Shell networking was not used.

- [Evans–Veselov–Winn, published article](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html): retrieved the source containing the pinned recurrence and Conjecture 6.3. The target remains raw coefficient log-concavity in the three principal directions; the separate saturation result does not supply it.
- [Primary paper on log-concavity under dependent convolution](https://www.stats.ox.ac.uk/~goldschm/logconcavity.pdf): inspected Condition 1 and its proof around Lemma 2.4. It uses centered partial sums and summation by parts, rather than termwise positivity. This is a related method only; no external assertion is used as a Lean axiom and its hypotheses are not assumed for our kernel.

Own selected proof route: coefficientwise adjacent-parameter minors of Q(j,t) are nonnegative by reflection pairing. The underlying binomial ratio increases with its coefficient index, and the reversed source weight sequence has the same ordered minor sign. A geometric-prefix recurrence in the parameter then expresses its full LC gap as a sum of these minors. This argument is checked in new Lean source; it does not itself settle the truncated lift or source lower-row inequalities.

A follow-up search for Jacobi/Legendre triangular transforms returned related LC-positivity and log-convexity papers, including [Wang–Yeh](https://www.sciencedirect.com/science/article/pii/S0097316506000124). No applicable theorem closing the present kernel condition was established from that search, and no such theorem is imported into Lean.
