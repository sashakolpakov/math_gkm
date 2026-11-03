# Gaussian baseline: eight checked admissions

This immutable source packet preserves exactly the eight selected MAIN
admissions listed in PROOF_REGISTRY.json. It extends the round04 packet with
three checked reciprocity/lower-half results. Newer admissions and pending
drafts are not included. Full Gaussian quotient positivity remains open.

Two conclusions are universal under the original two premises, for every
n, k, l and rational polynomial H: B(n,l) is nonzero, and
B(n,k) = B(n,l) * iota(H). The integrality theorem establishes that every
coefficient of H is an integer. The reciprocity theorem establishes
H.reverse = H, expressing palindromicity. Neither conclusion establishes
coefficientwise nonnegativity. No negative-coefficient examples are asserted.

The new conditional reduction shows that it suffices to establish universal
coefficient nonnegativity for degrees satisfying 2*d <= H.natDegree. That
lower-half nonnegativity premise remains OPEN. The earlier integrality-based
reduction to full positivity is also retained; a reduction is not a proof of
its remaining premise or of the full conjecture.

The other admissions are general integral unit-division and common-scalar
reciprocity lemmas, positivity under an explicit divisibility matching, and
positivity under an explicit positive block cover. See the exact statements
and premises in PROOF_REGISTRY.json. These sufficient conditions are not
asserted to cover all quotients. No novelty or learning advantage is claimed.

The 21 files in MathGKM/ are the complete first-party import closure of these
eight admissions, including exact root definitions, frozen target propositions
and accepted export wrappers. All fourteen source files from the earlier
round04 packet retain exactly their previous bytes. No unrelated campaign
result is imported. The contract and original definition provenance retain
the source interpretation; this export does not replace the independent
final correspondence audit.

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
  --build-dir /private/tmp/gaussian-baseline-round05-replay-FRESH
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
