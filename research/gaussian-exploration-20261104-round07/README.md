# Gaussian exploration: two round-seven classifications

This immutable source packet preserves exactly two newly admitted, closed
own-MAIN round0007 exploration claims, their original FINISHED-bound validator
archives, and the 12-file first-party import closure needed to reproduce them.
It does not relabel all nine accumulated admissions as new results.

Write [a]_X = sum_{i<a} X^i. The q-integer classification states that for all
natural a,b and all H in Q[X], the premises b>0 and [a]_X=[b]_X*H imply

    b divides a, and H = sum_{j<a/b} X^(b*j).

H is a rational polynomial: integrality or nonnegative coefficients are not
additional premises. The case a=0 is included and gives the zero polynomial.
The exact theorem is qinteger_classification in
MathGKM/Plan0007QIntegerClassification.lean.

The adjacent Gaussian classification states that for all natural n,l and all
H in Q[X], the premises B(n,l) != 0 and
B(n,l+1)=B(n,l)*iota(H), in the unchanged contract's notation, imply

    (l+1) divides (n-l), and
    H = sum_{j<(n-l)/(l+1)} X^((l+1)*j).

Subtraction and division here are natural-number operations. There is no l<n
premise: l=n is included and gives H=0. The numerator index is specifically
k=l+1. This is a uniform adjacent quotient family, not arbitrary k. The exact
theorem is adjacent_classification in MathGKM/Plan0007AdjacentClassification.lean.
No additional iff, converse/existence result or mathematical novelty is asserted.
The contract's NatCoeffs predicate concerns coefficients, not numerical values
of the polynomial.

The full target MathGKM.GaussianQuotient.FullPositivity quantifies arbitrary
n,k,l and remains open. An empty task.hypotheses list does not remove the
premises written as implication arrows in each exact statement_lean.
Descriptive English/Lean scope review does not constitute independent
paper/source approval or satisfy the separate full-root correspondence gate.

## Preserved evidence and source versions

Both new admissions were checked under native implementation
6f3c44afff35f20d63be78d94aac857c9d3532c340c63514d3473de5f7617934.
Four source files match the earlier seven-admission exploration packet exactly;
PROOF_REGISTRY.json retains their historical
71adccc13e32484c2efcd1b002d6786f61d4570f65c8344dd26dc84171af19e5
provenance. They are not newly attributed admissions. Other modules are included
only because their exact bytes belong to these new checked source closures.
The source revision establishes no causal performance winner for the earlier
A/B run; no controlled method-learning advantage is claimed. The mathematical
proposer remained autonomous and received no archival-session research guidance.

validation/<claim-id>/ retains each original FINISHED.json and every bound
nonbuild file unchanged, including the native checker result, StudyCheck,
StudyInspect, declaration artifact, sandbox profile and pins. All original
compile, kernel-replay and premise-inspection operations completed with return
code zero and no termination. Inspected axiom closures are restricted to
propext, Classical.choice and Quot.sound. Original and relocated records passed
genuine verify_record and FINISHED reuse before preservation.
No unadmitted draft, model/role payload, evaluation question/answer, controller
authority, private raw state, dependency build or compiled object is included.

Each portable admission_record changes only validation_bundle.directory to a
packet-relative locator. original_record_binding retains the original locator
and canonical record hash; substituting that locator recovers the original
hash. Original absolute paths inside validator evidence are provenance, not
commands or authority to resume a controller. The unchanged contract and its
seed definition provenance retain the original source interpretation.

## Reproduction

Use Lean4.32.2 and the exact dependency revisions in lake-manifest.json. This
packet downloads nothing and includes no dependency caches. The strict replay
requires the original Darwin lean and leanchecker binary hashes recorded in
PROOF_REGISTRY.json; another platform needs a separately audited build.

Static byte/import verification, without a compiler or checker:

```sh
python3 -I -B -S reproduce.py --verify-only
```

For an explicitly authorized replay on the original host, under its normal
resource wrapper, supply the pinned toolchain and prepared dependency libraries:

```sh
python3 -I -B -S reproduce.py \
  --toolchain /Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2 \
  --packages-dir /Users/sasha/math_gkm/.lake/packages \
  --build-dir /private/tmp/gaussian-exploration-round07-replay-FRESH
```

The build directory must be absent and outside this packet. The fixed
1800-second reproducer compiles and kernel-replays the complete project source
closure, then reproduces both original admissions and exact native inspector
artifacts and markers. Generated objects and logs stay outside this packet.
Only source/receipt preservation and static verification ran during archival;
no new compilation, kernel replay, model, experiment or research action ran.
