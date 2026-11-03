# Gaussian exploration: seven checked admissions

This immutable source packet preserves exactly seven closed own-MAIN
exploration admissions listed in PROOF_REGISTRY.json. It extends the first
five-admission round00 packet with plan0001-full-gaussian-quotient-integrality
and plan0001-positive-reciprocal-sign-obstruction. Exact checked propositions,
quantifiers and premises are retained. The full Gaussian quotient positivity
target remains open.

The new Gaussian integrality theorem is universal over n,k,l in N and H in
Q[q]. Under the original two premises, B(n,l) != 0 and
B(n,k) = B(n,l) * iota(H), every coefficient of H is an integer. There is no
additional index-order or witness restriction. This has the same Gaussian
integrality scope as the baseline result, obtained through the exploration
arm's alternative unit-leading division route; no stronger Gaussian claim is
asserted.

The sign-obstruction theorem uses the explicit polynomials P = 1+q^3,
Q = 1+q and R = q^2-q+1. It proves P = Q*R, natural coefficients for P and Q,
monicity of Q, reflect_3(P) = P and reflect_1(Q) = Q, while the coefficient of
q in R is -1 and R does not have natural coefficients. This is a generic
polynomial counterexample showing those properties do not suffice for the
coefficient-sign conclusion. No realization as a quotient of Gaussian
binomials at the same n is given. It does not refute FullPositivity.
These scopes were independently reviewed before this packet was frozen.

These are seven exploration admissions. Their number does not assert seven
results unique over the baseline or a demonstrated method-learning advantage.
No mathematical novelty is asserted, and baseline and exploration admission
counts must not be combined as independent new capabilities.

All proof sources, accepted records, native validator archives, contract and
pins were taken from this exploration arm's own snapshot and closed MAIN
checks. No baseline proof source or accepted record was copied. The shared
root definition remains the unchanged exploration clean seed.

The 19 files in MathGKM/ form the complete first-party import closure of these
seven admissions. All thirteen prior source files, five admitted records and
five FINISHED-bound archives retain their previous bytes. Unadmitted drafts,
model/role material, evaluation tasks/answers and comparison results are
excluded. The contract and definition provenance retain the original source
interpretation; this archive does not replace independent final
English/source correspondence review.

## Original evidence and identities

validation/<claim-id>/ contains each original FINISHED.json and every bound
nonbuild file, unchanged: native validator result, source closure, StudyCheck,
StudyInspect, declaration artifact, sandbox profile, rebuild pins and retirement
metadata. These are proof evidence, not compiled objects or role/model reports.
All original compile, kernel-replay and trusted premise-inspection operations
finished with return code zero and no termination. Inspected axiom closures use
only propext, Classical.choice and Quot.sound. Original and relocated records
passed the genuine verify_record and FINISHED reuse checks before publication.

Each registry admission_record has a portable validation directory relative to
this packet. original_record_binding preserves the original absolute locator
and canonical record hash: substitute that original locator into the portable
record to recover its original hash. For native reuse on this original host,
resolve the portable locator against this packet's directory in a temporary
record; leave every source, task, solution and FINISHED byte unchanged.

Raw validator results retain original paths and the finite environment created
by machinery.trust.environment. They contain no model/provider reports, usage,
requests, benchmark questions or comparison answers. Original absolute paths
are provenance, not commands or authority to resume a controller.

## Reproduction and limits

Use Lean 4.32.2 and the exact nine dependency revisions in lake-manifest.json.
The root mathlib revision is 905b95818eb32af7874a58b427f50c1711a5e96c.
Dependency sources remain available at their pinned upstream Git repositories;
no package objects, dependency cache or compiled products are published here.
Prepare those dependency checkouts and necessary library objects separately.
This reproducer performs no download or package update.

The strict reproducer checks the exact original Darwin lean and leanchecker
binary hashes in PROOF_REGISTRY.json, dependency revisions and tracked-source
cleanliness. It is not a claim of portable binary reproduction or a completed
cold-install check. A different platform requires an independently audited
build, whose identities must not be described as the original ones.

Verify this archive statically, without a compiler or checker:

```sh
python3 -I -B -S reproduce.py --verify-only
```

For the original host, under its normal bounded resource wrapper:

```sh
python3 -I -B -S reproduce.py \
  --toolchain /Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2 \
  --packages-dir /Users/sasha/math_gkm/.lake/packages \
  --build-dir /private/tmp/gaussian-exploration-round01-replay-FRESH
```

Choose an absent build directory outside this packet. The fixed 1800-second
reproducer recompiles and kernel-replays the entire project import closure,
then recompiles/replays each original StudyCheck and runs its unchanged native
StudyInspect. Every inspector artifact must reproduce its original hash, byte
count and completion marker. Generated objects, logs and the reproduction
result remain in the external build directory.

This preservation step ran only receipt/source checks and static verification.
It ran no compiler, kernel replay, model or cold-recompile experiment and made
no changes to the active machine or clean target seed.
