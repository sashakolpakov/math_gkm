# Gaussian exploration: first five checked admissions

This immutable source packet preserves exactly the first five closed own-MAIN
admissions of the exploration arm, listed in PROOF_REGISTRY.json. Their exact
checked propositions, quantifiers and premises are retained. The full Gaussian
quotient positivity target remains open.

The general division theorem takes P,Q in Z[q] and H in Q[q]. If the
leading coefficient of Q is 1 or -1 and the canonical rational casts satisfy
P = Q*H, then H is the rational cast of an integer polynomial. A second
admission expresses the same scope through the faithful fraction-field
embedding. These are two representations of the same division mechanism.

The other three admissions provide the integer-product bridge
intT_m = product(j=1,...,m)(1-q^j), its leading coefficient (-1)^m, its
embedding as T_m and its nonvanishing; the exact range test
B(n,k) != 0 iff k <= n; and, for k,l <= n, denominator clearing under the
original quotient premises. The cleared identity is
intT_l * intT_(n-l) = intT_k * intT_(n-k) * H, with the canonical embeddings
into the fraction field understood. Exact formal statements are in the
registry, and this scope was independently reviewed before the packet froze.

These admissions contain no coefficient-sign conclusion or separately
admitted universal Gaussian-quotient integrality statement in this arm.
They provide an abstract unit-leading division route; no stronger Gaussian
result is claimed. This is a count of the first five learning-arm admissions,
not five results unique over the baseline or a demonstrated method-learning
advantage. No mathematical novelty is asserted.

All proof sources, accepted records, native validator archives, contract and
pins were taken from this exploration arm's own snapshot and closed MAIN
checks. The baseline publication supplied only the archive/reproduction
format. No baseline proof source or accepted record was copied into this
packet. The shared root definition is the unchanged exploration clean seed.

The 13 files in MathGKM/ form the complete first-party import closure of these
five admissions: the root definition, two own source modules, five frozen
targets and five accepted export wrappers. Unadmitted drafts, model/role
material, evaluation tasks/answers and comparison results are excluded.
The contract and definition provenance retain the original source
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
  --build-dir /private/tmp/gaussian-exploration-round00-replay-FRESH
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
