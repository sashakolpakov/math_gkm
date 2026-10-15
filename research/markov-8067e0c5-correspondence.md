# Exact-root correspondence limits

Machine-authored request `8067e0c51ab944db8a1a44fb7403351d`; completion is null.
The protected root is `MathGKM.Markov.Conjecture63`, source
`MathGKM/Markov.lean`, SHA256
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The [published source](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was consulted live at equations (5), (7)-(11), Definitions 6.1-6.2 and
Conjecture 6.3. Retrieved text adds no premise to the Lean proofs.

* **Coverage:** The new theorem covers every actual predecessor path with
  denominator at least five and every run/offset 5<=k<=n. The combined prefix
  requires n>=4 and covers j<=2n. This is unbounded partial coverage, not all
  reduced rational sources or all positions. Symbolic chamber certificates and
  finite scans do not supply the missing universal coverage proofs.
* **Source family:** The partial theorem uses the protected recurrence through
  `source_fourth_block_shape_extendedCC`. It is not an arbitrary-frame or
  arbitrary-polynomial claim. Full source-family identification is not newly
  discharged. The later-block candidate experiments lack their formal
  chamber-to-source identities.
* **Homogeneity and coefficients:** The raw integer `coeff` extracts u^i v^j
  at w=1. Under the homogeneous source interpretation the omitted exponent is
  a+b-1-i-j. The uniform factor 7560 cancels from the triple inequality; there
  are no factorial weights, position-dependent renormalization, row sums or
  omitted zeros. The full homogeneity/source audit remains a closure obligation.
* **Polygon:** The partial theorem holds without polygon restrictions, hence
  implies its guarded instances. The residual retains the exact pinned guards.
  No support-saturation theorem or replacement polygon is assumed. The inherited
  bound j<=4n+5 is a bound on fourth-slice triples, not a finite bound on n.
* **Directions, zeros, endpoints:** Only the constant-i+j fourth lower slice
  advances. Both axial directions, all other slices, uncovered positions,
  0/1 and 1/1 remain in the unchanged root or its proved exact residual
  equivalence. All inequalities are non-strict, and k=n and n=4 are retained.
* **Assumptions:** The source-bound local compilation, replay and axiom
  inventory is `evidence/markov-8067e0c5/validation.json`. Only the permitted
  ordinary Lean axioms may occur. Hashes, experiments, browser results and
  execution outcomes are not mathematical premises.
* **Proof scope:** `InteriorCore63M806` remains unproved. Neither the exact root
  nor its negation is established. No fresh whole-source rebuild or independent
  hash-bound English/source completion audit is claimed.

Mission and design were read completely, along with the actual contract,
inherited index, independent target/residual/mathematical audits and latest
reports. Completed predecessor 95 and its raw final events were reconciled;
461 inherited artifact hashes matched. Its earlier interrupted-work reconciliation
was inspected, and no old setup or finalization write was replayed.

The active higher-priority policy denies `.scratch`; it was not accessed.
A unique research temporary directory was used. Sage and SymPy were unavailable;
GAP was located but was not required. No dependency update, controller invocation,
external model, publication, contact, commit, permission change or Git access
occurred. Only new research/evidence files were written. Protected input
preservation is separately recorded; local checks are not independent admission.

## Final local validation

All 65 accepted mathematical modules compiled and passed separate kernel replay. All 96 inventoried theorem closures use only propext, Classical.choice and Quot.sound. Thirty unchanged inherited split gap sources were checked in this invocation. There were no rejected Lean builds or kernel replays. Inherited compiled imports were reused; no fresh whole-source rebuild or independent completion audit occurred. All foreground executions returned. Completion remains null.
