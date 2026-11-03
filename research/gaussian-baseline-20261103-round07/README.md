# Gaussian baseline: nineteen checked admissions

This immutable source packet preserves exactly the nineteen selected closed
MAIN admissions listed in PROOF_REGISTRY.json. It extends the round06 packet
with these five completed records:

- gaussian-binomial-index-complement-v0
- gaussian-quotient-S-product-identity-v0
- gaussian-quotient-index-normalization-v0
- gaussian-quotient-natDegree-identity-v0
- gaussian-quotient-zero-out-of-range-v0

The exact checked propositions, quantifiers and premises appear in the
registry. Assume the original two quotient premises: B(n,l) is nonzero and
B(n,k) = B(n,l) * iota(H). For k <= n, the normalization theorem sets
l′ = min(l,n-l) and k′ = min(k,n-k), and proves l′ <= k′, 2*k′ <= n,
B(n,l′) is nonzero, and B(n,k′) = B(n,l′) * iota(H). The polynomial H is
unchanged. No initial l <= k premise is needed for this normalization.

Under the original quotient premises and k <= n, the degree theorem gives
H.natDegree + l*(n-l) = k*(n-k). The product theorem gives
H*S_k*S_(n-k) = S_l*S_(n-l), where S_m(X) is the product of (1-X^j) for
j = 1,...,m. Independently, the complement theorem states
B(n,j) = B(n,n-j) whenever j <= n. Under the original quotient premises,
k > n implies H = 0.

These scopes were independently reviewed before this packet was frozen.
Normalization and the earlier boundary-band theorems remain separate admitted
statements. Coefficient nonnegativity in the remaining region and full Gaussian
quotient positivity remain open. No novelty, method-learning advantage or
conjecture solution is claimed.

The earlier integrality and reciprocity results and conditional reductions
are retained unchanged. Their hypotheses and the unresolved lower-half
nonnegativity premise remain explicit in the exact statements. The earlier
natural-coefficient boundary-band results require l <= k <= n, the original
nonzero-denominator and polynomial-quotient premises, and their stated degree
bounds; they must not be read as unrestricted coefficientwise positivity.

The 45 files in MathGKM/ form the complete first-party import closure of these
nineteen admissions, including exact root definitions, frozen targets and
accepted export wrappers. All thirty-four source files, fourteen admitted
records and fourteen validator archives from round06 retain their previous
bytes. Newer admissions, pending drafts and unrelated campaign results are
not included. The contract and definition provenance retain the original
source interpretation; this archive does not replace final independent
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
  --build-dir /private/tmp/gaussian-baseline-round07-replay-FRESH
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
